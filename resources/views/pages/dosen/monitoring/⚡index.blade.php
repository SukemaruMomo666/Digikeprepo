<?php

use App\Models\Askep;
use App\Models\Penugasan;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.dosen')] #[Title('Monitoring Progress Askep')] class extends Component
{
    use WithPagination;

    public string $filterStatus = 'semua';
    public string $cari = '';

    public function with(): array
    {
        $dosenId = auth()->id();

        // Ambil daftar ID mahasiswa bimbingan dosen ini
        $mhsIds = Penugasan::where('dosen_id', $dosenId)->pluck('mahasiswa_id')->all();

        $askepList = Askep::whereIn('user_id', $mhsIds)
            ->with(['mahasiswa', 'pasien'])
            ->when($this->filterStatus !== 'semua', fn($q) => $q->where('status', $this->filterStatus))
            ->when($this->cari, function($q) {
                $q->whereHas('mahasiswa', fn($m) => $m->where('name', 'like', '%'.$this->cari.'%'))
                  ->orWhereHas('pasien', fn($p) => $p->where('nama_pasien', 'like', '%'.$this->cari.'%'));
            })
            ->latest('submitted_at')
            ->paginate(15);

        // Hitung statistik untuk header
        $stats = [
            'total' => Askep::whereIn('user_id', $mhsIds)->count(),
            'pending' => Askep::whereIn('user_id', $mhsIds)->where('status', 'menunggu_review')->count(),
            'revisi' => Askep::whereIn('user_id', $mhsIds)->where('status', 'perlu_revisi')->count(),
            'disetujui' => Askep::whereIn('user_id', $mhsIds)->where('status', 'disetujui')->count(),
        ];

        return [
            'askepList' => $askepList,
            'stats' => $stats
        ];
    }
}; ?>

