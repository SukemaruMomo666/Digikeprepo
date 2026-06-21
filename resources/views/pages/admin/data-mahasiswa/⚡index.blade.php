<?php

use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Data Mahasiswa')] class extends Component
{
    use WithPagination;

    public string $search       = '';
    public string $filterKelas  = '';
    public string $filterSemester = '';
    public string $filterAngkatan = '';
    public ?int   $editId       = null;
    public bool   $showEdit     = false;

    // Edit form fields
    public string $editKelas    = '';
    public string $editSemester = '';
    public string $editAngkatan = '';
    public string $editProdi    = '';

    public function updatingSearch(): void    { $this->resetPage(); }
    public function updatingFilterKelas(): void    { $this->resetPage(); }
    public function updatingFilterSemester(): void { $this->resetPage(); }
    public function updatingFilterAngkatan(): void { $this->resetPage(); }

    public function openEdit(int $id): void
    {
        $user = User::find($id);
        $this->editId       = $id;
        $this->editKelas    = $user->kelas    ?? '';
        $this->editSemester = $user->semester ?? '';
        $this->editAngkatan = $user->angkatan ?? '';
        $this->editProdi    = $user->prodi    ?? '';
        $this->showEdit     = true;
    }

    public function saveEdit(): void
    {
        $this->validate([
            'editKelas'    => 'nullable|string|max:10',
            'editSemester' => 'nullable|string|max:5',
            'editAngkatan' => 'nullable|string|max:10',
            'editProdi'    => 'nullable|string|max:100',
        ]);

        User::where('id', $this->editId)->update([
            'kelas'    => $this->editKelas    ?: null,
            'semester' => $this->editSemester ?: null,
            'angkatan' => $this->editAngkatan ?: null,
            'prodi'    => $this->editProdi    ?: null,
        ]);

        $this->showEdit = false;
        $this->editId   = null;
        session()->flash('success', 'Data mahasiswa berhasil diperbarui.');
    }

    public function with(): array
    {
        $users = User::where('role', 'mahasiswa')
            ->when($this->search, fn ($q) => $q->where(function ($q) {
                $q->where('name', 'like', "%{$this->search}%")
                  ->orWhere('nim_nip', 'like', "%{$this->search}%");
            }))
            ->when($this->filterKelas,    fn ($q) => $q->where('kelas', $this->filterKelas))
            ->when($this->filterSemester, fn ($q) => $q->where('semester', $this->filterSemester))
            ->when($this->filterAngkatan, fn ($q) => $q->where('angkatan', $this->filterAngkatan))
            ->withCount([
                'pasien',
                'askep as askep_draft_count'   => fn ($q) => $q->where('status', 'draft'),
                'askep as askep_review_count'  => fn ($q) => $q->where('status', 'menunggu_review'),
                'askep as askep_selesai_count' => fn ($q) => $q->where('status', 'selesai'),
            ])
            ->orderBy('angkatan')->orderBy('kelas')->orderBy('name')
            ->paginate(25);

        // Opsi filter unik
        $kelasOptions    = User::where('role', 'mahasiswa')->whereNotNull('kelas')->distinct()->orderBy('kelas')->pluck('kelas');
        $semesterOptions = User::where('role', 'mahasiswa')->whereNotNull('semester')->distinct()->orderBy('semester')->pluck('semester');
        $angkatanOptions = User::where('role', 'mahasiswa')->whereNotNull('angkatan')->distinct()->orderBy('angkatan')->pluck('angkatan');

        return compact('users', 'kelasOptions', 'semesterOptions', 'angkatanOptions');
    }
};
?>

