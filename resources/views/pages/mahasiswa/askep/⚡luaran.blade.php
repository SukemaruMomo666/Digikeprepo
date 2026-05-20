<?php

use App\Models\DiagnosaPasien;
use App\Models\LuaranPasien;
use App\Models\Pasien;
use Flux\Flux;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Luaran SLKI')] class extends Component
{
    public Pasien $pasien;

    /**
     * Luaran yang dipilih, dikelompokkan per diagnosa_pasien_id.
     *
     * @var array<int, array<int, bool>>
     */
    public array $selectedLuaran = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);
        abort_unless($pasien->diagnosaPasien()->exists(), 403, 'Selesaikan diagnosa terlebih dahulu.');

        $this->pasien = $pasien;

        // Muat data yang sudah tersimpan
        LuaranPasien::whereIn(
            'diagnosa_pasien_id',
            $pasien->diagnosaPasien()->pluck('id')
        )->get()->each(function (LuaranPasien $lp): void {
            $this->selectedLuaran[$lp->diagnosa_pasien_id][$lp->luaran_id] = true;
        });
    }

    #[Computed]
    public function diagnosaPasienList(): \Illuminate\Database\Eloquent\Collection
    {
        return $this->pasien->diagnosaPasien()
            ->with(['diagnosa.luaranSlki'])
            ->get();
    }

    public function save(): void
    {
        $hasSelection = collect($this->selectedLuaran)
            ->flatten()
            ->contains(true);

        if (! $hasSelection) {
            $this->addError('selectedLuaran', 'Pilih minimal satu luaran untuk setiap diagnosa.');

            return;
        }

        foreach ($this->diagnosaPasienList as $dp) {
            $dpId        = $dp->id;
            $selectedIds = array_keys(array_filter($this->selectedLuaran[$dpId] ?? []));

            // Hapus luaran yang tidak dipilih lagi
            $dp->luaranPasien()->whereNotIn('luaran_id', $selectedIds)->delete();

            // Tambah luaran baru
            foreach ($selectedIds as $luaranId) {
                LuaranPasien::firstOrCreate([
                    'diagnosa_pasien_id' => $dpId,
                    'luaran_id'          => $luaranId,
                ]);
            }
        }

        $this->pasien->catatRiwayat('Luaran SLKI disimpan.');

        Flux::toast(variant: 'success', text: 'Luaran berhasil disimpan.');

        $this->redirectRoute('pasien.intervensi', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.diagnosa', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Diagnosa
        </flux:button>
        <flux:heading size="xl" level="1">Luaran SLKI — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Pilih luaran keperawatan (SLKI) yang ingin dicapai untuk setiap diagnosa.</flux:text>
    </div>

    @include('partials.askep-stepper', ['step' => 3, 'pasien' => $pasien])

    @if($errors->has('selectedLuaran'))
        <flux:callout icon="exclamation-triangle" color="red" class="mt-4">
            <flux:callout.text>{{ $errors->first('selectedLuaran') }}</flux:callout.text>
        </flux:callout>
    @endif

    <form wire:submit="save" class="mt-6 flex flex-col gap-6">
        @foreach ($this->diagnosaPasienList as $dp)
            <flux:card wire:key="dp-{{ $dp->id }}">
                <div class="flex items-center gap-2 mb-4">
                    <flux:badge color="blue" size="sm">{{ $dp->diagnosa->kode_diagnosa }}</flux:badge>
                    <flux:heading size="sm" level="3">{{ $dp->diagnosa->label_diagnosa }}</flux:heading>
                </div>

                @if ($dp->diagnosa->luaranSlki->isEmpty())
                    <flux:text class="text-sm text-zinc-500">Tidak ada luaran yang terdaftar untuk diagnosa ini.</flux:text>
                @else
                    <div class="flex flex-col gap-2">
                        @foreach ($dp->diagnosa->luaranSlki as $luaran)
                            <label wire:key="luaran-{{ $dp->id }}-{{ $luaran->id }}"
                                class="flex items-start gap-3 rounded-lg border border-zinc-200 dark:border-zinc-700 p-3 cursor-pointer hover:bg-zinc-50 dark:hover:bg-zinc-800 transition-colors
                                    {{ ! empty($selectedLuaran[$dp->id][$luaran->id]) ? 'bg-blue-50 dark:bg-blue-950 border-blue-300 dark:border-blue-700' : '' }}">
                                <flux:checkbox
                                    wire:model.live="selectedLuaran.{{ $dp->id }}.{{ $luaran->id }}"
                                    :value="true"
                                    class="mt-0.5"
                                />
                                <div>
                                    <div class="flex items-center gap-2">
                                        <flux:badge size="sm" color="violet">{{ $luaran->kode_luaran }}</flux:badge>
                                        <span class="font-medium text-sm">{{ $luaran->label_luaran }}</span>
                                    </div>
                                    @if ($luaran->definisi)
                                        <flux:text class="text-xs text-zinc-500 mt-1">{{ $luaran->definisi }}</flux:text>
                                    @endif
                                </div>
                            </label>
                        @endforeach
                    </div>
                @endif
            </flux:card>
        @endforeach

        <div class="flex items-center gap-3 mt-2">
            <flux:button type="submit" variant="primary" icon-trailing="arrow-right">
                Simpan & Lanjut ke Intervensi
            </flux:button>
            <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                Simpan Nanti
            </flux:button>
        </div>
    </form>
</div>
