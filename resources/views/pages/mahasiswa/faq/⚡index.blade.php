<?php

use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('FAQ')] class extends Component
{
    public ?int $terbuka = null;

    public function toggle(int $index): void
    {
        $this->terbuka = $this->terbuka === $index ? null : $index;
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72]">Pertanyaan yang Sering Diajukan</h1>
        <p class="mt-1 text-sm text-[#7A8FA6]">Temukan jawaban atas pertanyaan umum tentang DIGIKEP.</p>
    </div>

    <div class="max-w-3xl divide-y divide-[#E0EBF5] rounded-2xl border border-[#E0EBF5] bg-white">
        @php
        $faqs = [
            ['q' => 'Apa itu DIGIKEP?', 'a' => 'DIGIKEP adalah sistem digital asuhan keperawatan yang dirancang untuk membantu mahasiswa keperawatan Politeknik Negeri Subang dalam mendokumentasikan proses asuhan keperawatan secara terstruktur berdasarkan standar SDKI, SLKI, dan SIKI.'],
            ['q' => 'Bagaimana cara membuat askep baru?', 'a' => 'Klik menu "Data Pasien", tambah pasien baru atau pilih pasien yang sudah ada, kemudian klik tombol "Buat Askep Baru". Sistem akan memandu Anda melalui 5 langkah: Pengkajian, Diagnosa, Perencanaan, Implementasi, dan Evaluasi.'],
            ['q' => 'Apa yang dimaksud EWS (Early Warning Score)?', 'a' => 'EWS adalah skor penilaian kondisi pasien berdasarkan tanda-tanda vital (tekanan darah, nadi, pernapasan, suhu, SpO2, dan kesadaran). Skor ini dihitung otomatis oleh sistem saat Anda mengisi data pengkajian.'],
            ['q' => 'Bisakah satu pasien memiliki lebih dari satu askep?', 'a' => 'Ya, satu pasien dapat memiliki beberapa dokumen askep, misalnya untuk episode rawat inap yang berbeda. Setiap askep memiliki status tersendiri (Draft, Menunggu Review, dll).'],
            ['q' => 'Apa perbedaan status askep Draft dan Menunggu Review?', 'a' => 'Draft berarti askep masih dalam proses pengerjaan. Menunggu Review berarti Anda sudah menyelesaikan semua langkah dan mengajukan untuk diperiksa oleh dosen pembimbing.'],
            ['q' => 'Apakah data askep bisa diekspor ke PDF?', 'a' => 'Ya, setelah askep disetujui oleh dosen, Anda dapat mengunduh hasil asuhan keperawatan dalam format PDF untuk keperluan laporan atau dokumentasi.'],
            ['q' => 'Bagaimana cara menghubungi dosen jika ada pertanyaan?', 'a' => 'Silakan hubungi dosen pembimbing melalui media komunikasi yang sudah ditentukan di kampus, atau gunakan fitur catatan/feedback di halaman detail askep setelah dosen memberikan review.'],
        ];
        @endphp

        @foreach ($faqs as $i => $faq)
            <div class="px-6 py-4">
                <button
                    wire:click="toggle({{ $i }})"
                    class="flex w-full items-center justify-between gap-4 text-left"
                >
                    <span class="font-semibold text-[#1B4F72]">{{ $faq['q'] }}</span>
                    <flux:icon
                        :icon="$terbuka === $i ? 'chevron-up' : 'chevron-down'"
                        class="size-4 shrink-0 text-[#7A8FA6]"
                    />
                </button>
                @if ($terbuka === $i)
                    <p class="mt-3 text-sm leading-relaxed text-[#7A8FA6]">{{ $faq['a'] }}</p>
                @endif
            </div>
        @endforeach
    </div>
</div>
