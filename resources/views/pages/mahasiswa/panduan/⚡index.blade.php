<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Panduan')] class extends Component {};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72]">Panduan Penggunaan</h1>
        <p class="mt-1 text-sm text-[#7A8FA6]">Panduan lengkap menggunakan sistem DIGIKEP untuk asuhan keperawatan.</p>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ([
            ['icon' => 'user-plus', 'title' => 'Menambah Pasien', 'desc' => 'Cara mendaftarkan pasien baru ke dalam sistem dengan data lengkap.', 'color' => '#2E86C1'],
            ['icon' => 'clipboard-document-list', 'title' => 'Pengkajian', 'desc' => 'Langkah-langkah mengisi form pengkajian keperawatan secara lengkap.', 'color' => '#1A9B72'],
            ['icon' => 'magnifying-glass', 'title' => 'Diagnosa SDKI', 'desc' => 'Cara memilih dan menetapkan diagnosa keperawatan berdasarkan SDKI.', 'color' => '#1B4F72'],
            ['icon' => 'chart-bar', 'title' => 'Luaran SLKI', 'desc' => 'Menetapkan luaran dan kriteria hasil berdasarkan standar SLKI.', 'color' => '#0F6E56'],
            ['icon' => 'wrench-screwdriver', 'title' => 'Intervensi SIKI', 'desc' => 'Merencanakan intervensi keperawatan berdasarkan panduan SIKI.', 'color' => '#2E86C1'],
            ['icon' => 'document-arrow-down', 'title' => 'Export PDF', 'desc' => 'Mengunduh hasil asuhan keperawatan dalam format PDF.', 'color' => '#1A9B72'],
        ] as $item)
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-5">
                <div class="mb-3 inline-flex size-10 items-center justify-center rounded-xl" style="background-color: {{ $item['color'] }}20">
                    <flux:icon :icon="$item['icon']" class="size-5" style="color: {{ $item['color'] }}" />
                </div>
                <h3 class="font-semibold text-[#1B4F72]">{{ $item['title'] }}</h3>
                <p class="mt-1 text-sm text-[#7A8FA6]">{{ $item['desc'] }}</p>
                <button class="mt-3 text-sm font-medium text-[#2E86C1] hover:underline">Baca selengkapnya →</button>
            </div>
        @endforeach
    </div>

    <div class="mt-8 rounded-2xl border border-[#85B7EB] bg-[#EBF5FB] p-5">
        <div class="flex items-start gap-3">
            <flux:icon.information-circle class="mt-0.5 size-5 shrink-0 text-[#2E86C1]" />
            <div>
                <p class="font-semibold text-[#1B4F72]">Butuh bantuan lebih lanjut?</p>
                <p class="mt-1 text-sm text-[#7A8FA6]">Hubungi dosen pembimbing atau admin kampus untuk panduan lebih lanjut tentang penggunaan sistem DIGIKEP.</p>
            </div>
        </div>
    </div>
</div>
