<?php

use App\Models\LogPembelajaran;
use App\Models\Penugasan;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.dosen')] #[Title('Monitoring Log Mahasiswa')] class extends Component
{
    use WithPagination;

    public string $cari = '';

    public function with(): array
    {
        $dosenId = auth()->id();
        $mhsIds = Penugasan::where('dosen_id', $dosenId)->pluck('mahasiswa_id')->all();

        $logs = LogPembelajaran::whereIn('user_id', $mhsIds)
            ->with('user')
            ->when($this->cari, function($q) {
                $q->whereHas('user', fn($u) => $u->where('name', 'like', '%'.$this->cari.'%'))
                  ->orWhere('ruang', 'like', '%'.$this->cari.'%');
            })
            ->latest('tanggal_shift')
            ->paginate(15);

        return [
            'logs' => $logs,
        ];
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
            <flux:heading size="xl" level="1">Log Pembelajaran Mahasiswa</flux:heading>
            <flux:text class="mt-1">Pantau refleksi harian (Gibbs Cycle) dari mahasiswa bimbingan Anda.</flux:text>
        </div>
        <div class="w-full sm:w-64">
            <flux:input wire:model.live.debounce.300ms="cari" icon="magnifying-glass" placeholder="Cari mhs atau ruang..." />
        </div>
    </div>

    <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white shadow-sm">
        <flux:table>
            <flux:table.columns>
                <flux:table.column>Tanggal / Shift</flux:table.column>
                <flux:table.column>Mahasiswa</flux:table.column>
                <flux:table.column>Ruang & Kasus</flux:table.column>
                <flux:table.column>Progress Refleksi</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($logs as $log)
                    <flux:table.row :key="$log->id">
                        <flux:table.cell>
                            <p class="text-sm font-bold text-[#1B4F72]">{{ $log->tanggal_shift->format('d/m/Y') }}</p>
                            <p class="text-[10px] font-bold text-[#7A8FA6] uppercase">{{ $log->shift }}</p>
                        </flux:table.cell>
                        <flux:table.cell>
                            <p class="font-medium text-zinc-900">{{ $log->user->name }}</p>
                            <p class="text-xs text-zinc-500">{{ $log->user->nim_nip }}</p>
                        </flux:table.cell>
                        <flux:table.cell>
                            <p class="text-sm font-semibold text-[#2E86C1]">{{ $log->ruang ?: '-' }}</p>
                            <p class="text-xs text-zinc-500 truncate max-w-xs">{{ $log->konteks_kasus ?: '-' }}</p>
                        </flux:table.cell>
                        <flux:table.cell>
                            @php
                                $filled = 0;
                                foreach(['description','feelings','evaluation','analysis','conclusion','action_plan'] as $f) {
                                    if(!empty($log->$f)) $filled++;
                                }
                            @endphp
                            <div class="flex items-center gap-2">
                                <div class="h-1 w-12 rounded-full bg-zinc-100 overflow-hidden">
                                    <div class="h-full bg-green-500" style="width: {{ ($filled/6)*100 }}%"></div>
                                </div>
                                <span class="text-[10px] font-bold text-zinc-500">{{ $filled }}/6 Tahap</span>
                            </div>
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:button size="sm" variant="ghost" icon="eye" :href="route('dosen.log.show', $log)" wire:navigate>Lihat Detail</flux:button>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="5" class="py-12 text-center text-[#7A8FA6]">
                            Belum ada log pembelajaran dari mahasiswa bimbingan Anda.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>
    </div>

    <div class="mt-6">
        {{ $logs->links() }}
    </div>
</div>
