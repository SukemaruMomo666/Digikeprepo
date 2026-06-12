<?php

use App\Models\DiagnosaSdki;
use App\Models\IntervensiSiki;
use App\Models\LuaranSlki;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.admin')] #[Title('Mapping Relasi')] class extends Component
{
    // ── SDKI → SLKI ───────────────────────────────────────────────────────────
    public ?int $selectedSdkiId = null;
    public array $selectedSlkiIds = [];
    public string $searchSdki = '';
    public string $searchSlki = '';

    // ── SLKI → SIKI ───────────────────────────────────────────────────────────
    public ?int $selectedSlkiId = null;
    public array $selectedSikiIds = [];
    public string $searchSlkiSrc = '';
    public string $searchSiki = '';

    // ── Tab ───────────────────────────────────────────────────────────────────
    public string $tab = 'sdki-slki';

    // ── SDKI → SLKI methods ───────────────────────────────────────────────────

    public function selectSdki(int $id): void
    {
        $this->selectedSdkiId = $id;
        $sdki = DiagnosaSdki::with('luaranSlki')->findOrFail($id);
        $this->selectedSlkiIds = $sdki->luaranSlki->pluck('id')->map(fn ($id) => (string) $id)->toArray();
        $this->searchSlki = '';
    }

    public function saveRelasiSdkiSlki(): void
    {
        abort_unless($this->selectedSdkiId !== null, 422);
        DiagnosaSdki::findOrFail($this->selectedSdkiId)
            ->luaranSlki()
            ->sync($this->selectedSlkiIds);
        $this->dispatch('toast', variant: 'success', message: 'Relasi SDKI → SLKI disimpan.');
    }

    // ── SLKI → SIKI methods ───────────────────────────────────────────────────

    public function selectSlki(int $id): void
    {
        $this->selectedSlkiId = $id;
        $slki = LuaranSlki::with('intervensiSiki')->findOrFail($id);
        $this->selectedSikiIds = $slki->intervensiSiki->pluck('id')->map(fn ($id) => (string) $id)->toArray();
        $this->searchSiki = '';
    }

    public function saveRelasiSlkiSiki(): void
    {
        abort_unless($this->selectedSlkiId !== null, 422);
        LuaranSlki::findOrFail($this->selectedSlkiId)
            ->intervensiSiki()
            ->sync($this->selectedSikiIds);
        $this->dispatch('toast', variant: 'success', message: 'Relasi SLKI → SIKI disimpan.');
    }

    // ── Computed ──────────────────────────────────────────────────────────────

    #[Computed]
    public function sdkiList(): \Illuminate\Database\Eloquent\Collection
    {
        return DiagnosaSdki::when($this->searchSdki, fn ($q) => $q->where('label_diagnosa', 'like', "%{$this->searchSdki}%")
            ->orWhere('kode_diagnosa', 'like', "%{$this->searchSdki}%"))
            ->withCount('luaranSlki')
            ->orderBy('kode_diagnosa')
            ->get();
    }

    #[Computed]
    public function slkiOptions(): \Illuminate\Database\Eloquent\Collection
    {
        return LuaranSlki::when($this->searchSlki, fn ($q) => $q->where('label_luaran', 'like', "%{$this->searchSlki}%"))
            ->orderBy('kode_luaran')
            ->get();
    }

    #[Computed]
    public function slkiList(): \Illuminate\Database\Eloquent\Collection
    {
        return LuaranSlki::when($this->searchSlkiSrc, fn ($q) => $q->where('label_luaran', 'like', "%{$this->searchSlkiSrc}%")
            ->orWhere('kode_luaran', 'like', "%{$this->searchSlkiSrc}%"))
            ->withCount('intervensiSiki')
            ->orderBy('kode_luaran')
            ->get();
    }

    #[Computed]
    public function sikiOptions(): \Illuminate\Database\Eloquent\Collection
    {
        return IntervensiSiki::when($this->searchSiki, fn ($q) => $q->where('label_intervensi', 'like', "%{$this->searchSiki}%"))
            ->orderBy('kode_intervensi')
            ->get();
    }
};
?>

