<?php

use App\Models\Pasien;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Data Pasien')] class extends Component
{
    use WithPagination;

    public string $search = '';

    public function updatingSearch(): void
    {
        $this->resetPage();
    }

    /**
     * Hapus pasien beserta semua data Askep-nya.
     */
    public function hapus(int $id): void
    {
        $pasien = Pasien::where('user_id', auth()->id())->findOrFail($id);
        $pasien->delete();

        Flux::toast(variant: 'success', text: 'Data pasien berhasil dihapus.');
    }

    public function with(): array
    {
        return [
            'pasienList' => Pasien::where('user_id', auth()->id())
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%");
                }))
                ->latest()
                ->paginate(10),
        ];
    }
};
?>

<div>
    <div class="flex items-center justify-between mb-6">
        <div>
            <flux:heading size="xl" level="1">Data Pasien</flux:heading>
            <flux:text class="mt-1">Kelola semua data pasien Anda.</flux:text>
        </div>
        <flux:button :href="route('pasien.create')" icon="plus" variant="primary" wire:navigate>
            Tambah Pasien
        </flux:button>
    </div>

    <flux:card>
        {{-- Search --}}
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari nama pasien atau No. RM..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        @if ($pasienList->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.user-plus class="mx-auto mb-3 size-10 text-zinc-400" />
                @if ($search)
                    <flux:text>Tidak ada pasien yang cocok dengan "{{ $search }}".</flux:text>
                @else
                    <flux:text>Belum ada data pasien.</flux:text>
                    <div class="mt-4">
                        <flux:button :href="route('pasien.create')" icon="plus" wire:navigate>
                            Tambah Pasien Pertama
                        </flux:button>
                    </div>
                @endif
            </div>
        @else
            <flux:table>
                <flux:table.columns>
                    <flux:table.column>No. RM</flux:table.column>
                    <flux:table.column>Nama Pasien</flux:table.column>
                    <flux:table.column>Umur</flux:table.column>
                    <flux:table.column>Jenis Kelamin</flux:table.column>
                    <flux:table.column>Ruang Rawat</flux:table.column>
                    <flux:table.column>Tgl. Masuk</flux:table.column>
                    <flux:table.column>Status</flux:table.column>
                    <flux:table.column></flux:table.column>
                </flux:table.columns>
                <flux:table.rows>
                    @foreach ($pasienList as $pasien)
                        <flux:table.row :key="$pasien->id">
                            <flux:table.cell class="font-mono text-sm">{{ $pasien->no_rm }}</flux:table.cell>
                            <flux:table.cell class="font-medium">{{ $pasien->nama_pasien }}</flux:table.cell>
                            <flux:table.cell>{{ $pasien->umur }} th</flux:table.cell>
                            <flux:table.cell>{{ $pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</flux:table.cell>
                            <flux:table.cell>{{ $pasien->ruang_rawat ?? '-' }}</flux:table.cell>
                            <flux:table.cell>{{ $pasien->tanggal_masuk->format('d/m/Y') }}</flux:table.cell>
                            <flux:table.cell>
                                @if ($pasien->isSelesai())
                                    <flux:badge color="green" size="sm">Selesai</flux:badge>
                                @else
                                    <flux:badge color="yellow" size="sm">Draft</flux:badge>
                                @endif
                            </flux:table.cell>
                            <flux:table.cell>
                                <flux:dropdown>
                                    <flux:button variant="ghost" size="sm" icon="ellipsis-horizontal" inset="top bottom" />
                                    <flux:menu>
                                        <flux:menu.item
                                            :href="route('pasien.show', $pasien)"
                                            icon="eye"
                                            wire:navigate
                                        >
                                            Lihat Detail
                                        </flux:menu.item>
                                        @if ($pasien->isDraft())
                                            <flux:menu.item
                                                :href="$pasien->nextAskepStep()"
                                                icon="arrow-right-circle"
                                                wire:navigate
                                            >
                                                Lanjutkan Askep
                                            </flux:menu.item>
                                        @endif
                                        <flux:menu.item
                                            :href="route('pasien.edit', $pasien)"
                                            icon="pencil"
                                            wire:navigate
                                        >
                                            Edit Data
                                        </flux:menu.item>
                                        <flux:menu.separator />
                                        <flux:menu.item
                                            variant="danger"
                                            icon="trash"
                                            wire:click="hapus({{ $pasien->id }})"
                                            wire:confirm="Hapus pasien {{ $pasien->nama_pasien }}? Semua data Askep akan ikut terhapus."
                                        >
                                            Hapus
                                        </flux:menu.item>
                                    </flux:menu>
                                </flux:dropdown>
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
