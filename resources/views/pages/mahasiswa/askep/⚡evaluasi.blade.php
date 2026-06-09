<?php

use App\Models\Askep;
use App\Models\AskepEvaluasi;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Evaluasi Askep')] class extends Component
{
    public Askep $askep;

    /** Index diagnosa yang sedang terbuka di accordion. */
    public ?int $terbuka = 0;

    /**
     * Data evaluasi per diagnosa.
     * @var array<int, array{
     *   diagnosa_id: int,
     *   kode: string,
     *   label: string,
     *   prioritas: int,
     *   luaran: list<array{
     *      kode: string, 
     *      label: string, 
     *      target_waktu: string, 
     *      kriteria: list<array{id: int, deskripsi: string, arah: string, opsi_skor: array<int, string>, awal: string, target: string}>
     *   }>,
     *   evaluasi: array{
     *     id: int|null,
     *     tanggal: string,
     *     jam: string,
     *     hari_ke: string,
     *     catatan_soap: string,
     *     tv_td: string,
     *     tv_nadi: string,
     *     tv_rr: string,
     *     tv_suhu: string,
     *     tv_spo2: string,
     *     skor_indikator: array<string, string>,
     *     analisis: string,
     *     analisis_narasi: string,
     *     tindak_lanjut: string,
     *     penanggung_jawab: string
     *   }
     * }>
     */
    public array $rencana = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load([
            'pasien',
            'diagnosa.sdki',
            'diagnosa.luaran.slki.kriteriaHasil',
            'diagnosa.evaluasi',
        ]);

        $this->inisialisasi();
    }

    /**
     * @return array<int, string>
     */
    public function opsiSkorIndikator(string $arah): array
    {
        return match ($arah) {
            'Meningkat' => [1 => 'Menurun', 2 => 'Cukup menurun', 3 => 'Sedang', 4 => 'Cukup meningkat', 5 => 'Meningkat'],
            'Menurun' => [1 => 'Meningkat', 2 => 'Cukup meningkat', 3 => 'Sedang', 4 => 'Cukup menurun', 5 => 'Menurun'],
            default => [1 => 'Memburuk', 2 => 'Cukup memburuk', 3 => 'Sedang', 4 => 'Cukup membaik', 5 => 'Membaik'],
        };
    }

    private function inisialisasi(): void
    {
        $this->rencana = [];

        foreach ($this->askep->diagnosa as $diagnosa) {
            $eval = $diagnosa->evaluasi->first();

            // Bangun array luaran dari step 3 (SLKI terpilih beserta skor awal & target)
            $luaranList = [];
            $skorAwalEval = $eval?->skor_indikator ?? []; // Format DB: ['kriteria_id' => 'skor_akhir']

            foreach ($diagnosa->luaran as $l) {
                $kriteriaList = [];
                $skorPerencanaan = is_array($l->skor_indikator) ? $l->skor_indikator : json_decode($l->skor_indikator ?? '{}', true);

                if ($l->slki) {
                    foreach ($l->slki->kriteriaHasil as $k) {
                        $kId = (string) $k->id;
                        // Hanya masukkan kriteria yang diisi di Langkah 3 (punya target)
                        if (isset($skorPerencanaan[$kId]['target']) && $skorPerencanaan[$kId]['target'] !== '') {
                            $kriteriaList[] = [
                                'id' => $k->id,
                                'deskripsi' => $k->deskripsi,
                                'arah' => $k->arah,
                                'opsi_skor' => $this->opsiSkorIndikator($k->arah),
                                'awal' => $skorPerencanaan[$kId]['awal'] ?? '-',
                                'target' => $skorPerencanaan[$kId]['target'],
                            ];
                            
                            // Initialize skor evaluasi if not set
                            if (!isset($skorAwalEval[$kId])) {
                                $skorAwalEval[$kId] = '';
                            }
                        }
                    }
                }

                $luaranList[] = [
                    'kode'        => $l->slki?->kode_luaran ?? '',
                    'label'       => $l->slki?->label_luaran ?? '',
                    'target_waktu' => $l->target_waktu ?? '',
                    'kriteria'    => $kriteriaList,
                ];
            }

            $this->rencana[] = [
                'diagnosa_id' => $diagnosa->id,
                'kode'        => $diagnosa->sdki?->kode_diagnosa ?? '',
                'label'       => $diagnosa->sdki?->label_diagnosa ?? '',
                'prioritas'   => $diagnosa->prioritas,
                'luaran'      => $luaranList,
                'evaluasi'    => [
                    'id'               => $eval?->id,
                    'tanggal'          => $eval?->tanggal?->format('Y-m-d') ?? now()->format('Y-m-d'),
                    'jam'              => $eval?->jam ?? now()->format('H:i'),
                    'hari_ke'          => (string) ($eval?->hari_ke ?? '1'),
                    'catatan_soap'     => $eval?->catatan_soap ?? '',
                    'tv_td'            => $eval?->tv_td ?? '',
                    'tv_nadi'          => (string) ($eval?->tv_nadi ?? ''),
                    'tv_rr'            => (string) ($eval?->tv_rr ?? ''),
                    'tv_suhu'          => (string) ($eval?->tv_suhu ?? ''),
                    'tv_spo2'          => (string) ($eval?->tv_spo2 ?? ''),
                    'skor_indikator'   => $skorAwalEval,
                    'analisis'         => $eval?->analisis ?? 'Belum Tercapai',
                    'analisis_narasi'  => $eval?->analisis_narasi ?? '',
                    'tindak_lanjut'    => $eval?->tindak_lanjut ?? 'Lanjutkan',
                    'penanggung_jawab' => $eval?->penanggung_jawab ?? '',
                ],
            ];
        }
    }

    public function toggleDiagnosa(int $index): void
    {
        $this->terbuka = $this->terbuka === $index ? null : $index;
    }

    public function simpan(): void
    {
        $rules = [];
        foreach ($this->rencana as $dIdx => $d) {
            $rules["rencana.{$dIdx}.evaluasi.tanggal"]         = ['required', 'date'];
            $rules["rencana.{$dIdx}.evaluasi.analisis"]        = ['required', 'in:Tercapai,Membaik,Belum Tercapai'];
            $rules["rencana.{$dIdx}.evaluasi.tindak_lanjut"]   = ['required', 'in:Lanjutkan,Hentikan,Modifikasi,Rujuk'];
            $rules["rencana.{$dIdx}.evaluasi.catatan_soap"]    = ['nullable', 'string', 'max:3000'];
            $rules["rencana.{$dIdx}.evaluasi.analisis_narasi"] = ['nullable', 'string', 'max:2000'];
        }

        $this->validate($rules);

        foreach ($this->rencana as $d) {
            $ev = $d['evaluasi'];
            AskepEvaluasi::updateOrCreate(
                ['askep_diagnosa_id' => $d['diagnosa_id']],
                [
                    'tanggal'          => $ev['tanggal'],
                    'jam'              => $ev['jam'],
                    'hari_ke'          => (int) $ev['hari_ke'],
                    'catatan_soap'     => $ev['catatan_soap'],
                    'tv_td'            => $ev['tv_td'],
                    'tv_nadi'          => $ev['tv_nadi'] !== '' ? (int) $ev['tv_nadi'] : null,
                    'tv_rr'            => $ev['tv_rr'] !== '' ? (int) $ev['tv_rr'] : null,
                    'tv_suhu'          => $ev['tv_suhu'] !== '' ? (float) $ev['tv_suhu'] : null,
                    'tv_spo2'          => $ev['tv_spo2'] !== '' ? (int) $ev['tv_spo2'] : null,
                    'skor_indikator'   => $ev['skor_indikator'], // format: ['kriteria_id' => 'skor_akhir']
                    'analisis'         => $ev['analisis'],
                    'analisis_narasi'  => $ev['analisis_narasi'],
                    'tindak_lanjut'    => $ev['tindak_lanjut'],
                    'penanggung_jawab' => $ev['penanggung_jawab'],
                ],
            );
        }

        Flux::toast(variant: 'success', text: 'Evaluasi tersimpan.');
    }

    public function selesaikanDanKirim(): void
    {
        $this->simpan();

        $this->askep->update([
            'step_terakhir' => 5,
            'status'        => Askep::STATUS_MENUNGGU_REVIEW,
            'submitted_at'  => now(),
        ]);

        $this->askep->pasien->catatRiwayat('Askep dikirim untuk review dosen.');
Flux::toast(variant: 'success', text: 'Askep berhasil dikirim untuk review.');

$this->redirectRoute('askep.show', $this->askep, navigate: true);
}

};
?>

