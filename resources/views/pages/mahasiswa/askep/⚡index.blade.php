<?php

use App\Models\Askep;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.mahasiswa')] #[Title('Semua Askep')] class extends Component
{
    use WithPagination;

    public string $search = '';
    public string $status = '';

    public function updatingSearch(): void { $this->resetPage(); }
    public function updatingStatus(): void { $this->resetPage(); }

    public function with(): array
    {
        return [
            'askepList' => Askep::query()
                ->where('user_id', auth()->id())
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->whereHas('pasien', fn ($q) => $q
                        ->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%"));
                }))
                ->when($this->status, fn ($q) => $q->where('status', $this->status))
                ->with('pasien')
                ->withCount(['pengkajian', 'diagnosa'])
                ->latest()
                ->paginate(10),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Semua Askep</flux:heading>
        <flux:text class="mt-1">Daftar seluruh asuhan keperawatan yang pernah dikerjakan.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center">
            <div class="flex-1">
                <flux:input
                    wire:model.live.debounce.300ms="search"
                    placeholder="Cari nama pasien atau No. RM..."
                    icon="magnifying-glass"
                    clearable
                />
            </div>
            <flux:select wire:model.live="status" class="sm:w-44">
                <flux:select.option value="">Semua Status</flux:select.option>
                <flux:select.option value="draft">Draft</flux:select.option>
                <flux:select.option value="menunggu_review">Menunggu Review</flux:select.option>
                <flux:select.option value="perlu_revisi">Perlu Revisi</flux:select.option>
                <flux:select.option value="disetujui">Disetujui</flux:select.option>
                <flux:select.option value="selesai">Selesai</flux:select.option>
            </flux:select>
        </div>

        @if ($askepList->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.clipboard-document-list class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada data askep.</flux:text>
            </div>
        @else
            <flux:table>
                <flux:table.columns>
                    <flux:table.column>Pasien</flux:table.column>
                    <flux:table.column>Tgl. Masuk</flux:table.column>
                    <flux:table.column class="text-center">Pengkajian</flux:table.column>
                    <flux:table.column class="text-center">Diagnosa</flux:table.column>
                    <flux:table.column>Status</flux:table.column>
                    <flux:table.column></flux:table.column>
                </flux:table.columns>
                <flux:table.rows>
                    @foreach ($askepList as $askep)
                        <flux:table.row :key="$askep->id">
                            <flux:table.cell>
                                <div class="font-medium">{{ $askep->pasien->nama_pasien }}</div>
                                <div class="text-xs font-mono text-zinc-500">{{ $askep->pasien->no_rm }}</div>
                            </flux:table.cell>
                            <flux:table.cell>{{ $askep->pasien->tanggal_masuk->format('d/m/Y') }}</flux:table.cell>
                            <flux:table.cell class="text-center">
                                <flux:badge color="{{ $askep->pengkajian_count > 0 ? 'green' : 'zinc' }}" size="sm">
                                    {{ $askep->pengkajian_count }}/1
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell class="text-center">
                                <flux:badge color="{{ $askep->diagnosa_count > 0 ? 'blue' : 'zinc' }}" size="sm">
                                    {{ $askep->diagnosa_count }}
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell>
                                <flux:badge color="{{ $askep->isSelesai() ? 'green' : 'yellow' }}" size="sm">
                                    {{ $askep->statusLabel() }}
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell>
                                @php $bisaDilanjutkan = in_array($askep->status, [Askep::STATUS_DRAFT, Askep::STATUS_PERLU_REVISI], true); @endphp
                                <flux:button
                                    :href="$bisaDilanjutkan ? $askep->nextStepUrl() : route('askep.show', $askep)"
                                    size="sm"
                                    variant="ghost"
                                    :icon-trailing="$bisaDilanjutkan ? 'arrow-right' : 'eye'"
                                    wire:navigate
                                >
                                    {{ $bisaDilanjutkan ? 'Lanjutkan' : 'Lihat' }}
                                </flux:button>
                            </flux:table.cell>
                        </flux:table.row>
                    @endforeach
                </flux:table.rows>
            </flux:table>

            <div class="mt-4">
                {{ $askepList->links() }}
            </div>
        @endif
    </flux:card>
</div>
