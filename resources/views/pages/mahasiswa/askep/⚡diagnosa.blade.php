<?php

use App\Models\Askep;
use App\Models\AskepDiagnosa;
use App\Models\DiagnosaSdki;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Diagnosa SDKI')] class extends Component
{
    public Askep $askep;

    public string $cari = '';

    /** @var array<int, array{id: int|null, sdki_id: int, kode: string, label: string, tipe: string|null, prioritas: int, etiologi_dipilih: array<string>, gejala_dipilih: array<string>, is_expanded: boolean, detail: array|null}> */
    public array $terpilih = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load(['pasien', 'diagnosa.sdki']);

        $this->terpilih = $askep->diagnosa->map(function ($d) {
            $sdki = $d->sdki;
            $detail = null;

            if ($sdki) {
                $detail = [
                    'definisi' => $sdki->definisi,
                    'penyebab' => $sdki->penyebab()->pluck('deskripsi')->toArray(),
                    'gejala' => $sdki->gejala()->get()->groupBy('tipe')->map->groupBy('jenis')->toArray(),
                    'faktor_risiko' => $sdki->faktorRisiko()->pluck('deskripsi')->toArray(),
                    'kondisi_klinis' => $sdki->kondisiKlinis()->pluck('deskripsi')->toArray(),
                ];
            }

            return [
                'id'       => $d->id,
                'sdki_id'  => $d->sdki_id,
                'kode'     => $sdki?->kode_diagnosa ?? '',
                'label'    => $sdki?->label_diagnosa ?? '',
                'tipe'     => $sdki?->tipe_diagnosa ?? '',
                'prioritas' => $d->prioritas,
                'etiologi_dipilih' => $d->etiologi_dipilih ?? [],
                'gejala_dipilih' => $d->gejala_dipilih ?? [],
                'is_expanded' => false,
                'detail' => $detail,
            ];
        })->values()->toArray();
    }

    public function with(): array
    {
        return [
            'daftarSdki' => DiagnosaSdki::when($this->cari, fn ($q) => $q->where(function ($q) {
                $q->where('kode_diagnosa', 'like', "%{$this->cari}%")
                  ->orWhere('label_diagnosa', 'like', "%{$this->cari}%");
            }))->orderBy('kode_diagnosa')->limit(30)->get(),
        ];
    }

    public function pilih(int $sdkiId, string $kode, string $label, ?string $tipe): void
    {
        foreach ($this->terpilih as $d) {
            if ($d['sdki_id'] === $sdkiId) {
                Flux::toast(variant: 'warning', text: 'Diagnosa sudah dipilih.');
                return;
            }
        }

        // Fetch detail
        $sdki = DiagnosaSdki::find($sdkiId);
        $detail = null;
        if ($sdki) {
            $detail = [
                'definisi' => $sdki->definisi,
                'penyebab' => $sdki->penyebab()->pluck('deskripsi')->toArray(),
                'gejala' => $sdki->gejala()->get()->groupBy('tipe')->map->groupBy('jenis')->toArray(), // Mayor/Minor -> Subjektif/Objektif
                'faktor_risiko' => $sdki->faktorRisiko()->pluck('deskripsi')->toArray(),
                'kondisi_klinis' => $sdki->kondisiKlinis()->pluck('deskripsi')->toArray(),
            ];
        }

        $this->terpilih[] = [
            'id'       => null,
            'sdki_id'  => $sdkiId,
            'kode'     => $kode,
            'label'    => $label,
            'tipe'     => $tipe,
            'prioritas' => count($this->terpilih) + 1,
            'etiologi_dipilih' => [],
            'gejala_dipilih' => [],
            'is_expanded' => true, // Auto expand when selected
            'detail' => $detail,
        ];

        $this->cari = '';
    }

    public function toggleExpand(int $index): void
    {
        $this->terpilih[$index]['is_expanded'] = ! $this->terpilih[$index]['is_expanded'];
    }

    public function hapusDiagnosa(int $index): void
    {
        if (! empty($this->terpilih[$index]['id'])) {
            AskepDiagnosa::find($this->terpilih[$index]['id'])?->delete();
        }

        array_splice($this->terpilih, $index, 1);

        foreach ($this->terpilih as $i => &$d) {
            $d['prioritas'] = $i + 1;
        }
    }

    public function naikPrioritas(int $index): void
    {
        if ($index === 0) {
            return;
        }

        [$this->terpilih[$index - 1], $this->terpilih[$index]] = [$this->terpilih[$index], $this->terpilih[$index - 1]];

        foreach ($this->terpilih as $i => &$d) {
            $d['prioritas'] = $i + 1;
        }
    }

    public function simpanLanjut(): void
    {
        if (empty($this->terpilih)) {
            Flux::toast(variant: 'error', text: 'Pilih minimal 1 diagnosa.');
            return;
        }

        $tersimpanIds = collect($this->terpilih)->pluck('id')->filter()->all();
        $this->askep->diagnosa()->whereNotIn('id', $tersimpanIds)->delete();

        foreach ($this->terpilih as &$d) {
            $data = [
                'askep_id'  => $this->askep->id,
                'sdki_id'   => $d['sdki_id'],
                'prioritas' => $d['prioritas'],
                'etiologi_dipilih' => array_values(array_filter($d['etiologi_dipilih'] ?? [])),
                'gejala_dipilih' => array_values(array_filter($d['gejala_dipilih'] ?? [])),
            ];

            if ($d['id']) {
                AskepDiagnosa::where('id', $d['id'])->update($data);
            } else {
                $baru = AskepDiagnosa::create($data);
                $d['id'] = $baru->id;
            }
        }

        if ($this->askep->step_terakhir < 2) {
            $this->askep->update(['step_terakhir' => 2]);
        }

        $this->askep->pasien->catatRiwayat('Diagnosa SDKI disimpan (' . count($this->terpilih) . ' diagnosa).');

        Flux::toast(variant: 'success', text: 'Diagnosa tersimpan.');
        $this->redirectRoute('mahasiswa.askep.perencanaan', $this->askep, navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 2])

    <div class="mb-4">
        <h2 class="text-xl font-bold text-[#1B4F72]">Langkah 2: Diagnosa Keperawatan (SDKI)</h2>
        <p class="text-sm text-[#7A8FA6]">Pilih diagnosa yang sesuai, urutkan berdasarkan prioritas.</p>
    </div>

    <div class="flex flex-col gap-6">
        {{-- Atas: Cari SDKI (Dimasukkan ke dalam Card) --}}
        <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 p-4 sm:p-5 shadow-sm">
            <h3 class="mb-3 font-semibold text-[#1B4F72] dark:text-white flex items-center gap-2">
                <flux:icon.magnifying-glass class="size-5 text-[#2E86C1]" />
                Pencarian SDKI
            </h3>
            <div class="mb-3">
                <flux:input
                    wire:model.live.debounce.300ms="cari"
                    placeholder="Ketik kode atau nama diagnosa..."
                />
            </div>

            {{-- max-h-72 setara dengan 18rem (cukup untuk 3-4 item), tidak memakan viewport --}}
            <div class="max-h-72 space-y-2 overflow-y-auto pr-2">
                @forelse ($daftarSdki as $sdki)
                    @php $sudahDipilih = collect($terpilih)->contains('sdki_id', $sdki->id); @endphp
                    <button
                        wire:click="pilih({{ $sdki->id }}, @js($sdki->kode_diagnosa), @js($sdki->label_diagnosa), @js($sdki->tipe_diagnosa))"
                        class="w-full rounded-xl border p-4 text-left transition
                            {{ $sudahDipilih ? 'border-[#5DCAA5] bg-[#E1F5EE] cursor-default' : 'border-[#E0EBF5] bg-white hover:border-[#85B7EB] hover:bg-[#EBF5FB]' }}"
                    >
                        <div class="flex items-start justify-between gap-2">
                            <div class="flex-1 min-w-0">
                                <span class="font-mono text-xs font-bold text-[#2E86C1]">{{ $sdki->kode_diagnosa }}</span>
                                <p class="mt-0.5 text-sm font-medium text-[#1B4F72] leading-snug">{{ $sdki->label_diagnosa }}</p>
                                @if ($sdki->tipe_diagnosa)
                                    <span class="mt-1 inline-block rounded-full bg-[#EBF5FB] px-2 py-0.5 text-[10px] text-[#2E86C1]">
                                        {{ $sdki->tipe_diagnosa }}
                                    </span>
                                @endif
                            </div>
                            @if ($sudahDipilih)
                                <flux:icon.check-circle class="mt-1 size-4 shrink-0 text-[#1A9B72]" />
                            @else
                                <flux:icon.plus class="mt-1 size-4 shrink-0 text-[#2E86C1]" />
                            @endif
                        </div>
                    </button>
                @empty
                    <div class="rounded-2xl border border-dashed border-[#D0DCE8] py-12 text-center text-sm text-[#7A8FA6]">
                        @if ($cari)
                            Tidak ada diagnosa yang cocok dengan "<strong>{{ $cari }}</strong>"
                        @else
                            Ketik untuk mencari diagnosa SDKI
                        @endif
                    </div>
                @endforelse
            </div>
        </div>

        {{-- Kanan/Atas: Daftar Terpilih --}}
        <div>
            <h3 class="mb-3 font-semibold text-[#1B4F72]">
                Diagnosa Terpilih
                <span class="ml-1 rounded-full bg-[#2E86C1] px-2 py-0.5 text-xs font-bold text-white">{{ count($terpilih) }}</span>
            </h3>

            @if (empty($terpilih))
                <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-12 text-center">
                    <flux:icon.clipboard-document-list class="mb-2 size-10 text-[#85B7EB]" />
                    <p class="text-sm text-[#7A8FA6]">Belum ada diagnosa dipilih.</p>
                    <p class="text-xs text-[#C4D3DF]">Pilih dari daftar SDKI di bawah.</p>
                </div>
            @else
                <div class="space-y-3 max-h-[50vh] lg:max-h-[62vh] overflow-y-auto pr-1 pb-4">
                    @foreach ($terpilih as $i => $d)
                        <div class="rounded-xl border border-[#E0EBF5] bg-white overflow-hidden transition-all {{ $d['is_expanded'] ? 'ring-2 ring-[#85B7EB] shadow-md' : '' }}">
                            {{-- Header (Selalu Tampil) --}}
                            <div class="flex items-start gap-3 p-4 bg-[#F8FBFE] dark:bg-zinc-800 cursor-pointer" wire:click="toggleExpand({{ $i }})">
                                <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white shadow-sm mt-0.5">
                                    {{ $d['prioritas'] }}
                                </div>
                                <div class="flex-1 min-w-0">
                                    <div class="flex items-center gap-2">
                                        <span class="font-mono text-xs font-bold text-[#2E86C1] bg-white px-1.5 py-0.5 rounded border border-[#E0EBF5]">{{ $d['kode'] }}</span>
                                        @if ($d['tipe'])
                                            <span class="text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">{{ $d['tipe'] }}</span>
                                        @endif
                                    </div>
                                    <p class="mt-1 text-[15px] font-bold text-[#1B4F72] leading-snug">{{ $d['label'] }}</p>
                                </div>
                                <div class="flex items-center gap-1 shrink-0">
                                    @if ($i > 0)
                                        <button wire:click.stop="naikPrioritas({{ $i }})" class="rounded p-1.5 text-[#7A8FA6] hover:text-[#2E86C1] hover:bg-[#EBF5FB] bg-white border border-[#E0EBF5] shadow-sm transition" title="Prioritas Naik">
                                            <flux:icon.arrow-up class="size-3.5" />
                                        </button>
                                    @endif
                                    <button wire:click.stop="hapusDiagnosa({{ $i }})" class="rounded p-1.5 text-[#D95C3A] hover:bg-[#FDE8E8] bg-white border border-[#FDE8E8] shadow-sm transition" title="Hapus">
                                        <flux:icon.trash class="size-3.5" />
                                    </button>
                                </div>
                            </div>

                            {{-- Detail & Form (Tampil jika expanded) --}}
                            @if ($d['is_expanded'])
                                <div class="p-5 border-t border-[#E0EBF5] space-y-5 bg-white">
                                    @if ($d['detail'])
                                        {{-- Definisi --}}
                                        @if ($d['detail']['definisi'])
                                            <div>
                                                <p class="text-xs font-bold uppercase tracking-wide text-[#7A8FA6] mb-1">Definisi</p>
                                                <p class="text-sm text-[#1B4F72] leading-relaxed bg-[#F4F8FB] p-3 rounded-lg border border-[#E0EBF5]">{{ $d['detail']['definisi'] }}</p>
                                            </div>
                                        @endif

                                        {{-- Penyebab (Etiologi) --}}
                                        @if ($d['tipe'] !== 'Risiko' && !empty($d['detail']['penyebab']))
                                            <div>
                                                <div class="mb-2">
                                                    <p class="text-xs font-bold uppercase tracking-wide text-[#7A8FA6]">Penyebab / Etiologi</p>
                                                    <p class="text-[11px] text-[#7A8FA6]">Pilih penyebab yang sesuai dengan kondisi pasien.</p>
                                                </div>
                                                <div class="grid grid-cols-1 gap-2 sm:grid-cols-2 bg-[#F8FBFE] dark:bg-zinc-800 p-3 rounded-lg border border-[#E0EBF5]">
                                                    @foreach ($d['detail']['penyebab'] as $penyebab)
                                                        <label class="flex items-start gap-2 cursor-pointer group">
                                                            <input type="checkbox" wire:model="terpilih.{{ $i }}.etiologi_dipilih" value="{{ $penyebab }}" class="mt-0.5 size-4 rounded border-gray-300 text-[#2E86C1] focus:ring-[#2E86C1]">
                                                            <span class="text-sm text-[#1B4F72] group-hover:text-[#2E86C1] leading-tight">{{ $penyebab }}</span>
                                                        </label>
                                                    @endforeach
                                                </div>
                                            </div>
                                        @elseif ($d['tipe'] !== 'Risiko' && empty($d['detail']['penyebab']))
                                            <div class="rounded-lg border border-dashed border-[#D0DCE8] p-3 text-center">
                                                <p class="text-xs text-[#7A8FA6] italic">Data master penyebab SDKI belum tersedia untuk diagnosa ini.</p>
                                            </div>
                                        @endif

                                        {{-- Faktor Risiko --}}
                                        @if ($d['tipe'] === 'Risiko' && !empty($d['detail']['faktor_risiko']))
                                            <div>
                                                <div class="mb-2">
                                                    <p class="text-xs font-bold uppercase tracking-wide text-[#7A8FA6]">Faktor Risiko</p>
                                                    <p class="text-[11px] text-[#7A8FA6]">Pilih faktor risiko yang ada pada pasien.</p>
                                                </div>
                                                <div class="grid grid-cols-1 gap-2 sm:grid-cols-2 bg-[#F8FBFE] dark:bg-zinc-800 p-3 rounded-lg border border-[#E0EBF5]">
                                                    @foreach ($d['detail']['faktor_risiko'] as $risiko)
                                                        <label class="flex items-start gap-2 cursor-pointer group">
                                                            <input type="checkbox" wire:model="terpilih.{{ $i }}.etiologi_dipilih" value="{{ $risiko }}" class="mt-0.5 size-4 rounded border-gray-300 text-[#2E86C1] focus:ring-[#2E86C1]">
                                                            <span class="text-sm text-[#1B4F72] group-hover:text-[#2E86C1] leading-tight">{{ $risiko }}</span>
                                                        </label>
                                                    @endforeach
                                                </div>
                                            </div>
                                        @elseif ($d['tipe'] === 'Risiko' && empty($d['detail']['faktor_risiko']))
                                            <div class="rounded-lg border border-dashed border-[#D0DCE8] p-3 text-center">
                                                <p class="text-xs text-[#7A8FA6] italic">Data master faktor risiko SDKI belum tersedia untuk diagnosa ini.</p>
                                            </div>
                                        @endif

                                        {{-- Gejala dan Tanda --}}
                                        @if ($d['tipe'] !== 'Risiko' && !empty($d['detail']['gejala']))
                                            <div>
                                                <p class="text-xs font-bold uppercase tracking-wide text-[#7A8FA6] mb-2">Gejala & Tanda Klinis</p>
                                                <div class="space-y-3">
                                                    @foreach (['Mayor', 'Minor'] as $tipeGejala)
                                                        @if (isset($d['detail']['gejala'][$tipeGejala]))
                                                            <div class="bg-white border border-[#E0EBF5] rounded-lg overflow-hidden">
                                                                <div class="bg-[#F4F8FB] px-3 py-1.5 border-b border-[#E0EBF5]">
                                                                    <span class="text-xs font-bold text-[#1B4F72]">{{ $tipeGejala }}</span>
                                                                </div>
                                                                <div class="p-3 space-y-3">
                                                                    @foreach (['Subjektif', 'Objektif'] as $jenisGejala)
                                                                        @if (isset($d['detail']['gejala'][$tipeGejala][$jenisGejala]))
                                                                            <div>
                                                                                <p class="text-[11px] font-semibold text-[#7A8FA6] mb-1">{{ $jenisGejala }}</p>
                                                                                <div class="grid grid-cols-1 gap-2 sm:grid-cols-2">
                                                                                    @foreach ($d['detail']['gejala'][$tipeGejala][$jenisGejala] as $gjl)
                                                                                        <label class="flex items-start gap-2 cursor-pointer group">
                                                                                            <input type="checkbox" wire:model="terpilih.{{ $i }}.gejala_dipilih" value="{{ $gjl['deskripsi'] }}" class="mt-0.5 size-4 rounded border-gray-300 text-[#1A9B72] focus:ring-[#1A9B72]">
                                                                                            <span class="text-sm text-[#1B4F72] group-hover:text-[#1A9B72] leading-tight">{{ $gjl['deskripsi'] }}</span>
                                                                                        </label>
                                                                                    @endforeach
                                                                                </div>
                                                                            </div>
                                                                        @endif
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                        @endif
                                                    @endforeach
                                                </div>
                                            </div>
                                        @endif

                                        {{-- Kondisi Klinis Terkait --}}
                                        @if (!empty($d['detail']['kondisi_klinis']))
                                            <div>
                                                <p class="text-xs font-bold uppercase tracking-wide text-[#7A8FA6] mb-1">Kondisi Klinis Terkait</p>
                                                <div class="flex flex-wrap gap-1.5">
                                                    @foreach ($d['detail']['kondisi_klinis'] as $kondisi)
                                                        <span class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-[11px] font-medium text-gray-600 ring-1 ring-inset ring-gray-500/10">
                                                            {{ $kondisi }}
                                                        </span>
                                                    @endforeach
                                                </div>
                                            </div>
                                        @endif

                                    @else
                                        <div class="rounded-lg border border-dashed border-[#D0DCE8] p-5 text-center">
                                            <flux:icon.server class="mx-auto mb-2 size-6 text-[#85B7EB]" />
                                            <p class="text-sm text-[#7A8FA6]">Gagal memuat detail dari master data SDKI.</p>
                                        </div>
                                    @endif
                                </div>
                            @endif
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>

    {{-- Navigation --}}
    <div class="mt-6 flex items-center justify-between border-t border-[#E0EBF5] pt-4">
        <flux:button :href="route('mahasiswa.askep.pengkajian', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
            Kembali
        </flux:button>

        <button
            wire:click="simpanLanjut"
            wire:loading.attr="disabled"
            class="inline-flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
            style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
        >
            <span wire:loading.remove wire:target="simpanLanjut">Simpan & Lanjut ke Perencanaan</span>
            <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
            <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
        </button>
    </div>
</div>
>
</div>
njut" />
        </button>
    </div>
</div>
