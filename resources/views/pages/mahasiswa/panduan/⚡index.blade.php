<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Panduan')] class extends Component {
    public bool $modalOpen = false;
    public array $selectedItem = [];

    public function bukaPanduan(string $title, string $desc, string $detail, string $icon, string $color): void
    {
        $this->selectedItem = [
            'title' => $title,
            'desc' => $desc,
            'detail' => $detail,
            'icon' => $icon,
            'color' => $color,
        ];
        $this->modalOpen = true;
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Panduan Penggunaan</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Panduan lengkap menggunakan sistem DIGIKEP untuk asuhan keperawatan.</p>
    </div>

    @php
    $panduan = [
        [
            'icon' => 'user-plus',
            'title' => 'Menambah Pasien',
            'desc' => 'Cara mendaftarkan pasien baru ke dalam sistem dengan data lengkap.',
            'color' => '#2E86C1',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Buka menu <strong class="text-[#1B4F72] dark:text-white">Data Pasien</strong> dari sidebar di sebelah kiri.</li>
                    <li>Klik tombol <strong class="text-[#1B4F72] dark:text-white">+ Tambah Pasien Baru</strong> di sudut kanan atas.</li>
                    <li>Isi formulir identitas pasien, pastikan Nomor Rekam Medis (No. RM) diisi dengan benar dan tidak duplikat.</li>
                    <li>Klik <strong class="text-[#1B4F72] dark:text-white">Simpan</strong>. Pasien akan muncul dalam daftar dan siap untuk dibuatkan dokumen Asuhan Keperawatan (Askep).</li>
                </ul>
            '
        ],
        [
            'icon' => 'clipboard-document-list',
            'title' => 'Tahap 1: Pengkajian',
            'desc' => 'Langkah-langkah mengisi form pengkajian keperawatan secara komprehensif.',
            'color' => '#1A9B72',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Pilih pasien dan klik <strong class="text-[#1B4F72] dark:text-white">Buat Askep Baru</strong>.</li>
                    <li>Anda akan diarahkan ke form Tahap 1: Pengkajian.</li>
                    <li>Gunakan <strong class="text-[#1B4F72] dark:text-white">Tab Navigasi</strong> di bagian atas (Identitas, TTV & EWS, Riwayat, Biologis, Fisik, dll) untuk pindah antar-bagian pengkajian.</li>
                    <li>Isi Tanda-Tanda Vital (TTV); skor EWS (Early Warning Score) akan dihitung otomatis oleh sistem.</li>
                    <li>Untuk bagian Fisik & Biologis, Anda dapat menggunakan tombol <strong class="text-[#1B4F72] dark:text-white">Set Normal</strong> untuk mempercepat pengisian jika pasien tidak memiliki keluhan di area tersebut.</li>
                    <li>Klik <strong class="text-[#1B4F72] dark:text-white">Simpan Draft</strong> jika belum selesai, atau <strong class="text-[#1B4F72] dark:text-white">Selanjutnya: Diagnosa</strong> untuk beralih ke tahap berikutnya.</li>
                </ul>
            '
        ],
        [
            'icon' => 'magnifying-glass',
            'title' => 'Tahap 2: Diagnosa',
            'desc' => 'Cara mencari dan menetapkan diagnosa keperawatan berdasarkan SDKI.',
            'color' => '#1B4F72',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Pada halaman Diagnosa, gunakan kotak <strong class="text-[#1B4F72] dark:text-white">Pencarian SDKI</strong> di atas untuk mencari diagnosa berdasarkan kata kunci atau kode.</li>
                    <li>Klik tombol <strong class="text-[#1B4F72] dark:text-white">+ (Plus)</strong> pada diagnosa yang sesuai. Diagnosa akan pindah ke daftar <strong class="text-[#1B4F72] dark:text-white">Diagnosa Terpilih</strong> di bawahnya.</li>
                    <li>Di daftar Diagnosa Terpilih, klik diagnosa untuk membuka rinciannya.</li>
                    <li>Pilih <strong class="text-[#1B4F72] dark:text-white">Etiologi (Penyebab)</strong> dan <strong class="text-[#1B4F72] dark:text-white">Gejala (Subjektif/Objektif)</strong> yang relevan dengan kondisi aktual pasien Anda.</li>
                    <li>Gunakan tombol panah Naik (Shift Up) untuk mengatur <strong class="text-[#1B4F72] dark:text-white">Prioritas</strong> diagnosa. Diagnosa paling kritis harus berada di urutan 1.</li>
                </ul>
            '
        ],
        [
            'icon' => 'chart-bar',
            'title' => 'Tahap 3: Perencanaan',
            'desc' => 'Menetapkan luaran (SLKI) dan merencanakan intervensi (SIKI).',
            'color' => '#0F6E56',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Untuk setiap diagnosa yang Anda pilih di tahap 2, tetapkan <strong class="text-[#1B4F72] dark:text-white">Luaran (SLKI)</strong> dan tentukan durasi target waktu penyelesaian (contoh: "3 x 24 jam").</li>
                    <li>Pilih kriteria hasil yang relevan dari *accordion* SLKI, lalu tetapkan <strong class="text-[#1B4F72] dark:text-white">Skor Awal</strong> dan <strong class="text-[#1B4F72] dark:text-white">Skor Target</strong> (skala 1-5).</li>
                    <li>Beralih ke tab <strong class="text-[#1B4F72] dark:text-white">Intervensi (SIKI)</strong> pada diagnosa tersebut, lalu pilih tindakan utama (Observasi, Terapeutik, Edukasi, Kolaborasi) yang akan Anda rencanakan.</li>
                </ul>
            '
        ],
        [
            'icon' => 'wrench-screwdriver',
            'title' => 'Tahap 4: Implementasi',
            'desc' => 'Mendokumentasikan tindakan yang telah dilakukan beserta respons pasien.',
            'color' => '#D95C3A',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Pada halaman Implementasi, Anda akan melihat daftar Intervensi (SIKI) yang telah direncanakan sebelumnya di panel/card tersendiri.</li>
                    <li>Klik salah satu intervensi, lalu isi form <strong class="text-[#1B4F72] dark:text-white">Catat Pelaksanaan</strong>.</li>
                    <li>Pilih waktu, shift, centang tindakan yang dilakukan, dan tuliskan respons pasien secara umum (Positif/Netral/Negatif) maupun catatan spesifik tambahan (durasi dll).</li>
                    <li>Data yang Anda simpan akan memanjang membentuk <strong class="text-[#1B4F72] dark:text-white">Riwayat Pelaksanaan</strong> (Log / *Timeline*) di bagian bawah form.</li>
                </ul>
            '
        ],
        [
            'icon' => 'document-check',
            'title' => 'Tahap 5: Evaluasi',
            'desc' => 'Mengevaluasi kondisi pasien dengan metode SOAP dan mengukur capaian skor.',
            'color' => '#8B5CF6',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Buka tab diagnosa yang ingin dievaluasi.</li>
                    <li>Isi data Tanda-Tanda Vital (TTV) saat evaluasi dilakukan.</li>
                    <li>Pada bagian <strong class="text-[#1B4F72] dark:text-white">Kriteria Hasil (SLKI)</strong>, berikan <strong class="text-[#1B4F72] dark:text-white">Skor Akhir Evaluasi</strong> berdasarkan kondisi aktual pasien.</li>
                    <li>Tuliskan narasi <strong class="text-[#1B4F72] dark:text-white">Catatan SOAP</strong> (Subjektif, Objektif, Analisis, Planning).</li>
                    <li>Tentukan <strong class="text-[#1B4F72] dark:text-white">A: Analisis</strong> (Tercapai / Membaik / Belum Tercapai) dan <strong class="text-[#1B4F72] dark:text-white">P: Tindak Lanjut</strong> (Lanjutkan / Hentikan / Modifikasi / Rujuk).</li>
                    <li>Setelah semua selesai, klik <strong class="text-[#1B4F72] dark:text-white">Selesai & Kirim untuk Review</strong> agar dosen pembimbing dapat memeriksa Askep Anda.</li>
                </ul>
            '
        ],
        [
            'icon' => 'document-arrow-down',
            'title' => 'Export Laporan',
            'desc' => 'Mengunduh hasil akhir asuhan keperawatan dalam format dokumen PDF.',
            'color' => '#1A9B72',
            'detail' => '
                <ul class="list-decimal pl-5 space-y-2 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <li>Setelah askep Anda diperiksa dan <strong class="text-[#1B4F72] dark:text-white">Disetujui</strong> oleh Dosen Pembimbing, buka halaman detail askep di menu Arsip.</li>
                    <li>Klik tombol <strong class="text-[#1B4F72] dark:text-white">Download PDF</strong> yang ada di bagian atas halaman.</li>
                    <li>Sistem akan mengkompilasi seluruh form Pengkajian, Diagnosa, Perencanaan, Implementasi, dan Evaluasi Anda menjadi dokumen laporan yang terstruktur dan siap cetak.</li>
                </ul>
            '
        ],
    ];
    @endphp

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ($panduan as $item)
            <div class="rounded-2xl flex flex-col items-start border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-900 p-5 transition hover:shadow-sm">
                <div class="mb-3 inline-flex size-10 items-center justify-center rounded-xl" style="background-color: {{ $item['color'] }}20">
                    <flux:icon :icon="$item['icon']" class="size-5" style="color: {{ $item['color'] }}" />
                </div>
                <h3 class="font-semibold text-[#1B4F72] dark:text-white">{{ $item['title'] }}</h3>
                <p class="mt-1 mb-4 flex-1 text-sm text-[#7A8FA6] dark:text-zinc-400">{{ $item['desc'] }}</p>
                <button 
                    wire:click="bukaPanduan('{{ $item['title'] }}', '{{ $item['desc'] }}', '{{ base64_encode($item['detail']) }}', '{{ $item['icon'] }}', '{{ $item['color'] }}')"
                    class="mt-auto inline-flex items-center gap-1 text-sm font-bold text-[#2E86C1] dark:text-blue-400 hover:text-[#1B4F72] dark:hover:text-white transition"
                >
                    Lihat detail <flux:icon.arrow-right class="size-3" />
                </button>
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

    {{-- Modal Detail Panduan --}}
    <flux:modal wire:model="modalOpen" class="w-full max-w-2xl">
        @if ($selectedItem)
            <div class="p-2">
                <div class="mb-4 flex items-center gap-3 border-b border-[#E0EBF5] dark:border-zinc-700 pb-4">
                    <div class="inline-flex size-10 shrink-0 items-center justify-center rounded-xl" style="background-color: {{ $selectedItem['color'] }}20">
                        <flux:icon :icon="$selectedItem['icon']" class="size-5" style="color: {{ $selectedItem['color'] }}" />
                    </div>
                    <div>
                        <h2 class="text-xl font-bold text-[#1B4F72] dark:text-white">{{ $selectedItem['title'] }}</h2>
                        <p class="text-sm text-[#7A8FA6] dark:text-zinc-400">{{ $selectedItem['desc'] }}</p>
                    </div>
                </div>
                
                <div class="space-y-4">
                    {!! base64_decode($selectedItem['detail']) !!}
                </div>

                <div class="mt-6 flex justify-end">
                    <flux:button wire:click="$set('modalOpen', false)" variant="primary">Tutup</flux:button>
                </div>
            </div>
        @endif
    </flux:modal>

</div>