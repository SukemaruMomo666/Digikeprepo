<?php

use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Semua Askep')] class extends Component
{
    use WithPagination;

    public string $search = '';
    public string $status = '';

    public function updatingSearch(): void { $this->resetPage(); }
    public function updatingStatus(): void { $this->resetPage(); }

    public function with(): array
    {
        return [
            'pasienList' => Pasien::where('user_id', auth()->id())
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%");
                }))
                ->when($this->status, fn ($q) => $q->where('status_askep', $this->status))
                ->withCount(['pengkajian', 'diagnosaPasien'])
                ->latest()
                ->paginate(10),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Semua Askep</flux:heading>
        <flux:text class="mt-1">Daftar seluruh asuhan keperawatan yang pernah dikerjakan.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center">
            <div class="flex-1">
                <flux:input
                    wire:model.live.debounce.300ms="search"
                    placeholder="Cari nama pasien atau No. RM..."
                    icon="magnifying-glass"
                    clearable
                />
            </div>
            <flux:select wire:model.live="status" class="sm:w-44">
                <flux:select.option value="">Semua Status</flux:select.option>
                <flux:select.option value="draft">Draft</flux:select.option>
                <flux:select.option value="selesai">Selesai</flux:select.option>
            </flux:select>
        </div>

        @if ($pasienList->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.clipboard-document-list class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada data askep.</flux:text>
            </div>
        @else
            <flux:table>
                <flux:table.columns>
                    <flux:table.column>Pasien</flux:table.column>
                    <flux:table.column>Tgl. Masuk</flux:table.column>
                    <flux:table.column class="text-center">Pengkajian</flux:table.column>
                    <flux:table.column class="text-center">Diagnosa</flux:table.column>
                    <flux:table.column>Status</flux:table.column>
                    <flux:table.column></flux:table.column>
                </flux:table.columns>
                <flux:table.rows>
                    @foreach ($pasienList as $pasien)
                        <flux:table.row :key="$pasien->id">
                            <flux:table.cell>
                                <div class="font-medium">{{ $pasien->nama_pasien }}</div>
                                <div class="text-xs font-mono text-zinc-500">{{ $pasien->no_rm }}</div>
                            </flux:table.cell>
                            <flux:table.cell>{{ $pasien->tanggal_masuk->format('d/m/Y') }}</flux:table.cell>
                            <flux:table.cell class="text-center">
                                <flux:badge color="{{ $pasien->pengkajian_count > 0 ? 'green' : 'zinc' }}" size="sm">
                                    {{ $pasien->pengkajian_count }}/11
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell class="text-center">
                                <flux:badge color="{{ $pasien->diagnosa_pasien_count > 0 ? 'blue' : 'zinc' }}" size="sm">
                                    {{ $pasien->diagnosa_pasien_count }}
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell>
                                @if ($pasien->isSelesai())
                                    <flux:badge color="green" size="sm">Selesai</flux:badge>
                                @else
                                    <flux:badge color="yellow" size="sm">Draft</flux:badge>
                                @endif
                            </flux:table.cell>
                            <flux:table.cell>
                                <flux:button
                                    :href="$pasien->isSelesai() ? route('pasien.askep', $pasien) : $pasien->nextAskepStep()"
                                    size="sm"
                                    variant="ghost"
                                    :icon-trailing="$pasien->isSelesai() ? 'eye' : 'arrow-right'"
                                    wire:navigate
                                >
                                    {{ $pasien->isSelesai() ? 'Lihat' : 'Lanjutkan' }}
                                </flux:button>
                            </flux:table.cell>
                        </flux:table.row>
                    @endforeach
                </flux:table.rows>
            </flux:table>

            <div class="mt-4">
                {{ $pasienList->links() }}
            </div>
        @endif
    </flux:card>
</div>
