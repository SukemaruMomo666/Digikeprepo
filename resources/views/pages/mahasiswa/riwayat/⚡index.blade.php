<?php

use App\Models\RiwayatPasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Riwayat Aktivitas')] class extends Component
{
    use WithPagination;

    public string $search = '';

    public function updatingSearch(): void { $this->resetPage(); }

    public function with(): array
    {
        return [
            'riwayatList' => RiwayatPasien::whereHas(
                'pasien',
                fn ($q) => $q->where('user_id', auth()->id())
            )
                ->with('pasien')
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('aktivitas', 'like', "%{$this->search}%")
                        ->orWhereHas('pasien', fn ($q) => $q->where('nama_pasien', 'like', "%{$this->search}%")
                            ->orWhere('no_rm', 'like', "%{$this->search}%"));
                }))
                ->latest('created_at')
                ->paginate(20),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Riwayat Aktivitas</flux:heading>
        <flux:text class="mt-1">Semua aktivitas yang tercatat pada data pasien Anda.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari aktivitas atau nama pasien..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        @if ($riwayatList->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.clock class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada riwayat aktivitas.</flux:text>
            </div>
        @else
            <ol class="relative border-s border-zinc-200 dark:border-zinc-700 ms-3">
                @foreach ($riwayatList as $log)
                    <li class="mb-6 ms-6" wire:key="log-{{ $log->id }}">
                        <span class="absolute -start-3 flex size-6 items-center justify-center rounded-full bg-blue-100 ring-4 ring-white dark:bg-blue-900 dark:ring-zinc-900">
                            <flux:icon.check class="size-3 text-blue-600 dark:text-blue-400" />
                        </span>
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-sm font-medium">{{ $log->aktivitas }}</p>
                                <flux:link
                                    :href="route('pasien.show', $log->pasien)"
                                    class="text-xs text-zinc-500 hover:text-blue-600"
                                    wire:navigate
                                >
                                    {{ $log->pasien->nama_pasien }}
                                    <span class="font-mono">({{ $log->pasien->no_rm }})</span>
                                </flux:link>
                            </div>
                            <flux:text class="shrink-0 text-xs text-zinc-400">
                                {{ $log->created_at->diffForHumans() }}
                            </flux:text>
                        </div>
                    </li>
                @endforeach
            </ol>

            <div class="mt-4">
                {{ $riwayatList->links() }}
            </div>
        @endif
    </flux:card>
</div>
