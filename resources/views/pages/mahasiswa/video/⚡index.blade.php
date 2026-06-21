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

<div class="p-2 md:p-4">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Video Tutorial</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Panduan lengkap cara mengerjakan Asuhan Keperawatan di DIGIKEP.</p>
    </div>

    {{-- Video Cara Mengerjakan Askep --}}
    <div class="overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 shadow-sm max-w-2xl">
        <div class="relative w-full bg-[#F4F8FB] dark:bg-zinc-800" style="padding-bottom: 56.25%;">
            <iframe 
                class="absolute inset-0 w-full h-full" 
                src="https://www.youtube.com/embed/FwYdmARI4JY" 
                title="Panduan Mengerjakan Asuhan Keperawatan di DIGIKEP" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
            </iframe>
        </div>
        <div class="p-3 sm:p-5">
            <h3 class="font-bold text-[#1B4F72] dark:text-white">Panduan Lengkap Pengerjaan Askep</h3>
            <p class="mt-2 text-sm leading-relaxed text-[#7A8FA6] dark:text-zinc-400">
                Mulai dari menambah pasien, mengisi pengkajian, menetapkan diagnosa SDKI, merencanakan luaran SLKI dan intervensi SIKI, mencatat implementasi, hingga evaluasi akhir dan pengiriman ke dosen pembimbing.
            </p>
        </div>
    </div>
</div>
