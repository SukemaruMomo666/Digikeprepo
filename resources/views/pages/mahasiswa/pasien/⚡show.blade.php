<?php

use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Detail Pasien')] class extends Component
{
    public Pasien $pasien;

    public function mount(Pasien $pasien): void
    {
        // Pastikan pasien milik mahasiswa yang sedang login
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien->load('riwayat');
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.index')" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Daftar Pasien
        </flux:button>
        <div class="flex items-start justify-between">
            <div>
                <flux:heading size="xl" level="1">{{ $pasien->nama_pasien }}</flux:heading>
                <flux:text class="mt-1 font-mono text-sm">No. RM: {{ $pasien->no_rm }}</flux:text>
            </div>
            <div class="flex items-center gap-2">
                @if ($pasien->isSelesai())
                    <flux:badge color="green">Askep Selesai</flux:badge>
                @else
                    <flux:badge color="yellow">Draft</flux:badge>
                @endif
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Info Pasien --}}
        <div class="lg:col-span-2 flex flex-col gap-6">
            <flux:card>
                <flux:heading size="lg" class="mb-4">Informasi Pasien</flux:heading>
                <dl class="grid grid-cols-2 gap-4 sm:grid-cols-3">
                    <div>
                        <flux:text class="text-xs uppercase tracking-wide text-zinc-500 dark:text-zinc-400">Umur</flux:text>
                        <flux:text class="mt-1 font-medium">{{ $pasien->umur }} tahun</flux:text>
                    </div>
                    <div>
                        <flux:text class="text-xs uppercase tracking-wide text-zinc-500 dark:text-zinc-400">Jenis Kelamin</flux:text>
                        <flux:text class="mt-1 font-medium">{{ $pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</flux:text>
                    </div>
                    <div>
                        <flux:text class="text-xs uppercase tracking-wide text-zinc-500 dark:text-zinc-400">Ruang Rawat</flux:text>
                        <flux:text class="mt-1 font-medium">{{ $pasien->ruang_rawat ?? '-' }}</flux:text>
                    </div>
                    <div>
                        <flux:text class="text-xs uppercase tracking-wide text-zinc-500 dark:text-zinc-400">Tanggal Masuk</flux:text>
                        <flux:text class="mt-1 font-medium">{{ $pasien->tanggal_masuk->translatedFormat('d F Y') }}</flux:text>
                    </div>
                    <div>
                        <flux:text class="text-xs uppercase tracking-wide text-zinc-500 dark:text-zinc-400">Dibuat</flux:text>
                        <flux:text class="mt-1 font-medium">{{ $pasien->created_at->diffForHumans() }}</flux:text>
                    </div>
                </dl>
            </flux:card>

            {{-- Langkah Askep --}}
            <flux:card>
                <flux:heading size="lg" class="mb-4">Progress Asuhan Keperawatan</flux:heading>
                <div class="flex flex-col gap-3">
                    @php
                        $steps = [
                            ['label' => 'Pengkajian', 'route' => 'pasien.pengkajian', 'done' => $pasien->pengkajian()->exists()],
                            ['label' => 'Diagnosa SDKI', 'route' => 'pasien.diagnosa', 'done' => $pasien->diagnosaPasien()->exists()],
                            ['label' => 'Luaran SLKI', 'route' => 'pasien.luaran', 'done' => $pasien->luaranPasien()->exists()],
                            ['label' => 'Intervensi SIKI', 'route' => 'pasien.intervensi', 'done' => $pasien->intervensiPasien()->exists()],
                        ];
                    @endphp
                    @foreach ($steps as $i => $step)
                        <div class="flex items-center gap-3">
                            @if ($step['done'])
                                <div class="flex size-7 shrink-0 items-center justify-center rounded-full bg-green-100 dark:bg-green-900/40">
                                    <flux:icon.check class="size-4 text-green-600 dark:text-green-400" />
                                </div>
                            @else
                                <div class="flex size-7 shrink-0 items-center justify-center rounded-full bg-zinc-100 dark:bg-zinc-800">
                                    <span class="text-xs font-semibold text-zinc-500">{{ $i + 1 }}</span>
                                </div>
                            @endif
                            <flux:text class="{{ $step['done'] ? 'font-medium' : 'text-zinc-500 dark:text-zinc-400' }}">
                                {{ $step['label'] }}
                            </flux:text>
                            @if ($step['done'])
                                <flux:badge color="green" size="sm" class="ml-auto">Selesai</flux:badge>
                            @else
                                <flux:badge color="zinc" size="sm" class="ml-auto">Belum</flux:badge>
                            @endif
                        </div>
                    @endforeach
                </div>
            </flux:card>
        </div>

        {{-- Sidebar: Aksi + Riwayat --}}
        <div class="flex flex-col gap-6">
            {{-- Aksi --}}
            <flux:card>
                <flux:heading size="lg" class="mb-4">Aksi</flux:heading>
                <div class="flex flex-col gap-2">
                    @if ($pasien->isDraft())
                        <flux:button
                            :href="$pasien->nextAskepStep()"
                            variant="primary"
                            icon-trailing="arrow-right"
                            class="w-full justify-center"
                            wire:navigate
                        >
                            Lanjutkan Askep
                        </flux:button>
                    @else
                        <flux:button
                            :href="route('pasien.askep', $pasien)"
                            variant="primary"
                            icon="document-text"
                            class="w-full justify-center"
                            wire:navigate
                        >
                            Lihat Hasil Lengkap
                        </flux:button>
                    @endif
                    <flux:button
                        :href="route('pasien.edit', $pasien)"
                        variant="ghost"
                        icon="pencil"
                        class="w-full justify-center"
                        wire:navigate
                    >
                        Edit Data Pasien
                    </flux:button>
                </div>
            </flux:card>

            {{-- Riwayat Aktivitas --}}
            <flux:card>
                <flux:heading size="lg" class="mb-4">Riwayat Aktivitas</flux:heading>
                @if ($pasien->riwayat->isEmpty())
                    <flux:text class="text-sm text-zinc-500">Belum ada riwayat.</flux:text>
                @else
                    <ol class="relative border-s border-zinc-200 dark:border-zinc-700">
                        @foreach ($pasien->riwayat as $log)
                            <li class="mb-6 ms-4 last:mb-0">
                                <div class="absolute -start-1.5 mt-1 size-3 rounded-full border border-white bg-zinc-300 dark:border-zinc-900 dark:bg-zinc-600"></div>
                                <flux:text class="text-sm font-medium">{{ $log->aktivitas }}</flux:text>
                                <flux:text class="text-xs text-zinc-500 dark:text-zinc-400">
                                    {{ $log->created_at->diffForHumans() }}
                                </flux:text>
                            </li>
                        @endforeach
                    </ol>
                @endif
            </flux:card>
        </div>
    </div>
</div>
