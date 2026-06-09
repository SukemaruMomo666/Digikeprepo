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

    public function hapusLog(int $intervensiId, int $logId): void
    {
        AskepImplementasi::where('id', $logId)
            ->where('askep_intervensi_id', $intervensiId)
            ->delete();

        Flux::toast(variant: 'success', text: 'Sesi implementasi dihapus.');
        $this->inisialisasi();
    }

    public function selesaikanLangkah(): void
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

        $this->redirectRoute('mahasiswa.askep.evaluasi', $this->askep, navigate: true);
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
            <flux:button :href="route('mahasiswa.askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate class="mt-4">
                Kembali ke Perencanaan
            </flux:button>
        </div>
    @else
        <div class="flex flex-col gap-6 lg:flex-row lg:items-start">
            {{-- Panel Kiri: Daftar Diagnosa & Intervensi --}}
            <div class="w-full shrink-0 space-y-4 lg:w-1/3">
                <h3 class="text-sm font-bold uppercase tracking-wider text-[#7A8FA6] px-1">Daftar Intervensi Terencana</h3>
                
                @foreach ($implementasi as $dIdx => $d)
                    <div class="overflow-hidden rounded-xl border border-[#E0EBF5] bg-white shadow-sm">
                        <div class="border-b border-[#E0EBF5] bg-[#F4F8FB] px-4 py-3">
                            <div class="flex items-center gap-2">
                                <span class="font-mono text-[10px] font-bold text-[#2E86C1] bg-white px-1.5 py-0.5 rounded border border-[#D0DCE8]">{{ $d['kode'] }}</span>
                                <span class="text-xs font-bold text-[#1B4F72] truncate">{{ $d['label'] }}</span>
                            </div>
                        </div>
                        <div class="flex flex-col">
                            @foreach ($d['intervensi'] as $iIdx => $i)
                                @php $isActive = $aktivitasAktif === $i['intervensi_id']; @endphp
                                <button
                                    wire:click="tampilkanForm({{ $i['intervensi_id'] }})"
                                    class="flex items-start gap-3 border-b border-[#E0EBF5] px-4 py-3 text-left transition last:border-b-0
                                        {{ $isActive ? 'bg-[#EBF5FB] relative' : 'hover:bg-gray-50' }}"
                                >
                                    @if ($isActive)
                                        <div class="absolute left-0 top-0 bottom-0 w-1 bg-[#2E86C1]"></div>
                                    @endif
                                    <div class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded-full {{ count($i['logs']) > 0 ? 'bg-[#1A9B72]' : 'bg-[#C4D3DF]' }} text-[10px] font-bold text-white">
                                        {{ count($i['logs']) }}
                                    </div>
                                    <div class="min-w-0 flex-1">
                                        <p class="text-sm font-semibold {{ $isActive ? 'text-[#1B4F72]' : 'text-gray-700' }}">{{ $i['siki_label'] }}</p>
                                        <p class="text-[11px] text-gray-500 mt-0.5">{{ count($i['tindakan_tersedia']) }} tindakan terencana</p>
                                    </div>
                                    <flux:icon.chevron-right class="size-4 shrink-0 mt-1 {{ $isActive ? 'text-[#2E86C1]' : 'text-gray-300' }}" />
                                </button>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            </div>

            {{-- Panel Kanan: Form Tambah & Timeline --}}
            <div class="flex-1 w-full space-y-6">
                @php
                    $aktifIntervensi = null;
                    foreach ($implementasi as $d) {
                        foreach ($d['intervensi'] as $i) {
                            if ($i['intervensi_id'] === $aktivitasAktif) {
                                $aktifIntervensi = $i;
                                break 2;
                            }
                        }
                    }
                @endphp

                @if ($aktifIntervensi)
                    {{-- Form Tambah Implementasi --}}
                    <div class="rounded-2xl border border-[#E0EBF5] bg-white p-5 sm:p-6 shadow-sm">
                        <div class="mb-5 border-b border-[#E0EBF5] pb-4 flex justify-between items-start">
                            <div>
                                <h3 class="text-lg font-bold text-[#1B4F72]">{{ $aktifIntervensi['siki_label'] }}</h3>
                                <p class="text-sm text-[#7A8FA6] mt-1">Catat pelaksanaan intervensi ini.</p>
                            </div>
                            <span class="rounded-full bg-[#EBF5FB] px-3 py-1 text-xs font-bold text-[#2E86C1] border border-[#D0DCE8]">{{ $aktifIntervensi['siki_kode'] }}</span>
                        </div>

                        <form wire:submit.prevent="simpanLog({{ $aktivitasAktif }})" class="space-y-6">
                            {{-- Waktu & Shift --}}
                            <div class="grid grid-cols-2 gap-4 sm:grid-cols-4 bg-[#F4F8FB] p-4 rounded-xl border border-[#E0EBF5]">
                                <div class="col-span-2 sm:col-span-1">
                                    <flux:select wire:model="formTambah.{{ $aktivitasAktif }}.shift" label="Shift">
                                        <flux:select.option value="Pagi">Pagi</flux:select.option>
                                        <flux:select.option value="Siang">Siang</flux:select.option>
                                        <flux:select.option value="Malam">Malam</flux:select.option>
                                    </flux:select>
                                </div>
                                <div class="col-span-1 sm:col-span-1">
                                    <flux:input wire:model="formTambah.{{ $aktivitasAktif }}.waktu" type="time" label="Waktu" required />
                                </div>
                                <div class="col-span-1 sm:col-span-2">
                                    <flux:input wire:model="formTambah.{{ $aktivitasAktif }}.tanggal" type="date" label="Tanggal" required />
                                </div>
                            </div>

                            {{-- Tindakan yang dilakukan --}}
                            <div>
                                <label class="mb-2 block text-sm font-bold text-[#1B4F72]">Tindakan yang Dilakukan</label>
                                @if (empty($aktifIntervensi['tindakan_tersedia']))
                                    <p class="text-xs italic text-gray-500">Tidak ada rincian tindakan spesifik. Silakan isi di kolom catatan.</p>
                                @else
                                    <div class="space-y-2 rounded-xl border border-[#E0EBF5] p-4 bg-white">
                                        @foreach ($aktifIntervensi['tindakan_tersedia'] as $tindakan)
                                            <label class="flex items-start gap-3 cursor-pointer group">
                                                <input
                                                    type="checkbox"
                                                    wire:click="toggleTindakanForm({{ $aktivitasAktif }}, @js($tindakan))"
                                                    @checked(in_array($tindakan, $formTambah[$aktivitasAktif]['tindakan_dilakukan'], true))
                                                    class="mt-0.5 size-4 rounded border-[#D0DCE8] text-[#1A9B72] focus:ring-[#1A9B72]"
                                                />
                                                <span class="text-sm text-[#1B4F72] group-hover:text-[#1A9B72]">{{ $tindakan }}</span>
                                            </label>
                                        @endforeach
                                    </div>
                                    @error('formTambah.'.$aktivitasAktif.'.tindakan_dilakukan') <span class="text-xs text-red-500">{{ $message }}</span> @enderror
                                @endif
                            </div>

                            {{-- Catatan & Respons --}}
                            <div class="space-y-4">
                                <flux:textarea
                                    wire:model="formTambah.{{ $aktivitasAktif }}.catatan"
                                    label="Catatan Perkembangan (Subjektif & Objektif)"
                                    placeholder="Contoh: Pasien mengatakan nyeri berkurang (S), skala nyeri menjadi 3, wajah tampak lebih rileks (O)..."
                                    rows="3"
                                />
                                
                                <div class="grid gap-4 sm:grid-cols-2">
                                    <div>
                                        <label class="mb-2 block text-sm font-bold text-[#1B4F72]">Respons Umum Pasien</label>
                                        <div class="flex gap-3">
                                            @foreach (['Positif', 'Netral', 'Negatif'] as $resp)
                                                <label class="cursor-pointer flex-1">
                                                    <input type="radio" wire:model="formTambah.{{ $aktivitasAktif }}.respons_pasien" value="{{ $resp }}" class="peer sr-only" />
                                                    <div class="rounded-lg border border-[#D0DCE8] bg-white py-2 text-center text-xs font-semibold text-[#7A8FA6] transition peer-checked:border-[#2E86C1] peer-checked:bg-[#2E86C1] peer-checked:text-white hover:bg-gray-50">
                                                        {{ $resp }}
                                                    </div>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div>
                                        <flux:input wire:model="formTambah.{{ $aktivitasAktif }}.durasi_menit" type="number" label="Durasi Tindakan (Menit)" placeholder="opsional" min="1" />
                                    </div>
                                </div>
                            </div>

                            <div class="flex justify-end pt-2">
                                <button type="submit" wire:loading.attr="disabled" class="inline-flex items-center gap-2 rounded-lg bg-[#1A9B72] px-5 py-2 text-sm font-bold text-white transition hover:bg-[#0F6E56] disabled:opacity-50">
                                    <span wire:loading.remove wire:target="simpanLog({{ $aktivitasAktif }})">Simpan Implementasi</span>
                                    <span wire:loading wire:target="simpanLog({{ $aktivitasAktif }})">Menyimpan...</span>
                                    <flux:icon.plus class="size-4" wire:loading.remove wire:target="simpanLog({{ $aktivitasAktif }})" />
                                </button>
                            </div>
                        </form>
                    </div>

                    {{-- Timeline History --}}
                    <div>
                        <h4 class="mb-4 text-sm font-bold uppercase tracking-wider text-[#7A8FA6]">Riwayat Pelaksanaan</h4>
                        
                        @if (empty($aktifIntervensi['logs']))
                            <div class="rounded-xl border border-dashed border-[#D0DCE8] bg-white py-8 text-center text-sm text-[#7A8FA6]">
                                Belum ada riwayat implementasi untuk intervensi ini.
                            </div>
                        @else
                            <div class="space-y-4">
                                @foreach (collect($aktifIntervensi['logs'])->sortByDesc(fn($l) => $l['tanggal'] . ' ' . $l['waktu']) as $log)
                                    <div class="relative pl-6 sm:pl-8">
                                        {{-- Timeline Node --}}
                                        <div class="absolute left-0 top-1.5 flex h-full flex-col items-center">
                                            <div class="size-3 rounded-full bg-[#2E86C1] ring-4 ring-[#EBF5FB]"></div>
                                            <div class="mt-2 w-px flex-1 bg-gray-200"></div>
                                        </div>

                                        {{-- Log Card --}}
                                        <div class="rounded-xl border border-[#E0EBF5] bg-white p-4 shadow-sm transition hover:border-[#85B7EB]">
                                            <div class="mb-3 flex flex-wrap items-center justify-between gap-2 border-b border-gray-100 pb-2">
                                                <div class="flex items-center gap-2">
                                                    <span class="rounded bg-[#F4F8FB] px-2 py-0.5 text-xs font-bold text-[#1B4F72] border border-[#E0EBF5]">
                                                        {{ \Carbon\Carbon::parse($log['tanggal'])->format('d M Y') }}
                                                    </span>
                                                    <span class="text-xs font-semibold text-[#7A8FA6]">{{ $log['waktu'] }}</span>
                                                    <span class="rounded-full bg-gray-100 px-2 py-0.5 text-[10px] font-bold uppercase text-gray-600">
                                                        Shift {{ $log['shift'] }}
                                                    </span>
                                                </div>
                                                <button wire:click="hapusLog({{ $aktivitasAktif }}, {{ $log['id'] }})" class="text-gray-400 hover:text-red-500" title="Hapus">
                                                    <flux:icon.trash class="size-4" />
                                                </button>
                                            </div>

                                            @if (!empty($log['tindakan_dilakukan']))
                                                <div class="mb-3">
                                                    <p class="text-[11px] font-bold uppercase text-[#7A8FA6] mb-1">Tindakan:</p>
                                                    <ul class="list-inside list-disc text-sm text-[#1B4F72] space-y-0.5 ml-1">
                                                        @foreach ($log['tindakan_dilakukan'] as $t)
                                                            <li>{{ $t }}</li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            @endif

                                            @if ($log['catatan'])
                                                <div class="mb-3 rounded-lg bg-[#F8FBFE] p-3 text-sm text-[#1B4F72] border border-[#E0EBF5]">
                                                    {{ $log['catatan'] }}
                                                </div>
                                            @endif

                                            @if ($log['respons_pasien'] || $log['durasi_menit'])
                                                <div class="flex flex-wrap gap-2 mt-2">
                                                    @if ($log['respons_pasien'])
                                                        <span class="inline-flex items-center rounded-md px-2 py-1 text-xs font-medium ring-1 ring-inset
                                                            {{ $log['respons_pasien'] === 'Positif' ? 'bg-green-50 text-green-700 ring-green-600/20' : 
                                                              ($log['respons_pasien'] === 'Negatif' ? 'bg-red-50 text-red-700 ring-red-600/10' : 
                                                              'bg-gray-50 text-gray-600 ring-gray-500/10') }}">
                                                            Respons: {{ $log['respons_pasien'] }}
                                                        </span>
                                                    @endif
                                                    @if ($log['durasi_menit'])
                                                        <span class="inline-flex items-center rounded-md bg-blue-50 px-2 py-1 text-xs font-medium text-blue-700 ring-1 ring-inset ring-blue-700/10">
                                                            <flux:icon.clock class="mr-1 size-3" /> {{ $log['durasi_menit'] }} mnt
                                                        </span>
                                                    @endif
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div>
                @endif
            </div>
        </div>

        {{-- Navigasi Bawah --}}
        <div class="mt-8 flex items-center justify-between border-t border-[#E0EBF5] pt-5">
            <flux:button :href="route('mahasiswa.askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                Kembali ke Perencanaan
            </flux:button>
            <button
                wire:click="selesaikanLangkah"
                wire:loading.attr="disabled"
                class="inline-flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <span wire:loading.remove wire:target="selesaikanLangkah">Lanjut ke Evaluasi</span>
                <span wire:loading wire:target="selesaikanLangkah">Memproses...</span>
                <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="selesaikanLangkah" />
            </button>
        </div>
    @endif
</div>
