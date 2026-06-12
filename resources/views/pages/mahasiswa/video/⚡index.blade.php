<?php

use Livewire\Attributes\Title;
use Livewire\Component;

new #[Title('Video Tutorial')] class extends Component {
    public function rendering($view): void
    {
        $layout = auth()->user()->isDosen() ? 'layouts.dosen' : (auth()->user()->isAdmin() ? 'layouts.admin' : 'layouts.mahasiswa');
        $view->layout($layout);
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Video Tutorial</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Panduan lengkap cara mengerjakan Asuhan Keperawatan di DIGIKEP.</p>
    </div>

    {{-- Placeholder Video Cara Mengerjakan Askep --}}
    <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 shadow-sm max-w-2xl">
        <div class="relative w-full bg-[#F4F8FB] dark:bg-zinc-800" style="padding-bottom: 56.25%;">
            <div class="absolute inset-0 flex flex-col items-center justify-center p-6 text-center">
                <flux:icon.video-camera class="mb-3 size-12 text-[#85B7EB] dark:text-zinc-600" />
                <span class="text-base font-semibold text-[#1B4F72] dark:text-zinc-300">Cara Mengerjakan Asuhan Keperawatan</span>
                <span class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-500">Video belum tersedia</span>
            </div>
        </div>
        <div class="p-5">
            <h3 class="font-bold text-[#1B4F72] dark:text-white">Panduan Lengkap Pengerjaan Askep</h3>
            <p class="mt-2 text-sm leading-relaxed text-[#7A8FA6] dark:text-zinc-400">
                Mulai dari menambah pasien, mengisi pengkajian, menetapkan diagnosa SDKI, merencanakan luaran SLKI dan intervensi SIKI, mencatat implementasi, hingga evaluasi akhir dan pengiriman ke dosen pembimbing.
            </p>
        </div>
    </div>
</div>
