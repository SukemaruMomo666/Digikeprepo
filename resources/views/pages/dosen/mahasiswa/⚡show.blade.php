<?php

use App\Models\Askep;
use App\Models\AskepFeedback;
use App\Models\Penugasan;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.dosen')] #[Title('Detail Mahasiswa')] class extends Component
{
    public User $mahasiswa;

    public function mount(User $mahasiswa): void
    {
        // Pastikan dosen memang membimbing mahasiswa ini
        $isMyStudent = Penugasan::where('dosen_id', auth()->id())
            ->where('mahasiswa_id', $mahasiswa->id)
            ->exists();

        abort_unless($isMyStudent, 403);
        
        $this->mahasiswa = $mahasiswa->loadCount('askep');
    }

    public function with(): array
    {
        $askepList = Askep::where('user_id', $this->mahasiswa->id)
            ->with('pasien')
            ->latest()
            ->get();

        $tugas = Penugasan::where('dosen_id', auth()->id())
            ->where('mahasiswa_id', $this->mahasiswa->id)
            ->first();

        return [
            'askepList' => $askepList,
            'tugas' => $tugas
        ];
    }
}; ?>

<div class="p-4 md:p-6">
    <div class="mb-6 flex items-center gap-3">
        <flux:button :href="route('dosen.mahasiswa.index')" variant="ghost" icon="arrow-left" wire:navigate />
        <div>
            <h2 class="text-2xl font-bold text-[#1B4F72]">Profil Mahasiswa</h2>
            <p class="text-sm text-[#7A8FA6]">Detail informasi dan riwayat pengerjaan askep.</p>
        </div>
    </div>

    <div class="grid gap-6 lg:grid-cols-[350px_1fr]">
        {{-- Sidebar Profil --}}
        <div class="space-y-6">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6 shadow-sm text-center">
                <div class="mx-auto flex size-20 items-center justify-center rounded-2xl bg-[#F4F8FB] text-3xl font-bold text-[#2E86C1]">
                    {{ $mahasiswa->initials() }}
                </div>
                <h3 class="mt-4 text-lg font-bold text-[#1B4F72]">{{ $mahasiswa->name }}</h3>
                <p class="text-sm font-semibold text-[#7A8FA6] uppercase tracking-widest">{{ $mahasiswa->nim }}</p>
                
                <div class="mt-6 grid grid-cols-2 gap-3 border-t border-gray-50 pt-6">
                    <div class="rounded-xl bg-[#F8FBFE] p-3">
                        <p class="text-[10px] font-bold uppercase text-[#7A8FA6]">Total Askep</p>
                        <p class="text-xl font-black text-[#1B4F72]">{{ $mahasiswa->askep_count }}</p>
                    </div>
                    <div class="rounded-xl bg-[#F8FBFE] p-3">
                        <p class="text-[10px] font-bold uppercase text-[#7A8FA6]">Rata-rata Skor</p>
                        <p class="text-xl font-black text-[#2E86C1]">-</p>
                    </div>
                </div>
            </div>

            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6 shadow-sm">
                <h4 class="mb-4 text-xs font-bold uppercase tracking-wider text-[#7A8FA6]">Informasi Penugasan</h4>
                <dl class="space-y-4">
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF]">Stase</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72]">{{ $tugas->stase ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF]">Rumah Sakit</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72]">{{ $tugas->rs ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF]">Bangsal / Ruang</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72]">{{ $tugas->bangsal ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF]">Periode</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72]">
                            {{ $tugas->periode_mulai?->translatedFormat('d M Y') ?? '?' }} - 
                            {{ $tugas->periode_selesai?->translatedFormat('d M Y') ?? '?' }}
                        </dd>
                    </div>
                </dl>
            </div>
        </div>

        {{-- Riwayat Askep --}}
        <div class="space-y-4">
            <h3 class="text-sm font-bold uppercase tracking-wider text-[#7A8FA6] px-1">Riwayat Dokumentasi Askep</h3>
            
            <div class="grid gap-4 sm:grid-cols-1">
                @forelse ($askepList as $askep)
                    <div class="group flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 rounded-2xl border border-[#E0EBF5] bg-white p-5 shadow-sm transition hover:border-[#2E86C1]">
                        <div class="flex items-center gap-4">
                            <div class="flex size-10 shrink-0 items-center justify-center rounded-full bg-[#EBF5FB] text-[#2E86C1]">
                                <flux:icon.clipboard-document-list class="size-5" />
                            </div>
                            <div>
                                <h4 class="font-bold text-[#1B4F72]">{{ $askep->pasien->nama_pasien }}</h4>
                                <div class="flex items-center gap-2 mt-0.5 text-xs text-[#7A8FA6]">
                                    <span class="rounded bg-gray-100 px-1.5 py-0.5 font-mono text-[10px] font-bold">RM: {{ $askep->pasien->no_rm }}</span>
                                    <span>·</span>
                                    <span>{{ $askep->created_at->translatedFormat('d M Y') }}</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex flex-wrap items-center gap-3">
                            <div class="flex flex-col items-end">
                                @php
                                    $statusClasses = match($askep->status) {
                                        'draft' => 'text-gray-500 bg-gray-50 border-gray-200',
                                        'menunggu_review' => 'text-amber-600 bg-amber-50 border-amber-200',
                                        'perlu_revisi' => 'text-blue-600 bg-blue-50 border-blue-200',
                                        'disetujui' => 'text-green-600 bg-green-50 border-green-200',
                                        default => 'text-gray-500 bg-gray-50 border-gray-200'
                                    };
                                @endphp
                                <span class="rounded-full border px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wide {{ $statusClasses }}">
                                    {{ str_replace('_', ' ', $askep->status) }}
                                </span>
                                <p class="mt-1 text-[10px] font-medium text-[#C4D3DF]">Progress: {{ $askep->step_terakhir }}/5 tahap</p>
                            </div>
                            
                            <flux:button :href="route('dosen.askep.review', $askep->id)" variant="ghost" size="sm" wire:navigate>
                                {{ $askep->status === 'menunggu_review' ? 'Review' : 'Lihat' }}
                            </flux:button>
                        </div>
                    </div>
                @empty
                    <div class="rounded-2xl border-2 border-dashed border-[#D0DCE8] bg-[#F4F8FB] py-12 text-center text-[#7A8FA6]">
                        <p class="text-sm">Mahasiswa ini belum membuat dokumentasi Askep.</p>
                    </div>
                @endforelse
            </div>
        </div>
    </div>
</div>
