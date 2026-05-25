<?php

use App\Models\Pasien;
use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Data Mahasiswa')] class extends Component
{
    use WithPagination;

    public string $search = '';
    public ?int $detailId = null;

    public function updatingSearch(): void { $this->resetPage(); }

    public function openDetail(int $id): void
    {
        $this->detailId = $id;
    }

    public function with(): array
    {
        $users = User::where('role', 'mahasiswa')
            ->when($this->search, fn ($q) => $q->where(function ($q) {
                $q->where('name', 'like', "%{$this->search}%")
                    ->orWhere('nim_nip', 'like', "%{$this->search}%");
            }))
            ->withCount([
                'pasien',
                'pasien as pasien_draft_count'   => fn ($q) => $q->where('status_askep', 'draft'),
                'pasien as pasien_selesai_count' => fn ($q) => $q->where('status_askep', 'selesai'),
            ])
            ->orderBy('name')
            ->paginate(20);

        $detailPasien = $this->detailId
            ? Pasien::where('user_id', $this->detailId)
                ->withCount('diagnosaPasien')
                ->with('pengkajian')
                ->latest()
                ->get()
            : collect();

        $detailUser = $this->detailId ? User::find($this->detailId) : null;

        return compact('users', 'detailPasien', 'detailUser');
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Data Mahasiswa</flux:heading>
        <flux:text class="mt-1">Pantau progres asuhan keperawatan tiap mahasiswa.</flux:text>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Tabel Mahasiswa --}}
        <div class="{{ $detailId ? 'lg:col-span-1' : 'lg:col-span-3' }}">
            <flux:card>
                <div class="mb-4">
                    <flux:input
                        wire:model.live.debounce.300ms="search"
                        placeholder="Cari nama atau NIM..."
                        icon="magnifying-glass"
                        clearable
                    />
                </div>

                <flux:table>
                    <flux:table.columns>
                        <flux:table.column>Mahasiswa</flux:table.column>
                        <flux:table.column>Draft</flux:table.column>
                        <flux:table.column>Selesai</flux:table.column>
                        @if (!$detailId)
                            <flux:table.column>Total</flux:table.column>
                        @endif
                        <flux:table.column></flux:table.column>
                    </flux:table.columns>
                    <flux:table.rows>
                        @forelse ($users as $user)
                            <flux:table.row
                                :key="$user->id"
                                wire:key="mhs-{{ $user->id }}"
                                class="{{ $detailId === $user->id ? 'bg-blue-50 dark:bg-blue-900/20' : '' }}"
                            >
                                <flux:table.cell>
                                    <p class="font-medium text-sm">{{ $user->name }}</p>
                                    <p class="font-mono text-xs text-zinc-500">{{ $user->nim_nip }}</p>
                                </flux:table.cell>
                                <flux:table.cell>
                                    @if ($user->pasien_draft_count > 0)
                                        <flux:badge color="yellow" size="sm">{{ $user->pasien_draft_count }}</flux:badge>
                                    @else
                                        <span class="text-sm text-zinc-400">0</span>
                                    @endif
                                </flux:table.cell>
                                <flux:table.cell>
                                    @if ($user->pasien_selesai_count > 0)
                                        <flux:badge color="green" size="sm">{{ $user->pasien_selesai_count }}</flux:badge>
                                    @else
                                        <span class="text-sm text-zinc-400">0</span>
                                    @endif
                                </flux:table.cell>
                                @if (!$detailId)
                                    <flux:table.cell class="text-sm">{{ $user->pasien_count }}</flux:table.cell>
                                @endif
                                <flux:table.cell>
                                    <flux:button
                                        size="sm"
                                        variant="{{ $detailId === $user->id ? 'primary' : 'ghost' }}"
                                        icon="eye"
                                        wire:click="{{ $detailId === $user->id ? '$set(\'detailId\', null)' : 'openDetail('.$user->id.')' }}"
                                        inset="top bottom"
                                    />
                                </flux:table.cell>
                            </flux:table.row>
                        @empty
                            <flux:table.row>
                                <flux:table.cell colspan="5" class="py-8 text-center text-zinc-500">
                                    Tidak ada mahasiswa ditemukan.
                                </flux:table.cell>
                            </flux:table.row>
                        @endforelse
                    </flux:table.rows>
                </flux:table>

                <div class="mt-3">{{ $users->links() }}</div>
            </flux:card>
        </div>

        {{-- Panel Detail --}}
        @if ($detailId && $detailUser)
            <div class="lg:col-span-2">
                <flux:card>
                    <div class="mb-4 flex items-start justify-between">
                        <div>
                            <flux:heading size="lg">{{ $detailUser->name }}</flux:heading>
                            <flux:text class="font-mono text-sm text-zinc-500">{{ $detailUser->nim_nip }}</flux:text>
                        </div>
                        <flux:button size="sm" variant="ghost" icon="x-mark" wire:click="$set('detailId', null)" />
                    </div>

                    @if ($detailPasien->isEmpty())
                        <div class="py-10 text-center">
                            <flux:icon.user-group class="mx-auto mb-2 size-10 text-zinc-400" />
                            <flux:text>Mahasiswa ini belum memiliki data pasien.</flux:text>
                        </div>
                    @else
                        <div class="space-y-3">
                            @foreach ($detailPasien as $pasien)
                                <div wire:key="dp-{{ $pasien->id }}"
                                    class="rounded-xl border border-zinc-200 dark:border-zinc-700 p-4">
                                    <div class="flex items-start justify-between">
                                        <div>
                                            <p class="font-medium">{{ $pasien->nama_pasien }}</p>
                                            <p class="font-mono text-xs text-zinc-500">{{ $pasien->no_rm }}</p>
                                        </div>
                                        @if ($pasien->isSelesai())
                                            <flux:badge color="green" size="sm">Selesai</flux:badge>
                                        @else
                                            <flux:badge color="yellow" size="sm">Draft</flux:badge>
                                        @endif
                                    </div>

                                    {{-- Progress steps --}}
                                    <div class="mt-3 grid grid-cols-4 gap-2">
                                        @php
                                            $hasPengkajian = $pasien->pengkajian->isNotEmpty();
                                            $hasDiagnosa   = $pasien->diagnosa_pasien_count > 0;
                                        @endphp
                                        @foreach ([
                                            ['label' => 'Pengkajian', 'done' => $hasPengkajian, 'color' => 'blue'],
                                            ['label' => 'Diagnosa',   'done' => $hasDiagnosa,   'color' => 'violet'],
                                            ['label' => 'Luaran',     'done' => $pasien->isSelesai() || ($hasDiagnosa && $hasPengkajian), 'color' => 'emerald'],
                                            ['label' => 'Intervensi', 'done' => $pasien->isSelesai(), 'color' => 'orange'],
                                        ] as $step)
                                            <div class="text-center">
                                                <div class="mx-auto mb-1 flex size-7 items-center justify-center rounded-full
                                                    {{ $step['done'] ? 'bg-'.$step['color'].'-100 dark:bg-'.$step['color'].'-900/40' : 'bg-zinc-100 dark:bg-zinc-800' }}">
                                                    @if ($step['done'])
                                                        <flux:icon.check class="size-3.5 text-{{ $step['color'] }}-600 dark:text-{{ $step['color'] }}-400" />
                                                    @else
                                                        <div class="size-2 rounded-full bg-zinc-300 dark:bg-zinc-600"></div>
                                                    @endif
                                                </div>
                                                <p class="text-[10px] text-zinc-500">{{ $step['label'] }}</p>
                                            </div>
                                        @endforeach
                                    </div>

                                    <div class="mt-3 grid grid-cols-3 gap-2 text-center text-xs text-zinc-500">
                                        <div>
                                            <p class="font-semibold text-zinc-700 dark:text-zinc-300">{{ $pasien->pengkajian->count() }}/11</p>
                                            <p>Pola Dikaji</p>
                                        </div>
                                        <div>
                                            <p class="font-semibold text-zinc-700 dark:text-zinc-300">{{ $pasien->diagnosa_pasien_count }}</p>
                                            <p>Diagnosa</p>
                                        </div>
                                        <div>
                                            <p class="font-semibold text-zinc-700 dark:text-zinc-300">{{ $pasien->tanggal_masuk->format('d/m/Y') }}</p>
                                            <p>Tgl Masuk</p>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </flux:card>
            </div>
        @endif
    </div>
</div>
