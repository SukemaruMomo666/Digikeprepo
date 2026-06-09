<?php

use App\Models\LogPembelajaran;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Detail Log Pembelajaran')] class extends Component
{
    public LogPembelajaran $log;

    public function mount(LogPembelajaran $log): void
    {
        abort_unless($log->user_id === auth()->id(), 403);
        $this->log = $log;
    }
};
?>

<div class="max-w-4xl mx-auto p-4 md:p-6">
    <div class="mb-8 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <flux:button icon="arrow-left" variant="ghost" size="sm" :href="route('mahasiswa.log.index')" wire:navigate />
            <div>
                <flux:heading size="xl">Detail Log Refleksi</flux:heading>
                <flux:text class="mt-1">{{ $log->tanggal_shift->translatedFormat('l, d F Y') }} • {{ $log->shift }}</flux:text>
            </div>
        </div>
        <flux:button icon="pencil-square" variant="ghost" :href="route('mahasiswa.log.edit', $log)" wire:navigate>Edit Log</flux:button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        {{-- Sidebar Info --}}
        <div class="space-y-6">
            <flux:card>
                <flux:heading size="md" class="mb-4 text-[#1B4F72]">Info Praktik</flux:heading>
                <div class="space-y-4">
                    <div>
                        <p class="text-[10px] font-bold uppercase text-zinc-400">Ruang / Bangsal</p>
                        <p class="font-semibold text-zinc-800">{{ $log->ruang ?: '-' }}</p>
                    </div>
                    <div>
                        <p class="text-[10px] font-bold uppercase text-zinc-400">Konteks Kasus</p>
                        <p class="font-semibold text-zinc-800 leading-tight">{{ $log->konteks_kasus ?: '-' }}</p>
                    </div>
                </div>
            </flux:card>

            <flux:card class="bg-[#F8FBFE] border-[#E0EBF5]">
                <flux:heading size="sm" class="mb-2 text-[#2E86C1]">Tentang Gibbs Cycle</flux:heading>
                <flux:text size="xs" class="leading-relaxed">
                    Gibbs Reflective Cycle membantu Anda belajar dari pengalaman dengan menganalisis perasaan, evaluasi, dan membuat rencana tindakan nyata.
                </flux:text>
            </flux:card>
        </div>

        {{-- Content Gibbs --}}
        <div class="md:col-span-2 space-y-8">
            {{-- Loop Gibbs Stages --}}
            @php
                $stages = [
                    ['title' => 'Description', 'icon' => 'information-circle', 'color' => 'blue', 'content' => $log->description],
                    ['title' => 'Feelings', 'icon' => 'heart', 'color' => 'amber', 'content' => $log->feelings],
                    ['title' => 'Evaluation', 'icon' => 'presentation-chart-line', 'color' => 'green', 'content' => $log->evaluation],
                    ['title' => 'Analysis', 'icon' => 'light-bulb', 'color' => 'purple', 'content' => $log->analysis],
                    ['title' => 'Conclusion', 'icon' => 'academic-cap', 'color' => 'teal', 'content' => $log->conclusion],
                    ['title' => 'Action Plan', 'icon' => 'rocket-launch', 'color' => 'rose', 'content' => $log->action_plan],
                ];
            @endphp

            @foreach ($stages as $stage)
                <div class="relative pl-8 before:absolute before:left-3 before:top-8 before:bottom-0 before:w-px before:bg-zinc-100 last:before:hidden">
                    <div class="absolute left-0 top-0 flex size-6 items-center justify-center rounded-full bg-{{ $stage['color'] }}-100 text-{{ $stage['color'] }}-600 ring-4 ring-white">
                        <flux:icon.{{ $stage['icon'] }} class="size-3.5" />
                    </div>
                    <div class="mb-2 flex items-center gap-2">
                        <flux:heading size="md" class="text-{{ $stage['color'] }}-700 font-black tracking-tight uppercase text-xs">{{ $stage['title'] }}</flux:heading>
                    </div>
                    <div class="rounded-2xl border border-zinc-100 bg-white p-5 shadow-sm">
                        <p class="text-sm text-zinc-700 leading-relaxed whitespace-pre-line">{{ $stage['content'] }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
