<?php

use App\Models\Askep;
use App\Models\AskepImplementasi;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Implementasi Askep')] class extends Component
{
    public Askep $askep;

    public ?int $aktivitasAktif = null;

    /**
     * @var array<int, array{
     *   diagnosa_id: int,
     *   kode: string,
     *   label: string,
     *   prioritas: int,
     *   intervensi: array<int, array{
     *     intervensi_id: int,
     *     siki_kode: string,
     *     siki_label: string,
     *     tindakan_tersedia: list<string>,
     *     logs: array<int, array{
     *       id: int|null,
     *       tanggal: string,
     *       waktu: string,
     *       shift: string,
     *       durasi_menit: int|null,
     *       tindakan_dilakukan: list<string>,
     *       spo2_sebelum: int|null,
     *       spo2_setelah: int|null,
     *       catatan: string,
     *       respons_pasien: string
     *     }>
     *   }>
     * }>
     */
    public array $implementasi = [];

    /** @var array<int, array<string, mixed>> */
    public array $formTambah = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load([
            'pasien',
            'diagnosa.sdki',
            'diagnosa.intervensi.siki',
            'diagnosa.intervensi.implementasi',
        ]);

        $this->inisialisasi();
    }

    private function inisialisasi(): void
    {
        $this->implementasi = [];
        $this->formTambah = [];
        $aktivitasPertama = null;

        foreach ($this->askep->diagnosa as $diagnosa) {
            $intervensiList = [];

            foreach ($diagnosa->intervensi->where('is_included', true) as $intervensi) {
                $logs = $intervensi->implementasi->map(fn ($impl) => [
                    'id' => $impl->id,
                    'tanggal' => $impl->tanggal?->format('Y-m-d') ?? '',
                    'waktu' => $impl->waktu ?? '',
                    'shift' => $impl->shift ?? 'Pagi',
                    'durasi_menit' => $impl->durasi_menit,
                    'tindakan_dilakukan' => $impl->tindakan_dilakukan ?? [],
                    'spo2_sebelum' => $impl->spo2_sebelum,
                    'spo2_setelah' => $impl->spo2_setelah,
                    'catatan' => $impl->catatan ?? '',
                    'respons_pasien' => $impl->respons_pasien ?? '',
                ])->values()->toArray();

                $intervensiList[] = [
                    'intervensi_id' => $intervensi->id,
                    'siki_kode' => $intervensi->siki?->kode_intervensi ?? 'MANUAL',
                    'siki_label' => $intervensi->siki?->label_intervensi ?? ($intervensi->nama_manual ?? 'Intervensi'),
                    'tindakan_tersedia' => $intervensi->tindakan_dipilih ?? [],
                    'logs' => $logs,
                ];

                $this->formTambah[$intervensi->id] = [
                    'tanggal' => now()->format('Y-m-d'),
                    'waktu' => now()->format('H:i'),
                    'shift' => 'Pagi',
                    'durasi_menit' => null,
                    'tindakan_dilakukan' => [],
                    'spo2_sebelum' => null,
                    'spo2_setelah' => null,
                    'catatan' => '',
                    'respons_pasien' => '',
                ];

                $aktivitasPertama ??= $intervensi->id;
            }

            if ($intervensiList !== []) {
                $this->implementasi[] = [
                    'diagnosa_id' => $diagnosa->id,
                    'kode' => $diagnosa->sdki?->kode_diagnosa ?? '',
                    'label' => $diagnosa->sdki?->label_diagnosa ?? '',
                    'prioritas' => $diagnosa->prioritas,
                    'intervensi' => $intervensiList,
                ];
            }
        }

        if ($this->aktivitasAktif === null || ! array_key_exists($this->aktivitasAktif, $this->formTambah)) {
            $this->aktivitasAktif = $aktivitasPertama;
        }
    }

    public function tampilkanForm(int $intervensiId): void
    {
        $this->aktivitasAktif = $intervensiId;
    }

    public function toggleTindakanForm(int $intervensiId, string $tindakan): void
    {
        $dipilih = $this->formTambah[$intervensiId]['tindakan_dilakukan'];

        if (in_array($tindakan, $dipilih, true)) {
            $this->formTambah[$intervensiId]['tindakan_dilakukan'] = array_values(
                array_filter($dipilih, fn ($item) => $item !== $tindakan)
            );

            return;
        }

        $this->formTambah[$intervensiId]['tindakan_dilakukan'][] = $tindakan;
    }

    public function resetForm(int $intervensiId): void
    {
        $this->formTambah[$intervensiId] = [
            'tanggal' => now()->format('Y-m-d'),
            'waktu' => now()->format('H:i'),
            'shift' => 'Pagi',
            'durasi_menit' => null,
            'tindakan_dilakukan' => [],
            'spo2_sebelum' => null,
            'spo2_setelah' => null,
            'catatan' => '',
            'respons_pasien' => '',
        ];
    }

    public function simpanLog(int $intervensiId): void
    {
        $form = $this->formTambah[$intervensiId];

        $this->validate([
            "formTambah.{$intervensiId}.tanggal" => ['required', 'date'],
            "formTambah.{$intervensiId}.waktu" => ['required'],
            "formTambah.{$intervensiId}.shift" => ['required', 'in:Pagi,Siang,Malam'],
            "formTambah.{$intervensiId}.durasi_menit" => ['nullable', 'integer', 'min:1', 'max:1440'],
            "formTambah.{$intervensiId}.spo2_sebelum" => ['nullable', 'integer', 'min:1', 'max:100'],
            "formTambah.{$intervensiId}.spo2_setelah" => ['nullable', 'integer', 'min:1', 'max:100'],
            "formTambah.{$intervensiId}.respons_pasien" => ['required', 'in:Positif,Netral,Negatif'],
        ]);

        AskepImplementasi::create([
            'askep_intervensi_id' => $intervensiId,
            'tanggal' => $form['tanggal'],
            'waktu' => $form['waktu'],
            'shift' => $form['shift'],
            'durasi_menit' => $form['durasi_menit'] ?: null,
            'tindakan_dilakukan' => $form['tindakan_dilakukan'],
            'spo2_sebelum' => $form['spo2_sebelum'] ?: null,
            'spo2_setelah' => $form['spo2_setelah'] ?: null,
            'catatan' => $form['catatan'],
            'respons_pasien' => $form['respons_pasien'],
        ]);

        Flux::toast(variant: 'success', text: 'Sesi implementasi tersimpan.');

        $this->resetForm($intervensiId);
        $this->inisialisasi();
    }

    public function hapusLog(int $logId): void
    {
        AskepImplementasi::findOrFail($logId)->delete();
        Flux::toast(variant: 'success', text: 'Sesi implementasi dihapus.');
        $this->inisialisasi();
    }

    public function simpanLanjut(): void
    {
        $totalLog = collect($this->implementasi)
            ->flatMap(fn ($diagnosa) => $diagnosa['intervensi'])
            ->sum(fn ($intervensi) => count($intervensi['logs']));

        if ($totalLog === 0) {
            Flux::toast(variant: 'error', text: 'Tambahkan minimal 1 sesi implementasi.');

            return;
        }

        if ($this->askep->step_terakhir < 4) {
            $this->askep->update(['step_terakhir' => 4]);
        }

        $this->askep->pasien->catatRiwayat('Implementasi dicatat (' . $totalLog . ' sesi).');

        Flux::toast(variant: 'success', text: 'Implementasi tersimpan.');
        $this->redirectRoute('askep.evaluasi', $this->askep, navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 4])

    <div class="mb-5 flex items-start justify-between gap-4">
        <div>
            <div class="mb-2 flex items-center gap-2">
                <span class="flex size-8 items-center justify-center rounded-lg bg-[#E1F5EE] text-[#0F6E56]">
                    <flux:icon.clipboard-document-check class="size-4" />
                </span>
                <h2 class="text-xl font-bold text-[#1B4F72]">Tahap 4: Implementasi Keperawatan</h2>
            </div>
            <p class="text-sm text-[#7A8FA6]">Dokumentasikan tindakan yang dilakukan berdasarkan rencana SIKI.</p>
        </div>
        <span class="shrink-0 rounded-full bg-[#E1F5EE] px-3 py-1 text-xs font-bold text-[#0F6E56]">Rencana disetujui</span>
    </div>

    @if (empty($implementasi))
        <div class="flex flex-col items-center justify-center rounded-xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-16 text-center">
            <flux:icon.clipboard-document-list class="mb-3 size-12 text-[#85B7EB]" />
            <p class="font-medium text-[#1B4F72]">Belum ada intervensi</p>
            <p class="mt-1 text-sm text-[#7A8FA6]">Kembali ke tahap perencanaan dan pilih intervensi terlebih dahulu.</p>
            <flux:button :href="route('askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate class="mt-4">
                Kembali ke Perencanaan
            </flux:button>
        </div>
    @else
        @php
            $semuaIntervensi = collect($implementasi)->flatMap(fn ($diagnosa) => collect($diagnosa['intervensi'])->map(fn ($intervensi) => $intervensi + [
                'diagnosa_kode' => $diagnosa['kode'],
                'diagnosa_label' => $diagnosa['label'],
            ]));
            $totalIntervensi = $semuaIntervensi->count();
            $totalLog = $semuaIntervensi->sum(fn ($intervensi) => count($intervensi['logs']));
            $durasiTotal = $semuaIntervensi->flatMap(fn ($intervensi) => $intervensi['logs'])->sum(fn ($log) => (int) ($log['durasi_menit'] ?? 0));
            $intervensiSelesai = $semuaIntervensi->filter(fn ($intervensi) => count($intervensi['logs']) > 0)->count();
            $kepatuhan = $totalIntervensi > 0 ? (int) round(($intervensiSelesai / $totalIntervensi) * 100) : 0;
            $aktivitas = $semuaIntervensi->firstWhere('intervensi_id', $aktivitasAktif) ?? $semuaIntervensi->first();
            $fid = $aktivitas['intervensi_id'] ?? null;
        @endphp

        <div class="mb-5 rounded-xl border border-[#E0EBF5] bg-white p-4">
            <div class="grid gap-3 text-sm sm:grid-cols-3">
                <div>
                    <p class="text-xs font-semibold text-[#7A8FA6]">Pasien</p>
                    <p class="mt-1 font-semibold text-[#1B4F72]">
                        {{ $askep->pasien->nama_pasien }}
                        <span class="font-normal text-[#7A8FA6]">| No. RM: {{ $askep->pasien->no_rm }}</span>
                    </p>
                </div>
                <div>
                    <p class="text-xs font-semibold text-[#7A8FA6]">Tanggal</p>
                    <p class="mt-1 font-semibold text-[#1B4F72]">{{ now()->translatedFormat('l, d F Y H:i') }} WIB</p>
                </div>
                <div>
                    <p class="text-xs font-semibold text-[#7A8FA6]">Shift Aktif</p>
                    <p class="mt-1 font-semibold text-[#1B4F72]">{{ $fid ? ($formTambah[$fid]['shift'] ?? 'Pagi') : 'Pagi' }}</p>
                </div>
            </div>
        </div>

        <div class="space-y-5">
            <section class="rounded-xl border border-[#E0EBF5] bg-white p-4">
                <h3 class="mb-3 font-semibold text-[#1B4F72]">Aktivitas yang akan dilakukan hari ini</h3>
                <div class="space-y-2">
                    @foreach ($semuaIntervensi as $index => $intervensi)
                        @php
                            $sudahAdaLog = count($intervensi['logs']) > 0;
                            $aktif = $aktivitasAktif === $intervensi['intervensi_id'];
                        @endphp
                        <button
                            wire:click="tampilkanForm({{ $intervensi['intervensi_id'] }})"
                            class="w-full rounded-lg border p-3 text-left transition {{ $aktif ? 'border-[#5DCAA5] bg-[#F0FBF7]' : 'border-[#E0EBF5] bg-white hover:border-[#85B7EB] hover:bg-[#F8FBFE]' }}"
                        >
                            <div class="flex items-start justify-between gap-3">
                                <div>
                                    <p class="text-sm font-semibold text-[#1B4F72]">{{ $index + 1 }}. {{ $intervensi['siki_label'] }}</p>
                                    <p class="mt-1 text-xs text-[#7A8FA6]">{{ $intervensi['diagnosa_kode'] }} {{ $intervensi['diagnosa_label'] }} | {{ $intervensi['siki_kode'] }}</p>
                                </div>
                                <span class="rounded-full px-2 py-0.5 text-[10px] font-bold {{ $sudahAdaLog ? 'bg-[#E1F5EE] text-[#0F6E56]' : 'bg-[#F4F8FB] text-[#7A8FA6]' }}">
                                    {{ $sudahAdaLog ? 'selesai' : 'belum selesai' }}
                                </span>
                            </div>
                        </button>
                    @endforeach
                </div>
            </section>

            <section class="rounded-xl border border-[#E0EBF5] bg-white p-4">
                <h3 class="mb-3 font-semibold text-[#1B4F72]">Metrik Otomatis</h3>
                <div class="grid gap-3 sm:grid-cols-3">
                    <div class="rounded-lg bg-[#F8FBFE] p-3">
                        <p class="text-xs text-[#7A8FA6]">Total Aktivitas Hari Ini</p>
                        <p class="mt-1 text-lg font-bold text-[#1B4F72]">{{ $totalLog }} dari {{ $totalIntervensi }}</p>
                    </div>
                    <div class="rounded-lg bg-[#F8FBFE] p-3">
                        <p class="text-xs text-[#7A8FA6]">Total Durasi Implementasi</p>
                        <p class="mt-1 text-lg font-bold text-[#1B4F72]">{{ $durasiTotal }} menit</p>
                    </div>
                    <div class="rounded-lg bg-[#F8FBFE] p-3">
                        <p class="text-xs text-[#7A8FA6]">Kepatuhan</p>
                        <p class="mt-1 text-lg font-bold text-[#1B4F72]">{{ $kepatuhan }}%</p>
                    </div>
                </div>
                <div class="mt-3 h-2 overflow-hidden rounded-full bg-[#E8EEF4]">
                    <div class="h-full rounded-full bg-[#1A9B72]" style="width: {{ $kepatuhan }}%"></div>
                </div>
            </section>

            @if ($fid)
                <section class="rounded-xl border border-[#E0EBF5] bg-white p-4">
                    <div class="mb-4 flex items-start justify-between gap-4">
                        <div>
                            <h3 class="font-semibold text-[#1B4F72]">Form Dokumentasi Implementasi</h3>
                            <p class="mt-1 text-sm font-semibold text-[#1B4F72]">{{ $aktivitas['siki_label'] }}</p>
                        </div>
                        <span class="rounded-full bg-[#EBF5FB] px-3 py-1 text-xs font-bold text-[#2E86C1]">{{ $aktivitas['siki_kode'] }}</span>
                    </div>

                    @if (! empty($aktivitas['logs']))
                        <div class="mb-4 rounded-lg border border-[#5DCAA5] bg-[#F0FBF7] p-3">
                            <p class="mb-2 text-xs font-bold uppercase text-[#0F6E56]">Sesi Tersimpan ({{ count($aktivitas['logs']) }})</p>
                            <div class="space-y-2">
                                @foreach ($aktivitas['logs'] as $log)
                                    <div class="rounded-lg border border-[#BFECDD] bg-white p-3">
                                        <div class="flex items-start justify-between gap-3">
                                            <div class="text-xs text-[#1B4F72]">
                                                <p class="font-semibold">Sesi {{ $loop->iteration }} | {{ \Carbon\Carbon::parse($log['tanggal'])->translatedFormat('d M Y') }} {{ $log['waktu'] }} | Shift {{ $log['shift'] }} | {{ $log['durasi_menit'] ?? 0 }} menit</p>
                                                @if (! empty($log['tindakan_dilakukan']))
                                                    <p class="mt-1"><span class="font-semibold">Tindakan:</span> {{ \Illuminate\Support\Str::limit(implode('; ', $log['tindakan_dilakukan']), 220) }}</p>
                                                @endif
                                                <p class="mt-1"><span class="font-semibold">Respons:</span> {{ $log['respons_pasien'] ?? '-' }}</p>
                                                @if ($log['catatan'])
                                                    <p class="mt-1"><span class="font-semibold">Catatan:</span> {{ $log['catatan'] }}</p>
                                                @endif
                                            </div>
                                            <button
                                                wire:click="hapusLog({{ $log['id'] }})"
                                                wire:confirm="Hapus sesi ini?"
                                                class="rounded-md bg-[#FDE8E8] p-1.5 text-[#D95C3A] hover:bg-[#F8D1D1]"
                                                title="Hapus sesi"
                                            >
                                                <flux:icon.trash class="size-3.5" />
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endif

                    <div class="grid gap-3 md:grid-cols-3">
                        <flux:input type="date" wire:model="formTambah.{{ $fid }}.tanggal" label="Tanggal Implementasi" />
                        <flux:input type="time" wire:model="formTambah.{{ $fid }}.waktu" label="Waktu Implementasi" />
                        <flux:input type="number" min="1" max="1440" wire:model="formTambah.{{ $fid }}.durasi_menit" label="Durasi (menit)" />
                    </div>

                    <div class="mt-3">
                        <label class="text-sm font-semibold text-[#1B4F72]">Shift</label>
                        <select wire:model="formTambah.{{ $fid }}.shift" class="mt-1 w-full rounded-lg border border-[#D0DCE8] bg-white px-3 py-2 text-sm text-[#1B4F72] focus:border-[#2E86C1] focus:outline-none">
                            <option value="Pagi">Pagi</option>
                            <option value="Siang">Siang</option>
                            <option value="Malam">Malam</option>
                        </select>
                    </div>

                    <div class="mt-4">
                        <p class="mb-2 text-sm font-semibold text-[#1B4F72]">Tindakan Dilakukan</p>
                        @if (empty($aktivitas['tindakan_tersedia']))
                            <p class="rounded-lg border border-dashed border-[#D0DCE8] bg-[#F4F8FB] px-3 py-3 text-sm text-[#7A8FA6]">Belum ada daftar tindakan pada intervensi ini.</p>
                        @else
                            <div class="space-y-3">
                                @foreach ($aktivitas['tindakan_tersedia'] as $tindakan)
                                    <label class="flex items-start gap-2 text-sm text-[#1B4F72]">
                                        <input
                                            type="checkbox"
                                            wire:click="toggleTindakanForm({{ $fid }}, @js($tindakan))"
                                            @checked(in_array($tindakan, $formTambah[$fid]['tindakan_dilakukan'] ?? [], true))
                                            class="mt-1 size-4 rounded border-[#D0DCE8] accent-[#1A9B72]"
                                        />
                                        <span>{{ $tindakan }}</span>
                                    </label>
                                @endforeach
                            </div>
                        @endif
                    </div>

                    <div class="mt-4 grid gap-3 md:grid-cols-2">
                        <flux:input type="number" min="1" max="100" wire:model="formTambah.{{ $fid }}.spo2_sebelum" label="SpO2 sebelum" />
                        <flux:input type="number" min="1" max="100" wire:model="formTambah.{{ $fid }}.spo2_setelah" label="SpO2 setelah" />
                    </div>

                    <div class="mt-4">
                        <flux:textarea wire:model="formTambah.{{ $fid }}.catatan" label="Catatan" rows="4" placeholder="Catatan pelaksanaan tindakan..." />
                    </div>

                    <div class="mt-4">
                        <p class="mb-2 text-sm font-semibold text-[#1B4F72]">Respons Pasien</p>
                        <div class="grid gap-2 sm:grid-cols-3">
                            @foreach (['Positif', 'Netral', 'Negatif'] as $respons)
                                <label class="flex items-center gap-2 rounded-lg border border-[#D0DCE8] px-3 py-2 text-sm text-[#1B4F72]">
                                    <input type="radio" wire:model="formTambah.{{ $fid }}.respons_pasien" value="{{ $respons }}" class="accent-[#1A9B72]" />
                                    {{ $respons }}
                                </label>
                            @endforeach
                        </div>
                        @error("formTambah.{$fid}.respons_pasien") <p class="mt-1 text-xs text-[#D95C3A]">{{ $message }}</p> @enderror
                    </div>

                    <div class="mt-5 grid gap-2 sm:grid-cols-2">
                        <button wire:click="simpanLog({{ $fid }})" wire:loading.attr="disabled" class="inline-flex items-center justify-center gap-2 rounded-lg bg-[#1A9B72] px-4 py-2.5 text-sm font-bold text-white hover:bg-[#0F6E56] disabled:opacity-50">
                            <flux:icon.check class="size-4" />
                            Simpan Sesi
                        </button>
                        <button wire:click="resetForm({{ $fid }})" type="button" class="inline-flex items-center justify-center gap-2 rounded-lg bg-[#F4F8FB] px-4 py-2.5 text-sm font-semibold text-[#7A8FA6] hover:bg-[#E8EEF4]">
                            Reset
                        </button>
                    </div>
                </section>
            @endif

            <section class="rounded-xl border border-[#E0EBF5] bg-white p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Ringkasan Implementasi</h3>
                <div class="space-y-4">
                    @foreach ($implementasi as $diagnosa)
                        @php $jumlahLogDiagnosa = collect($diagnosa['intervensi'])->sum(fn ($intervensi) => count($intervensi['logs'])); @endphp
                        <div class="rounded-lg bg-[#F8FBFE] p-4">
                            <div class="mb-3 flex items-center justify-between gap-3">
                                <div>
                                    <p class="font-mono text-xs font-bold text-[#2E86C1]">{{ $diagnosa['kode'] }}</p>
                                    <p class="text-sm font-semibold text-[#1B4F72]">{{ $diagnosa['label'] }}</p>
                                </div>
                                <span class="rounded-full bg-[#E1F5EE] px-2 py-0.5 text-xs font-bold text-[#0F6E56]">{{ $jumlahLogDiagnosa }} sesi</span>
                            </div>
                            <div class="space-y-2">
                                @foreach ($diagnosa['intervensi'] as $intervensi)
                                    <div class="flex items-center justify-between rounded-lg border border-[#E0EBF5] bg-white px-3 py-2 text-sm">
                                        <span class="text-[#1B4F72]">{{ $intervensi['siki_label'] }}</span>
                                        <span class="text-xs font-semibold {{ count($intervensi['logs']) > 0 ? 'text-[#0F6E56]' : 'text-[#7A8FA6]' }}">{{ count($intervensi['logs']) }} sesi</span>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endforeach
                </div>
            </section>

            <div class="grid gap-3 border-t border-[#E0EBF5] pt-4 sm:grid-cols-2">
                <flux:button :href="route('askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                    Tinjau Rencana
                </flux:button>
                <button
                    wire:click="simpanLanjut"
                    wire:loading.attr="disabled"
                    class="inline-flex items-center justify-center gap-2 rounded-lg bg-[#1A9B72] px-5 py-2.5 text-sm font-bold text-white hover:bg-[#0F6E56] disabled:opacity-50"
                >
                    <span wire:loading.remove wire:target="simpanLanjut">Setujui & Simpan, Lanjut ke Evaluasi</span>
                    <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
                    <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
                </button>
            </div>
        </div>
    @endif
</div>
