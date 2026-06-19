<?php

use App\Models\Askep;
use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Buat Askep Baru')] class extends Component
{
    public Pasien $pasien;

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);
        $this->pasien = $pasien;
    }

    public function buat(): void
    {
        $askep = Askep::create([
            'pasien_id'    => $this->pasien->id,
            'user_id'      => auth()->id(),
            'status'       => Askep::STATUS_DRAFT,
            'step_terakhir' => 0,
        ]);

        $this->pasien->catatRiwayat('Askep baru dibuat.');

        $this->redirectRoute('mahasiswa.askep.pengkajian', $askep, navigate: true);
    }
};
?>

<div class="p-2 md:p-4">
    <div class="mb-6">
        <flux:button :href="route('mahasiswa.pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Detail Pasien
        </flux:button>
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">Buat Askep Baru</h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Mulai proses asuhan keperawatan untuk pasien ini.</p>
    </div>

    {{-- Pasien Summary Card --}}
    <div class="mb-6 max-w-2xl rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white dark:bg-zinc-800 p-5">
        <div class="flex items-start gap-4">
            @php
                $words    = explode(' ', trim($pasien->nama_pasien));
                $initials = strtoupper(substr($words[0], 0, 1) . (isset($words[1]) ? substr($words[1], 0, 1) : ''));
            @endphp
            <div class="flex size-12 shrink-0 items-center justify-center rounded-full text-sm font-bold text-white"
                 style="background: linear-gradient(135deg, #2E86C1, #1B4F72)">
                {{ $initials }}
            </div>
            <div class="flex-1">
                <h2 class="text-lg font-bold text-[#1B4F72] dark:text-white">{{ $pasien->nama_pasien }}</h2>
                <div class="mt-1 flex flex-wrap gap-3 text-sm text-[#7A8FA6] dark:text-zinc-400">
                    <span>No. RM: <span class="font-mono font-medium text-[#1B4F72] dark:text-zinc-200">{{ $pasien->no_rm }}</span></span>
                    <span>•</span>
                    <span>{{ $pasien->umur }} tahun / {{ $pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</span>
                    @if ($pasien->ruang_rawat)
                        <span>•</span>
                        <span>{{ $pasien->ruang_rawat }}</span>
                    @endif
                    @if ($pasien->diagnosa_medis)
                        <span>•</span>
                        <span class="text-[#D95C3A]">{{ $pasien->diagnosa_medis }}</span>
                    @endif
                </div>
                <p class="mt-1 text-xs text-[#7A8FA6]">
                    Masuk: {{ $pasien->tanggal_masuk->translatedFormat('d F Y') }}
                </p>
            </div>
        </div>
    </div>

    {{-- Alur 5 Langkah --}}
    <div class="mb-6 max-w-2xl">
        <h3 class="mb-3 font-semibold text-[#1B4F72] dark:text-white">Alur Asuhan Keperawatan (5 Langkah)</h3>
        <div class="space-y-2">
            @foreach ([
                ['label' => 'Pengkajian', 'desc' => 'Identitas, TTV, EWS, biologis, psikososial, pemeriksaan fisik'],
                ['label' => 'Diagnosa SDKI', 'desc' => 'Pilih diagnosa keperawatan berdasarkan standar SDKI'],
                ['label' => 'Perencanaan (SLKI + SIKI)', 'desc' => 'Tetapkan luaran dan rencana intervensi keperawatan'],
                ['label' => 'Implementasi', 'desc' => 'Catat tindakan keperawatan yang telah dilakukan'],
                ['label' => 'Evaluasi', 'desc' => 'Evaluasi hasil askep berdasarkan kriteria luaran SLKI'],
            ] as $i => $s)
                <div class="flex items-start gap-3 rounded-xl border border-[#E0EBF5] dark:border-zinc-700 bg-[#F4F8FB] dark:bg-zinc-800 p-3">
                    <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">
                        {{ $i + 1 }}
                    </div>
                    <div>
                        <p class="font-medium text-[#1B4F72] dark:text-zinc-100">{{ $s['label'] }}</p>
                        <p class="text-xs text-[#7A8FA6] dark:text-zinc-400">{{ $s['desc'] }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

    <div class="flex items-center gap-3">
        <button
            wire:click="buat"
            wire:loading.attr="disabled"
            class="inline-flex items-center gap-2 rounded-xl px-6 py-3 text-sm font-bold text-white shadow-sm transition hover:opacity-90 disabled:opacity-50"
            style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
        >
            <span wire:loading.remove>
                <flux:icon.arrow-right class="size-4" />
            </span>
            <span wire:loading>
                <flux:icon.arrow-path class="size-4 animate-spin" />
            </span>
            Mulai Pengkajian
        </button>
        <flux:button :href="route('mahasiswa.pasien.show', $pasien)" variant="ghost" wire:navigate>
            Batal
        </flux:button>
    </div>
</div>
