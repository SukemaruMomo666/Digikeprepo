<?php

use App\Models\IntervensiPasien;
use App\Models\LuaranPasien;
use App\Models\Pasien;
use Flux\Flux;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Intervensi SIKI')] class extends Component
{
    public Pasien $pasien;

    /**
     * Intervensi yang dipilih, dikelompokkan per luaran_pasien_id.
     *
     * @var array<int, array<int, bool>>
     */
    public array $selectedIntervensi = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);
        abort_unless($pasien->luaranPasien()->exists(), 403, 'Selesaikan luaran terlebih dahulu.');

        $this->pasien = $pasien;

        // Muat data yang sudah tersimpan
        IntervensiPasien::whereIn(
            'luaran_pasien_id',
            $pasien->luaranPasien()->pluck('luaran_pasien.id')
        )->get()->each(function (IntervensiPasien $ip): void {
            $this->selectedIntervensi[$ip->luaran_pasien_id][$ip->intervensi_id] = true;
        });
    }

    #[Computed]
    public function luaranPasienList(): \Illuminate\Database\Eloquent\Collection
    {
        return LuaranPasien::whereIn(
            'diagnosa_pasien_id',
            $this->pasien->diagnosaPasien()->pluck('id')
        )
            ->with(['luaran.intervensiSiki', 'diagnosaPasien.diagnosa'])
            ->get();
    }

    public function save(): void
    {
        $hasSelection = collect($this->selectedIntervensi)
            ->flatten()
            ->contains(true);

        if (! $hasSelection) {
            $this->addError('selectedIntervensi', 'Pilih minimal satu intervensi.');

            return;
        }

        foreach ($this->luaranPasienList as $lp) {
            $lpId        = $lp->id;
            $selectedIds = array_keys(array_filter($this->selectedIntervensi[$lpId] ?? []));

            // Hapus intervensi yang tidak dipilih lagi
            $lp->intervensiPasien()->whereNotIn('intervensi_id', $selectedIds)->delete();

            // Tambah intervensi baru
            foreach ($selectedIds as $intervensiId) {
                IntervensiPasien::firstOrCreate([
                    'luaran_pasien_id' => $lpId,
                    'intervensi_id'    => $intervensiId,
                ]);
            }
        }

        $this->redirectRoute('pasien.evaluasi', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.luaran', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Luaran
        </flux:button>
        <flux:heading size="xl" level="1">Intervensi SIKI — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Pilih intervensi keperawatan (SIKI) untuk setiap luaran yang sudah ditetapkan.</flux:text>
    </div>

    @include('partials.askep-stepper', ['step' => 4, 'pasien' => $pasien])

    @if($errors->has('selectedIntervensi'))
        <flux:callout icon="exclamation-triangle" color="red" class="mt-4">
            <flux:callout.text>{{ $errors->first('selectedIntervensi') }}</flux:callout.text>
        </flux:callout>
    @endif

    <form wire:submit="save" class="mt-6 flex flex-col gap-6">
        @foreach ($this->luaranPasienList as $lp)
            <flux:card wire:key="lp-{{ $lp->id }}">
                <div class="mb-1 flex items-center gap-2 text-xs text-zinc-500">
                    <flux:badge color="blue" size="sm">{{ $lp->diagnosaPasien->diagnosa->kode_diagnosa }}</flux:badge>
                    <span>{{ $lp->diagnosaPasien->diagnosa->label_diagnosa }}</span>
                    <flux:icon.chevron-right class="size-3" />
                </div>
                <div class="flex items-center gap-2 mb-4">
                    <flux:badge color="violet" size="sm">{{ $lp->luaran->kode_luaran }}</flux:badge>
                    <flux:heading size="sm" level="3">{{ $lp->luaran->label_luaran }}</flux:heading>
                </div>

                @if ($lp->luaran->intervensiSiki->isEmpty())
                    <flux:text class="text-sm text-zinc-500">Tidak ada intervensi yang terdaftar untuk luaran ini.</flux:text>
                @else
                    <div class="flex flex-col gap-2">
                        @foreach ($lp->luaran->intervensiSiki as $intervensi)
                            <label wire:key="intervensi-{{ $lp->id }}-{{ $intervensi->id }}"
                                class="flex items-start gap-3 rounded-lg border border-zinc-200 dark:border-zinc-700 p-3 cursor-pointer hover:bg-zinc-50 dark:hover:bg-zinc-800 transition-colors
                                    {{ ! empty($selectedIntervensi[$lp->id][$intervensi->id]) ? 'bg-green-50 dark:bg-green-950 border-green-300 dark:border-green-700' : '' }}">
                                <flux:checkbox
                                    wire:model.live="selectedIntervensi.{{ $lp->id }}.{{ $intervensi->id }}"
                                    :value="true"
                                    class="mt-0.5"
                                />
                                <div>
                                    <div class="flex items-center gap-2">
                                        <flux:badge size="sm" color="green">{{ $intervensi->kode_intervensi }}</flux:badge>
                                        <span class="font-medium text-sm">{{ $intervensi->label_intervensi }}</span>
                                    </div>
                                    @if ($intervensi->definisi)
                                        <flux:text class="text-xs text-zinc-500 mt-1">{{ $intervensi->definisi }}</flux:text>
                                    @endif
                                </div>
                            </label>
                        @endforeach
                    </div>
                @endif
            </flux:card>
        @endforeach

        <div class="flex items-center gap-3 mt-2">
            <flux:button type="submit" variant="primary" icon="check-badge">
                Selesaikan Askep
            </flux:button>
            <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                Simpan Nanti
            </flux:button>
        </div>
    </form>
</div>
