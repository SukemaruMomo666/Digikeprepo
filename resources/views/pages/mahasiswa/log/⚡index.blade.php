<?php

use App\Models\LogPembelajaran;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Log Pembelajaran')] class extends Component
{
    use WithPagination;

    public function with(): array
    {
        return [
            'logs' => LogPembelajaran::where('user_id', auth()->id())
                ->latest('tanggal_shift')
                ->paginate(10),
        ];
    }

    public function hapus(int $id): void
    {
        $log = LogPembelajaran::where('user_id', auth()->id())->findOrFail($id);
        $log->delete();
        $this->dispatch('toast', variant: 'success', message: 'Log berhasil dihapus.');
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Log Pembelajaran</flux:heading>
            <flux:text class="mt-1">Catatan refleksi harian menggunakan Gibbs Reflective Cycle.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" :href="route('mahasiswa.log.create')" wire:navigate>
            Tambah Log Baru
        </flux:button>
    </div>

    <div class="grid grid-cols-1 gap-4">
        @forelse ($logs as $log)
            <flux:card class="group relative overflow-hidden transition-all hover:border-[#2E86C1]">
                <div class="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                    <div class="flex items-start gap-4">
                        <div class="flex size-12 shrink-0 flex-col items-center justify-center rounded-xl bg-[#F4F8FB] text-[#2E86C1]">
                            <span class="text-lg font-black leading-none">{{ $log->tanggal_shift->format('d') }}</span>
                            <span class="text-[10px] font-bold uppercase">{{ $log->tanggal_shift->format('M') }}</span>
                        </div>
                        <div>
                            <div class="flex items-center gap-2">
                                <flux:heading size="lg" class="group-hover:text-[#2E86C1] transition-colors">
                                    {{ $log->ruang ?? 'Ruang Tidak Disebutkan' }}
                                </flux:heading>
                                <flux:badge size="sm" color="blue" variant="outline">{{ $log->shift }}</flux:badge>
                            </div>
                            <flux:text size="sm" class="mt-1 line-clamp-1">
                                <span class="font-bold text-zinc-500 italic">Kasus:</span> {{ $log->konteks_kasus ?: '-' }}
                            </flux:text>
                        </div>
                    </div>

                    <div class="flex items-center gap-2">
                        <flux:button icon="pencil-square" size="sm" variant="ghost" :href="route('mahasiswa.log.edit', $log)" wire:navigate>Edit</flux:button>
                        <flux:button icon="trash" size="sm" variant="ghost" class="text-red-500 hover:bg-red-50" wire:click="hapus({{ $log->id }})" wire:confirm="Hapus log ini?">Hapus</flux:button>
                        <flux:button icon="chevron-right" size="sm" variant="ghost" :href="route('mahasiswa.log.show', $log)" wire:navigate />
                    </div>
                </div>
            </flux:card>
        @empty
            <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-white py-16 text-center">
                <flux:icon.book-open class="mb-3 size-12 text-[#C4D3DF]" />
                <p class="font-medium text-[#1B4F72]">Belum ada log pembelajaran</p>
                <p class="mt-1 text-sm text-[#7A8FA6]">Mulai catat refleksi harian Anda sekarang.</p>
                <flux:button variant="primary" class="mt-4" :href="route('mahasiswa.log.create')" wire:navigate>Buat Log Pertama</flux:button>
            </div>
        @endforelse
    </div>

    <div class="mt-6">
        {{ $logs->links() }}
    </div>
</div>
