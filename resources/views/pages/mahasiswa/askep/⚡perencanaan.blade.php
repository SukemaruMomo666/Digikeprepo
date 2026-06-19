<?php

use App\Models\Askep;
use App\Models\AskepDiagnosaLuaran;
use App\Models\AskepIntervensi;
use App\Models\IntervensiSiki;
use App\Models\LuaranSlki;
use Illuminate\Support\Arr;
use Flux\Flux;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Layout;
use Livewire\Attributes\On;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Perencanaan Askep')] class extends Component
{
    public Askep $askep;

    /** Index diagnosa yang sedang dibuka di accordion (null = semua tutup). */
    public ?int $terbuka = 0;

    /**
     * Data perencanaan per diagnosa.
     * @var array<int, array{
     *   diagnosa_id: int,
     *   sdki_id: int,
     *   kode: string,
     *   label: string,
     *   prioritas: int,
     *   luaran: array<int, array{id: int|null, slki_id: int, kode: string, label: string, target_waktu: string, skor_indikator: array<int, array{awal: string, target: string}>, dipilih: bool, kriteria: array<int, array{id: int, urutan: int, deskripsi: string, arah: string, opsi_skor: array<int, string>}>}>,
     *   intervensi: array<int, array{id: int|null, siki_id: int|null, nama_manual: string, kode: string, label: string, definisi: string, tindakan_per_jenis: array<string, list<string>>, tindakan_dipilih: list<string>, dipilih: bool}>
     * }>
     */
    public array $rencana = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load([
            'pasien',
            'diagnosa.sdki.luaranSlki.intervensiSiki.sikiTindakan',
            'diagnosa.sdki.luaranSlki.kriteriaHasil',
            'diagnosa.luaran.slki.kriteriaHasil',
            'diagnosa.intervensi.siki',
        ]);

        $this->inisialisasiRencana();
    }

    private function inisialisasiRencana(): void
    {
        $this->rencana = [];

        foreach ($this->askep->diagnosa as $diagnosa) {
            // Luaran yang sudah tersimpan, di-index per slki_id
            $luaranTersimpan = $diagnosa->luaran->keyBy('slki_id');

            // Intervensi yang sudah tersimpan, di-index per siki_id
            $intervensiTersimpan = $diagnosa->intervensi->keyBy('siki_id');

            // Rekomendasi luaran SLKI dari mapping SDKI
            $luaranOptions = [];
            foreach ($diagnosa->sdki?->luaranSlki ?? collect() as $slki) {
                $saved = $luaranTersimpan->get($slki->id);
                $skorIndikator = $saved?->skor_indikator ?? []; // Expected format: [kriteria_id => ['awal' => '2', 'target' => '5']]
                $kriteria = $slki->kriteriaHasil
                    ->map(fn ($item): array => [
                        'id' => $item->id,
                        'urutan' => $item->urutan,
                        'deskripsi' => $item->deskripsi,
                        'arah' => $item->arah,
                        'opsi_skor' => $this->opsiSkorIndikator($item->arah),
                    ])
                    ->values()
                    ->all();

                $luaranOptions[] = [
                    'id'          => $saved?->id,
                    'slki_id'     => $slki->id,
                    'kode'        => $slki->kode_luaran,
                    'label'       => $slki->label_luaran,
                    'target_waktu' => $saved?->target_waktu ?? '',
                    'skor_indikator' => collect($kriteria)
                        ->mapWithKeys(function ($item) use ($skorIndikator): array {
                            $kId = (string) $item['id'];
                            // Provide defaults or pull existing saved data
                            $awal = $skorIndikator[$kId]['awal'] ?? '';
                            $target = $skorIndikator[$kId]['target'] ?? '';
                            return [$kId => ['awal' => (string) $awal, 'target' => (string) $target]];
                        })
                        ->all(),
                    'kriteria'    => $kriteria,
                    'dipilih'     => $saved !== null,
                ];
            }

            // Intervensi SIKI dari mapping SLKI yang terkait
            $semuaSiki = collect();
            foreach ($diagnosa->sdki?->luaranSlki ?? collect() as $slki) {
                $semuaSiki = $semuaSiki->merge($slki->intervensiSiki);
            }
            $semuaSiki = $semuaSiki->unique('id');

            $intervensiOptions = [];
            foreach ($semuaSiki as $siki) {
                $saved = $intervensiTersimpan->get($siki->id);
                // Grup tindakan per jenis (unique agar tidak duplikat antar batch SDKI)
                $tindakanPerJenis = $siki->sikiTindakan
                    ->groupBy('jenis')
                    ->map(fn ($group) => $group->pluck('deskripsi')->unique()->values()->all())
                    ->all();
                $intervensiOptions[] = [
                    'id'                => $saved?->id,
                    'siki_id'           => $siki->id,
                    'nama_manual'       => '',
                    'kode'              => $siki->kode_intervensi,
                    'label'             => $siki->label_intervensi,
                    'definisi'          => $siki->definisi ?? '',
                    'tindakan_per_jenis'=> $tindakanPerJenis,
                    'tindakan_dipilih'  => $saved?->tindakan_dipilih ?? [],
                    'dipilih'           => $saved !== null,
                ];
            }

            // Intervensi manual yang sudah tersimpan (siki_id null)
            foreach ($diagnosa->intervensi->whereNull('siki_id') as $manual) {
                $intervensiOptions[] = [
                    'id'                => $manual->id,
                    'siki_id'           => null,
                    'nama_manual'       => $manual->nama_manual ?? '',
                    'kode'              => 'MANUAL',
                    'label'             => $manual->nama_manual ?? 'Intervensi Manual',
                    'definisi'          => '',
                    'tindakan_per_jenis'=> [],
                    'tindakan_dipilih'  => $manual->tindakan_dipilih ?? [],
                    'dipilih'           => true,
                ];
            }

            $this->rencana[] = [
                'diagnosa_id' => $diagnosa->id,
                'sdki_id'     => $diagnosa->sdki_id,
                'kode'        => $diagnosa->sdki?->kode_diagnosa ?? '',
                'label'       => $diagnosa->sdki?->label_diagnosa ?? '',
                'prioritas'   => $diagnosa->prioritas,
                'luaran'      => $luaranOptions,
                'intervensi'  => $intervensiOptions,
            ];
        }
    }

    public function toggleDiagnosa(int $index): void
    {
        $this->terbuka = $this->terbuka === $index ? null : $index;
    }

    public function toggleLuaran(int $dIdx, int $lIdx): void
    {
        $this->rencana[$dIdx]['luaran'][$lIdx]['dipilih']
            = ! $this->rencana[$dIdx]['luaran'][$lIdx]['dipilih'];
    }

    /**
     * @return array<int, string>
     */
    public function opsiSkorIndikator(string $arah): array
    {
        return match ($arah) {
            'Meningkat' => [
                1 => 'Menurun',
                2 => 'Cukup menurun',
                3 => 'Sedang',
                4 => 'Cukup meningkat',
                5 => 'Meningkat',
            ],
            'Menurun' => [
                1 => 'Meningkat',
                2 => 'Cukup meningkat',
                3 => 'Sedang',
                4 => 'Cukup menurun',
                5 => 'Menurun',
            ],
            default => [
                1 => 'Memburuk',
                2 => 'Cukup memburuk',
                3 => 'Sedang',
                4 => 'Cukup membaik',
                5 => 'Membaik',
            ],
        };
    }

    public function toggleTindakan(int $dIdx, int $iIdx, string $tindakan): void
    {
        $dipilih = $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih'];
        if (in_array($tindakan, $dipilih, true)) {
            $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih']
                = array_values(array_filter($dipilih, fn ($t) => $t !== $tindakan));
        } else {
            $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih'][] = $tindakan;
        }
    }

    /** Pilih atau hapus semua tindakan dalam satu jenis/kategori. */
    #[On('toggle-all-jenis')]
    public function toggleAllJenis(int $dIdx, int $iIdx, array $tindakans): void
    {
        $dipilih = $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih'];
        $semuaDipilih = collect($tindakans)->every(fn ($t) => in_array($t, $dipilih, true));

        if ($semuaDipilih) {
            // Hapus semua dari jenis ini
            $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih']
                = array_values(array_filter($dipilih, fn ($t) => ! in_array($t, $tindakans, true)));
        } else {
            // Tambahkan yang belum ada
            foreach ($tindakans as $t) {
                if (! in_array($t, $dipilih, true)) {
                    $this->rencana[$dIdx]['intervensi'][$iIdx]['tindakan_dipilih'][] = $t;
                }
            }
        }
    }

    public function toggleIntervensi(int $dIdx, int $iIdx): void
    {
        $this->rencana[$dIdx]['intervensi'][$iIdx]['dipilih']
            = ! $this->rencana[$dIdx]['intervensi'][$iIdx]['dipilih'];
    }

    public function simpanLanjut(): void
    {
        foreach ($this->rencana as $d) {
            $diagnosaId = $d['diagnosa_id'];

            // ── Simpan Luaran ──────────────────────────────────────────────
            $slkiDipilihIds = [];
            foreach ($d['luaran'] as $l) {
                if (! $l['dipilih']) {
                    continue;
                }
                $slkiDipilihIds[] = $l['slki_id'];

                AskepDiagnosaLuaran::updateOrCreate(
                    ['askep_diagnosa_id' => $diagnosaId, 'slki_id' => $l['slki_id']],
                    [
                        'target_waktu' => $l['target_waktu'],
                        'skor_indikator' => collect($l['skor_indikator'] ?? [])
                            ->filter(fn ($skor): bool => !empty($skor['awal']) || !empty($skor['target'])) // Save if either is filled
                            ->map(fn ($skor): array => [
                                'awal' => (int) $skor['awal'],
                                'target' => (int) $skor['target']
                            ])
                            ->all(),
                    ],
                );
            }

            // Hapus luaran yang di-uncheck
            AskepDiagnosaLuaran::where('askep_diagnosa_id', $diagnosaId)
                ->whereNotIn('slki_id', $slkiDipilihIds)
                ->delete();

            // ── Simpan Intervensi ──────────────────────────────────────────
            $sikiDipilihIds = [];
            foreach ($d['intervensi'] as $i) {
                if (! $i['dipilih']) {
                    continue;
                }

                if ($i['siki_id'] !== null) {
                    $sikiDipilihIds[] = $i['siki_id'];
                    AskepIntervensi::updateOrCreate(
                        ['askep_diagnosa_id' => $diagnosaId, 'siki_id' => $i['siki_id']],
                        ['tindakan_dipilih' => $i['tindakan_dipilih'], 'is_included' => true],
                    );
                } else {
                    // Manual
                    if ($i['id']) {
                        AskepIntervensi::where('id', $i['id'])->update([
                            'tindakan_dipilih' => $i['tindakan_dipilih'],
                        ]);
                    }
                }
            }

            // Hapus intervensi SIKI yang di-uncheck
            AskepIntervensi::where('askep_diagnosa_id', $diagnosaId)
                ->whereNotNull('siki_id')
                ->whereNotIn('siki_id', $sikiDipilihIds)
                ->delete();
        }

        if ($this->askep->step_terakhir < 3) {
            $this->askep->update(['step_terakhir' => 3]);
        }

        $this->askep->pasien->catatRiwayat('Perencanaan (SLKI & SIKI) disimpan.');

        Flux::toast(variant: 'success', text: 'Perencanaan tersimpan.');
        $this->redirectRoute('mahasiswa.askep.implementasi', $this->askep, navigate: true);
    }
};
?>

