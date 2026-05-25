<?php

use App\Models\DiagnosaSdki;
use App\Models\Pasien;
use App\Models\User;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.admin')] #[Title('Dashboard Admin')] class extends Component
{
    public function with(): array
    {
        return [
            'totalMahasiswa'      => User::where('role', 'mahasiswa')->count(),
            'totalPasien'         => Pasien::count(),
            'totalDiagnosaMaster' => DiagnosaSdki::count(),
            'askepSelesai'        => Pasien::where('status_askep', 'selesai')->count(),
            'pasienTerakhir'      => Pasien::with('mahasiswa')->latest()->limit(8)->get(),
        ];
    }
};
?>

<div>
    {{-- Page Header --}}
    <div class="mb-6">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-white/90">Dashboard Admin</h1>
        <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Kelola sistem DIGIKEP — Politeknik Negeri Subang.</p>
    </div>

    {{-- Stat Cards --}}
    <div class="grid grid-cols-2 gap-4 md:grid-cols-4 md:gap-6 mb-6">
        <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03] md:p-6">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-polsub shadow-polsub">
                <flux:icon.academic-cap class="size-6 text-white" />
            </div>
            <div class="mt-5">
                <span class="text-sm text-gray-500 dark:text-gray-400">Mahasiswa</span>
                <h4 class="mt-2 text-3xl font-bold text-gray-800 dark:text-white/90">{{ $totalMahasiswa }}</h4>
            </div>
        </div>

        <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03] md:p-6">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-violet-100 dark:bg-violet-900/40">
                <flux:icon.users class="size-6 text-violet-600 dark:text-violet-400" />
            </div>
            <div class="mt-5">
                <span class="text-sm text-gray-500 dark:text-gray-400">Total Pasien</span>
                <h4 class="mt-2 text-3xl font-bold text-gray-800 dark:text-white/90">{{ $totalPasien }}</h4>
            </div>
        </div>

        <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03] md:p-6">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-amber-100 dark:bg-amber-900/40">
                <flux:icon.book-open class="size-6 text-amber-600 dark:text-amber-400" />
            </div>
            <div class="mt-5">
                <span class="text-sm text-gray-500 dark:text-gray-400">Diagnosa SDKI</span>
                <h4 class="mt-2 text-3xl font-bold text-gray-800 dark:text-white/90">{{ $totalDiagnosaMaster }}</h4>
            </div>
        </div>

        <div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-white/[0.03] md:p-6">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-emerald-100 dark:bg-emerald-900/40">
                <flux:icon.check-badge class="size-6 text-emerald-600 dark:text-emerald-400" />
            </div>
            <div class="mt-5">
                <span class="text-sm text-gray-500 dark:text-gray-400">Askep Selesai</span>
                <h4 class="mt-2 text-3xl font-bold text-gray-800 dark:text-white/90">{{ $askepSelesai }}</h4>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 gap-6 xl:grid-cols-12">
        {{-- Pasien Terbaru --}}
        <div class="xl:col-span-8">
            <div class="rounded-2xl border border-gray-200 bg-white px-4 pb-3 pt-4 dark:border-gray-800 dark:bg-white/[0.03] sm:px-6">
                <div class="flex flex-col gap-2 mb-4 sm:flex-row sm:items-center sm:justify-between">
                    <h3 class="text-lg font-semibold text-gray-800 dark:text-white/90">Pasien Terbaru</h3>
                    <flux:button :href="route('admin.data-mahasiswa.index')" variant="ghost" size="sm" wire:navigate>
                        Lihat Semua →
                    </flux:button>
                </div>

                @if ($pasienTerakhir->isEmpty())
                    <p class="py-8 text-center text-sm text-gray-500">Belum ada data pasien.</p>
                @else
                    <div class="overflow-x-auto">
                        <table class="min-w-full">
                            <thead>
                                <tr class="border-y border-gray-100 dark:border-gray-800">
                                    <th class="py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">Nama Pasien</th>
                                    <th class="py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">Mahasiswa</th>
                                    <th class="py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                                @foreach ($pasienTerakhir as $pasien)
                                    <tr>
                                        <td class="py-3 text-sm font-medium text-gray-800 dark:text-white/90">{{ $pasien->nama_pasien }}</td>
                                        <td class="py-3">
                                            <p class="text-sm text-gray-700 dark:text-white/90">{{ $pasien->mahasiswa->name }}</p>
                                            <p class="text-xs font-mono text-gray-400">{{ $pasien->mahasiswa->nim_nip }}</p>
                                        </td>
                                        <td class="py-3">
                                            @if ($pasien->isSelesai())
                                                <span class="rounded-full bg-emerald-50 px-2.5 py-0.5 text-xs font-medium text-emerald-600 dark:bg-emerald-500/15 dark:text-emerald-400">Selesai</span>
                                            @else
                                                <span class="rounded-full bg-amber-50 px-2.5 py-0.5 text-xs font-medium text-amber-600 dark:bg-amber-500/15 dark:text-amber-400">Draft</span>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>

        {{-- Menu Cepat --}}
        <div class="xl:col-span-4">
            <div class="rounded-2xl border border-gray-200 bg-white px-4 pb-4 pt-4 dark:border-gray-800 dark:bg-white/[0.03] sm:px-6">
                <h3 class="text-lg font-semibold text-gray-800 dark:text-white/90 mb-4">Menu Cepat</h3>
                <div class="space-y-0.5">
                    @foreach ([
                        ['route' => 'admin.users.index',          'icon' => 'academic-cap',           'label' => 'Kelola Mahasiswa'],
                        ['route' => 'admin.sdki.index',           'icon' => 'book-open',              'label' => 'Data Master SDKI'],
                        ['route' => 'admin.slki.index',           'icon' => 'clipboard-document-check', 'label' => 'Data Master SLKI'],
                        ['route' => 'admin.siki.index',           'icon' => 'clipboard-document-list','label' => 'Data Master SIKI'],
                        ['route' => 'admin.relasi.index',         'icon' => 'arrows-right-left',      'label' => 'Mapping Relasi'],
                        ['route' => 'admin.log.index',            'icon' => 'clock',                  'label' => 'Log Aktivitas'],
                        ['route' => 'admin.data-mahasiswa.index', 'icon' => 'eye',                    'label' => 'Data Mahasiswa'],
                    ] as $item)
                        <a
                            href="{{ route($item['route']) }}"
                            wire:navigate
                            class="flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm text-gray-700 hover:bg-orange-50 hover:text-polsub dark:text-gray-300 dark:hover:bg-white/[0.05] transition-colors group"
                        >
                            <flux:icon :name="$item['icon']" class="size-5 text-gray-400 group-hover:text-polsub dark:text-gray-500 transition-colors" />
                            {{ $item['label'] }}
                            <flux:icon.chevron-right class="ml-auto size-4 text-gray-300 group-hover:text-polsub dark:text-gray-600 transition-colors" />
                        </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
