<?php

use App\Models\Askep;
use App\Models\Penugasan;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.dosen')] #[Title('Semua Askep Bimbingan')] class extends Component
{
    use WithPagination;

    public string $search = '';
    public string $status = '';

    public function updatingSearch(): void { $this->resetPage(); }
    public function updatingStatus(): void { $this->resetPage(); }

    public function with(): array
    {
        $dosenId = auth()->id();
        $mahasiswaIds = Penugasan::where('dosen_id', $dosenId)->pluck('mahasiswa_id');

        return [
            'askepList' => Askep::query()
                ->whereIn('user_id', $mahasiswaIds)
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->whereHas('pasien', fn ($q) => $q
                        ->where('nama_pasien', 'like', "%{$this->search}%")
                        ->orWhere('no_rm', 'like', "%{$this->search}%"))
                    ->orWhereHas('user', fn ($q) => $q
                        ->where('name', 'like', "%{$this->search}%")
                        ->orWhere('nim_nip', 'like', "%{$this->search}%"));
                }))
                ->when($this->status, fn ($q) => $q->where('status', $this->status))
                ->with(['pasien', 'user'])
                ->latest('submitted_at')
                ->latest()
                ->paginate(15),
        ];
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Semua Askep Bimbingan</flux:heading>
        <flux:text class="mt-1">Daftar seluruh asuhan keperawatan dari mahasiswa bimbingan Anda.</flux:text>
    </div>

    <flux:card>
        <div class="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center">
            <div class="flex-1">
                <flux:input
                    wire:model.live.debounce.300ms="search"
                    placeholder="Cari mahasiswa, pasien, atau No. RM..."
                    icon="magnifying-glass"
                    clearable
                />
            </div>
            <flux:select wire:model.live="status" class="sm:w-48">
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
                <flux:text>Belum ada data askep bimbingan.</flux:text>
            </div>
        @else
            <flux:table>
                <flux:table.columns>
                    <flux:table.column>Mahasiswa</flux:table.column>
                    <flux:table.column>Pasien</flux:table.column>
                    <flux:table.column>Tgl. Submit</flux:table.column>
                    <flux:table.column>Status</flux:table.column>
                    <flux:table.column></flux:table.column>
                </flux:table.columns>
                <flux:table.rows>
                    @foreach ($askepList as $askep)
                        <flux:table.row :key="$askep->id">
                            <flux:table.cell>
                                <div class="font-medium text-zinc-900">{{ $askep->user->name }}</div>
                                <div class="text-xs text-zinc-500">NIM: {{ $askep->user->nim_nip }}</div>
                            </flux:table.cell>
                            <flux:table.cell>
                                <div class="font-medium text-zinc-700">{{ $askep->pasien->nama_pasien }}</div>
                                <div class="text-xs text-zinc-500 font-mono">RM: {{ $askep->pasien->no_rm }}</div>
                            </flux:table.cell>
                            <flux:table.cell>
                                <div class="text-sm">
                                    {{ $askep->submitted_at?->format('d/m/Y') ?? '-' }}
                                    <span class="text-xs text-zinc-400 block">{{ $askep->submitted_at?->format('H:i') }}</span>
                                </div>
                            </flux:table.cell>
                            <flux:table.cell>
                                @php
                                    $color = match($askep->status) {
                                        Askep::STATUS_MENUNGGU_REVIEW => 'amber',
                                        Askep::STATUS_DISETUJUI, Askep::STATUS_SELESAI => 'green',
                                        Askep::STATUS_PERLU_REVISI => 'red',
                                        default => 'zinc',
                                    };
                                @endphp
                                <flux:badge color="{{ $color }}" size="sm" inset="left">
                                    {{ $askep->statusLabel() }}
                                </flux:badge>
                            </flux:table.cell>
                            <flux:table.cell>
                                <flux:button
                                    :href="route('dosen.askep.review', $askep)"
                                    size="sm"
                                    variant="ghost"
                                    icon-trailing="chevron-right"
                                    wire:navigate
                                >
                                    Review
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
