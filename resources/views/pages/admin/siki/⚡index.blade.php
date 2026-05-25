<?php

use App\Models\IntervensiSiki;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Intervensi SIKI')] class extends Component
{
    use WithPagination;

    public string $search = '';

    // Form
    public ?int $editId = null;
    public string $kode_intervensi = '';
    public string $label_intervensi = '';
    public string $definisi = '';
    public string $tindakan = '';
    public bool $showForm = false;

    public function updatingSearch(): void { $this->resetPage(); }

    public function openCreate(): void
    {
        $this->reset('kode_intervensi', 'label_intervensi', 'definisi', 'tindakan', 'editId');
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $item = IntervensiSiki::findOrFail($id);
        $this->editId = $id;
        $this->kode_intervensi = $item->kode_intervensi;
        $this->label_intervensi = $item->label_intervensi;
        $this->definisi = $item->definisi ?? '';
        $this->tindakan = $item->tindakan ?? '';
        $this->showForm = true;
    }

    public function save(): void
    {
        $data = $this->validate([
            'kode_intervensi'  => ['required', 'string', 'max:10', Rule::unique('intervensi_siki', 'kode_intervensi')->ignore($this->editId)->whereNull('deleted_at')],
            'label_intervensi' => ['required', 'string', 'max:255'],
            'definisi'         => ['nullable', 'string'],
            'tindakan'         => ['nullable', 'string'],
        ]);

        if ($this->editId) {
            IntervensiSiki::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Intervensi diperbarui.');
        } else {
            IntervensiSiki::create($data);
            $this->dispatch('toast', variant: 'success', message: 'Intervensi ditambahkan.');
        }

        $this->showForm = false;
        $this->reset('kode_intervensi', 'label_intervensi', 'definisi', 'tindakan', 'editId');
    }

    public function hapus(int $id): void
    {
        IntervensiSiki::findOrFail($id)->delete();
        $this->dispatch('toast', variant: 'success', message: 'Intervensi dihapus.');
    }

    public function with(): array
    {
        return [
            'items' => IntervensiSiki::when($this->search, fn ($q) => $q->where(function ($q) {
                $q->where('kode_intervensi', 'like', "%{$this->search}%")
                    ->orWhere('label_intervensi', 'like', "%{$this->search}%");
            }))
                ->withCount('intervensiPasien')
                ->orderBy('kode_intervensi')
                ->paginate(20),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Intervensi SIKI</flux:heading>
            <flux:text class="mt-1">Standar Intervensi Keperawatan Indonesia — data master.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Intervensi</flux:button>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari kode atau label intervensi..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Kode</flux:table.column>
                <flux:table.column>Label Intervensi</flux:table.column>
                <flux:table.column>Digunakan</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($items as $item)
                    <flux:table.row :key="$item->id" wire:key="siki-{{ $item->id }}">
                        <flux:table.cell class="font-mono text-sm font-semibold text-orange-600 dark:text-orange-400">
                            {{ $item->kode_intervensi }}
                        </flux:table.cell>
                        <flux:table.cell>
                            <p class="font-medium">{{ $item->label_intervensi }}</p>
                            @if ($item->tindakan)
                                <p class="mt-0.5 text-xs text-zinc-500 line-clamp-1">{{ $item->tindakan }}</p>
                            @endif
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:badge color="{{ $item->intervensi_pasien_count > 0 ? 'orange' : 'zinc' }}" size="sm">
                                {{ $item->intervensi_pasien_count }}× dipakai
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
                                        wire:confirm="Hapus intervensi ini?"
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="4" class="py-10 text-center text-zinc-500">
                            Belum ada data intervensi SIKI.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $items->links() }}</div>
    </flux:card>

    {{-- Modal --}}
    <flux:modal wire:model="showForm" class="max-w-lg">
        <flux:heading size="lg">{{ $editId ? 'Edit Intervensi' : 'Tambah Intervensi SIKI' }}</flux:heading>

        <div class="mt-4 space-y-4">
            <flux:input wire:model="kode_intervensi" label="Kode Intervensi" placeholder="I.0001" required />
            <flux:input wire:model="label_intervensi" label="Label Intervensi" placeholder="Contoh: Manajemen Jalan Napas" required />
            <flux:textarea wire:model="definisi" label="Definisi (opsional)" rows="3" />
            <flux:textarea wire:model="tindakan" label="Tindakan (opsional)" placeholder="Deskripsi tindakan yang dilakukan..." rows="4" />
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="save">Simpan</flux:button>
        </div>
    </flux:modal>
</div>
