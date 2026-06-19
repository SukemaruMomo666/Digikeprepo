<?php

use App\Models\Penugasan;
use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Kelola Penugasan')] class extends Component
{
    use WithPagination;

    public string $tab          = 'massal'; // massal | individual
    public string $search       = '';
    public string $filterKelas  = '';
    public string $filterAngkatan = '';
    public string $filterTipe   = '';

    // === MASSAL ===
    public string $bulkKelas    = '';
    public string $bulkAngkatan = '';
    public ?int   $bulkDosenId  = null;
    public string $bulkTipe     = 'Dosen Wali';
    public string $bulkStase    = '';
    public string $bulkRs       = '';
    public string $bulkBangsal  = '';
    public string $bulkMulai    = '';
    public string $bulkSelesai  = '';
    public bool   $bulkPreview  = false;

    // === INDIVIDUAL ===
    public ?int    $editId          = null;
    public bool    $showForm        = false;
    public ?int    $mahasiswa_id    = null;
    public ?int    $dosen_id        = null;
    public string  $tipe_dosen      = 'Dosen Wali';
    public ?string $angkatan        = null;
    public ?string $kelas           = null;
    public ?string $stase           = null;
    public ?string $rs              = null;
    public ?string $bangsal         = null;
    public ?string $periode_mulai   = null;
    public ?string $periode_selesai = null;

    public function updatingSearch(): void        { $this->resetPage(); }
    public function updatingTab(): void           { $this->resetPage(); }
    public function updatingFilterKelas(): void   { $this->resetPage(); }
    public function updatingFilterAngkatan(): void{ $this->resetPage(); }
    public function updatingFilterTipe(): void    { $this->resetPage(); }

    // ── Massal ──────────────────────────────────

    public function previewMassal(): void
    {
        $this->validate([
            'bulkDosenId' => 'required|exists:users,id',
            'bulkMulai'   => 'required|date',
            'bulkSelesai' => 'required|date|after_or_equal:bulkMulai',
        ], [], [
            'bulkDosenId' => 'Dosen Pembimbing',
            'bulkMulai'   => 'Periode Mulai',
            'bulkSelesai' => 'Periode Selesai',
        ]);

        if (!$this->bulkKelas && !$this->bulkAngkatan) {
            $this->addError('bulkKelas', 'Pilih minimal kelas atau angkatan.');
            return;
        }

        $this->bulkPreview = true;
    }

    public function saveMassal(): void
    {
        $mahasiswas = $this->getMahasiswaMassal();

        foreach ($mahasiswas as $mhs) {
            Penugasan::updateOrCreate(
                ['mahasiswa_id' => $mhs->id, 'tipe_dosen' => $this->bulkTipe],
                [
                    'dosen_id'        => $this->bulkDosenId,
                    'kelas'           => $mhs->kelas,
                    'angkatan'        => $mhs->angkatan,
                    'stase'           => $this->bulkStase   ?: null,
                    'rs'              => $this->bulkRs      ?: null,
                    'bangsal'         => $this->bulkBangsal ?: null,
                    'periode_mulai'   => $this->bulkMulai,
                    'periode_selesai' => $this->bulkSelesai,
                ]
            );
        }

        $this->bulkPreview = false;
        $this->reset('bulkKelas', 'bulkAngkatan', 'bulkDosenId', 'bulkTipe', 'bulkStase', 'bulkRs', 'bulkBangsal', 'bulkMulai', 'bulkSelesai');
        $this->dispatch('toast', variant: 'success', message: count($mahasiswas) . ' penugasan berhasil disimpan.');
    }

    private function getMahasiswaMassal()
    {
        return User::where('role', 'mahasiswa')
            ->when($this->bulkKelas,    fn ($q) => $q->where('kelas', $this->bulkKelas))
            ->when($this->bulkAngkatan, fn ($q) => $q->where('angkatan', $this->bulkAngkatan))
            ->orderBy('name')
            ->get();
    }

    // ── Individual ──────────────────────────────

    public function openCreate(): void
    {
        $this->reset('mahasiswa_id', 'dosen_id', 'tipe_dosen', 'angkatan', 'kelas', 'stase', 'rs', 'bangsal', 'periode_mulai', 'periode_selesai', 'editId');
        $this->tipe_dosen = 'Dosen Wali';
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $p = Penugasan::findOrFail($id);
        $this->editId          = $id;
        $this->mahasiswa_id    = $p->mahasiswa_id;
        $this->dosen_id        = $p->dosen_id;
        $this->tipe_dosen      = $p->tipe_dosen ?? 'Dosen Wali';
        $this->angkatan        = $p->angkatan;
        $this->kelas           = $p->kelas;
        $this->stase           = $p->stase;
        $this->rs              = $p->rs;
        $this->bangsal         = $p->bangsal;
        $this->periode_mulai   = $p->periode_mulai?->format('Y-m-d');
        $this->periode_selesai = $p->periode_selesai?->format('Y-m-d');
        $this->showForm        = true;
    }

    public function save(): void
    {
        $data = $this->validate([
            'mahasiswa_id'    => 'required|exists:users,id',
            'dosen_id'        => 'required|exists:users,id',
            'tipe_dosen'      => 'required|string|max:50',
            'angkatan'        => 'nullable|string|max:10',
            'kelas'           => 'nullable|string|max:10',
            'stase'           => 'nullable|string|max:100',
            'rs'              => 'nullable|string|max:255',
            'bangsal'         => 'nullable|string|max:100',
            'periode_mulai'   => 'nullable|date',
            'periode_selesai' => 'nullable|date|after_or_equal:periode_mulai',
        ]);

        foreach ($data as $k => $v) { if ($v === '') $data[$k] = null; }

        if ($this->editId) {
            Penugasan::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Penugasan diperbarui.');
        } else {
            Penugasan::create($data);
            $this->dispatch('toast', variant: 'success', message: 'Penugasan ditambahkan.');
        }

        $this->showForm = false;
        $this->reset('mahasiswa_id', 'dosen_id', 'tipe_dosen', 'angkatan', 'kelas', 'stase', 'rs', 'bangsal', 'periode_mulai', 'periode_selesai', 'editId');
    }

    public function hapus(int $id): void
    {
        Penugasan::findOrFail($id)->delete();
        $this->dispatch('toast', variant: 'success', message: 'Penugasan dihapus.');
    }

    public function with(): array
    {
        $kelasOptions    = User::where('role', 'mahasiswa')->whereNotNull('kelas')->distinct()->orderBy('kelas')->pluck('kelas');
        $angkatanOptions = User::where('role', 'mahasiswa')->whereNotNull('angkatan')->distinct()->orderBy('angkatan')->pluck('angkatan');
        $dosens          = User::where('role', 'dosen')->orderBy('name')->get();

        $penugasans = Penugasan::with(['mahasiswa', 'dosen'])
            ->when($this->search, fn ($q) => $q->whereHas('mahasiswa', fn ($q) =>
                $q->where('name', 'like', "%{$this->search}%")
                  ->orWhere('nim_nip', 'like', "%{$this->search}%")
            ))
            ->when($this->filterKelas, fn ($q) => $q->whereHas('mahasiswa', fn ($q) =>
                $q->where('kelas', $this->filterKelas)
            ))
            ->when($this->filterAngkatan, fn ($q) => $q->whereHas('mahasiswa', fn ($q) =>
                $q->where('angkatan', $this->filterAngkatan)
            ))
            ->when($this->filterTipe, fn ($q) => $q->where('tipe_dosen', $this->filterTipe))
            ->orderBy(
                User::select('kelas')->whereColumn('users.id', 'penugasan.mahasiswa_id')->limit(1)
            )
            ->latest('penugasan.id')
            ->paginate(20);

        $totalFiltered = $penugasans->total();

        $mahasiswaMassal = $this->bulkPreview ? $this->getMahasiswaMassal()->load('penugasanSebagaiMahasiswa') : collect();
        $mahasiswas      = User::where('role', 'mahasiswa')->orderBy('name')->get();

        return compact('penugasans', 'totalFiltered', 'kelasOptions', 'angkatanOptions', 'dosens', 'mahasiswas', 'mahasiswaMassal');
    }
};
?>

