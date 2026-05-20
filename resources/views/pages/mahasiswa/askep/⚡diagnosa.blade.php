<?php

use App\Models\DiagnosaSdki;
use App\Models\DiagnosaPasien;
use App\Models\Pasien;
use Flux\Flux;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Diagnosa SDKI')] class extends Component
{
    public Pasien $pasien;

    /** @var array<int, bool> */
    public array $selectedIds = [];

    /** @var array<int, string> */
    public array $dataSubjektif = [];

    /** @var array<int, string> */
    public array $dataObjektif = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);
        abort_unless($pasien->pengkajian()->exists(), 403, 'Selesaikan pengkajian terlebih dahulu.');

        $this->pasien = $pasien;

        // Muat data yang sudah tersimpan
        $pasien->diagnosaPasien()->with('diagnosa')->get()->each(function (DiagnosaPasien $dp): void {
            $this->selectedIds[$dp->diagnosa_id]    = true;
            $this->dataSubjektif[$dp->diagnosa_id]  = $dp->data_subjektif ?? '';
            $this->dataObjektif[$dp->diagnosa_id]   = $dp->data_objektif ?? '';
        });
    }

    #[Computed]
    public function diagnosaSdkiList(): \Illuminate\Database\Eloquent\Collection
    {
        return DiagnosaSdki::orderBy('kode_diagnosa')->get();
    }

    public function save(): void
    {
        $selectedIds = array_keys(array_filter($this->selectedIds));

        if (empty($selectedIds)) {
            $this->addError('selectedIds', 'Pilih minimal satu diagnosa.');

            return;
        }

        $rules = [];
        foreach ($selectedIds as $id) {
            $rules["dataSubjektif.{$id}"] = ['nullable', 'string', 'max:1000'];
            $rules["dataObjektif.{$id}"]  = ['nullable', 'string', 'max:1000'];
        }
        $this->validate($rules);

        // Hapus diagnosa yang tidak lagi dipilih, berserta luaran/intervensi-nya
        $this->pasien->diagnosaPasien()
            ->whereNotIn('diagnosa_id', $selectedIds)
            ->each(fn ($dp) => $dp->delete());

        // Upsert diagnosa yang dipilih
        foreach ($selectedIds as $id) {
            DiagnosaPasien::updateOrCreate(
                ['pasien_id' => $this->pasien->id, 'diagnosa_id' => $id],
                [
                    'data_subjektif' => $this->dataSubjektif[$id] ?? null,
                    'data_objektif'  => $this->dataObjektif[$id] ?? null,
                ]
            );
        }

        $this->pasien->catatRiwayat('Diagnosa SDKI disimpan (' . count($selectedIds) . ' diagnosa).');

        Flux::toast(variant: 'success', text: 'Diagnosa berhasil disimpan.');

        $this->redirectRoute('pasien.luaran', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.pengkajian', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Pengkajian
        </flux:button>
        <flux:heading size="xl" level="1">Diagnosa SDKI — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Pilih diagnosa keperawatan yang sesuai berdasarkan hasil pengkajian.</flux:text>
    </div>

    @include('partials.askep-stepper', ['step' => 2, 'pasien' => $pasien])

    @if($errors->has('selectedIds'))
        <flux:callout icon="exclamation-triangle" color="red" class="mt-4">
            <flux:callout.text>{{ $errors->first('selectedIds') }}</flux:callout.text>
        </flux:callout>
    @endif

    <form wire:submit="save" class="mt-6 flex flex-col gap-4">
        @foreach ($this->diagnosaSdkiList as $diagnosa)
            @php $isSelected = ! empty($selectedIds[$diagnosa->id]); @endphp

            <flux:card wire:key="diagnosa-{{ $diagnosa->id }}"
                class="{{ $isSelected ? 'ring-2 ring-blue-500 dark:ring-blue-400' : '' }}">
                <div class="flex items-start gap-3">
                    <flux:checkbox
                        wire:model.live="selectedIds.{{ $diagnosa->id }}"
                        :value="true"
                        class="mt-1"
                    />
                    <div class="flex-1">
                        <div class="flex items-center gap-2 mb-1">
                            <flux:badge size="sm" color="blue">{{ $diagnosa->kode_diagnosa }}</flux:badge>
                            <span class="font-semibold text-sm">{{ $diagnosa->label_diagnosa }}</span>
                        </div>
                        @if ($diagnosa->definisi)
                            <flux:text class="text-xs text-zinc-500 mb-3">{{ $diagnosa->definisi }}</flux:text>
                        @endif

                        @if ($isSelected)
                            <div class="grid grid-cols-1 gap-3 sm:grid-cols-2 mt-3 pt-3 border-t border-zinc-200 dark:border-zinc-700">
                                <flux:textarea
                                    wire:model="dataSubjektif.{{ $diagnosa->id }}"
                                    label="Data Subjektif (DS)"
                                    placeholder="Keluhan yang disampaikan pasien..."
                                    rows="3"
                                />
                                <flux:textarea
                                    wire:model="dataObjektif.{{ $diagnosa->id }}"
                                    label="Data Objektif (DO)"
                                    placeholder="Hasil observasi/pemeriksaan..."
                                    rows="3"
                                />
                            </div>
                        @endif
                    </div>
                </div>
            </flux:card>
        @endforeach

        <div class="flex items-center gap-3 mt-2">
            <flux:button type="submit" variant="primary" icon-trailing="arrow-right">
                Simpan & Lanjut ke Luaran
            </flux:button>
            <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                Simpan Nanti
            </flux:button>
        </div>
    </form>
</div>
