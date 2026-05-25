<?php

use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Dashboard')] class extends Component
{
    public function mount(): void
    {
        // Paksa ganti password jika masih first login
        if (auth()->user()->is_first_login) {
            $this->redirectRoute('password.change', navigate: true);
        }
    }

    public function with(): array
    {
        $userId = auth()->id();

        return [
            'jumlahPasien'   => Pasien::where('user_id', $userId)->count(),
            'totalDiagnosa'  => \App\Models\DiagnosaPasien::whereHas('pasien', fn ($q) => $q->where('user_id', $userId))->count(),
            'askepSelesai'   => Pasien::where('user_id', $userId)->where('status_askep', 'selesai')->count(),
            'pasienTerakhir' => Pasien::where('user_id', $userId)->latest()->limit(5)->get(),
        ];
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Page Header --}}
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-white">
            Selamat Datang, <span class="text-polsub">{{ auth()->user()->name }}</span>
        </h1>
        <p class="mt-1 text-sm text-gray-500 dark:text-zinc-400">Berikut adalah ringkasan asuhan keperawatan Anda hari ini.</p>
    </div>

    {{-- Stat Cards --}}
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-3 md:gap-6 mb-6">
        {{-- Total Pasien — Orange (Polsub) --}}
        <div class="relative overflow-hidden rounded-2xl bg-gradient-polsub p-6 shadow-polsub">
            <div class="relative z-10">
                <flux:icon.users class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Total Pasien</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $jumlahPasien }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.15]">
                <flux:icon.users class="size-32 text-white" />
            </div>
        </div>

        {{-- Total Diagnosa — Emerald --}}
        <div class="relative overflow-hidden rounded-2xl bg-gradient-to-br from-emerald-400 to-teal-500 p-6 shadow-lg">
            <div class="relative z-10">
                <flux:icon.clipboard-document-list class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Diagnosa</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $totalDiagnosa }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.15]">
                <flux:icon.clipboard-document-list class="size-32 text-white" />
            </div>
        </div>

        {{-- Askep Selesai — Blue --}}
        <div class="relative overflow-hidden rounded-2xl bg-gradient-to-br from-blue-400 to-blue-600 p-6 shadow-lg">
            <div class="relative z-10">
                <flux:icon.check-badge class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Selesai</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $askepSelesai }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.15]">
                <flux:icon.check-badge class="size-32 text-white" />
            </div>
        </div>
    </div>

    {{-- Pasien Terakhir --}}
    <div class="rounded-2xl border border-gray-200 bg-white dark:border-zinc-700 dark:bg-zinc-800">
        {{-- Card Header --}}
        <div class="flex items-center justify-between border-b border-gray-100 px-6 py-4 dark:border-zinc-700">
            <div class="flex items-center gap-2">
                <flux:icon.clipboard-document-list class="size-5 text-gray-400" />
                <h3 class="text-base font-semibold text-gray-800 dark:text-white">Pasien Terakhir</h3>
            </div>
            <a
                href="{{ route('pasien.index') }}"
                wire:navigate
                class="text-sm font-medium text-polsub hover:underline"
            >
                Lihat Semua
            </a>
        </div>

        @if ($pasienTerakhir->isEmpty())
            <div class="py-14 text-center">
                <flux:icon.user-plus class="mx-auto mb-3 size-12 text-gray-200" />
                <p class="text-sm text-gray-500">Belum ada data pasien.</p>
                <div class="mt-4">
                    <a
                        href="{{ route('pasien.create') }}"
                        wire:navigate
                        class="inline-flex items-center gap-2 rounded-xl bg-gradient-polsub px-4 py-2 text-sm font-semibold text-white shadow-polsub"
                    >
                        <flux:icon.plus class="size-4" />
                        Tambah Pasien Pertama
                    </a>
                </div>
            </div>
        @else
            <div class="overflow-x-auto">
                <table class="min-w-full">
                    <thead>
                        <tr class="border-b border-gray-100 dark:border-zinc-700">
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-zinc-400">Nama Pasien</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-zinc-400">Umur</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-zinc-400">No. Rekam Medis</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-zinc-400">Status</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-gray-500 dark:text-zinc-400">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100 dark:divide-zinc-700">
                        @foreach ($pasienTerakhir as $pasien)
                            @php
                                $words = explode(' ', trim($pasien->nama_pasien));
                                $initials = strtoupper(
                                    substr($words[0], 0, 1) . (isset($words[1]) ? substr($words[1], 0, 1) : '')
                                );
                                $palette = ['bg-orange-400','bg-emerald-400','bg-blue-500','bg-violet-500','bg-rose-400','bg-amber-400','bg-teal-500'];
                                $avatarBg = $palette[ord($pasien->nama_pasien[0]) % count($palette)];
                            @endphp
                            <tr class="transition-colors hover:bg-gray-50 dark:hover:bg-zinc-700/50">
                                <td class="px-6 py-3.5">
                                    <div class="flex items-center gap-3">
                                        <div class="flex size-8 shrink-0 items-center justify-center rounded-full {{ $avatarBg }} text-xs font-bold text-white">
                                            {{ $initials }}
                                        </div>
                                        <span class="text-sm font-medium text-gray-800 dark:text-white">{{ $pasien->nama_pasien }}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-3.5 text-sm text-gray-500 dark:text-zinc-400">{{ $pasien->umur }} tahun</td>
                                <td class="px-6 py-3.5 font-mono text-sm text-gray-500 dark:text-zinc-400">{{ $pasien->no_rm }}</td>
                                <td class="px-6 py-3.5">
                                    @if ($pasien->isSelesai())
                                        <span class="inline-flex items-center rounded-full border border-emerald-400 bg-emerald-50 px-2.5 py-0.5 text-xs font-semibold uppercase tracking-wide text-emerald-600">
                                            Selesai
                                        </span>
                                    @else
                                        <span class="inline-flex items-center rounded-full border border-amber-400 bg-amber-50 px-2.5 py-0.5 text-xs font-semibold uppercase tracking-wide text-amber-600">
                                            Draft
                                        </span>
                                    @endif
                                </td>
                                <td class="px-6 py-3.5">
                                    <a
                                        href="{{ $pasien->isDraft() ? $pasien->nextAskepStep() : route('pasien.show', $pasien) }}"
                                        wire:navigate
                                        class="text-gray-400 transition-colors hover:text-polsub"
                                        title="{{ $pasien->isDraft() ? 'Lanjutkan Askep' : 'Lihat Detail' }}"
                                    >
                                        <flux:icon.eye class="size-5" />
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="border-t border-gray-100 px-6 py-3 dark:border-zinc-700">
                <p class="text-xs text-gray-400">
                    Menampilkan {{ $pasienTerakhir->count() }} dari total {{ $jumlahPasien }} pasien aktif
                </p>
            </div>
        @endif
    </div>

    {{-- FAB Tambah Pasien (mobile only) --}}
    <div class="fixed bottom-6 right-6 z-30 lg:hidden">
        <a
            href="{{ route('pasien.create') }}"
            wire:navigate
            class="flex items-center gap-2 rounded-full bg-gradient-polsub px-5 py-3 text-sm font-semibold text-white shadow-polsub-lg"
        >
            <flux:icon.plus class="size-4" />
            Tambah Pasien
        </a>
    </div>
</div>