<div class="p-4 md:p-6">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 5])

    <div class="mb-4">
        <h2 class="text-xl font-bold text-[#1B4F72]">Langkah 5: Evaluasi Keperawatan</h2>
        <p class="text-sm text-[#7A8FA6]">Evaluasi pencapaian luaran per diagnosa menggunakan metode SOAP.</p>
    </div>

    @if (empty($rencana))
        <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-16 text-center">
            <flux:icon.clipboard-document-list class="mb-3 size-12 text-[#85B7EB]" />
            <p class="font-medium text-[#1B4F72]">Belum ada diagnosa</p>
            <flux:button :href="route('askep.implementasi', $askep)" variant="ghost" icon="arrow-left" wire:navigate class="mt-4">
                Kembali ke Implementasi
            </flux:button>
        </div>
    @else
        <div class="space-y-3">
            @foreach ($rencana as $dIdx => $d)
                <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white">
                    {{-- Header --}}
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
                                    @php
                                        $analisis = $d['evaluasi']['analisis'];
                                        $badgeClass = match ($analisis) {
                                            'teratasi'          => 'bg-[#E1F5EE] text-[#0F6E56]',
                                            'teratasi_sebagian' => 'bg-[#FEF3C7] text-amber-700',
                                            default             => 'bg-[#FDE8E8] text-[#D95C3A]',
                                        };
                                        $badgeLabel = match ($analisis) {
                                            'teratasi'          => 'Teratasi',
                                            'teratasi_sebagian' => 'Teratasi Sebagian',
                                            default             => 'Belum Teratasi',
                                        };
                                    @endphp
                                    <span class="rounded-full {{ $badgeClass }} px-2 py-0.5 text-[10px] font-semibold">
                                        {{ $badgeLabel }}
                                    </span>
                                </div>
                                <p class="mt-0.5 text-sm font-medium text-[#1B4F72]">{{ $d['label'] }}</p>
                            </div>
                        </div>
                        <flux:icon.chevron-down
                            class="size-5 shrink-0 text-[#7A8FA6] transition-transform {{ $terbuka === $dIdx ? 'rotate-180' : '' }}"
                        />
                    </button>

                    @if ($terbuka === $dIdx)
                        <div class="border-t border-[#E0EBF5] px-5 py-5 space-y-5">

                            {{-- Luaran yang ditetapkan --}}
                            @if (! empty($d['luaran']))
                                <div class="rounded-xl bg-[#F0FBF7] border border-[#5DCAA5] p-4">
                                    <p class="mb-2 text-xs font-semibold uppercase tracking-wide text-[#0F6E56]">Luaran yang Ditetapkan (SLKI)</p>
                                    @foreach ($d['luaran'] as $l)
                                        <div class="flex items-start gap-2 py-1">
                                            <flux:icon.check-circle class="mt-0.5 size-4 shrink-0 text-[#1A9B72]" />
                                            <div>
                                                <span class="font-mono text-xs text-[#1A9B72]">{{ $l['kode'] }}</span>
                                                <span class="mx-1 text-[#C4D3DF]">·</span>
                                                <span class="text-sm text-[#1B4F72]">{{ $l['label'] }}</span>
                                                @if ($l['target_waktu'])
                                                    <span class="ml-1 text-xs text-[#7A8FA6]">(target: {{ $l['target_waktu'] }})</span>
                                                @endif
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endif

                            {{-- Tanggal, Jam, Hari ke- --}}
                            <div class="grid grid-cols-3 gap-3">
                                <div>
                                    <label class="text-xs font-medium text-[#7A8FA6]">Tanggal Evaluasi</label>
                                    <input
                                        type="date"
                                        wire:model="rencana.{{ $dIdx }}.evaluasi.tanggal"
                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                    />
                                </div>
                                <div>
                                    <label class="text-xs font-medium text-[#7A8FA6]">Jam</label>
                                    <input
                                        type="time"
                                        wire:model="rencana.{{ $dIdx }}.evaluasi.jam"
                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                    />
                                </div>
                                <div>
                                    <label class="text-xs font-medium text-[#7A8FA6]">Hari Ke-</label>
                                    <input
                                        type="number"
                                        min="1"
                                        wire:model="rencana.{{ $dIdx }}.evaluasi.hari_ke"
                                        class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                    />
                                </div>
                            </div>

                            {{-- Catatan SOAP --}}
                            <div>
                                <label class="text-xs font-medium text-[#7A8FA6]">Catatan SOAP</label>
                                <textarea
                                    wire:model="rencana.{{ $dIdx }}.evaluasi.catatan_soap"
                                    rows="4"
                                    placeholder="S: Subjektif — keluhan yang disampaikan pasien&#10;O: Objektif — hasil pemeriksaan&#10;A: Analisis — kesimpulan kondisi&#10;P: Planning — rencana selanjutnya"
                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-2 text-sm resize-none focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                ></textarea>
                            </div>

                            {{-- TTV --}}
                            <div>
                                <p class="mb-2 text-xs font-medium text-[#7A8FA6]">Tanda-Tanda Vital Saat Evaluasi</p>
                                <div class="grid grid-cols-2 gap-3 sm:grid-cols-5">
                                    <div>
                                        <label class="text-xs text-[#7A8FA6]">TD (mmHg)</label>
                                        <input
                                            type="text"
                                            wire:model="rencana.{{ $dIdx }}.evaluasi.tv_td"
                                            placeholder="120/80"
                                            class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                        />
                                    </div>
                                    <div>
                                        <label class="text-xs text-[#7A8FA6]">Nadi (/mnt)</label>
                                        <input
                                            type="number"
                                            wire:model="rencana.{{ $dIdx }}.evaluasi.tv_nadi"
                                            placeholder="80"
                                            class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                        />
                                    </div>
                                    <div>
                                        <label class="text-xs text-[#7A8FA6]">RR (/mnt)</label>
                                        <input
                                            type="number"
                                            wire:model="rencana.{{ $dIdx }}.evaluasi.tv_rr"
                                            placeholder="18"
                                            class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                        />
                                    </div>
                                    <div>
                                        <label class="text-xs text-[#7A8FA6]">Suhu (°C)</label>
                                        <input
                                            type="number"
                                            step="0.1"
                                            wire:model="rencana.{{ $dIdx }}.evaluasi.tv_suhu"
                                            placeholder="36.5"
                                            class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                        />
                                    </div>
                                    <div>
                                        <label class="text-xs text-[#7A8FA6]">SpO₂ (%)</label>
                                        <input
                                            type="number"
                                            wire:model="rencana.{{ $dIdx }}.evaluasi.tv_spo2"
                                            placeholder="98"
                                            class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none"
                                        />
                                    </div>
                                </div>
                            </div>

                            {{-- Skor Indikator SLKI --}}
                            @if (! empty($d['luaran']))
                                <div>
                                    <p class="mb-3 text-sm font-bold text-[#1B4F72]">Evaluasi Kriteria Hasil (SLKI)</p>
                                    <div class="space-y-4">
                                        @foreach ($d['luaran'] as $l)
                                            <div class="rounded-xl border border-[#CDEFE4] bg-white overflow-hidden">
                                                <div class="bg-[#F0FBF7] px-4 py-2 border-b border-[#CDEFE4]">
                                                    <span class="text-xs font-bold text-[#0F6E56]">{{ $l['kode'] }} - {{ $l['label'] }}</span>
                                                </div>
                                                <div class="p-3">
                                                    @if(empty($l['kriteria']))
                                                        <p class="text-xs text-[#7A8FA6] italic">Tidak ada target kriteria hasil yang ditetapkan di Langkah Perencanaan.</p>
                                                    @else
                                                        <div class="space-y-3">
                                                            @foreach ($l['kriteria'] as $k)
                                                                @php $kId = $k['id']; @endphp
                                                                <div class="grid grid-cols-1 md:grid-cols-[1fr_auto] gap-3 items-center p-2 rounded bg-[#F4F8FB] border border-[#E0EBF5]">
                                                                    <div>
                                                                        <div class="flex items-center gap-2 mb-1">
                                                                            <p class="text-sm font-medium text-[#1B4F72] leading-tight">{{ $k['deskripsi'] }}</p>
                                                                            <span class="rounded-full bg-white px-2 py-0.5 text-[9px] font-semibold text-[#7A8FA6] border border-[#D0DCE8]">{{ $k['arah'] }}</span>
                                                                        </div>
                                                                        <div class="flex gap-4 text-[10px] font-semibold text-[#7A8FA6]">
                                                                            <span>Skor Awal: <span class="text-[#1B4F72]">{{ $k['awal'] }}</span></span>
                                                                            <span>Target: <span class="text-[#1A9B72]">{{ $k['target'] }}</span></span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="flex flex-col items-center">
                                                                        <p class="text-[9px] font-bold uppercase tracking-wider text-[#2E86C1] mb-1">Skor Akhir Evaluasi</p>
                                                                        <div class="flex gap-1 bg-white p-1 rounded border border-[#D0DCE8]">
                                                                            <span class="text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight flex items-center justify-center">{{ $k['opsi_skor'][1] }}</span>
                                                                            @for ($s = 1; $s <= 5; $s++)
                                                                                <label class="cursor-pointer">
                                                                                    <input type="radio" wire:model="rencana.{{ $dIdx }}.evaluasi.skor_indikator.{{ $kId }}" value="{{ $s }}" class="peer sr-only" />
                                                                                    <span class="flex size-7 items-center justify-center rounded-sm text-xs font-bold text-[#1B4F72] transition peer-checked:bg-[#2E86C1] peer-checked:text-white hover:bg-[#EBF5FB]" title="{{ $s }}. {{ $k['opsi_skor'][$s] }}">
                                                                                        {{ $s }}
                                                                                    </span>
                                                                                </label>
                                                                            @endfor
                                                                            <span class="text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight flex items-center justify-center">{{ $k['opsi_skor'][5] }}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            @endif

                            {{-- Analisis --}}
                            <div>
                                <p class="mb-2 text-xs font-medium text-[#7A8FA6]">A: Analisis Diagnosa <span class="text-[#D95C3A]">*</span></p>
                                <div class="grid grid-cols-3 gap-2">
                                    @foreach (['Tercapai' => ['label' => 'Tercapai', 'color' => 'text-[#0F6E56] border-[#5DCAA5] bg-[#E1F5EE]', 'default' => 'border-[#D0DCE8] hover:border-[#5DCAA5]'], 'Membaik' => ['label' => 'Membaik', 'color' => 'text-[#2E86C1] border-[#85B7EB] bg-[#EBF5FB]', 'default' => 'border-[#D0DCE8] hover:border-[#85B7EB]'], 'Belum Tercapai' => ['label' => 'Belum Tercapai', 'color' => 'text-[#D95C3A] border-[#F4A58C] bg-[#FDE8E8]', 'default' => 'border-[#D0DCE8] hover:border-[#F4A58C]']] as $val => $opt)
                                        <button
                                            wire:click="$set('rencana.{{ $dIdx }}.evaluasi.analisis', '{{ $val }}')"
                                            class="rounded-xl border-2 px-3 py-2.5 text-sm font-semibold transition
                                                {{ $d['evaluasi']['analisis'] === $val ? $opt['color'] : 'border-[#D0DCE8] text-[#7A8FA6] ' . $opt['default'] }}"
                                        >
                                            {{ $opt['label'] }}
                                        </button>
                                    @endforeach
                                </div>
                                @error('rencana.'.$dIdx.'.evaluasi.analisis') <span class="text-xs text-red-500">{{ $message }}</span> @enderror
                            </div>

                            {{-- Narasi Analisis --}}
                            <div>
                                <label class="text-xs font-medium text-[#7A8FA6]">Catatan Tambahan Analisis</label>
                                <textarea
                                    wire:model="rencana.{{ $dIdx }}.evaluasi.analisis_narasi"
                                    rows="2"
                                    placeholder="Uraikan perkembangan kondisi pasien secara singkat..."
                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-2 text-sm resize-none focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                ></textarea>
                            </div>

                            {{-- Tindak Lanjut --}}
                            <div>
                                <p class="mb-2 text-xs font-medium text-[#7A8FA6]">P: Tindak Lanjut (Planning) <span class="text-[#D95C3A]">*</span></p>
                                <div class="grid grid-cols-2 md:grid-cols-4 gap-2">
                                    @foreach (['Lanjutkan', 'Hentikan', 'Modifikasi', 'Rujuk'] as $val)
                                        <button
                                            wire:click="$set('rencana.{{ $dIdx }}.evaluasi.tindak_lanjut', '{{ $val }}')"
                                            class="rounded-xl border-2 px-3 py-2 text-sm font-semibold transition
                                                {{ $d['evaluasi']['tindak_lanjut'] === $val ? 'text-[#2E86C1] border-[#2E86C1] bg-[#EBF5FB]' : 'border-[#D0DCE8] text-[#7A8FA6] hover:border-[#85B7EB]' }}"
                                        >
                                            {{ $val }}
                                        </button>
                                    @endforeach
                                </div>
                                @error('rencana.'.$dIdx.'.evaluasi.tindak_lanjut') <span class="text-xs text-red-500">{{ $message }}</span> @enderror
                            </div>

                            <div>
                                <label class="text-xs font-medium text-[#7A8FA6]">Penanggung Jawab</label>
                                <input
                                    type="text"
                                    wire:model="rencana.{{ $dIdx }}.evaluasi.penanggung_jawab"
                                    placeholder="Nama mahasiswa / ttd"
                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] px-3 py-1.5 text-sm focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                />
                            </div>
                        </div>
                    @endif
                </div>
            @endforeach
        </div>

        {{-- Navigation --}}
        <div class="mt-6 flex flex-col items-stretch gap-3 border-t border-[#E0EBF5] pt-4 sm:flex-row sm:items-center sm:justify-between">
            <flux:button :href="route('askep.implementasi', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                Kembali
            </flux:button>

            <div class="flex flex-col items-stretch gap-2 sm:flex-row sm:items-center">
                <button
                    wire:click="simpan"
                    wire:loading.attr="disabled"
                    class="inline-flex items-center justify-center gap-2 rounded-xl border border-[#85B7EB] px-5 py-2.5 text-sm font-semibold text-[#2E86C1] transition hover:bg-[#EBF5FB] disabled:opacity-50"
                >
                    <flux:icon.document-check class="size-4" wire:loading.remove wire:target="simpan" />
                    <span wire:loading.remove wire:target="simpan">Simpan Draft</span>
                    <span wire:loading wire:target="simpan">Menyimpan...</span>
                </button>

                <button
                    wire:click="selesaikanDanKirim"
                    wire:loading.attr="disabled"
                    class="inline-flex items-center justify-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                    style="background: linear-gradient(135deg, #1A9B72, #0F6E56)"
                >
                    <span wire:loading.remove wire:target="selesaikanDanKirim">Selesai & Kirim untuk Review</span>
                    <span wire:loading wire:target="selesaikanDanKirim">Mengirim...</span>
                    <flux:icon.paper-airplane class="size-4" wire:loading.remove wire:target="selesaikanDanKirim" />
                </button>
            </div>
        </div>
    @endif
</div>
