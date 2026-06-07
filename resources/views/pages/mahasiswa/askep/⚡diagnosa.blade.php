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

    /** @var array<int, array{id: int|null, sdki_id: int, kode: string, label: string, prioritas: int}> */
    public array $terpilih = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load(['pasien', 'diagnosa.sdki']);

        $this->terpilih = $askep->diagnosa->map(fn ($d) => [
            'id'       => $d->id,
            'sdki_id'  => $d->sdki_id,
            'kode'     => $d->sdki?->kode_diagnosa ?? '',
            'label'    => $d->sdki?->label_diagnosa ?? '',
            'prioritas' => $d->prioritas,
        ])->values()->toArray();
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

    public function pilih(int $sdkiId, string $kode, string $label): void
    {
        foreach ($this->terpilih as $d) {
            if ($d['sdki_id'] === $sdkiId) {
                Flux::toast(variant: 'warning', text: 'Diagnosa sudah dipilih.');

                return;
            }
        }

        $this->terpilih[] = [
            'id'       => null,
            'sdki_id'  => $sdkiId,
            'kode'     => $kode,
            'label'    => $label,
            'prioritas' => count($this->terpilih) + 1,
        ];

        $this->cari = '';
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
            if ($d['id']) {
                AskepDiagnosa::where('id', $d['id'])->update(['prioritas' => $d['prioritas']]);
            } else {
                $baru    = AskepDiagnosa::create([
                    'askep_id'  => $this->askep->id,
                    'sdki_id'   => $d['sdki_id'],
                    'prioritas' => $d['prioritas'],
                ]);
                $d['id'] = $baru->id;
            }
        }

        if ($this->askep->step_terakhir < 2) {
            $this->askep->update(['step_terakhir' => 2]);
        }

        $this->askep->pasien->catatRiwayat('Diagnosa SDKI disimpan (' . count($this->terpilih) . ' diagnosa).');

        Flux::toast(variant: 'success', text: 'Diagnosa tersimpan.');
        $this->redirectRoute('askep.perencanaan', $this->askep, navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 2])

    <div class="mb-4">
        <h2 class="text-xl font-bold text-[#1B4F72]">Langkah 2: Diagnosa Keperawatan (SDKI)</h2>
        <p class="text-sm text-[#7A8FA6]">Pilih diagnosa yang sesuai, urutkan berdasarkan prioritas.</p>
    </div>

    <div class="grid gap-6 lg:grid-cols-2">
        {{-- Kiri: Cari SDKI --}}
        <div>
            <div class="mb-3">
                <flux:input
                    wire:model.live.debounce.300ms="cari"
                    placeholder="Cari kode atau nama diagnosa SDKI..."
                    icon="magnifying-glass"
                />
            </div>

            <div class="max-h-[62vh] space-y-2 overflow-y-auto pr-1">
                @forelse ($daftarSdki as $sdki)
                    @php $sudahDipilih = collect($terpilih)->contains('sdki_id', $sdki->id); @endphp
                    <button
                        wire:click="pilih({{ $sdki->id }}, @js($sdki->kode_diagnosa), @js($sdki->label_diagnosa))"
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

        {{-- Kanan: Daftar Terpilih --}}
        <div>
            <h3 class="mb-3 font-semibold text-[#1B4F72]">
                Diagnosa Terpilih
                <span class="ml-1 rounded-full bg-[#2E86C1] px-2 py-0.5 text-xs font-bold text-white">{{ count($terpilih) }}</span>
            </h3>

            @if (empty($terpilih))
                <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-12 text-center">
                    <flux:icon.clipboard-document-list class="mb-2 size-10 text-[#85B7EB]" />
                    <p class="text-sm text-[#7A8FA6]">Belum ada diagnosa dipilih.</p>
                    <p class="text-xs text-[#C4D3DF]">Pilih dari daftar SDKI di kiri.</p>
                </div>
            @else
                <div class="space-y-2 max-h-[62vh] overflow-y-auto pr-1">
                    @foreach ($terpilih as $i => $d)
                        <div class="flex items-start gap-2 rounded-xl border border-[#E0EBF5] bg-white p-4">
                            <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">
                                {{ $d['prioritas'] }}
                            </div>
                            <div class="flex-1 min-w-0">
                                <span class="font-mono text-xs font-bold text-[#2E86C1]">{{ $d['kode'] }}</span>
                                <p class="mt-0.5 text-sm font-medium text-[#1B4F72] leading-snug">{{ $d['label'] }}</p>
                            </div>
                            <div class="flex items-center gap-1 shrink-0">
                                @if ($i > 0)
                                    <button wire:click="naikPrioritas({{ $i }})" class="rounded p-1 text-[#7A8FA6] hover:text-[#2E86C1] hover:bg-[#EBF5FB]" title="Naikkan prioritas">
                                        <flux:icon.arrow-up class="size-3.5" />
                                    </button>
                                @endif
                                <button wire:click="hapusDiagnosa({{ $i }})" class="rounded p-1 text-[#7A8FA6] hover:text-[#D95C3A] hover:bg-[#FDE8E8]" title="Hapus">
                                    <flux:icon.trash class="size-3.5" />
                                </button>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>

    {{-- Navigation --}}
    <div class="mt-6 flex items-center justify-between border-t border-[#E0EBF5] pt-4">
        <flux:button :href="route('askep.pengkajian', $askep)" variant="ghost" icon="arrow-left" wire:navigate>
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
