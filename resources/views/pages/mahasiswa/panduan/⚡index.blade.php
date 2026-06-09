<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Panduan')] class extends Component {};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Panduan Penggunaan</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Panduan lengkap menggunakan sistem DIGIKEP untuk asuhan keperawatan.</p>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ([
            ['icon' => 'user-plus', 'title' => 'Menambah Pasien', 'desc' => 'Cara mendaftarkan pasien baru ke dalam sistem dengan data lengkap.', 'color' => '#2E86C1'],
            ['icon' => 'clipboard-document-list', 'title' => 'Tahap 1: Pengkajian', 'desc' => 'Langkah-langkah mengisi form pengkajian keperawatan secara komprehensif.', 'color' => '#1A9B72'],
            ['icon' => 'magnifying-glass', 'title' => 'Tahap 2: Diagnosa', 'desc' => 'Cara mencari dan menetapkan diagnosa keperawatan berdasarkan SDKI.', 'color' => '#1B4F72'],
            ['icon' => 'chart-bar', 'title' => 'Tahap 3: Perencanaan', 'desc' => 'Menetapkan luaran (SLKI) dan merencanakan intervensi (SIKI).', 'color' => '#0F6E56'],
            ['icon' => 'wrench-screwdriver', 'title' => 'Tahap 4: Implementasi', 'desc' => 'Mendokumentasikan tindakan yang telah dilakukan beserta respons pasien.', 'color' => '#D95C3A'],
            ['icon' => 'document-check', 'title' => 'Tahap 5: Evaluasi', 'desc' => 'Mengevaluasi kondisi pasien dengan metode SOAP dan mengukur capaian skor.', 'color' => '#8B5CF6'],
            ['icon' => 'document-arrow-down', 'title' => 'Export Laporan', 'desc' => 'Mengunduh hasil akhir asuhan keperawatan dalam format dokumen PDF.', 'color' => '#1A9B72'],
        ] as $item)
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 p-5">
                <div class="mb-3 inline-flex size-10 items-center justify-center rounded-xl" style="background-color: {{ $item['color'] }}20">
                    <flux:icon :icon="$item['icon']" class="size-5" style="color: {{ $item['color'] }}" />
                </div>
                <h3 class="font-semibold text-[#1B4F72] dark:text-white">{{ $item['title'] }}</h3>
                <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">{{ $item['desc'] }}</p>
                <button class="mt-3 text-sm font-medium text-[#2E86C1] dark:text-blue-400 hover:underline">Baca selengkapnya →</button>
            </div>
        @endforeach
    </div>

    <div class="mt-8 rounded-2xl border border-[#85B7EB] dark:border-blue-900/50 bg-[#EBF5FB] dark:bg-blue-900/20 p-5">
        <div class="flex items-start gap-3">
            <flux:icon.information-circle class="mt-0.5 size-5 shrink-0 text-[#2E86C1] dark:text-blue-400" />
            <div>
                <p class="font-semibold text-[#1B4F72] dark:text-white">Butuh bantuan lebih lanjut?</p>
                <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Hubungi dosen pembimbing atau admin kampus untuk panduan lebih lanjut tentang penggunaan sistem DIGIKEP.</p>
            </div>
        </div>
    </div>
</div>