<div class="p-2 md:p-4">
    <div class="mb-6 flex items-center justify-between">
        <div>
            <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Data Mahasiswa</h1>
            <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Kelola dan pantau data akademik serta progres askep tiap mahasiswa.</p>
        </div>
    </div>

    @if(session('success'))
        <div class="mb-4 flex items-center gap-2 rounded-xl border border-green-200 bg-green-50 px-4 py-3 text-sm font-medium text-green-700 dark:border-green-800 dark:bg-green-900/20 dark:text-green-300">
            <flux:icon.check-circle class="size-4 shrink-0" />
            {{ session('success') }}
        </div>
    @endif

    {{-- Filter Bar --}}
    <div class="mb-4 flex flex-wrap gap-3">
        <div class="flex-1 min-w-48">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari nama atau NIM..." autocomplete="off"
                icon="magnifying-glass"
                clearable
            />
        </div>
        <flux:select wire:model.live="filterAngkatan" placeholder="Semua Angkatan" class="w-40">
            <flux:select.option value="">Semua Angkatan</flux:select.option>
            @foreach($angkatanOptions as $opt)
                <flux:select.option value="{{ $opt }}">{{ $opt }}</flux:select.option>
            @endforeach
        </flux:select>
        <flux:select wire:model.live="filterKelas" placeholder="Semua Kelas" class="w-36">
            <flux:select.option value="">Semua Kelas</flux:select.option>
            @foreach($kelasOptions as $opt)
                <flux:select.option value="{{ $opt }}">Kelas {{ $opt }}</flux:select.option>
            @endforeach
        </flux:select>
        <flux:select wire:model.live="filterSemester" placeholder="Semua Semester" class="w-40">
            <flux:select.option value="">Semua Semester</flux:select.option>
            @foreach($semesterOptions as $opt)
                <flux:select.option value="{{ $opt }}">Semester {{ $opt }}</flux:select.option>
            @endforeach
        </flux:select>
        @if($filterKelas || $filterSemester || $filterAngkatan || $search)
            <flux:button wire:click="$set('filterKelas',''); $set('filterSemester',''); $set('filterAngkatan',''); $set('search','')" variant="ghost" icon="x-mark" size="sm">
                Reset
            </flux:button>
        @endif
    </div>

    {{-- Tabel --}}
    <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800">
        <div class="overflow-x-auto">
            <table class="min-w-full">
                <thead>
                    <tr class="border-b border-[#E0EBF5] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-900/50">
                        <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Mahasiswa</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Kelas</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Semester</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Angkatan</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Prodi</th>
                        <th class="px-4 py-3 text-center text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Pasien</th>
                        <th class="px-4 py-3 text-center text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Askep</th>
                        <th class="px-4 py-3 text-center text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-[#E0EBF5] dark:divide-zinc-700">
                    @forelse($users as $user)
                        <tr wire:key="mhs-{{ $user->id }}" class="hover:bg-[#F4F8FB] dark:hover:bg-zinc-700/40 transition-colors">
                            <td class="px-4 py-3">
                                <p class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-100">{{ $user->name }}</p>
                                <p class="font-mono text-xs text-[#7A8FA6] dark:text-zinc-400">{{ $user->nim_nip }}</p>
                            </td>
                            <td class="px-4 py-3">
                                @if($user->kelas)
                                    <span class="inline-flex items-center rounded-full bg-[#EBF5FB] dark:bg-blue-900/30 px-2.5 py-0.5 text-xs font-semibold text-[#1B4F72] dark:text-[#85B7EB]">
                                        {{ $user->kelas }}
                                    </span>
                                @else
                                    <span class="text-xs text-zinc-400">—</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-sm text-[#1B4F72] dark:text-zinc-300">
                                {{ $user->semester ? 'Semester '.$user->semester : '—' }}
                            </td>
                            <td class="px-4 py-3 text-sm text-[#1B4F72] dark:text-zinc-300">
                                {{ $user->angkatan ?? '—' }}
                            </td>
                            <td class="px-4 py-3 text-sm text-[#7A8FA6] dark:text-zinc-400">
                                {{ $user->prodi ?? '—' }}
                            </td>
                            <td class="px-4 py-3 text-center">
                                <span class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-200">{{ $user->pasien_count }}</span>
                            </td>
                            <td class="px-4 py-3">
                                <div class="flex items-center justify-center gap-1.5">
                                    @if($user->askep_draft_count > 0)
                                        <span title="Draft" class="inline-flex items-center rounded-full bg-zinc-100 dark:bg-zinc-700 px-2 py-0.5 text-xs font-semibold text-zinc-600 dark:text-zinc-300">
                                            {{ $user->askep_draft_count }} Draft
                                        </span>
                                    @endif
                                    @if($user->askep_review_count > 0)
                                        <span title="Menunggu Review" class="inline-flex items-center rounded-full bg-amber-100 dark:bg-amber-900/30 px-2 py-0.5 text-xs font-semibold text-amber-700 dark:text-amber-300">
                                            {{ $user->askep_review_count }} Review
                                        </span>
                                    @endif
                                    @if($user->askep_selesai_count > 0)
                                        <span title="Selesai" class="inline-flex items-center rounded-full bg-[#E1F5EE] dark:bg-green-900/30 px-2 py-0.5 text-xs font-semibold text-[#0F6E56] dark:text-green-400">
                                            {{ $user->askep_selesai_count }} Selesai
                                        </span>
                                    @endif
                                    @if($user->askep_draft_count == 0 && $user->askep_review_count == 0 && $user->askep_selesai_count == 0)
                                        <span class="text-xs text-zinc-400">—</span>
                                    @endif
                                </div>
                            </td>
                            <td class="px-4 py-3 text-center">
                                <flux:button size="sm" variant="ghost" icon="pencil-square" wire:click="openEdit({{ $user->id }})" />
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="8" class="px-4 py-12 text-center text-sm text-zinc-400">
                                Tidak ada mahasiswa ditemukan.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="border-t border-[#E0EBF5] dark:border-zinc-700 px-4 py-3">
            {{ $users->links() }}
        </div>
    </div>

    {{-- Modal Edit --}}
    <flux:modal wire:model="showEdit" class="max-w-md">
        @php $editUser = $editId ? App\Models\User::find($editId) : null; @endphp
        <flux:heading size="lg">Edit Data Akademik</flux:heading>
        <flux:text class="mb-4">{{ $editUser?->name }} &mdash; <span class="font-mono">{{ $editUser?->nim_nip }}</span></flux:text>

        <div class="space-y-4">
            <div class="grid grid-cols-2 gap-4">
                <flux:input wire:model="editKelas" label="Kelas" placeholder="Cth: A, 1A, 2B..." />
                <flux:input wire:model="editSemester" label="Semester" placeholder="Cth: 3, 5, 7..." />
            </div>
            <div class="grid grid-cols-2 gap-4">
                <flux:input wire:model="editAngkatan" label="Angkatan" placeholder="Cth: 2023, 2024..." />
                <flux:input wire:model="editProdi" label="Prodi" placeholder="Cth: D3 Keperawatan..." />
            </div>
        </div>

        <div class="mt-6 flex justify-end gap-3">
            <flux:button variant="ghost" wire:click="$set('showEdit', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="saveEdit">Simpan</flux:button>
        </div>
    </flux:modal>
</div>