<div class="p-2 md:p-4">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Kelola Penugasan</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Plot mahasiswa ke dosen pembimbing secara massal atau individual.</p>
    </div>

    {{-- Tab --}}
    <div class="mb-6 flex gap-1 rounded-xl border border-[#E0EBF5] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-800/60 p-1 w-fit">
        <button
            wire:click="$set('tab','massal')"
            class="rounded-lg px-5 py-2 text-sm font-semibold transition
                {{ $tab === 'massal'
                    ? 'bg-white dark:bg-zinc-700 text-[#1B4F72] dark:text-white shadow-sm'
                    : 'text-[#7A8FA6] dark:text-zinc-400 hover:text-[#1B4F72] dark:hover:text-white' }}"
        >
            Plot Massal
        </button>
        <button
            wire:click="$set('tab','individual')"
            class="rounded-lg px-5 py-2 text-sm font-semibold transition
                {{ $tab === 'individual'
                    ? 'bg-white dark:bg-zinc-700 text-[#1B4F72] dark:text-white shadow-sm'
                    : 'text-[#7A8FA6] dark:text-zinc-400 hover:text-[#1B4F72] dark:hover:text-white' }}"
        >
            Per Mahasiswa
        </button>
    </div>

    {{-- ══════════ TAB: MASSAL ══════════ --}}
    @if($tab === 'massal')
        <div class="grid gap-6 lg:grid-cols-5">

            {{-- Form kiri --}}
            <div class="lg:col-span-2 space-y-5">
                <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-5">
                    <h2 class="mb-4 font-semibold text-[#1B4F72] dark:text-white">1. Pilih Target Mahasiswa</h2>
                    <div class="space-y-3">
                        <div>
                            <label class="mb-1 block text-xs font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-wider">Angkatan</label>
                            <flux:select wire:model.live="bulkAngkatan" placeholder="Semua Angkatan">
                                <flux:select.option value="">Semua Angkatan</flux:select.option>
                                @foreach($angkatanOptions as $opt)
                                    <flux:select.option value="{{ $opt }}">Angkatan {{ $opt }}</flux:select.option>
                                @endforeach
                            </flux:select>
                        </div>
                        <div>
                            <label class="mb-1 block text-xs font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-wider">Kelas</label>
                            <flux:select wire:model.live="bulkKelas" placeholder="Semua Kelas">
                                <flux:select.option value="">Semua Kelas</flux:select.option>
                                @foreach($kelasOptions as $opt)
                                    <flux:select.option value="{{ $opt }}">Kelas {{ $opt }}</flux:select.option>
                                @endforeach
                            </flux:select>
                        </div>
                    </div>
                    @error('bulkKelas') <p class="mt-1 text-xs text-red-500">{{ $message }}</p> @enderror
                </div>

                <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-5">
                    <h2 class="mb-4 font-semibold text-[#1B4F72] dark:text-white">2. Isi Detail Penugasan</h2>
                    <div class="space-y-3">
                        <div>
                            <label class="mb-1 block text-xs font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-wider">Tipe Dosen <span class="text-red-500">*</span></label>
                            <flux:select wire:model="bulkTipe">
                                @foreach(\App\Models\Penugasan::TIPE_OPTIONS as $tipe)
                                    <flux:select.option value="{{ $tipe }}">{{ $tipe }}</flux:select.option>
                                @endforeach
                            </flux:select>
                        </div>
                        <div>
                            <label class="mb-1 block text-xs font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-wider">Dosen <span class="text-red-500">*</span></label>
                            <flux:select wire:model="bulkDosenId" placeholder="Pilih Dosen" searchable>
                                @foreach($dosens as $d)
                                    <flux:select.option :value="$d->id">{{ $d->name }}</flux:select.option>
                                @endforeach
                            </flux:select>
                            @error('bulkDosenId') <p class="mt-1 text-xs text-red-500">{{ $message }}</p> @enderror
                        </div>
                        <flux:input wire:model="bulkStase" label="Stase" placeholder="Cth: KMB I" autocomplete="off" />
                        <flux:input wire:model="bulkRs" label="Rumah Sakit" placeholder="Cth: RSUD Subang" autocomplete="off" />
                        <flux:input wire:model="bulkBangsal" label="Bangsal / Ruang" placeholder="Cth: Teratai" autocomplete="off" />
                        <div class="grid grid-cols-2 gap-3">
                            <div>
                                <flux:input type="date" wire:model="bulkMulai" label="Periode Mulai" />
                                @error('bulkMulai') <p class="mt-1 text-xs text-red-500">{{ $message }}</p> @enderror
                            </div>
                            <div>
                                <flux:input type="date" wire:model="bulkSelesai" label="Periode Selesai" />
                                @error('bulkSelesai') <p class="mt-1 text-xs text-red-500">{{ $message }}</p> @enderror
                            </div>
                        </div>
                    </div>
                </div>

                <flux:button variant="primary" wire:click="previewMassal" icon="eye" class="w-full justify-center">
                    Preview & Konfirmasi
                </flux:button>
            </div>

            {{-- Preview kanan --}}
            <div class="lg:col-span-3">
                <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-5 h-full">
                    <h2 class="mb-4 font-semibold text-[#1B4F72] dark:text-white">Preview Mahasiswa yang Akan Di-plot</h2>

                    @if(!$bulkPreview)
                        <div class="flex flex-col items-center justify-center py-16 text-center">
                            <flux:icon.user-group class="mb-3 size-12 text-[#D0DCE8] dark:text-zinc-600" />
                            <p class="text-sm text-[#7A8FA6] dark:text-zinc-400">Pilih filter dan isi detail penugasan,<br>lalu klik <strong>Preview & Konfirmasi</strong>.</p>
                        </div>
                    @elseif($mahasiswaMassal->isEmpty())
                        <div class="flex flex-col items-center justify-center py-16 text-center">
                            <flux:icon.exclamation-triangle class="mb-3 size-10 text-amber-400" />
                            <p class="text-sm text-[#7A8FA6]">Tidak ada mahasiswa yang cocok dengan filter tersebut.</p>
                        </div>
                    @else
                        @php
                            $dosen = $dosens->firstWhere('id', $bulkDosenId);
                        @endphp
                        <div class="mb-4 rounded-xl border border-[#D6EAF8] bg-[#EBF5FB] dark:bg-blue-900/20 dark:border-blue-800 p-4 text-sm">
                            <p class="font-semibold text-[#1B4F72] dark:text-blue-200">{{ $mahasiswaMassal->count() }} mahasiswa akan di-assign ke:</p>
                            <p class="mt-1 text-[#1B4F72] dark:text-zinc-300">
                                <strong>{{ $dosen?->name ?? '-' }}</strong>
                                @if($bulkStase) &nbsp;•&nbsp; Stase: {{ $bulkStase }} @endif
                                @if($bulkRs) &nbsp;•&nbsp; {{ $bulkRs }} @endif
                            </p>
                            <p class="mt-0.5 text-[#7A8FA6] dark:text-zinc-400 text-xs">
                                Periode: {{ $bulkMulai }} s/d {{ $bulkSelesai }}
                            </p>
                        </div>

                        <div class="max-h-80 overflow-y-auto divide-y divide-[#E0EBF5] dark:divide-zinc-700 rounded-xl border border-[#E0EBF5] dark:border-zinc-700">
                            @foreach($mahasiswaMassal as $mhs)
                                <div class="flex items-center justify-between px-4 py-2.5">
                                    <div>
                                        <p class="text-sm font-medium text-[#1B4F72] dark:text-zinc-100">{{ $mhs->name }}</p>
                                        <p class="font-mono text-xs text-[#7A8FA6] dark:text-zinc-400">{{ $mhs->nim_nip }} &nbsp;•&nbsp; Kelas {{ $mhs->kelas ?? '-' }}</p>
                                    </div>
                                    @php $existing = $mhs->penugasanSebagaiMahasiswa->first(); @endphp
                                    @if($existing)
                                        <span class="text-xs text-amber-600 dark:text-amber-400 font-medium">Timpa existing</span>
                                    @else
                                        <span class="text-xs text-[#1A9B72] dark:text-green-400 font-medium">Baru</span>
                                    @endif
                                </div>
                            @endforeach
                        </div>

                        <div class="mt-5 flex justify-end gap-3">
                            <flux:button variant="ghost" wire:click="$set('bulkPreview', false)">Ubah</flux:button>
                            <flux:button variant="primary" wire:click="saveMassal" wire:loading.attr="disabled" icon="check">
                                <span wire:loading.remove wire:target="saveMassal">Simpan {{ $mahasiswaMassal->count() }} Penugasan</span>
                                <span wire:loading wire:target="saveMassal">Menyimpan...</span>
                            </flux:button>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    @endif

    {{-- ══════════ TAB: INDIVIDUAL ══════════ --}}
    @if($tab === 'individual')
        {{-- Filter bar --}}
        <div class="mb-4 flex flex-wrap items-center gap-3">
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
            <flux:select wire:model.live="filterTipe" placeholder="Semua Tipe" class="w-40">
                <flux:select.option value="">Semua Tipe</flux:select.option>
                @foreach(\App\Models\Penugasan::TIPE_OPTIONS as $tipe)
                    <flux:select.option value="{{ $tipe }}">{{ $tipe }}</flux:select.option>
                @endforeach
            </flux:select>
            @if($filterKelas || $filterAngkatan || $filterTipe || $search)
                <flux:button wire:click="$set('filterKelas',''); $set('filterAngkatan',''); $set('filterTipe',''); $set('search','')" variant="ghost" icon="x-mark" size="sm">Reset</flux:button>
            @endif
            <flux:button variant="primary" icon="plus" wire:click="openCreate" class="ml-auto">Tambah Manual</flux:button>
        </div>

        {{-- Stats --}}
        <div class="mb-4 flex items-center gap-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
            <flux:icon.user-group class="size-4" />
            <span><strong class="text-[#1B4F72] dark:text-zinc-200">{{ $totalFiltered }}</strong> penugasan ditampilkan</span>
            @if($filterKelas || $filterAngkatan || $filterTipe)
                <span class="text-xs">
                    @if($filterAngkatan) &nbsp;• Angkatan {{ $filterAngkatan }} @endif
                    @if($filterKelas) &nbsp;• Kelas {{ $filterKelas }} @endif
                    @if($filterTipe) &nbsp;• {{ $filterTipe }} @endif
                </span>
            @endif
        </div>

        <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800">
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead>
                        <tr class="border-b border-[#E0EBF5] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-900/50">
                            <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Mahasiswa</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Dosen Pembimbing / Tipe</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Stase / RS</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Periode</th>
                            <th class="px-4 py-3"></th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-[#E0EBF5] dark:divide-zinc-700">
                        @forelse($penugasans as $item)
                            <tr wire:key="p-{{ $item->id }}" class="hover:bg-[#F4F8FB] dark:hover:bg-zinc-700/40 transition-colors">
                                <td class="px-4 py-3">
                                    <p class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-100">{{ $item->mahasiswa->name }}</p>
                                    <p class="font-mono text-xs text-[#7A8FA6] dark:text-zinc-400">
                                        {{ $item->mahasiswa->nim_nip }}
                                        @if($item->mahasiswa->kelas)
                                            &nbsp;•&nbsp; Kelas {{ $item->mahasiswa->kelas }}
                                        @endif
                                    </p>
                                </td>
                                <td class="px-4 py-3">
                                    <p class="text-sm text-[#1B4F72] dark:text-zinc-200">{{ $item->dosen->name }}</p>
                                    <p class="font-mono text-xs text-[#7A8FA6] dark:text-zinc-400">
                                        <span class="inline-flex items-center rounded-full bg-[#EBF5FB] dark:bg-blue-900/30 px-2 py-0.5 text-[10px] font-semibold text-[#2E86C1] dark:text-blue-300">
                                            {{ $item->tipe_dosen ?? 'Dosen Wali' }}
                                        </span>
                                    </p>
                                </td>
                                <td class="px-4 py-3">
                                    <p class="text-sm font-medium text-[#1B4F72] dark:text-zinc-200">{{ $item->stase ?? '-' }}</p>
                                    <p class="text-xs text-[#7A8FA6] dark:text-zinc-400">{{ $item->rs ?? '-' }}@if($item->bangsal) &nbsp;({{ $item->bangsal }})@endif</p>
                                </td>
                                <td class="px-4 py-3 text-xs text-[#7A8FA6] dark:text-zinc-400">
                                    @if($item->periode_mulai && $item->periode_selesai)
                                        {{ $item->periode_mulai->format('d/m/Y') }} – {{ $item->periode_selesai->format('d/m/Y') }}
                                    @else
                                        —
                                    @endif
                                </td>
                                <td class="px-4 py-3">
                                    <flux:dropdown>
                                        <flux:button size="sm" variant="ghost" icon="ellipsis-horizontal" inset="top bottom" />
                                        <flux:menu>
                                            <flux:menu.item icon="pencil" wire:click="openEdit({{ $item->id }})">Edit</flux:menu.item>
                                            <flux:menu.separator />
                                            <flux:menu.item icon="trash" variant="danger"
                                                wire:click="hapus({{ $item->id }})"
                                                wire:confirm="Hapus penugasan ini?">Hapus</flux:menu.item>
                                        </flux:menu>
                                    </flux:dropdown>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="px-4 py-12 text-center text-sm text-zinc-400">Belum ada penugasan.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="border-t border-[#E0EBF5] dark:border-zinc-700 px-4 py-3">
                {{ $penugasans->links() }}
            </div>
        </div>

        {{-- Modal Individual --}}
        <flux:modal wire:model="showForm" class="max-w-lg">
            <flux:heading size="lg">{{ $editId ? 'Edit Penugasan' : 'Tambah Penugasan' }}</flux:heading>
            <flux:text class="mb-5">Lengkapi detail penugasan mahasiswa.</flux:text>
            <div class="grid grid-cols-2 gap-4">
                <div class="col-span-2">
                    <flux:select wire:model="mahasiswa_id" label="Mahasiswa" placeholder="Pilih Mahasiswa" searchable>
                        @foreach($mahasiswas as $m)
                            <flux:select.option :value="$m->id">{{ $m->name }} ({{ $m->nim_nip }})</flux:select.option>
                        @endforeach
                    </flux:select>
                </div>
                <div>
                    <flux:select wire:model="tipe_dosen" label="Tipe Dosen">
                        @foreach(\App\Models\Penugasan::TIPE_OPTIONS as $tipe)
                            <flux:select.option value="{{ $tipe }}">{{ $tipe }}</flux:select.option>
                        @endforeach
                    </flux:select>
                </div>
                <div>
                    <flux:select wire:model="dosen_id" label="Dosen" placeholder="Pilih Dosen" searchable>
                        @foreach($dosens as $d)
                            <flux:select.option :value="$d->id">{{ $d->name }}</flux:select.option>
                        @endforeach
                    </flux:select>
                </div>
                <flux:input wire:model="kelas" label="Kelas" placeholder="Cth: 1A" />
                <flux:input wire:model="angkatan" label="Angkatan" placeholder="Cth: 2024" />
                <div class="col-span-2">
                    <flux:input wire:model="stase" label="Stase" placeholder="Cth: KMB I" autocomplete="off" />
                </div>
                <flux:input wire:model="rs" label="Rumah Sakit" placeholder="Cth: RSUD Subang" autocomplete="off" />
                <flux:input wire:model="bangsal" label="Bangsal" placeholder="Cth: Teratai" autocomplete="off" />
                <flux:input type="date" wire:model="periode_mulai" label="Periode Mulai" />
                <flux:input type="date" wire:model="periode_selesai" label="Periode Selesai" />
            </div>
            <div class="mt-6 flex justify-end gap-2">
                <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
                <flux:button variant="primary" wire:click="save">{{ $editId ? 'Simpan' : 'Tambah' }}</flux:button>
            </div>
        </flux:modal>
    @endif
</div>
