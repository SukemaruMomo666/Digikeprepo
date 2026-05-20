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
    <flux:heading size="xl" level="1">Dashboard Admin</flux:heading>
    <flux:text class="mt-1 mb-6">Kelola sistem DIGIKEP — Politeknik Negeri Subang.</flux:text>

    {{-- Stat Cards --}}
    <div class="grid grid-cols-2 gap-4 sm:grid-cols-4 mb-8">
        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-blue-100 dark:bg-blue-900/40">
                <flux:icon.academic-cap class="size-5 text-blue-600 dark:text-blue-400" />
            </div>
            <div>
                <flux:text class="text-sm">Mahasiswa</flux:text>
                <flux:heading size="xl">{{ $totalMahasiswa }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-violet-100 dark:bg-violet-900/40">
                <flux:icon.users class="size-5 text-violet-600 dark:text-violet-400" />
            </div>
            <div>
                <flux:text class="text-sm">Total Pasien</flux:text>
                <flux:heading size="xl">{{ $totalPasien }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-amber-100 dark:bg-amber-900/40">
                <flux:icon.book-open class="size-5 text-amber-600 dark:text-amber-400" />
            </div>
            <div>
                <flux:text class="text-sm">Diagnosa SDKI</flux:text>
                <flux:heading size="xl">{{ $totalDiagnosaMaster }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-green-100 dark:bg-green-900/40">
                <flux:icon.check-badge class="size-5 text-green-600 dark:text-green-400" />
            </div>
            <div>
                <flux:text class="text-sm">Askep Selesai</flux:text>
                <flux:heading size="xl">{{ $askepSelesai }}</flux:heading>
            </div>
        </flux:card>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Pasien Terbaru --}}
        <div class="lg:col-span-2">
            <flux:card>
                <flux:heading size="lg" class="mb-4">Pasien Terbaru</flux:heading>

                @if ($pasienTerakhir->isEmpty())
                    <flux:text class="py-8 text-center text-zinc-500">Belum ada data pasien.</flux:text>
                @else
                    <flux:table>
                        <flux:table.columns>
                            <flux:table.column>Nama Pasien</flux:table.column>
                            <flux:table.column>Mahasiswa (NIM)</flux:table.column>
                            <flux:table.column>Status</flux:table.column>
                        </flux:table.columns>
                        <flux:table.rows>
                            @foreach ($pasienTerakhir as $pasien)
                                <flux:table.row :key="$pasien->id">
                                    <flux:table.cell class="font-medium">{{ $pasien->nama_pasien }}</flux:table.cell>
                                    <flux:table.cell class="text-sm text-zinc-500">
                                        {{ $pasien->mahasiswa->name }}
                                        <span class="font-mono">({{ $pasien->mahasiswa->nim_nip }})</span>
                                    </flux:table.cell>
                                    <flux:table.cell>
                                        @if ($pasien->isSelesai())
                                            <flux:badge color="green" size="sm">Selesai</flux:badge>
                                        @else
                                            <flux:badge color="yellow" size="sm">Draft</flux:badge>
                                        @endif
                                    </flux:table.cell>
                                </flux:table.row>
                            @endforeach
                        </flux:table.rows>
                    </flux:table>
                @endif
            </flux:card>
        </div>

        {{-- Menu Cepat --}}
        <div>
            <flux:card>
                <flux:heading size="lg" class="mb-4">Menu Cepat</flux:heading>
                <flux:navlist>
                    <flux:navlist.item
                        icon="users"
                        :href="route('admin.users.index')"
                        wire:navigate
                    >
                        Kelola Mahasiswa
                    </flux:navlist.item>
                    <flux:navlist.item
                        icon="book-open"
                        :href="route('admin.sdki.index')"
                        wire:navigate
                    >
                        Data Master SDKI
                    </flux:navlist.item>
                    <flux:navlist.item
                        icon="clipboard-document-check"
                        :href="route('admin.slki.index')"
                        wire:navigate
                    >
                        Data Master SLKI
                    </flux:navlist.item>
                    <flux:navlist.item
                        icon="clipboard-document-list"
                        :href="route('admin.siki.index')"
                        wire:navigate
                    >
                        Data Master SIKI
                    </flux:navlist.item>
                    <flux:navlist.item
                        icon="arrows-right-left"
                        :href="route('admin.relasi.index')"
                        wire:navigate
                    >
                        Mapping Relasi
                    </flux:navlist.item>
                    <flux:navlist.item
                        icon="clock"
                        :href="route('admin.log.index')"
                        wire:navigate
                    >
                        Log Aktivitas
                    </flux:navlist.item>
                </flux:navlist>
            </flux:card>
        </div>
    </div>
</div>
