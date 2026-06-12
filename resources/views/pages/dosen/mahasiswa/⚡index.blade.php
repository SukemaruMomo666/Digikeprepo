<?php

use App\Models\Penugasan;
use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.dosen')] #[Title('Daftar Mahasiswa Bimbingan')] class extends Component
{
    use WithPagination;

    public string $cari = '';

    public function with(): array
    {
        $dosenId = auth()->id();

        $mahasiswaList = Penugasan::where('dosen_id', $dosenId)
            ->with(['mahasiswa' => function($query) {
                $query->withCount('askep');
            }])
            ->when($this->cari, function($query) {
                $query->whereHas('mahasiswa', function($q) {
                    $q->where('name', 'like', '%' . $this->cari . '%')
                      ->orWhere('nim_nip', 'like', '%' . $this->cari . '%');
                });
            })
            ->paginate(12);

        return [
            'mahasiswaList' => $mahasiswaList,
        ];
    }
}; ?>

<div class="p-4 md:p-6">
    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
            <h2 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Mahasiswa Bimbingan</h2>
            <p class="text-sm text-[#7A8FA6] dark:text-zinc-400">Daftar mahasiswa yang ditugaskan kepada Anda pada periode ini.</p>
        </div>

        <div class="w-full sm:w-64">
            <flux:input wire:model.live.debounce.300ms="cari" icon="magnifying-glass" placeholder="Cari nama atau NIM..." autocomplete="off" />
        </div>
    </div>

    @if ($mahasiswaList->isEmpty())
        <div class="flex flex-col items-center justify-center rounded-2xl border-2 border-dashed border-[#D0DCE8] dark:border-zinc-700 bg-white dark:bg-zinc-800 py-16 text-center">
            <flux:icon.users class="mb-3 size-12 text-[#C4D3DF] dark:text-zinc-600" />
            <p class="font-medium text-[#1B4F72] dark:text-white">Tidak ada mahasiswa ditemukan</p>
            <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Pastikan data penugasan sudah diinput oleh Admin.</p>
        </div>
    @else
        <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            @foreach ($mahasiswaList as $tugas)
                @php $mhs = $tugas->mahasiswa; @endphp
                <div class="group relative overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-5 shadow-sm transition hover:border-[#2E86C1] hover:shadow-md">
                    <div class="flex items-start gap-4">
                        <div class="flex size-12 shrink-0 items-center justify-center rounded-xl bg-[#F4F8FB] dark:bg-zinc-700 text-lg font-bold text-[#2E86C1] dark:text-[#85B7EB] group-hover:bg-[#EBF5FB] dark:group-hover:bg-zinc-600">
                            {{ $mhs->initials() }}
                        </div>
                        <div class="min-w-0 flex-1">
                            <h4 class="truncate font-bold text-[#1B4F72] dark:text-white">{{ $mhs->name }}</h4>
                            <p class="text-xs font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-wider">
                                {{ $mhs->nim_nip }} | KELAS {{ $tugas->kelas ?? '-' }}
                            </p>
                        </div>
                    </div>

                    <div class="mt-5 grid grid-cols-2 gap-2 border-t border-gray-50 dark:border-zinc-700 pt-4">
                        <div class="rounded-lg bg-[#F8FBFE] dark:bg-zinc-700/50 p-2 text-center">
                            <p class="text-[10px] font-bold uppercase tracking-tighter text-[#7A8FA6] dark:text-zinc-400">Total Askep</p>
                            <p class="text-lg font-black text-[#1B4F72] dark:text-zinc-100">{{ $mhs->askep_count }}</p>
                        </div>
                        <div class="rounded-lg bg-[#F8FBFE] dark:bg-zinc-700/50 p-2 text-center">
                            <p class="text-[10px] font-bold uppercase tracking-tighter text-[#7A8FA6] dark:text-zinc-400">Stase</p>
                            <p class="truncate text-xs font-bold text-[#2E86C1] dark:text-[#85B7EB]">{{ $tugas->stase ?? '-' }}</p>
                        </div>
                    </div>

                    <div class="mt-4 flex flex-col gap-1 text-[11px] text-[#7A8FA6] dark:text-zinc-400">
                        <div class="flex items-center gap-2">
                            <flux:icon.building-office class="size-3" />
                            <span class="truncate">{{ $tugas->rs ?? 'RS Belum Ditentukan' }}</span>
                        </div>
                        <div class="flex items-center gap-2">
                            <flux:icon.calendar class="size-3" />
                            <span>{{ $tugas->periode_mulai?->format('d/m/y') ?? '?' }} - {{ $tugas->periode_selesai?->format('d/m/y') ?? '?' }}</span>
                        </div>
                    </div>

                    <div class="mt-5">
                        <flux:button :href="route('dosen.mahasiswa.show', $mhs->id)" variant="ghost" class="w-full text-xs" wire:navigate>
                            Lihat Detail & Riwayat
                        </flux:button>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="mt-6">
            {{ $mahasiswaList->links() }}
        </div>
    @endif
</div>
