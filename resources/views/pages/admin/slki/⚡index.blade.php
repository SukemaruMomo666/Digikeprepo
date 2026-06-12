<?php

use App\Models\LuaranSlki;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Luaran SLKI')] class extends Component
{
    use WithPagination;

    public string $search = '';

    // Form
    public ?int $editId = null;
    public string $kode_luaran = '';
    public string $label_luaran = '';
    public string $definisi = '';
    public string $kriteria_hasil = '';
    public bool $showForm = false;

    public function updatingSearch(): void { $this->resetPage(); }

    public function openCreate(): void
    {
        $this->reset('kode_luaran', 'label_luaran', 'definisi', 'kriteria_hasil', 'editId');
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $item = LuaranSlki::findOrFail($id);
        $this->editId = $id;
        $this->kode_luaran = $item->kode_luaran;
        $this->label_luaran = $item->label_luaran;
        $this->definisi = $item->definisi ?? '';
        $this->kriteria_hasil = $item->kriteria_hasil ?? '';
        $this->showForm = true;
    }

    public function save(): void
    {
        $data = $this->validate([
            'kode_luaran'    => ['required', 'string', 'max:10', Rule::unique('luaran_slki', 'kode_luaran')->ignore($this->editId)->whereNull('deleted_at')],
            'label_luaran'   => ['required', 'string', 'max:255'],
            'definisi'       => ['nullable', 'string'],
            'kriteria_hasil' => ['nullable', 'string'],
        ]);

        if ($this->editId) {
            LuaranSlki::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Luaran diperbarui.');
        } else {
            LuaranSlki::create($data);
            $this->dispatch('toast', variant: 'success', message: 'Luaran ditambahkan.');
        }

        $this->showForm = false;
        $this->reset('kode_luaran', 'label_luaran', 'definisi', 'kriteria_hasil', 'editId');
    }

    public function hapus(int $id): void
    {
        LuaranSlki::findOrFail($id)->delete();
        $this->dispatch('toast', variant: 'success', message: 'Luaran dihapus.');
    }

    public function with(): array
    {
        return [
            'items' => LuaranSlki::when($this->search, fn ($q) => $q->where(function ($q) {
                $q->where('kode_luaran', 'like', "%{$this->search}%")
                    ->orWhere('label_luaran', 'like', "%{$this->search}%");
            }))
                ->withCount('askepDiagnosaLuaran')
                ->orderBy('kode_luaran')
                ->paginate(20),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Luaran SLKI</flux:heading>
            <flux:text class="mt-1">Standar Luaran Keperawatan Indonesia — data master.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Luaran</flux:button>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari kode atau label luaran..." autocomplete="off"
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Kode</flux:table.column>
                <flux:table.column>Label Luaran</flux:table.column>
                <flux:table.column>Digunakan</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($items as $item)
                    <flux:table.row :key="$item->id" wire:key="slki-{{ $item->id }}">
                        <flux:table.cell class="font-mono text-sm font-semibold text-emerald-600 dark:text-emerald-400">
                            {{ $item->kode_luaran }}
                        </flux:table.cell>
                        <flux:table.cell>
                            <p class="font-medium">{{ $item->label_luaran }}</p>
                            @if ($item->kriteria_hasil)
                                <p class="mt-0.5 text-xs text-zinc-500 line-clamp-1">{{ $item->kriteria_hasil }}</p>
                            @endif
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:badge color="{{ $item->askep_diagnosa_luaran_count > 0 ? 'emerald' : 'zinc' }}" size="sm">
                                {{ $item->askep_diagnosa_luaran_count }}× dipakai
                            </flux:badge>
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
                                        wire:confirm="Hapus luaran ini?"
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="4" class="py-10 text-center text-zinc-500">
                            Belum ada data luaran SLKI.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $items->links() }}</div>
    </flux:card>

    {{-- Modal --}}
    <flux:modal wire:model="showForm" class="max-w-lg">
        <flux:heading size="lg">{{ $editId ? 'Edit Luaran' : 'Tambah Luaran SLKI' }}</flux:heading>

        <div class="mt-4 space-y-4">
            <flux:input wire:model="kode_luaran" label="Kode Luaran" placeholder="L.0001" required />
            <flux:input wire:model="label_luaran" label="Label Luaran" placeholder="Contoh: Bersihan Jalan Napas" required />
            <flux:textarea wire:model="definisi" label="Definisi (opsional)" rows="3" />
            <flux:textarea wire:model="kriteria_hasil" label="Kriteria Hasil (opsional)" placeholder="Deskripsi kriteria pencapaian luaran..." rows="4" />
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="save">Simpan</flux:button>
        </div>
    </flux:modal>
</div>
