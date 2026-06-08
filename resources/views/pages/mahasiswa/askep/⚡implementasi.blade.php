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

    /** Index diagnosa yang sedang terbuka. */
    public ?int $terbuka = 0;

    /**
     * Data implementasi (log tindakan per intervensi).
     * @var array<int, array{
     *   diagnosa_id: int,
     *   kode: string,
     *   label: string,
     *   prioritas: int,
     *   intervensi: array<int, array{
     *     intervensi_id: int,
     *     siki_kode: string,
     *     siki_label: string,
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

    /** Untuk form tambah log baru per intervensi: key = intervensi_id. */
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
        $this->formTambah   = [];

        foreach ($this->askep->diagnosa as $diagnosa) {
            $intervensiList = [];

            foreach ($diagnosa->intervensi->where('is_included', true) as $intervensi) {
                $logs = $intervensi->implementasi->map(fn ($impl) => [
                    'id'                => $impl->id,
                    'tanggal'           => $impl->tanggal?->format('Y-m-d') ?? '',
                    'waktu'             => $impl->waktu ?? '',
                    'shift'             => $impl->shift ?? 'Pagi',
                    'durasi_menit'      => $impl->durasi_menit,
                    'tindakan_dilakukan' => $impl->tindakan_dilakukan ?? [],
                    'spo2_sebelum'      => $impl->spo2_sebelum,
                    'spo2_setelah'      => $impl->spo2_setelah,
                    'catatan'           => $impl->catatan ?? '',
                    'respons_pasien'    => $impl->respons_pasien ?? '',
                ])->values()->toArray();

                $intervensiList[] = [
                    'intervensi_id' => $intervensi->id,
                    'siki_kode'     => $intervensi->siki?->kode_intervensi ?? 'MANUAL',
                    'siki_label'    => $intervensi->siki?->label_intervensi ?? ($intervensi->nama_manual ?? 'Intervensi'),
                    'tindakan_tersedia' => $intervensi->tindakan_dipilih ?? [],
                    'logs'          => $logs,
                ];

                // Siapkan form tambah kosong untuk intervensi ini
                $this->formTambah[$intervensi->id] = [
                    'tampil'            => false,
                    'tanggal'           => now()->format('Y-m-d'),
                    'waktu'             => now()->format('H:i'),
                    'shift'             => 'Pagi',
                    'durasi_menit'      => null,
                    'tindakan_dilakukan' => [],
                    'spo2_sebelum'      => null,
                    'spo2_setelah'      => null,
                    'catatan'           => '',
                    'respons_pasien'    => '',
                ];
            }

            if (! empty($intervensiList)) {
                $this->implementasi[] = [
                    'diagnosa_id' => $diagnosa->id,
                    'kode'        => $diagnosa->sdki?->kode_diagnosa ?? '',
                    'label'       => $diagnosa->sdki?->label_diagnosa ?? '',
                    'prioritas'   => $diagnosa->prioritas,
                    'intervensi'  => $intervensiList,
                ];
            }
        }
    }

    public function toggleDiagnosa(int $index): void
    {
        $this->terbuka = $this->terbuka === $index ? null : $index;
    }

    public function tampilkanForm(int $intervensiId): void
    {
        $this->formTambah[$intervensiId]['tampil'] = true;
    }

    public function sembunyikanForm(int $intervensiId): void
    {
        $this->formTambah[$intervensiId]['tampil']             = false;
        $this->formTambah[$intervensiId]['durasi_menit']       = null;
        $this->formTambah[$intervensiId]['catatan']            = '';
        $this->formTambah[$intervensiId]['respons_pasien']     = '';
        $this->formTambah[$intervensiId]['spo2_sebelum']       = null;
        $this->formTambah[$intervensiId]['spo2_setelah']       = null;
        $this->formTambah[$intervensiId]['tindakan_dilakukan'] = [];
    }

    public function toggleTindakanForm(int $intervensiId, string $tindakan): void
    {
        $dipilih = $this->formTambah[$intervensiId]['tindakan_dilakukan'];
        if (in_array($tindakan, $dipilih, true)) {
            $this->formTambah[$intervensiId]['tindakan_dilakukan']
                = array_values(array_filter($dipilih, fn ($t) => $t !== $tindakan));
        } else {
            $this->formTambah[$intervensiId]['tindakan_dilakukan'][] = $tindakan;
        }
    }

    public function simpanLog(int $intervensiId): void
    {
        $form = $this->formTambah[$intervensiId];

        $this->validate([
            "formTambah.{$intervensiId}.tanggal"        => ['required', 'date'],
            "formTambah.{$intervensiId}.waktu"           => ['required'],
            "formTambah.{$intervensiId}.shift"           => ['required', 'in:Pagi,Siang,Malam'],
            "formTambah.{$intervensiId}.durasi_menit"    => ['nullable', 'integer', 'min:1', 'max:1440'],
            "formTambah.{$intervensiId}.spo2_sebelum"    => ['nullable', 'integer', 'min:1', 'max:100'],
            "formTambah.{$intervensiId}.spo2_setelah"    => ['nullable', 'integer', 'min:1', 'max:100'],
            "formTambah.{$intervensiId}.respons_pasien"  => ['required', 'string', 'max:2000'],
        ]);

        AskepImplementasi::create([
            'askep_intervensi_id' => $intervensiId,
            'tanggal'             => $form['tanggal'],
            'waktu'               => $form['waktu'],
            'shift'               => $form['shift'],
            'durasi_menit'        => $form['durasi_menit'] ?: null,
            'tindakan_dilakukan'  => $form['tindakan_dilakukan'],
            'spo2_sebelum'        => $form['spo2_sebelum'] ?: null,
            'spo2_setelah'        => $form['spo2_setelah'] ?: null,
            'catatan'             => $form['catatan'],
            'respons_pasien'      => $form['respons_pasien'],
        ]);

        Flux::toast(variant: 'success', text: 'Log implementasi ditambahkan.');
        $this->sembunyikanForm($intervensiId);
        $this->inisialisasi();
    }

    public function hapusLog(int $logId): void
    {
        AskepImplementasi::findOrFail($logId)->delete();
        Flux::toast(variant: 'success', text: 'Log dihapus.');
        $this->inisialisasi();
    }

    public function simpanLanjut(): void
    {
        // Cek minimal ada 1 log di keseluruhan
        $totalLog = collect($this->implementasi)
            ->flatMap(fn ($d) => $d['intervensi'])
            ->sum(fn ($i) => count($i['logs']));

        if ($totalLog === 0) {
            Flux::toast(variant: 'error', text: 'Tambahkan minimal 1 log implementasi.');

            return;
        }

        if ($this->askep->step_terakhir < 4) {
            $this->askep->update(['step_terakhir' => 4]);
        }

        $this->askep->pasien->catatRiwayat('Implementasi dicatat (' . $totalLog . ' log).');

        Flux::toast(variant: 'success', text: 'Implementasi tersimpan.');
        $this->redirectRoute('askep.evaluasi', $this->askep, navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 4])

    <div class="mb-4">
        <h2 class="text-xl font-bold text-[#1B4F72]">Langkah 4: Implementasi</h2>
        <p class="text-sm text-[#7A8FA6]">Catat tindakan keperawatan yang sudah dilakukan per intervensi.</p>
    </div>

    @if (empty($implementasi))
        <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-16 text-center">
            <flux:icon.clipboard-document-list class="mb-3 size-12 text-[#85B7EB]" />
            <p class="font-medium text-[#1B4F72]">Belum ada intervensi</p>
            <p class="mt-1 text-sm text-[#7A8FA6]">Kembali ke langkah 3 dan pilih intervensi terlebih dahulu.</p>
            <div class="mt-4">
                <flux:button :href="route('askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                    Kembali ke Perencanaan
                </flux:button>
            </div>
        </div>
    @else
        <div class="space-y-3">
            @foreach ($implementasi as $dIdx => $d)
                <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white">
                    {{-- Accordion Header --}}
                    <button
                        wire:click="toggleDiagnosa({{ $dIdx }})"
                        class="flex w-full items-center justify-between px-5 py-4 text-left hover:bg-[#F4F8FB] transition"
                    >
                        <div class="flex items-center gap-3">
                            <div class="flex size-7 shrink-0 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">
                                {{ $d['prioritas'] }}
                            </div>
                            <div>
                                <div class="flex items-center gap-2">
                                    <span class="font-mono text-xs font-bold text-[#2E86C1]">{{ $d['kode'] }}</span>
                                    @php $totalLog = collect($d['intervensi'])->sum(fn ($i) => count($i['logs'])); @endphp
                                    @if ($totalLog > 0)
                                        <span class="rounded-full bg-[#E1F5EE] px-2 py-0.5 text-[10px] font-semibold text-[#0F6E56]">{{ $totalLog }} log</span>
                                    @endif
                                </div>
                                <p class="mt-0.5 text-sm font-medium text-[#1B4F72]">{{ $d['label'] }}</p>
                            </div>
                        </div>
                        <flux:icon.chevron-down
                            class="size-5 shrink-0 text-[#7A8FA6] transition-transform {{ $terbuka === $dIdx ? 'rotate-180' : '' }}"
                        />
                    </button>

                    @if ($terbuka === $dIdx)
                        <div class="border-t border-[#E0EBF5] px-5 py-4 space-y-5">
                            @foreach ($d['intervensi'] as $intervensi)
                                @php $fid = $intervensi['intervensi_id']; @endphp
                                <div class="rounded-xl border border-[#E0EBF5] bg-[#F8FBFE] p-4">
                                    {{-- Judul Intervensi --}}
                                    <div class="mb-3 flex items-start justify-between gap-3">
                                        <div>
                                            @if ($intervensi['siki_kode'] !== 'MANUAL')
                                                <span class="font-mono text-xs font-bold text-[#2E86C1]">{{ $intervensi['siki_kode'] }}</span>
                                                <span class="mx-1 text-[#C4D3DF]">·</span>
                                            @endif
                                            <span class="text-sm font-semibold text-[#1B4F72]">{{ $intervensi['siki_label'] }}</span>
                                        </div>
                                        <button
                                            wire:click="tampilkanForm({{ $fid }})"
                                            class="flex shrink-0 items-center gap-1 rounded-lg border border-[#85B7EB] px-2.5 py-1.5 text-xs font-semibold text-[#2E86C1] hover:bg-[#EBF5FB] transition"
                                        >
                                            <flux:icon.plus class="size-3.5" />
                                            Tambah Log
                                        </button>
                                    </div>

                                    {{-- Form Tambah Log --}}
                                    @if (! empty($formTambah[$fid]['tampil']))
                                        <div class="mb-3 rounded-xl border border-[#85B7EB] bg-white p-4 space-y-3">
                                            <p class="text-xs font-semibold text-[#2E86C1] uppercase tracking-wide">Log Baru</p>

                                            <div class="grid grid-cols-2 gap-3 sm:grid-cols-4">
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">Tanggal</label>
                                                    <input
                                                        type="date"
                                                        wire:model="formTambah.{{ $fid }}.tanggal"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                    />
                                                </div>
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">Waktu</label>
                                                    <input
                                                        type="time"
                                                        wire:model="formTambah.{{ $fid }}.waktu"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                    />
                                                </div>
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">Shift</label>
                                                    <select
                                                        wire:model="formTambah.{{ $fid }}.shift"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                                    >
                                                        <option value="Pagi">Pagi (07.00–14.00)</option>
                                                        <option value="Siang">Siang (14.00–21.00)</option>
                                                        <option value="Malam">Malam (21.00–07.00)</option>
                                                    </select>
                                                </div>
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">Durasi (menit)</label>
                                                    <input
                                                        type="number"
                                                        min="1"
                                                        max="1440"
                                                        wire:model="formTambah.{{ $fid }}.durasi_menit"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                    />
                                                    @error("formTambah.{$fid}.durasi_menit") <p class="mt-1 text-xs text-[#D95C3A]">{{ $message }}</p> @enderror
                                                </div>
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">SpO2 sebelum (%)</label>
                                                    <input
                                                        type="number"
                                                        min="1"
                                                        max="100"
                                                        wire:model="formTambah.{{ $fid }}.spo2_sebelum"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                    />
                                                    @error("formTambah.{$fid}.spo2_sebelum") <p class="mt-1 text-xs text-[#D95C3A]">{{ $message }}</p> @enderror
                                                </div>
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">SpO2 setelah (%)</label>
                                                    <input
                                                        type="number"
                                                        min="1"
                                                        max="100"
                                                        wire:model="formTambah.{{ $fid }}.spo2_setelah"
                                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                    />
                                                    @error("formTambah.{$fid}.spo2_setelah") <p class="mt-1 text-xs text-[#D95C3A]">{{ $message }}</p> @enderror
                                                </div>
                                            </div>

                                            {{-- Tindakan pilihan dari SIKI --}}
                                            @if (! empty($intervensi['tindakan_tersedia']))
                                                <div>
                                                    <label class="text-xs font-medium text-[#7A8FA6]">Tindakan yang Dilakukan</label>
                                                    <div class="mt-1.5 space-y-1">
                                                        @foreach ($intervensi['tindakan_tersedia'] as $tindakan)
                                                            <label class="flex items-start gap-2 cursor-pointer">
                                                                <input
                                                                    type="checkbox"
                                                                    wire:click="toggleTindakanForm({{ $fid }}, @js($tindakan))"
                                                                    @checked(in_array($tindakan, $formTambah[$fid]['tindakan_dilakukan'] ?? [], true))
                                                                    class="mt-0.5 size-3.5 accent-[#2E86C1]"
                                                                />
                                                                <span class="text-xs text-[#1B4F72]">{{ $tindakan }}</span>
                                                            </label>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            @endif

                                            <div>
                                                <label class="text-xs font-medium text-[#7A8FA6]">Catatan Tambahan</label>
                                                <textarea
                                                    wire:model="formTambah.{{ $fid }}.catatan"
                                                    rows="2"
                                                    placeholder="Catatan pelaksanaan tindakan..."
                                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-2 text-sm resize-none focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                ></textarea>
                                            </div>

                                            <div>
                                                <label class="text-xs font-medium text-[#7A8FA6]">Respons Pasien <span class="text-[#D95C3A]">*</span></label>
                                                <textarea
                                                    wire:model="formTambah.{{ $fid }}.respons_pasien"
                                                    rows="2"
                                                    placeholder="Bagaimana respons/reaksi pasien setelah dilakukan tindakan..."
                                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-2 text-sm resize-none focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                ></textarea>
                                                @error("formTambah.{$fid}.respons_pasien") <p class="mt-1 text-xs text-[#D95C3A]">{{ $message }}</p> @enderror
                                            </div>

                                            <div class="flex items-center gap-2">
                                                <button
                                                    wire:click="simpanLog({{ $fid }})"
                                                    wire:loading.attr="disabled"
                                                    class="rounded-lg px-4 py-2 text-xs font-semibold text-white transition hover:opacity-90 disabled:opacity-50"
                                                    style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
                                                >
                                                    Simpan Log
                                                </button>
                                                <button
                                                    wire:click="sembunyikanForm({{ $fid }})"
                                                    class="rounded-lg border border-[#D0DCE8] px-4 py-2 text-xs font-semibold text-[#7A8FA6] hover:bg-[#F4F8FB] transition"
                                                >
                                                    Batal
                                                </button>
                                            </div>
                                        </div>
                                    @endif

                                    {{-- Daftar Log --}}
                                    @if (empty($intervensi['logs']))
                                        <p class="text-center text-xs text-[#C4D3DF] py-3">Belum ada log untuk intervensi ini.</p>
                                    @else
                                        <div class="space-y-2">
                                            @foreach ($intervensi['logs'] as $log)
                                                <div class="rounded-xl border border-[#E0EBF5] bg-white p-3">
                                                    <div class="flex items-start justify-between gap-2">
                                                        <div class="flex-1 min-w-0">
                                                            <div class="flex flex-wrap items-center gap-1.5 text-xs">
                                                                <span class="font-semibold text-[#1B4F72]">{{ \Carbon\Carbon::parse($log['tanggal'])->translatedFormat('d M Y') }}</span>
                                                                <span class="text-[#7A8FA6]">{{ $log['waktu'] }}</span>
                                                                <span class="rounded-full bg-[#EBF5FB] px-2 py-0.5 font-medium capitalize text-[#2E86C1]">{{ $log['shift'] }}</span>
                                                                @if ($log['durasi_menit'])
                                                                    <span class="rounded-full bg-[#F4F8FB] px-2 py-0.5 font-medium text-[#7A8FA6]">{{ $log['durasi_menit'] }} menit</span>
                                                                @endif
                                                                @if ($log['spo2_sebelum'] || $log['spo2_setelah'])
                                                                    <span class="rounded-full bg-[#E1F5EE] px-2 py-0.5 font-medium text-[#0F6E56]">
                                                                        SpO2 {{ $log['spo2_sebelum'] ?? '-' }} -> {{ $log['spo2_setelah'] ?? '-' }}%
                                                                    </span>
                                                                @endif
                                                            </div>
                                                            @if (! empty($log['tindakan_dilakukan']))
                                                                <ul class="mt-1.5 space-y-0.5">
                                                                    @foreach ($log['tindakan_dilakukan'] as $t)
                                                                        <li class="flex items-start gap-1 text-xs text-[#1B4F72]">
                                                                            <flux:icon.check class="mt-0.5 size-3 shrink-0 text-[#1A9B72]" />
                                                                            {{ $t }}
                                                                        </li>
                                                                    @endforeach
                                                                </ul>
                                                            @endif
                                                            @if ($log['respons_pasien'])
                                                                <p class="mt-1.5 text-xs text-[#7A8FA6]"><span class="font-medium text-[#1B4F72]">Respons:</span> {{ $log['respons_pasien'] }}</p>
                                                            @endif
                                                        </div>
                                                        <button
                                                            wire:click="hapusLog({{ $log['id'] }})"
                                                            wire:confirm="Hapus log ini?"
                                                            class="shrink-0 rounded p-1 text-[#C4D3DF] hover:text-[#D95C3A] hover:bg-[#FDE8E8] transition"
                                                        >
                                                            <flux:icon.trash class="size-3.5" />
                                                        </button>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            @endforeach
        </div>

        {{-- Navigation --}}
        <div class="mt-6 flex items-center justify-between border-t border-[#E0EBF5] pt-4">
            <flux:button :href="route('askep.perencanaan', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                Kembali
            </flux:button>

            <button
                wire:click="simpanLanjut"
                wire:loading.attr="disabled"
                class="inline-flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <span wire:loading.remove wire:target="simpanLanjut">Simpan & Lanjut ke Evaluasi</span>
                <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
                <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
            </button>
        </div>
    @endif
</div>
