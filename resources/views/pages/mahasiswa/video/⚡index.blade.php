<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Video Tutorial')] class extends Component {};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Video Tutorial</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Pelajari cara menggunakan DIGIKEP dari awal hingga akhir melalui seri video panduan berikut.</p>
    </div>

    @php
    // Ganti nilai 'youtube_id' di bawah ini dengan ID video YouTube Anda nanti.
    // Contoh link: https://www.youtube.com/watch?v=ABCDEFG123
    // Maka ID-nya adalah: ABCDEFG123

    $videos = [
        [
            'title' => '1. Pengenalan & Menambah Pasien', 
            'youtube_id' => 'placeholder_id_1', 
            'desc' => 'Cara login, navigasi menu, pengaturan profil, dan mendaftarkan pasien baru ke dalam sistem dengan No. RM yang benar.'
        ],
        [
            'title' => '2. Pengkajian & Fitur Cerdas', 
            'youtube_id' => 'placeholder_id_2', 
            'desc' => 'Langkah pengisian data pengkajian, penghitungan otomatis skor EWS, dan trik menggunakan tombol Set Normal untuk mempercepat pekerjaan.'
        ],
        [
            'title' => '3. Diagnosa & Perencanaan', 
            'youtube_id' => 'placeholder_id_3', 
            'desc' => 'Cara menetapkan diagnosa SDKI, mengatur prioritas, menetapkan skor awal/target SLKI, dan merencanakan intervensi SIKI.'
        ],
        [
            'title' => '4. Implementasi & Evaluasi', 
            'youtube_id' => 'placeholder_id_4', 
            'desc' => 'Mencatat riwayat pelaksanaan (waktu, shift, respons) dan mengevaluasi capaian akhir dengan metode SOAP.'
        ],
        [
            'title' => '5. Revisi Dosen & Export PDF', 
            'youtube_id' => 'placeholder_id_5', 
            'desc' => 'Cara mengirim Askep ke dosen, memahami catatan revisi, memperbaiki dokumen, dan mengunduh hasil akhir berupa laporan PDF.'
        ],
    ];
    @endphp

    <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ($videos as $video)
            <div class="flex flex-col overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 shadow-sm transition hover:shadow-md">
                {{-- Container Video 16:9 --}}
                <div class="relative w-full bg-zinc-100 dark:bg-zinc-800" style="padding-bottom: 56.25%;">
                    @if ($video['youtube_id'] !== 'placeholder_id' && !str_contains($video['youtube_id'], 'placeholder'))
                        <iframe 
                            class="absolute top-0 left-0 w-full h-full"
                            src="https://www.youtube.com/embed/{{ $video['youtube_id'] }}" 
                            title="{{ $video['title'] }}" 
                            frameborder="0" 
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                            allowfullscreen
                            loading="lazy"
                        ></iframe>
                    @else
                        {{-- Placeholder Jika Video Belum Ada --}}
                        <div class="absolute inset-0 flex flex-col items-center justify-center bg-[#F4F8FB] dark:bg-zinc-800 p-4 text-center">
                            <flux:icon.video-camera class="mb-2 size-10 text-[#85B7EB] dark:text-zinc-600" />
                            <span class="text-sm font-semibold text-[#7A8FA6] dark:text-zinc-500">Video Belum Tersedia</span>
                            <span class="mt-1 text-xs text-[#C4D3DF] dark:text-zinc-600">Ganti 'youtube_id' di kode program</span>
                        </div>
                    @endif
                </div>
                
                {{-- Detail Konten --}}
                <div class="flex flex-1 flex-col p-5">
                    <h3 class="font-bold text-[#1B4F72] dark:text-white">{{ $video['title'] }}</h3>
                    <p class="mt-2 text-sm leading-relaxed text-[#7A8FA6] dark:text-zinc-400">{{ $video['desc'] }}</p>
                </div>
            </div>
        @endforeach
    </div>

    <div class="mt-8 rounded-2xl border border-[#85B7EB] dark:border-blue-900/50 bg-[#EBF5FB] dark:bg-blue-900/20 p-5">
        <div class="flex items-start gap-3">
            <flux:icon.light-bulb class="mt-0.5 size-5 shrink-0 text-[#2E86C1] dark:text-blue-400" />
            <div>
                <p class="font-semibold text-[#1B4F72] dark:text-white">Tips Menonton</p>
                <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Putar perangkat (HP) Anda ke mode lanskap (mendatar) atau tekan ikon <strong class="text-[#1B4F72] dark:text-zinc-300">Layar Penuh (Full Screen)</strong> di pojok kanan bawah video agar tulisan di dalam tutorial terlihat lebih jelas.</p>
            </div>
        </div>
    </div>
</div>