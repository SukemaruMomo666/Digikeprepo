<?php

use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Arsip Pengkajian')] class extends Component
{
    use WithPagination;

    public string $search = '';

    public function updatingSearch(): void { $this->resetPage(); }

    public function with(): array
    {
        return [
            'arsipList' => Pasien::where('user_id', auth()->id())
                ->whereHas('askep', fn ($q) => $q->where('status', 'selesai'))
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%");
                }))
                ->withCount('diagnosaPasien')
                ->with('pengkajian')
                ->latest()
                ->paginate(10),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Arsip Pengkajian</flux:heading>
        <flux:text class="mt-1">Dokumen asuhan keperawatan yang sudah selesai dikerjakan.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari nama pasien atau No. RM..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        @if ($arsipList->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.archive-box class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada arsip pengkajian.</flux:text>
                @if ($search)
                    <flux:text class="text-sm text-zinc-400 mt-1">Tidak ada hasil untuk "{{ $search }}".</flux:text>
                @else
                    <flux:text class="text-sm text-zinc-400 mt-1">
                        Arsip muncul setelah askep diselesaikan (semua 4 langkah selesai).
                    </flux:text>
                @endif
            </div>
        @else
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
                @foreach ($arsipList as $pasien)
                    <div wire:key="arsip-{{ $pasien->id }}"
                        class="rounded-xl border border-zinc-200 dark:border-zinc-700 p-4 hover:border-blue-300 dark:hover:border-blue-700 transition-colors">
                        <div class="flex items-start justify-between mb-3">
                            <div>
                                <p class="font-semibold">{{ $pasien->nama_pasien }}</p>
                                <p class="text-xs font-mono text-zinc-500">{{ $pasien->no_rm }}</p>
                            </div>
                            <flux:badge color="green" size="sm">Selesai</flux:badge>
                        </div>

                        <dl class="grid grid-cols-2 gap-2 text-sm mb-4">
                            <div>
                                <flux:text class="text-xs text-zinc-500">Umur</flux:text>
                                <p>{{ $pasien->umur }} th &bull; {{ $pasien->jenis_kelamin === 'L' ? 'L' : 'P' }}</p>
                            </div>
                            <div>
                                <flux:text class="text-xs text-zinc-500">Tgl. Masuk</flux:text>
                                <p>{{ $pasien->tanggal_masuk->format('d/m/Y') }}</p>
                            </div>
                            <div>
                                <flux:text class="text-xs text-zinc-500">Pola Dikaji</flux:text>
                                <p>{{ $pasien->pengkajian->count() }}/11</p>
                            </div>
                            <div>
                                <flux:text class="text-xs text-zinc-500">Diagnosa</flux:text>
                                <p>{{ $pasien->diagnosa_pasien_count }}</p>
                            </div>
                        </dl>

                        <div class="flex gap-2">
                            <flux:button
                                :href="route('mahasiswa.pasien.askep', $pasien)"
                                size="sm"
                                variant="primary"
                                icon="document-text"
                                class="flex-1 justify-center"
                                wire:navigate
                            >
                                Lihat Dokumen
                            </flux:button>
                            <flux:button
                                :href="route('mahasiswa.pasien.show', $pasien)"
                                size="sm"
                                variant="ghost"
                                icon="eye"
                                wire:navigate
                            />
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="mt-6">
                {{ $arsipList->links() }}
            </div>
        @endif
    </flux:card>
</div>
