<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Video Tutorial')] class extends Component {};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72]">Video Tutorial</h1>
        <p class="mt-1 text-sm text-[#7A8FA6]">Pelajari cara menggunakan DIGIKEP melalui video panduan berikut.</p>
    </div>

    <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ([
            ['title' => 'Pengenalan DIGIKEP', 'dur' => '5:32', 'thumb' => '1'],
            ['title' => 'Cara Input Pengkajian', 'dur' => '8:14', 'thumb' => '2'],
            ['title' => 'Menetapkan Diagnosa SDKI', 'dur' => '6:47', 'thumb' => '3'],
            ['title' => 'Perencanaan SLKI & SIKI', 'dur' => '7:20', 'thumb' => '4'],
            ['title' => 'Implementasi & Evaluasi', 'dur' => '5:58', 'thumb' => '5'],
            ['title' => 'Export Hasil Askep', 'dur' => '3:15', 'thumb' => '6'],
        ] as $video)
            <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white">
                {{-- Thumbnail placeholder --}}
                <div class="flex h-40 items-center justify-center" style="background: linear-gradient(135deg, #1B4F72, #0A2D45)">
                    <div class="flex size-12 items-center justify-center rounded-full bg-white/20 backdrop-blur-sm">
                        <flux:icon.play class="size-6 text-white" />
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-semibold text-[#1B4F72]">{{ $video['title'] }}</h3>
                    <div class="mt-2 flex items-center gap-2 text-xs text-[#7A8FA6]">
                        <flux:icon.clock class="size-3.5" />
                        <span>{{ $video['dur'] }}</span>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <p class="mt-6 text-center text-sm text-[#7A8FA6]">Video tutorial lengkap akan segera tersedia.</p>
</div>
