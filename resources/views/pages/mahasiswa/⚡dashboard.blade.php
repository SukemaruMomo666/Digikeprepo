<?php

use App\Models\Askep;
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
            'totalDiagnosa'  => \App\Models\AskepDiagnosa::whereHas(
                'askep',
                fn ($q) => $q->where('user_id', $userId)
            )->count(),
            'askepSelesai'   => Askep::where('user_id', $userId)
                ->where('status', Askep::STATUS_SELESAI)
                ->count(),
            'pasienTerakhir' => Pasien::where('user_id', $userId)->with(['askep' => fn ($q) => $q->latest()->limit(1)])->latest()->limit(5)->get(),
        ];
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Page Header --}}
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-[#1B4F72] dark:text-white">
            Selamat Datang, <span class="text-[#2E86C1]">{{ auth()->user()->name }}</span>
        </h1>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">Berikut adalah ringkasan asuhan keperawatan Anda hari ini.</p>
    </div>

    {{-- Stat Cards --}}
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-3 md:gap-6 mb-6">
        {{-- Total Pasien — Navy Primary --}}
        <div class="relative overflow-hidden rounded-2xl p-6 shadow-primary" style="background: linear-gradient(135deg, #2E86C1, #1B4F72)">
            <div class="relative z-10">
                <flux:icon.users class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Total Pasien</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $jumlahPasien }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.12]">
                <flux:icon.users class="size-32 text-white" />
            </div>
        </div>

        {{-- Total Diagnosa — Teal Health --}}
        <div class="relative overflow-hidden rounded-2xl p-6 shadow-lg" style="background: linear-gradient(135deg, #1A9B72, #0F6E56)">
            <div class="relative z-10">
                <flux:icon.clipboard-document-list class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Diagnosa</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $totalDiagnosa }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.12]">
                <flux:icon.clipboard-document-list class="size-32 text-white" />
            </div>
        </div>

        {{-- Askep Selesai — Deep Navy --}}
        <div class="relative overflow-hidden rounded-2xl p-6 shadow-lg" style="background: linear-gradient(135deg, #1B4F72, #0A2D45)">
            <div class="relative z-10">
                <flux:icon.check-badge class="mb-3 size-8 text-white/90" />
                <p class="text-xs font-semibold uppercase tracking-widest text-white/70">Selesai</p>
                <h4 class="mt-1 text-5xl font-bold text-white">{{ $askepSelesai }}</h4>
            </div>
            <div class="pointer-events-none absolute -right-3 -bottom-3 opacity-[0.12]">
                <flux:icon.check-badge class="size-32 text-white" />
            </div>
        </div>
    </div>

    {{-- Pasien Terakhir --}}
    <div class="rounded-2xl border border-[#E0EBF5] bg-white dark:border-zinc-700 dark:bg-zinc-800" style="box-shadow: 0 1px 4px rgba(27, 79, 114, 0.06)">
        {{-- Card Header --}}
        <div class="flex items-center justify-between border-b border-[#E0EBF5] px-6 py-4 dark:border-zinc-700">
            <div class="flex items-center gap-2">
                <flux:icon.clipboard-document-list class="size-5 text-[#2E86C1]" />
                <h3 class="text-base font-semibold text-[#1B4F72] dark:text-white">Pasien Terakhir</h3>
            </div>
            <a
                href="{{ route('pasien.index') }}"
                wire:navigate
                class="text-sm font-medium text-[#2E86C1] hover:text-[#1B4F72] hover:underline"
            >
                Lihat Semua
            </a>
        </div>

        @if ($pasienTerakhir->isEmpty())
            <div class="py-14 text-center">
                <flux:icon.user-plus class="mx-auto mb-3 size-12 text-[#85B7EB]" />
                <p class="text-sm text-[#7A8FA6]">Belum ada data pasien.</p>
                <div class="mt-4">
                    <a
                        href="{{ route('pasien.create') }}"
                        wire:navigate
                        class="inline-flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white shadow-primary"
                        style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
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
                        <tr class="border-b border-[#E0EBF5] bg-[#F4F8FB] dark:border-zinc-700 dark:bg-zinc-900/50">
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Nama Pasien</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Umur</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">No. Rekam Medis</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Status</th>
                            <th class="px-6 py-3 text-left text-xs font-semibold uppercase tracking-wider text-[#1B4F72] dark:text-zinc-400">Aksi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-[#E0EBF5] dark:divide-zinc-700">
                        @foreach ($pasienTerakhir as $pasien)
                            @php
                                $words    = explode(' ', trim($pasien->nama_pasien));
                                $initials = strtoupper(
                                    substr($words[0], 0, 1) . (isset($words[1]) ? substr($words[1], 0, 1) : '')
                                );
                                $navyPalette = ['bg-[#2E86C1]', 'bg-[#1A9B72]', 'bg-[#1B4F72]', 'bg-[#5DCAA5]', 'bg-[#85B7EB]', 'bg-[#0F6E56]'];
                                $avatarBg    = $navyPalette[ord($pasien->nama_pasien[0]) % count($navyPalette)];
                                $askepAktif  = $pasien->askep->first();
                            @endphp
                            <tr class="transition-colors hover:bg-[#F4F8FB] dark:hover:bg-zinc-700/50">
                                <td class="px-6 py-3.5">
                                    <div class="flex items-center gap-3">
                                        <div class="flex size-8 shrink-0 items-center justify-center rounded-full {{ $avatarBg }} text-xs font-bold text-white">
                                            {{ $initials }}
                                        </div>
                                        <span class="text-sm font-medium text-[#1B4F72] dark:text-white">{{ $pasien->nama_pasien }}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-3.5 text-sm text-[#7A8FA6] dark:text-zinc-400">{{ $pasien->umur }} tahun</td>
                                <td class="px-6 py-3.5 font-mono text-sm text-[#7A8FA6] dark:text-zinc-400">{{ $pasien->no_rm }}</td>
                                <td class="px-6 py-3.5">
                                    @if ($pasien->isSelesai())
                                        <span class="inline-flex items-center rounded-full border border-[#5DCAA5] bg-[#E1F5EE] px-2.5 py-0.5 text-xs font-semibold uppercase tracking-wide text-[#0F6E56]">
                                            Selesai
                                        </span>
                                    @elseif ($askepAktif)
                                        <span class="inline-flex items-center rounded-full border border-[#85B7EB] bg-[#EBF5FB] px-2.5 py-0.5 text-xs font-semibold uppercase tracking-wide text-[#1B4F72]">
                                            {{ $askepAktif->statusLabel() }}
                                        </span>
                                    @else
                                        <span class="inline-flex items-center rounded-full border border-zinc-200 bg-zinc-50 px-2.5 py-0.5 text-xs font-semibold uppercase tracking-wide text-zinc-500">
                                            Belum Ada Askep
                                        </span>
                                    @endif
                                </td>
                                <td class="px-6 py-3.5">
                                    <a
                                        href="{{ route('pasien.show', $pasien) }}"
                                        wire:navigate
                                        class="text-[#85B7EB] transition-colors hover:text-[#2E86C1]"
                                        title="Lihat Detail"
                                    >
                                        <flux:icon.eye class="size-5" />
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="border-t border-[#E0EBF5] px-6 py-3 dark:border-zinc-700">
                <p class="text-xs text-[#7A8FA6]">
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
            class="flex items-center gap-2 rounded-full px-5 py-3 text-sm font-semibold text-white shadow-primary-lg"
            style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
        >
            <flux:icon.plus class="size-4" />
            Tambah Pasien
        </a>
    </div>
</div>
