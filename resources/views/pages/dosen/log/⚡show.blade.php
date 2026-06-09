<?php

use App\Models\LogPembelajaran;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.dosen')] #[Title('Detail Log Mahasiswa')] class extends Component
{
    public LogPembelajaran $log;

    public function mount(LogPembelajaran $log): void
    {
        // Pastikan dosen ini pembimbingnya
        $isPembimbing = auth()->user()->penugasanSebagaiDosen()
            ->where('mahasiswa_id', $log->user_id)
            ->exists();
            
        abort_unless($isPembimbing, 403);
        $this->log = $log->load('user');
    }
};
?>

<div class="max-w-5xl mx-auto p-4 md:p-6">
    <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div class="flex items-center gap-3">
            <flux:button icon="arrow-left" variant="ghost" size="sm" :href="route('dosen.log.index')" wire:navigate />
            <div>
                <flux:heading size="xl">Detail Log Refleksi Mahasiswa</flux:heading>
                <flux:text class="mt-1">
                    <span class="font-bold text-[#1B4F72]">{{ $log->user->name }}</span> 
                    <span class="mx-1 text-zinc-300">•</span> 
                    {{ $log->tanggal_shift->translatedFormat('l, d F Y') }}
                </flux:text>
            </div>
        </div>
        
        <div class="flex items-center gap-2">
            <flux:badge color="blue" size="sm" variant="outline">{{ $log->shift }}</flux:badge>
            <flux:badge color="zinc" size="sm" variant="outline">{{ $log->ruang }}</flux:badge>
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        {{-- Gibbs Stages Content --}}
        <div class="md:col-span-3 space-y-8">
            @php
                $stages = [
                    ['title' => 'Description', 'icon' => 'information-circle', 'color' => 'blue', 'content' => $log->description, 'q' => 'Apa yang terjadi?'],
                    ['title' => 'Feelings', 'icon' => 'heart', 'color' => 'amber', 'content' => $log->feelings, 'q' => 'Apa yang dirasakan?'],
                    ['title' => 'Evaluation', 'icon' => 'presentation-chart-line', 'color' => 'green', 'content' => $log->evaluation, 'q' => 'Apa yang baik/buruk?'],
                    ['title' => 'Analysis', 'icon' => 'light-bulb', 'color' => 'purple', 'content' => $log->analysis, 'q' => 'Apa maknanya?'],
                    ['title' => 'Conclusion', 'icon' => 'academic-cap', 'color' => 'teal', 'content' => $log->conclusion, 'q' => 'Apa kesimpulannya?'],
                    ['title' => 'Action Plan', 'icon' => 'rocket-launch', 'color' => 'rose', 'content' => $log->action_plan, 'q' => 'Rencana ke depan?'],
                ];
            @endphp

            @foreach ($stages as $stage)
                <div class="relative pl-10 before:absolute before:left-4 before:top-10 before:bottom-0 before:w-px before:bg-zinc-100 last:before:hidden">
                    <div class="absolute left-0 top-0 flex size-9 items-center justify-center rounded-xl bg-{{ $stage['color'] }}-50 text-{{ $stage['color'] }}-600 border border-{{ $stage['color'] }}-100 shadow-sm ring-4 ring-white">
                        <flux:icon.{{ $stage['icon'] }} class="size-4.5" />
                    </div>
                    <div class="mb-3">
                        <flux:heading size="sm" class="text-{{ $stage['color'] }}-700 font-black tracking-widest uppercase text-[10px]">{{ $stage['title'] }}</flux:heading>
                        <p class="text-[11px] text-zinc-400 font-medium italic">{{ $stage['q'] }}</p>
                    </div>
                    <div class="rounded-2xl border border-zinc-100 bg-white p-6 shadow-sm">
                        <p class="text-sm text-zinc-700 leading-relaxed whitespace-pre-line">{{ $stage['content'] }}</p>
                    </div>
                </div>
            @endforeach
        </div>

        {{-- Sidebar Actions/Info --}}
        <div class="space-y-6">
            <flux:card class="bg-[#F8FBFE] border-[#E0EBF5]">
                <flux:heading size="md" class="mb-4 text-[#1B4F72]">Konteks Kasus</flux:heading>
                <div class="rounded-lg bg-white p-3 border border-[#D0DCE8] text-sm text-zinc-600 italic">
                    "{{ $log->konteks_kasus ?: 'Tidak disebutkan' }}"
                </div>
            </flux:card>

            {{-- Placeholder for Feedback System --}}
            <flux:card>
                <flux:heading size="sm" class="mb-3">Bimbingan Dosen</flux:heading>
                <p class="text-xs text-zinc-500 leading-relaxed">
                    Fitur feedback langsung pada log akan tersedia pada pembaruan mendatang. Saat ini, gunakan menu <strong>Review Askep</strong> untuk memberikan masukan menyeluruh.
                </p>
            </flux:card>
        </div>
    </div>
</div>