<div class="p-2 md:p-4">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 3])

    <div class="mb-4">
        <h2 class="text-xl font-bold text-[#1B4F72]">Langkah 3: Perencanaan (SLKI & SIKI)</h2>
        <p class="text-sm text-[#7A8FA6]">Pilih luaran (SLKI) dan intervensi (SIKI) untuk setiap diagnosa keperawatan.</p>
    </div>

    @if (empty($rencana))
        <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-16 text-center">
            <flux:icon.clipboard-document-list class="mb-3 size-12 text-[#85B7EB]" />
            <p class="font-medium text-[#1B4F72]">Belum ada diagnosa</p>
            <p class="mt-1 text-sm text-[#7A8FA6]">Kembali ke langkah 2 dan tambahkan diagnosa terlebih dahulu.</p>
            <div class="mt-4">
                <flux:button :href="route('mahasiswa.askep.diagnosa', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                    Kembali ke Diagnosa
                </flux:button>
            </div>
        </div>
    @else
        <div class="space-y-3">
            @foreach ($rencana as $dIdx => $d)
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
                                    @php
                                        $jmlLuaran     = count(array_filter($d['luaran'], fn ($l) => $l['dipilih']));
                                        $jmlIntervensi = count(array_filter($d['intervensi'], fn ($i) => $i['dipilih']));
                                    @endphp
                                    @if ($jmlLuaran > 0 || $jmlIntervensi > 0)
                                        <span class="rounded-full bg-[#E1F5EE] px-2 py-0.5 text-[10px] font-semibold text-[#0F6E56]">
                                            {{ $jmlLuaran }} SLKI · {{ $jmlIntervensi }} SIKI
                                        </span>
                                    @endif
                                </div>
                                <p class="mt-0.5 text-sm font-medium text-[#1B4F72]">{{ $d['label'] }}</p>
                            </div>
                        </div>
                        <flux:icon.chevron-down
                            class="size-5 shrink-0 text-[#7A8FA6] transition-transform {{ $terbuka === $dIdx ? 'rotate-180' : '' }}"
                        />
                    </button>

                    {{-- Accordion Body --}}
                    @if ($terbuka === $dIdx)
                        <div class="border-t border-[#E0EBF5] px-5 py-4 space-y-6">

                            {{-- SLKI Section --}}
                            <div>
                                <div class="mb-3 flex items-center gap-2">
                                    <div class="flex size-5 shrink-0 items-center justify-center rounded-full bg-[#1A9B72] text-[10px] font-bold text-white">L</div>
                                    <h4 class="font-semibold text-[#0F6E56]">Luaran Keperawatan (SLKI)</h4>
                                    <span class="text-xs text-[#7A8FA6]">— pilih target yang ingin dicapai</span>
                                </div>

                                @if (empty($d['luaran']))
                                    <p class="rounded-xl border border-dashed border-[#D0DCE8] bg-[#F4F8FB] px-4 py-3 text-sm text-[#7A8FA6]">
                                        Belum ada rekomendasi SLKI untuk diagnosa ini.
                                    </p>
                                @else
                                    <div class="space-y-2">
                                        @foreach ($d['luaran'] as $lIdx => $l)
                                            <div wire:key="luaran-{{ $d['diagnosa_id'] }}-{{ $l['slki_id'] }}" class="rounded-xl border {{ $l['dipilih'] ? 'border-[#5DCAA5] bg-[#F0FBF7]' : 'border-[#E0EBF5] bg-white' }} p-4">
                                                <div class="flex items-start gap-3">
                                                    <button
                                                        wire:click="toggleLuaran({{ $dIdx }}, {{ $lIdx }})"
                                                        class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded border-2 transition
                                                            {{ $l['dipilih'] ? 'border-[#1A9B72] bg-[#1A9B72] text-white' : 'border-[#D0DCE8] hover:border-[#5DCAA5]' }}"
                                                    >
                                                        @if ($l['dipilih'])
                                                            <flux:icon.check class="size-3" />
                                                        @endif
                                                    </button>
                                                    <div class="flex-1 min-w-0">
                                                        <div class="flex items-center gap-1.5 flex-wrap">
                                                            <span class="font-mono text-xs font-bold text-[#1A9B72]">{{ $l['kode'] }}</span>
                                                            <span class="text-sm font-medium text-[#1B4F72]">{{ $l['label'] }}</span>
                                                        </div>
                                                        <div class="mt-2">
                                                                <label class="text-xs font-medium text-[#7A8FA6]">Target Waktu Pencapaian</label>
                                                                <input
                                                                    wire:model="rencana.{{ $dIdx }}.luaran.{{ $lIdx }}.target_waktu"
                                                                    type="text"
                                                                    placeholder="Contoh: 3 × 24 jam, 5 hari..."
                                                                    class="mt-1 w-full rounded-lg border border-[#D0DCE8] bg-white px-3 py-1.5 text-sm text-[#1B4F72] placeholder:text-[#C4D3DF] focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20"
                                                                />
                                                        </div>

                                                            @if (! empty($l['kriteria']))
                                                                <div class="mt-4 space-y-3">
                                                                    <div class="flex items-center justify-between gap-3">
                                                                        <p class="text-xs font-semibold uppercase tracking-wide text-[#0F6E56]">Indikator Kriteria Hasil</p>
                                                                        <span class="rounded-full bg-white px-2 py-0.5 text-[10px] font-semibold text-[#7A8FA6]">{{ count($l['kriteria']) }} indikator</span>
                                                                    </div>

                                                                    <div class="overflow-hidden rounded-lg border border-[#CDEFE4] bg-white">
                                                                        @foreach ($l['kriteria'] as $kIdx => $kriteria)
                                                                            <div wire:key="kriteria-{{ $d['diagnosa_id'] }}-{{ $l['slki_id'] }}-{{ $kriteria['id'] }}" class="border-b border-[#E6F5F0] p-3 last:border-b-0">
                                                                                <div class="flex items-start gap-3">
                                                                                    <span class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#E1F5EE] text-[11px] font-bold text-[#0F6E56]">
                                                                                        {{ $kriteria['urutan'] }}
                                                                                    </span>
                                                                                    <div class="min-w-0 flex-1">
                                                                                        <div class="flex flex-wrap items-center gap-2">
                                                                                            <p class="text-sm font-medium text-[#1B4F72]">{{ $kriteria['deskripsi'] }}</p>
                                                                                            <span class="rounded-full bg-[#F4F8FB] px-2 py-0.5 text-[10px] font-semibold text-[#7A8FA6]">{{ $kriteria['arah'] }}</span>
                                                                                        </div>

                                                                                        <div class="mt-3 grid grid-cols-1 md:grid-cols-2 gap-4 rounded-lg bg-[#F4F8FB] p-3 border border-[#E0EBF5]">
                                                                                            {{-- Skor Awal --}}
                                                                                            <div>
                                                                                                <div class="mb-2 flex items-center justify-between">
                                                                                                    <p class="text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Skor Awal</p>
                                                                                                </div>
                                                                                                <div class="flex items-center justify-between bg-white rounded border border-[#D0DCE8] p-1">
                                                                                                    <span class="hidden sm:block text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight">{{ $kriteria['opsi_skor'][1] }}</span>
                                                                                                    <div class="flex flex-1 justify-around sm:flex-none sm:justify-start gap-1">
                                                                                                        @foreach (range(1, 5) as $skor)
                                                                                                            <label class="cursor-pointer">
                                                                                                                <input type="radio" wire:model="rencana.{{ $dIdx }}.luaran.{{ $lIdx }}.skor_indikator.{{ $kriteria['id'] }}.awal" value="{{ $skor }}" class="peer sr-only" />
                                                                                                                <span class="flex size-6 sm:size-7 items-center justify-center rounded-sm text-xs font-bold text-[#1B4F72] transition peer-checked:bg-[#2E86C1] peer-checked:text-white hover:bg-[#EBF5FB] dark:bg-blue-900/30" title="{{ $skor }}. {{ $kriteria['opsi_skor'][$skor] }}">
                                                                                                                    {{ $skor }}
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        @endforeach
                                                                                                    </div>
                                                                                                    <span class="hidden sm:block text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight">{{ $kriteria['opsi_skor'][5] }}</span>
                                                                                                </div>
                                                                                            </div>

                                                                                            {{-- Skor Target --}}
                                                                                            <div>
                                                                                                <div class="mb-2 flex items-center justify-between">
                                                                                                    <p class="text-[10px] font-bold uppercase tracking-wider text-[#0F6E56]">Skor Target</p>
                                                                                                </div>
                                                                                                <div class="flex items-center justify-between bg-white dark:bg-zinc-900 rounded border border-[#1A9B72]/30 dark:border-emerald-500/30 p-1">
                                                                                                    <span class="hidden sm:block text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight">{{ $kriteria['opsi_skor'][1] }}</span>
                                                                                                    <div class="flex flex-1 justify-around sm:flex-none sm:justify-start gap-1">
                                                                                                        @foreach (range(1, 5) as $skor)
                                                                                                            <label class="cursor-pointer">
                                                                                                                <input type="radio" wire:model="rencana.{{ $dIdx }}.luaran.{{ $lIdx }}.skor_indikator.{{ $kriteria['id'] }}.target" value="{{ $skor }}" class="peer sr-only" />
                                                                                                                <span class="flex size-6 sm:size-7 items-center justify-center rounded-sm text-xs font-bold text-[#1B4F72] transition peer-checked:bg-[#1A9B72] peer-checked:text-white hover:bg-[#E1F5EE]" title="{{ $skor }}. {{ $kriteria['opsi_skor'][$skor] }}">
                                                                                                                    {{ $skor }}
                                                                                                                </span>
                                                                                                            </label>
                                                                                                        @endforeach
                                                                                                    </div>
                                                                                                    <span class="hidden sm:block text-[9px] font-medium text-[#7A8FA6] w-12 text-center leading-tight">{{ $kriteria['opsi_skor'][5] }}</span>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        @endforeach
                                                                    </div>
                                                                </div>
                                                            @else
                                                                <p class="mt-3 rounded-lg border border-dashed border-[#CDEFE4] bg-white px-3 py-2 text-xs text-[#7A8FA6]">
                                                                    Kriteria hasil detail belum tersedia untuk luaran ini.
                                                                </p>
                                                            @endif
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>

                            {{-- SIKI Section --}}
                            <div>
                                <div class="mb-3 flex items-center gap-2">
                                    <div class="flex size-5 shrink-0 items-center justify-center rounded-full bg-[#2E86C1] text-[10px] font-bold text-white">I</div>
                                    <h4 class="font-semibold text-[#1B4F72] dark:text-white">Intervensi Keperawatan (SIKI)</h4>
                                    <span class="text-xs text-[#7A8FA6] dark:text-zinc-400">— pilih intervensi &amp; centang tindakannya</span>
                                </div>

                                @if (empty($d['intervensi']))
                                    <p class="rounded-xl border border-dashed border-[#D0DCE8] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-800 px-4 py-3 text-sm text-[#7A8FA6] dark:text-zinc-400">
                                        Belum ada rekomendasi SIKI untuk diagnosa ini.
                                    </p>
                                @else
                                    @php
                                        $jenisMeta = [
                                            'Observasi'   => ['color' => 'blue',   'bg' => 'bg-blue-50 dark:bg-blue-900/20',   'border' => 'border-blue-200 dark:border-blue-800',   'badge' => 'bg-blue-100 text-blue-700 dark:bg-blue-900 dark:text-blue-300',   'dot' => 'bg-blue-500'],
                                            'Terapeutik'  => ['color' => 'teal',   'bg' => 'bg-teal-50 dark:bg-teal-900/20',   'border' => 'border-teal-200 dark:border-teal-800',   'badge' => 'bg-teal-100 text-teal-700 dark:bg-teal-900 dark:text-teal-300',   'dot' => 'bg-teal-500'],
                                            'Edukasi'     => ['color' => 'amber',  'bg' => 'bg-amber-50 dark:bg-amber-900/20', 'border' => 'border-amber-200 dark:border-amber-800', 'badge' => 'bg-amber-100 text-amber-700 dark:bg-amber-900 dark:text-amber-300', 'dot' => 'bg-amber-500'],
                                            'Kolaborasi'  => ['color' => 'purple', 'bg' => 'bg-purple-50 dark:bg-purple-900/20','border' => 'border-purple-200 dark:border-purple-800','badge' => 'bg-purple-100 text-purple-700 dark:bg-purple-900 dark:text-purple-300','dot' => 'bg-purple-500'],
                                        ];
                                    @endphp
                                    <div class="space-y-3">
                                        @foreach ($d['intervensi'] as $iIdx => $i)
                                            @php
                                                $totalTindakan = collect($i['tindakan_per_jenis'])->flatten()->count();
                                                $dipilihCount  = count($i['tindakan_dipilih']);
                                            @endphp
                                            <div wire:key="siki-{{ $d['diagnosa_id'] }}-{{ $iIdx }}"
                                                class="overflow-hidden rounded-xl border-2 transition-all
                                                    {{ $i['dipilih'] ? 'border-[#2E86C1] dark:border-blue-600' : 'border-[#E0EBF5] dark:border-zinc-700' }}">

                                                {{-- Header intervensi (klik untuk pilih) --}}
                                                <button
                                                    wire:click="toggleIntervensi({{ $dIdx }}, {{ $iIdx }})"
                                                    type="button"
                                                    class="flex w-full items-start gap-3 px-4 py-3 text-left transition
                                                        {{ $i['dipilih'] ? 'bg-[#EBF5FB] dark:bg-blue-900/20' : 'bg-white dark:bg-zinc-800 hover:bg-[#F4F8FB] dark:hover:bg-zinc-700/50' }}"
                                                >
                                                    {{-- Checkbox visual --}}
                                                    <span class="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded border-2 transition
                                                        {{ $i['dipilih'] ? 'border-[#2E86C1] bg-[#2E86C1] text-white' : 'border-[#D0DCE8] dark:border-zinc-600' }}">
                                                        @if ($i['dipilih'])
                                                            <flux:icon.check class="size-3" />
                                                        @endif
                                                    </span>
                                                    <div class="flex-1 min-w-0">
                                                        <div class="flex flex-wrap items-center gap-1.5">
                                                            @if ($i['kode'] !== 'MANUAL')
                                                                <span class="font-mono text-xs font-bold text-[#2E86C1] dark:text-[#85B7EB]">{{ $i['kode'] }}</span>
                                                            @else
                                                                <span class="rounded bg-zinc-100 dark:bg-zinc-700 px-1.5 py-0.5 text-[10px] font-bold text-zinc-500">MANUAL</span>
                                                            @endif
                                                            <span class="text-sm font-semibold text-[#1B4F72] dark:text-white">{{ $i['label'] }}</span>
                                                            @if ($i['dipilih'] && $totalTindakan > 0)
                                                                <span class="rounded-full bg-[#EBF5FB] dark:bg-blue-900/30 px-2 py-0.5 text-[10px] font-bold text-[#2E86C1] dark:text-[#85B7EB]">
                                                                    {{ $dipilihCount }}/{{ $totalTindakan }} dipilih
                                                                </span>
                                                            @endif
                                                        </div>
                                                        @if ($i['definisi'])
                                                            <p class="mt-0.5 text-xs text-[#7A8FA6] dark:text-zinc-400 line-clamp-2">{{ $i['definisi'] }}</p>
                                                        @endif
                                                    </div>
                                                    <flux:icon.chevron-down class="size-4 shrink-0 text-[#7A8FA6] dark:text-zinc-400 transition-transform mt-0.5 {{ $i['dipilih'] ? 'rotate-180' : '' }}" />
                                                </button>

                                                {{-- Tindakan per kategori (hanya tampil jika dipilih) --}}
                                                @if ($i['dipilih'] && !empty($i['tindakan_per_jenis']))
                                                    <div class="border-t border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 px-4 py-3 space-y-4">
                                                        <p class="text-xs font-semibold uppercase tracking-wider text-[#7A8FA6] dark:text-zinc-400">
                                                            Centang tindakan yang akan dilakukan:
                                                        </p>
                                                        <div class="grid gap-3 sm:grid-cols-2">
                                                            @foreach ($i['tindakan_per_jenis'] as $jenis => $tindakanList)
                                                                @php $meta = $jenisMeta[$jenis] ?? ['bg' => 'bg-gray-50 dark:bg-zinc-700', 'border' => 'border-gray-200 dark:border-zinc-600', 'badge' => 'bg-gray-100 text-gray-600', 'dot' => 'bg-gray-400']; @endphp
                                                                <div class="rounded-lg border {{ $meta['border'] }} {{ $meta['bg'] }} overflow-hidden">
                                                                    {{-- Header kategori --}}
                                                                    <div class="flex items-center justify-between px-3 py-1.5 border-b {{ $meta['border'] }}">
                                                                        <div class="flex items-center gap-1.5">
                                                                            <span class="size-2 rounded-full {{ $meta['dot'] }}"></span>
                                                                            <span class="text-[11px] font-bold uppercase tracking-wider {{ $meta['badge'] }} px-1.5 py-0.5 rounded">{{ $jenis }}</span>
                                                                        </div>
                                                                        {{-- Pilih semua di kategori ini --}}
                                                                        @php
                                                                            $semuaDipilih = collect($tindakanList)->every(fn($t) => in_array($t, $i['tindakan_dipilih'], true));
                                                                        @endphp
                                                                        <button
                                                                            wire:click="$dispatch('toggle-all-jenis', {dIdx: {{ $dIdx }}, iIdx: {{ $iIdx }}, tindakans: @js($tindakanList)})"
                                                                            type="button"
                                                                            class="text-[10px] font-medium text-[#2E86C1] dark:text-[#85B7EB] hover:underline"
                                                                        >
                                                                            {{ $semuaDipilih ? 'Hapus semua' : 'Pilih semua' }}
                                                                        </button>
                                                                    </div>
                                                                    {{-- Daftar tindakan --}}
                                                                    <div class="p-2 space-y-1">
                                                                        @foreach ($tindakanList as $tIdx => $tindakan)
                                                                            @php $checked = in_array($tindakan, $i['tindakan_dipilih'], true); @endphp
                                                                            <label wire:key="tindakan-{{ $d['diagnosa_id'] }}-{{ $iIdx }}-{{ $tIdx }}"
                                                                                class="flex items-start gap-2 cursor-pointer rounded p-1 transition
                                                                                    {{ $checked ? 'bg-white/80 dark:bg-zinc-700/80' : 'hover:bg-white/60 dark:hover:bg-zinc-700/40' }}">
                                                                                <input
                                                                                    type="checkbox"
                                                                                    wire:click="toggleTindakan({{ $dIdx }}, {{ $iIdx }}, @js($tindakan))"
                                                                                    @checked($checked)
                                                                                    class="mt-0.5 size-3.5 shrink-0 rounded accent-[#2E86C1]"
                                                                                />
                                                                                <span class="text-xs leading-snug {{ $checked ? 'font-medium text-[#1B4F72] dark:text-zinc-100' : 'text-[#555] dark:text-zinc-300' }}">
                                                                                    {{ $tindakan }}
                                                                                </span>
                                                                            </label>
                                                                        @endforeach
                                                                    </div>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                        </div>
                    @endif
                </div>
            @endforeach
        </div>

        {{-- Navigation --}}
        <div class="mt-6 flex items-center justify-between border-t border-[#E0EBF5] pt-4">
            <flux:button :href="route('mahasiswa.askep.diagnosa', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
                Kembali
            </flux:button>

            <button
                wire:click="simpanLanjut"
                wire:loading.attr="disabled"
                class="inline-flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <span wire:loading.remove wire:target="simpanLanjut">Simpan & Lanjut ke Implementasi</span>
                <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
                <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
            </button>
        </div>
    @endif
</div>
