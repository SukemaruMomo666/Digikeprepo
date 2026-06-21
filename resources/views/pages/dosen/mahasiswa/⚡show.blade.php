<?php

use App\Models\Askep;
use App\Models\AskepFeedback;
use App\Models\Penugasan;
use App\Models\User;
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

<div class="p-2 md:p-4">
    <div class="mb-6 flex items-center gap-3">
        <flux:button :href="route('dosen.mahasiswa.index')" variant="ghost" icon="arrow-left" wire:navigate />
        <div>
            <h2 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Profil Mahasiswa</h2>
            <p class="text-sm text-[#7A8FA6] dark:text-zinc-400">Detail informasi dan riwayat pengerjaan askep.</p>
        </div>
    </div>

    <div class="grid gap-6 lg:grid-cols-[350px_1fr]">
        {{-- Sidebar Profil --}}
        <div class="space-y-6">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-4 sm:p-6 shadow-sm text-center">
                <div class="mx-auto flex size-20 items-center justify-center rounded-2xl bg-[#F4F8FB] dark:bg-zinc-700 text-3xl font-bold text-[#2E86C1] dark:text-[#85B7EB]">
                    {{ $mahasiswa->initials() }}
                </div>
                <h3 class="mt-4 text-lg font-bold text-[#1B4F72] dark:text-white">{{ $mahasiswa->name }}</h3>
                <p class="text-sm font-semibold text-[#7A8FA6] dark:text-zinc-400 uppercase tracking-widest">{{ $mahasiswa->nim }}</p>

                <div class="mt-6 grid grid-cols-2 gap-3 border-t border-gray-50 dark:border-zinc-700 pt-6">
                    <div class="rounded-xl bg-[#F8FBFE] dark:bg-zinc-700/50 p-3">
                        <p class="text-[10px] font-bold uppercase text-[#7A8FA6] dark:text-zinc-400">Total Askep</p>
                        <p class="text-xl font-black text-[#1B4F72] dark:text-zinc-100">{{ $mahasiswa->askep_count }}</p>
                    </div>
                    <div class="rounded-xl bg-[#F8FBFE] dark:bg-zinc-700/50 p-3">
                        <p class="text-[10px] font-bold uppercase text-[#7A8FA6] dark:text-zinc-400">Rata-rata Skor</p>
                        <p class="text-xl font-black text-[#2E86C1] dark:text-[#85B7EB]">-</p>
                    </div>
                </div>
            </div>

            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-4 sm:p-6 shadow-sm">
                <h4 class="mb-4 text-xs font-bold uppercase tracking-wider text-[#7A8FA6] dark:text-zinc-400">Informasi Penugasan</h4>
                <dl class="space-y-4">
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF] dark:text-zinc-500">Stase</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-200">{{ $tugas->stase ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF] dark:text-zinc-500">Rumah Sakit</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-200">{{ $tugas->rs ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF] dark:text-zinc-500">Bangsal / Ruang</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-200">{{ $tugas->bangsal ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] font-bold uppercase text-[#C4D3DF] dark:text-zinc-500">Periode</dt>
                        <dd class="text-sm font-semibold text-[#1B4F72] dark:text-zinc-200">
                            {{ $tugas->periode_mulai?->translatedFormat('d M Y') ?? '?' }} -
                            {{ $tugas->periode_selesai?->translatedFormat('d M Y') ?? '?' }}
                        </dd>
                    </div>
                </dl>
            </div>
        </div>

        {{-- Riwayat Askep --}}
        <div class="space-y-4">
            <h3 class="text-sm font-bold uppercase tracking-wider text-[#7A8FA6] dark:text-zinc-400 px-1">Riwayat Dokumentasi Askep</h3>

            <div class="grid gap-4 sm:grid-cols-1">
                @forelse ($askepList as $askep)
                    <div class="group flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-3 sm:p-5 shadow-sm transition hover:border-[#2E86C1]">
                        <div class="flex items-center gap-4">
                            <div class="flex size-10 shrink-0 items-center justify-center rounded-full bg-[#EBF5FB] dark:bg-blue-900/30 text-[#2E86C1] dark:text-[#85B7EB]">
                                <flux:icon.clipboard-document-list class="size-5" />
                            </div>
                            <div>
                                <h4 class="font-bold text-[#1B4F72] dark:text-white">{{ $askep->pasien->nama_pasien }}</h4>
                                <div class="flex items-center gap-2 mt-0.5 text-xs text-[#7A8FA6] dark:text-zinc-400">
                                    <span class="rounded bg-gray-100 dark:bg-zinc-700 px-1.5 py-0.5 font-mono text-[10px] font-bold dark:text-zinc-300">RM: {{ $askep->pasien->no_rm }}</span>
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
                                <p class="mt-1 text-[10px] font-medium text-[#C4D3DF] dark:text-zinc-500">Progress: {{ $askep->step_terakhir }}/5 tahap</p>
                            </div>
                            
                            <flux:button :href="route('dosen.askep.review', $askep->id)" variant="ghost" size="sm" wire:navigate>
                                {{ $askep->status === 'menunggu_review' ? 'Review' : 'Lihat' }}
                            </flux:button>
                        </div>
                    </div>
                @empty
                    <div class="rounded-2xl border-2 border-dashed border-[#D0DCE8] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-800 py-12 text-center text-[#7A8FA6] dark:text-zinc-400">
                        <p class="text-sm">Mahasiswa ini belum membuat dokumentasi Askep.</p>
                    </div>
                @endforelse
            </div>
        </div>
    </div>
</div>