<div>
    <div class="mb-6">
        <flux:heading size="xl" level="1">Mapping Relasi</flux:heading>
        <flux:text class="mt-1">Kelola hubungan antar data master SDKI, SLKI, dan SIKI.</flux:text>
    </div>

    <div class="flex gap-1 rounded-xl bg-zinc-100 p-1 dark:bg-zinc-800 w-fit">
        <button
            wire:click="$set('tab', 'sdki-slki')"
            class="rounded-lg px-4 py-1.5 text-sm font-medium transition-colors
                {{ $tab === 'sdki-slki' ? 'bg-white shadow dark:bg-zinc-700 text-zinc-900 dark:text-white' : 'text-zinc-500 hover:text-zinc-700 dark:hover:text-zinc-300' }}"
        >SDKI → SLKI</button>
        <button
            wire:click="$set('tab', 'slki-siki')"
            class="rounded-lg px-4 py-1.5 text-sm font-medium transition-colors
                {{ $tab === 'slki-siki' ? 'bg-white shadow dark:bg-zinc-700 text-zinc-900 dark:text-white' : 'text-zinc-500 hover:text-zinc-700 dark:hover:text-zinc-300' }}"
        >SLKI → SIKI</button>
    </div>

    {{-- Tab SDKI → SLKI --}}
    @if ($tab === 'sdki-slki')
        <div class="mt-4 grid grid-cols-1 gap-4 lg:grid-cols-2">
            {{-- Kiri: Pilih SDKI --}}
            <flux:card>
                <flux:heading size="sm" class="mb-3">Pilih Diagnosa SDKI</flux:heading>
                <flux:input
                    wire:model.live.debounce.300ms="searchSdki"
                    placeholder="Cari diagnosa..." autocomplete="off"
                    icon="magnifying-glass"
                    clearable
                    class="mb-3"
                />
                <div class="max-h-[420px] overflow-y-auto space-y-1 pr-1">
                    @foreach ($this->sdkiList as $sdki)
                        <button
                            wire:click="selectSdki({{ $sdki->id }})"
                            wire:key="sdki-src-{{ $sdki->id }}"
                            class="w-full text-left rounded-lg px-3 py-2 text-sm transition-colors
                                {{ $selectedSdkiId === $sdki->id
                                    ? 'bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300'
                                    : 'hover:bg-zinc-100 dark:hover:bg-zinc-800' }}"
                        >
                            <span class="font-mono text-xs font-semibold">{{ $sdki->kode_diagnosa }}</span>
                            <span class="ml-2">{{ $sdki->label_diagnosa }}</span>
                            @if ($sdki->luaran_slki_count > 0)
                                <flux:badge size="sm" color="blue" class="ml-1">{{ $sdki->luaran_slki_count }}</flux:badge>
                            @endif
                        </button>
                    @endforeach
                </div>
            </flux:card>

            {{-- Kanan: Pilih SLKI --}}
            <flux:card>
                @if ($selectedSdkiId)
                    @php $sdki = \App\Models\DiagnosaSdki::find($selectedSdkiId) @endphp
                    <div class="mb-3 flex items-center justify-between">
                        <flux:heading size="sm">
                            Luaran untuk
                            <span class="text-blue-600 dark:text-blue-400">{{ $sdki->kode_diagnosa }}</span>
                        </flux:heading>
                        <flux:button size="sm" variant="primary" wire:click="saveRelasiSdkiSlki">Simpan</flux:button>
                    </div>
                    <flux:input
                        wire:model.live.debounce.300ms="searchSlki"
                        placeholder="Cari luaran..." autocomplete="off"
                        icon="magnifying-glass"
                        clearable
                        class="mb-3"
                    />
                    <div class="max-h-[360px] overflow-y-auto space-y-1 pr-1">
                        @foreach ($this->slkiOptions as $slki)
                            <label
                                wire:key="slki-opt-{{ $slki->id }}"
                                class="flex cursor-pointer items-center gap-3 rounded-lg px-3 py-2 hover:bg-zinc-100 dark:hover:bg-zinc-800"
                            >
                                <flux:checkbox
                                    wire:model="selectedSlkiIds"
                                    value="{{ $slki->id }}"
                                />
                                <span class="text-sm">
                                    <span class="font-mono text-xs font-semibold text-emerald-600 dark:text-emerald-400">{{ $slki->kode_luaran }}</span>
                                    <span class="ml-1">{{ $slki->label_luaran }}</span>
                                </span>
                            </label>
                        @endforeach
                    </div>
                @else
                    <div class="flex h-full min-h-[200px] items-center justify-center text-zinc-400">
                        <div class="text-center">
                            <flux:icon.arrow-left class="mx-auto mb-2 size-8" />
                            <flux:text>Pilih diagnosa SDKI terlebih dahulu</flux:text>
                        </div>
                    </div>
                @endif
            </flux:card>
        </div>
    @endif

    {{-- Tab SLKI → SIKI --}}
    @if ($tab === 'slki-siki')
        <div class="mt-4 grid grid-cols-1 gap-4 lg:grid-cols-2">
            {{-- Kiri: Pilih SLKI --}}
            <flux:card>
                <flux:heading size="sm" class="mb-3">Pilih Luaran SLKI</flux:heading>
                <flux:input
                    wire:model.live.debounce.300ms="searchSlkiSrc"
                    placeholder="Cari luaran..." autocomplete="off"
                    icon="magnifying-glass"
                    clearable
                    class="mb-3"
                />
                <div class="max-h-[420px] overflow-y-auto space-y-1 pr-1">
                    @foreach ($this->slkiList as $slki)
                        <button
                            wire:click="selectSlki({{ $slki->id }})"
                            wire:key="slki-src-{{ $slki->id }}"
                            class="w-full text-left rounded-lg px-3 py-2 text-sm transition-colors
                                {{ $selectedSlkiId === $slki->id
                                    ? 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/40 dark:text-emerald-300'
                                    : 'hover:bg-zinc-100 dark:hover:bg-zinc-800' }}"
                        >
                            <span class="font-mono text-xs font-semibold">{{ $slki->kode_luaran }}</span>
                            <span class="ml-2">{{ $slki->label_luaran }}</span>
                            @if ($slki->intervensi_siki_count > 0)
                                <flux:badge size="sm" color="orange" class="ml-1">{{ $slki->intervensi_siki_count }}</flux:badge>
                            @endif
                        </button>
                    @endforeach
                </div>
            </flux:card>

            {{-- Kanan: Pilih SIKI --}}
            <flux:card>
                @if ($selectedSlkiId)
                    @php $slki = \App\Models\LuaranSlki::find($selectedSlkiId) @endphp
                    <div class="mb-3 flex items-center justify-between">
                        <flux:heading size="sm">
                            Intervensi untuk
                            <span class="text-emerald-600 dark:text-emerald-400">{{ $slki->kode_luaran }}</span>
                        </flux:heading>
                        <flux:button size="sm" variant="primary" wire:click="saveRelasiSlkiSiki">Simpan</flux:button>
                    </div>
                    <flux:input
                        wire:model.live.debounce.300ms="searchSiki"
                        placeholder="Cari intervensi..." autocomplete="off"
                        icon="magnifying-glass"
                        clearable
                        class="mb-3"
                    />
                    <div class="max-h-[360px] overflow-y-auto space-y-1 pr-1">
                        @foreach ($this->sikiOptions as $siki)
                            <label
                                wire:key="siki-opt-{{ $siki->id }}"
                                class="flex cursor-pointer items-center gap-3 rounded-lg px-3 py-2 hover:bg-zinc-100 dark:hover:bg-zinc-800"
                            >
                                <flux:checkbox
                                    wire:model="selectedSikiIds"
                                    value="{{ $siki->id }}"
                                />
                                <span class="text-sm">
                                    <span class="font-mono text-xs font-semibold text-orange-600 dark:text-orange-400">{{ $siki->kode_intervensi }}</span>
                                    <span class="ml-1">{{ $siki->label_intervensi }}</span>
                                </span>
                            </label>
                        @endforeach
                    </div>
                @else
                    <div class="flex h-full min-h-[200px] items-center justify-center text-zinc-400">
                        <div class="text-center">
                            <flux:icon.arrow-left class="mx-auto mb-2 size-8" />
                            <flux:text>Pilih luaran SLKI terlebih dahulu</flux:text>
                        </div>
                    </div>
                @endif
            </flux:card>
        </div>
    @endif
</div>