<div class="p-4 md:p-6">
    <div class="mb-8">
        <h2 class="text-2xl font-bold text-[#1B4F72]">Monitoring Progress Askep</h2>
        <p class="text-sm text-[#7A8FA6] mt-1">Pantau status pengerjaan dan review Asuhan Keperawatan mahasiswa bimbingan Anda.</p>
    </div>

    {{-- Stats Cards --}}
    <div class="mb-8 grid gap-4 grid-cols-2 lg:grid-cols-4">
        <div class="rounded-2xl border border-[#E0EBF5] bg-white p-5 shadow-sm">
            <p class="text-xs font-bold uppercase tracking-wider text-[#7A8FA6]">Total Askep</p>
            <p class="mt-2 text-2xl font-black text-[#1B4F72]">{{ $stats['total'] }}</p>
        </div>
        <div class="rounded-2xl border border-amber-200 bg-amber-50 p-5 shadow-sm">
            <p class="text-xs font-bold uppercase tracking-wider text-amber-700">Butuh Review</p>
            <p class="mt-2 text-2xl font-black text-amber-600">{{ $stats['pending'] }}</p>
        </div>
        <div class="rounded-2xl border border-[#85B7EB]/30 bg-[#F0F7FE] p-5 shadow-sm">
            <p class="text-xs font-bold uppercase tracking-wider text-[#2E86C1]">Dalam Revisi</p>
            <p class="mt-2 text-2xl font-black text-[#1B4F72]">{{ $stats['revisi'] }}</p>
        </div>
        <div class="rounded-2xl border border-green-200 bg-green-50 p-5 shadow-sm">
            <p class="text-xs font-bold uppercase tracking-wider text-green-700">Sudah Disetujui</p>
            <p class="mt-2 text-2xl font-black text-green-600">{{ $stats['disetujui'] }}</p>
        </div>
    </div>

    {{-- Toolbar --}}
    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between bg-[#F8FBFE] p-4 rounded-xl border border-[#E0EBF5]">
        <div class="flex flex-wrap gap-2">
            @foreach(['semua' => 'Semua', 'menunggu_review' => 'Menunggu Review', 'perlu_revisi' => 'Revisi', 'disetujui' => 'Disetujui', 'draft' => 'Draft'] as $val => $label)
                <button 
                    wire:click="$set('filterStatus', '{{ $val }}')"
                    class="rounded-lg px-3 py-1.5 text-xs font-bold transition
                        {{ $filterStatus === $val ? 'bg-[#2E86C1] text-white shadow-sm' : 'bg-white text-[#7A8FA6] border border-[#D0DCE8] hover:bg-gray-50' }}"
                >
                    {{ $label }}
                </button>
            @endforeach
        </div>

        <div class="w-full sm:w-64">
            <flux:input wire:model.live.debounce.300ms="cari" icon="magnifying-glass" placeholder="Cari mhs/pasien..." class="bg-white" />
        </div>
    </div>

    {{-- Monitoring Table --}}
    <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white shadow-sm">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead class="bg-[#F4F8FB] border-b border-[#E0EBF5]">
                    <tr>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Mahasiswa</th>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Pasien & Diagnosa Medis</th>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Tahap</th>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Status</th>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Dikirim</th>
                        <th class="px-5 py-4 text-[10px] font-bold uppercase tracking-wider text-[#7A8FA6]">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse ($askepList as $askep)
                        <tr class="hover:bg-[#F8FBFE] transition">
                            <td class="px-5 py-4">
                                <p class="text-sm font-bold text-[#1B4F72]">{{ $askep->mahasiswa->name }}</p>
                                <p class="text-[10px] font-bold text-[#7A8FA6] uppercase">{{ $askep->mahasiswa->nim }}</p>
                            </td>
                            <td class="px-5 py-4">
                                <p class="text-sm font-semibold text-[#1B4F72]">{{ $askep->pasien->nama_pasien }}</p>
                                <p class="text-[11px] text-[#7A8FA6] truncate max-w-xs">{{ $askep->pasien->diagnosa_medis ?? '-' }}</p>
                            </td>
                            <td class="px-5 py-4">
                                <div class="flex items-center gap-2">
                                    <div class="h-1.5 w-16 rounded-full bg-gray-100 overflow-hidden">
                                        <div class="h-full bg-[#2E86C1]" style="width: {{ ($askep->step_terakhir / 5) * 100 }}%"></div>
                                    </div>
                                    <span class="text-[10px] font-bold text-[#7A8FA6]">{{ $askep->step_terakhir }}/5</span>
                                </div>
                            </td>
                            <td class="px-5 py-4">
                                @php
                                    $statusClasses = match($askep->status) {
                                        'draft' => 'bg-gray-100 text-gray-600',
                                        'menunggu_review' => 'bg-amber-100 text-amber-700',
                                        'perlu_revisi' => 'bg-blue-100 text-blue-700',
                                        'disetujui' => 'bg-green-100 text-green-700',
                                        'selesai' => 'bg-emerald-600 text-white',
                                        default => 'bg-gray-100 text-gray-600'
                                    };
                                @endphp
                                <span class="rounded-full {{ $statusClasses }} px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wide">
                                    {{ str_replace('_', ' ', $askep->status) }}
                                </span>
                            </td>
                            <td class="px-5 py-4">
                                <p class="text-xs text-[#7A8FA6]">{{ $askep->submitted_at?->translatedFormat('d M Y') ?? '-' }}</p>
                                <p class="text-[10px] text-[#C4D3DF]">{{ $askep->submitted_at?->format('H:i') ?? '' }}</p>
                            </td>
                            <td class="px-5 py-4">
                                <flux:button 
                                    :href="route('dosen.askep.review', $askep->id)" 
                                    size="xs" 
                                    variant="{{ $askep->status === 'menunggu_review' ? 'primary' : 'ghost' }}"
                                    wire:navigate
                                >
                                    {{ $askep->status === 'menunggu_review' ? 'Review Sekarang' : 'Lihat' }}
                                </flux:button>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="px-5 py-12 text-center text-[#7A8FA6]">
                                <p class="text-sm">Tidak ada data askep yang sesuai dengan kriteria.</p>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <div class="mt-6">
        {{ $askepList->links() }}
    </div>
</div>
