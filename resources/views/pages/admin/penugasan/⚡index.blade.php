<?php

use App\Models\Penugasan;
use App\Models\User;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Kelola Penugasan')] class extends Component
{
    use WithPagination;

    public string $search = '';

    // Form fields
    public ?int $mahasiswa_id = null;
    public ?int $dosen_id = null;
    public ?string $angkatan = null;
    public ?string $kelas = null;
    public ?string $stase = null;
    public ?string $rs = null;
    public ?string $bangsal = null;
    public ?string $periode_mulai = null;
    public ?string $periode_selesai = null;

    public ?int $editId = null;
    public bool $showForm = false;

    public function updatingSearch(): void { $this->resetPage(); }

    public function openCreate(): void
    {
        $this->reset('mahasiswa_id', 'dosen_id', 'angkatan', 'kelas', 'stase', 'rs', 'bangsal', 'periode_mulai', 'periode_selesai', 'editId');
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $penugasan = Penugasan::findOrFail($id);
        $this->editId = $id;
        $this->mahasiswa_id = $penugasan->mahasiswa_id;
        $this->dosen_id = $penugasan->dosen_id;
        $this->angkatan = $penugasan->angkatan;
        $this->kelas = $penugasan->kelas;
        $this->stase = $penugasan->stase;
        $this->rs = $penugasan->rs;
        $this->bangsal = $penugasan->bangsal;
        $this->periode_mulai = $penugasan->periode_mulai ? $penugasan->periode_mulai->format('Y-m-d') : null;
        $this->periode_selesai = $penugasan->periode_selesai ? $penugasan->periode_selesai->format('Y-m-d') : null;
        $this->showForm = true;
    }

    public function save(): void
    {
        $data = $this->validate([
            'mahasiswa_id'    => ['required', 'exists:users,id'],
            'dosen_id'        => ['required', 'exists:users,id'],
            'angkatan'        => ['nullable', 'numeric', 'digits:4'],
            'kelas'           => ['nullable', 'string', 'max:10'],
            'stase'           => ['nullable', 'string', 'max:100'],
            'rs'              => ['nullable', 'string', 'max:255'],
            'bangsal'         => ['nullable', 'string', 'max:100'],
            'periode_mulai'   => ['nullable', 'date'],
            'periode_selesai' => ['nullable', 'date', 'after_or_equal:periode_mulai'],
        ]);

        // Ensure empty strings are null
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null;
            }
        }

        if ($this->editId) {
            Penugasan::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Penugasan diperbarui.');
        } else {
            Penugasan::create($data);
            $this->dispatch('toast', variant: 'success', message: 'Penugasan ditambahkan.');
        }

        $this->showForm = false;
        $this->reset('mahasiswa_id', 'dosen_id', 'angkatan', 'kelas', 'stase', 'rs', 'bangsal', 'periode_mulai', 'periode_selesai', 'editId');
    }

    public function hapus(int $id): void
    {
        Penugasan::findOrFail($id)->delete();
        $this->dispatch('toast', variant: 'success', message: 'Penugasan dihapus.');
    }

    public function with(): array
    {
        return [
            'penugasans' => Penugasan::with(['mahasiswa', 'dosen'])
                ->when($this->search, function ($q) {
                    $q->whereHas('mahasiswa', function ($q) {
                        $q->where('name', 'like', "%{$this->search}%")
                          ->orWhere('nim_nip', 'like', "%{$this->search}%");
                    });
                })
                ->latest()
                ->paginate(15),
            'mahasiswas' => User::where('role', 'mahasiswa')->orderBy('name')->get(),
            'dosens'     => User::where('role', 'dosen')->orderBy('name')->get(),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Kelola Penugasan</flux:heading>
            <flux:text class="mt-1">Daftar penugasan mahasiswa ke dosen pembimbing.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Penugasan</flux:button>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari mahasiswa (nama/NIM)..." autocomplete="off"
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Mahasiswa</flux:table.column>
                <flux:table.column>Dosen Pembimbing</flux:table.column>
                <flux:table.column>Stase / RS</flux:table.column>
                <flux:table.column>Periode</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($penugasans as $item)
                    <flux:table.row :key="$item->id">
                        <flux:table.cell>
                            <div class="font-medium text-zinc-900 dark:text-white">{{ $item->mahasiswa->name }}</div>
                            <div class="text-xs text-zinc-500">{{ $item->mahasiswa->nim_nip }} • Angkatan {{ $item->angkatan ?? '-' }} ({{ $item->kelas ?? '-' }})</div>
                        </flux:table.cell>
                        <flux:table.cell>
                            <div class="text-sm">{{ $item->dosen->name }}</div>
                            <div class="text-xs text-zinc-500">{{ $item->dosen->nim_nip }}</div>
                        </flux:table.cell>
                        <flux:table.cell>
                            <div class="text-sm font-medium">{{ $item->stase ?? '-' }}</div>
                            <div class="text-xs text-zinc-500">{{ $item->rs ?? '-' }} @if($item->bangsal) ({{ $item->bangsal }}) @endif</div>
                        </flux:table.cell>
                        <flux:table.cell>
                            @if($item->periode_mulai && $item->periode_selesai)
                                <div class="text-xs">
                                    {{ $item->periode_mulai->format('d/m/Y') }} - {{ $item->periode_selesai->format('d/m/Y') }}
                                </div>
                            @else
                                <span class="text-zinc-400">-</span>
                            @endif
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:dropdown>
                                <flux:button size="sm" variant="ghost" icon="ellipsis-horizontal" inset="top bottom" />
                                <flux:menu>
                                    <flux:menu.item icon="pencil" wire:click="openEdit({{ $item->id }})">Edit</flux:menu.item>
                                    <flux:menu.separator />
                                    <flux:menu.item
                                        icon="trash"
                                        variant="danger"
                                        wire:click="hapus({{ $item->id }})"
                                        wire:confirm="Hapus penugasan ini?"
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="5" class="py-10 text-center text-zinc-500">
                            Belum ada penugasan yang dibuat.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $penugasans->links() }}</div>
    </flux:card>

    {{-- Modal Form --}}
    <flux:modal wire:model="showForm" class="max-w-lg">
        <div class="space-y-6">
            <div>
                <flux:heading size="lg">{{ $editId ? 'Edit Penugasan' : 'Tambah Penugasan' }}</flux:heading>
                <flux:text class="mt-1">Lengkapi detail penugasan mahasiswa.</flux:text>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <flux:select wire:model="mahasiswa_id" label="Mahasiswa" placeholder="Pilih Mahasiswa" searchable>
                    @foreach($mahasiswas as $m)
                        <flux:select.option :value="$m->id">{{ $m->name }} ({{ $m->nim_nip }})</flux:select.option>
                    @endforeach
                </flux:select>

                <flux:select wire:model="dosen_id" label="Dosen Pembimbing" placeholder="Pilih Dosen" searchable>
                    @foreach($dosens as $d)
                        <flux:select.option :value="$d->id">{{ $d->name }}</flux:select.option>
                    @endforeach
                </flux:select>

                <flux:input wire:model="angkatan" label="Angkatan" placeholder="Contoh: 2024" />
                <flux:input wire:model="kelas" label="Kelas" placeholder="Contoh: A" />

                <div class="md:col-span-2">
                    <flux:input wire:model="stase" label="Stase" placeholder="Contoh: Keperawatan Medikal Bedah" />
                </div>

                <flux:input wire:model="rs" label="Rumah Sakit" placeholder="Contoh: RSUD Dr. Soetomo" />
                <flux:input wire:model="bangsal" label="Bangsal / Ruang" placeholder="Contoh: Melati" />

                <flux:input type="date" wire:model="periode_mulai" label="Periode Mulai" />
                <flux:input type="date" wire:model="periode_selesai" label="Periode Selesai" />
            </div>

            <div class="flex justify-end gap-2">
                <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
                <flux:button variant="primary" wire:click="save">{{ $editId ? 'Simpan' : 'Tambah' }}</flux:button>
            </div>
        </div>
    </flux:modal>
</div>
