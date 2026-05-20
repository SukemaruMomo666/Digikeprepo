<?php

use App\Models\Pasien;
use App\Models\Pengkajian;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Pengkajian')] class extends Component
{
    public Pasien $pasien;

    /** @var array<string, array{observasi: string, is_abnormal: bool, tipe_data: string}> */
    public array $pengkajianData = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien;

        // Inisialisasi semua 11 pola dengan nilai default
        foreach (Pengkajian::labelPola() as $key => $label) {
            $this->pengkajianData[$key] = [
                'observasi'   => '',
                'is_abnormal' => false,
                'tipe_data'   => 'DS',
            ];
        }

        // Isi data yang sudah tersimpan
        $pasien->pengkajian()->get()->each(function (Pengkajian $row): void {
            $this->pengkajianData[$row->pola_kesehatan] = [
                'observasi'   => $row->observasi ?? '',
                'is_abnormal' => $row->is_abnormal,
                'tipe_data'   => $row->tipe_data ?? 'DS',
            ];
        });
    }

    public function save(): void
    {
        $rules = [];
        foreach (array_keys(Pengkajian::labelPola()) as $key) {
            $rules["pengkajianData.{$key}.observasi"]   = ['nullable', 'string', 'max:1000'];
            $rules["pengkajianData.{$key}.is_abnormal"] = ['boolean'];
            $rules["pengkajianData.{$key}.tipe_data"]   = ['required', 'in:DS,DO'];
        }
        $this->validate($rules);

        foreach ($this->pengkajianData as $pola => $data) {
            Pengkajian::updateOrCreate(
                ['pasien_id' => $this->pasien->id, 'pola_kesehatan' => $pola],
                [
                    'observasi'   => $data['observasi'] ?: null,
                    'is_abnormal' => $data['is_abnormal'],
                    'tipe_data'   => $data['tipe_data'],
                ]
            );
        }

        $this->pasien->catatRiwayat('Pengkajian disimpan.');

        Flux::toast(variant: 'success', text: 'Pengkajian berhasil disimpan.');

        $this->redirectRoute('pasien.diagnosa', $this->pasien, navigate: true);
    }
};
?>

<div>
    {{-- Header --}}
    <div class="mb-6">
        <flux:button :href="route('pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali
        </flux:button>
        <flux:heading size="xl" level="1">Pengkajian — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Isi 11 Pola Kesehatan Gordon. Tandai pola yang abnormal untuk dijadikan dasar diagnosa.</flux:text>
    </div>

    {{-- Stepper --}}
    @include('partials.askep-stepper', ['step' => 1, 'pasien' => $pasien])

    <form wire:submit="save" class="mt-6 flex flex-col gap-4">
        @foreach (App\Models\Pengkajian::labelPola() as $key => $label)
            <flux:card wire:key="{{ $key }}">
                <div class="flex items-start justify-between gap-4">
                    <div class="flex-1">
                        <flux:heading size="sm" level="3" class="mb-3">{{ $label }}</flux:heading>

                        <flux:textarea
                            wire:model="pengkajianData.{{ $key }}.observasi"
                            placeholder="Tuliskan hasil observasi / anamnesis..."
                            rows="3"
                        />
                    </div>

                    <div class="shrink-0 flex flex-col items-end gap-3 pt-1">
                        <flux:switch
                            wire:model="pengkajianData.{{ $key }}.is_abnormal"
                            label="Abnormal"
                        />

                        <flux:select
                            wire:model="pengkajianData.{{ $key }}.tipe_data"
                            class="w-24 text-sm"
                        >
                            <flux:select.option value="DS">DS</flux:select.option>
                            <flux:select.option value="DO">DO</flux:select.option>
                        </flux:select>
                    </div>
                </div>
            </flux:card>
        @endforeach

        <div class="flex items-center gap-3 mt-2">
            <flux:button type="submit" variant="primary" icon-trailing="arrow-right">
                Simpan & Lanjut ke Diagnosa
            </flux:button>
            <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                Simpan Nanti
            </flux:button>
        </div>
    </form>
</div>
