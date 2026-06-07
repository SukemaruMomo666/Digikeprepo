<?php

use App\Models\DiagnosaSdki;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Diagnosa SDKI')] class extends Component
{
    use WithPagination;

    public string $search = '';

    // Form
    public ?int $editId = null;
    public string $kode_diagnosa = '';
    public string $label_diagnosa = '';
    public string $definisi = '';
    public bool $showForm = false;

    public function updatingSearch(): void { $this->resetPage(); }

    public function openCreate(): void
    {
        $this->reset('kode_diagnosa', 'label_diagnosa', 'definisi', 'editId');
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $item = DiagnosaSdki::findOrFail($id);
        $this->editId = $id;
        $this->kode_diagnosa = $item->kode_diagnosa;
        $this->label_diagnosa = $item->label_diagnosa;
        $this->definisi = $item->definisi ?? '';
        $this->showForm = true;
    }

    public function save(): void
    {
        $data = $this->validate([
            'kode_diagnosa'  => ['required', 'string', 'max:10', Rule::unique('diagnosa_sdki', 'kode_diagnosa')->ignore($this->editId)->whereNull('deleted_at')],
            'label_diagnosa' => ['required', 'string', 'max:255'],
            'definisi'       => ['nullable', 'string'],
        ]);

        if ($this->editId) {
            DiagnosaSdki::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Diagnosa diperbarui.');
        } else {
            DiagnosaSdki::create($data);
            $this->dispatch('toast', variant: 'success', message: 'Diagnosa ditambahkan.');
        }

        $this->showForm = false;
        $this->reset('kode_diagnosa', 'label_diagnosa', 'definisi', 'editId');
    }

    public function hapus(int $id): void
    {
        DiagnosaSdki::findOrFail($id)->delete();
        $this->dispatch('toast', variant: 'success', message: 'Diagnosa dihapus.');
    }

    public function with(): array
    {
        return [
            'items' => DiagnosaSdki::when($this->search, fn ($q) => $q->where(function ($q) {
                $q->where('kode_diagnosa', 'like', "%{$this->search}%")
                    ->orWhere('label_diagnosa', 'like', "%{$this->search}%");
            }))
                ->withCount('askepDiagnosa')
                ->orderBy('kode_diagnosa')
                ->paginate(20),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Diagnosa SDKI</flux:heading>
            <flux:text class="mt-1">Standar Diagnosa Keperawatan Indonesia — data master.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Diagnosa</flux:button>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari kode atau label diagnosa..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Kode</flux:table.column>
                <flux:table.column>Label Diagnosa</flux:table.column>
                <flux:table.column>Digunakan</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($items as $item)
                    <flux:table.row :key="$item->id" wire:key="sdki-{{ $item->id }}">
                        <flux:table.cell class="font-mono text-sm font-semibold text-blue-600 dark:text-blue-400">
                            {{ $item->kode_diagnosa }}
                        </flux:table.cell>
                        <flux:table.cell>
                            <p class="font-medium">{{ $item->label_diagnosa }}</p>
                            @if ($item->definisi)
                                <p class="mt-0.5 text-xs text-zinc-500 line-clamp-1">{{ $item->definisi }}</p>
                            @endif
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:badge color="{{ $item->askep_diagnosa_count > 0 ? 'blue' : 'zinc' }}" size="sm">
                                {{ $item->askep_diagnosa_count }}× dipakai
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
                                        wire:confirm="Hapus diagnosa ini?"
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="4" class="py-10 text-center text-zinc-500">
                            Belum ada data diagnosa SDKI.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $items->links() }}</div>
    </flux:card>

    {{-- Modal --}}
    <flux:modal wire:model="showForm" class="max-w-lg">
        <flux:heading size="lg">{{ $editId ? 'Edit Diagnosa' : 'Tambah Diagnosa SDKI' }}</flux:heading>

        <div class="mt-4 space-y-4">
            <flux:input wire:model="kode_diagnosa" label="Kode Diagnosa" placeholder="D.0001" required />
            <flux:input wire:model="label_diagnosa" label="Label Diagnosa" placeholder="Contoh: Bersihan Jalan Napas Tidak Efektif" required />
            <flux:textarea wire:model="definisi" label="Definisi (opsional)" placeholder="Deskripsi diagnosa..." rows="4" />
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="save">Simpan</flux:button>
        </div>
    </flux:modal>
</div>
