<?php

use App\Models\RiwayatPasien;
use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Log Aktivitas')] class extends Component
{
    use WithPagination;

    public string $search = '';
    public string $filterMahasiswa = '';

    public function updatingSearch(): void { $this->resetPage(); }
    public function updatingFilterMahasiswa(): void { $this->resetPage(); }

    public function with(): array
    {
        $query = RiwayatPasien::with(['pasien.mahasiswa'])
            ->when($this->search, function ($q) {
                $q->where('aktivitas', 'like', "%{$this->search}%")
                    ->orWhereHas('pasien', fn ($q) => $q->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%"));
            })
            ->when($this->filterMahasiswa, fn ($q) => $q->whereHas('pasien', fn ($q) => $q->where('user_id', $this->filterMahasiswa)))
            ->latest('created_at');

        return [
            'logs'        => $query->paginate(25),
            'mahasiswaList' => User::where('role', 'mahasiswa')->orderBy('name')->get(['id', 'name', 'nim_nip']),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Log Aktivitas</flux:heading>
        <flux:text class="mt-1">Riwayat semua aktivitas asuhan keperawatan di sistem.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4 flex flex-col gap-3 sm:flex-row">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari aktivitas atau nama pasien..."
                icon="magnifying-glass"
                clearable
                class="flex-1"
            />
            <flux:select wire:model.live="filterMahasiswa" placeholder="Semua mahasiswa" class="sm:w-56">
                @foreach ($mahasiswaList as $mhs)
                    <flux:select.option value="{{ $mhs->id }}">{{ $mhs->name }} ({{ $mhs->nim_nip }})</flux:select.option>
                @endforeach
            </flux:select>
        </div>

        @if ($logs->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.clock class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada log aktivitas.</flux:text>
            </div>
        @else
            <div class="divide-y divide-zinc-100 dark:divide-zinc-800">
                @foreach ($logs as $log)
                    <div wire:key="log-{{ $log->id }}" class="flex items-start gap-4 py-3">
                        <div class="mt-0.5 flex size-8 shrink-0 items-center justify-center rounded-full bg-zinc-100 dark:bg-zinc-800">
                            <flux:icon.clock class="size-4 text-zinc-500" />
                        </div>
                        <div class="flex-1 min-w-0">
                            <p class="text-sm font-medium">{{ $log->aktivitas }}</p>
                            <div class="mt-0.5 flex flex-wrap items-center gap-x-3 gap-y-1 text-xs text-zinc-500">
                                <span>
                                    <span class="font-medium">{{ $log->pasien->nama_pasien ?? '—' }}</span>
                                    <span class="font-mono">({{ $log->pasien->no_rm ?? '' }})</span>
                                </span>
                                <span>&bull;</span>
                                <span>{{ $log->pasien->mahasiswa->name ?? '—' }}</span>
                                <span>&bull;</span>
                                <span>{{ $log->created_at->diffForHumans() }}</span>
                                <span class="text-zinc-400">{{ $log->created_at->format('d/m/Y H:i') }}</span>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="mt-4">{{ $logs->links() }}</div>
        @endif
    </flux:card>
</div>
