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

<div>
    <flux:heading size="xl" level="1">Selamat Datang, {{ auth()->user()->name }}</flux:heading>
    <flux:text class="mt-1 mb-6">Kelola data asuhan keperawatan Anda di sini.</flux:text>

    {{-- Stat Cards --}}
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-3 mb-8">
        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-blue-100 dark:bg-blue-900/40">
                <flux:icon.users class="size-5 text-blue-600 dark:text-blue-400" />
            </div>
            <div>
                <flux:text class="text-sm">Jumlah Pasien</flux:text>
                <flux:heading size="xl">{{ $jumlahPasien }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4 p-5">
            <div class="flex size-11 shrink-0 items-center justify-center rounded-full bg-violet-100 dark:bg-violet-900/40">
                <flux:icon.clipboard-document-list class="size-5 text-violet-600 dark:text-violet-400" />
            </div>
            <div>
                <flux:text class="text-sm">Total Diagnosa</flux:text>
                <flux:heading size="xl">{{ $totalDiagnosa }}</flux:heading>
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

    {{-- Pasien Terakhir --}}
    <flux:card>
        <div class="flex items-center justify-between mb-4">
            <flux:heading size="lg">Pasien Terakhir</flux:heading>
            <flux:button :href="route('pasien.create')" icon="plus" size="sm" wire:navigate>
                Tambah Pasien
            </flux:button>
        </div>

        @if ($pasienTerakhir->isEmpty())
            <div class="py-12 text-center">
                <flux:icon.user-plus class="mx-auto mb-3 size-10 text-zinc-400" />
                <flux:text>Belum ada data pasien.</flux:text>
                <div class="mt-4">
                    <flux:button :href="route('pasien.create')" icon="plus" wire:navigate>
                        Tambah Pasien Pertama
                    </flux:button>
                </div>
            </div>
        @else
            <flux:table>
                <flux:table.columns>
                    <flux:table.column>No. RM</flux:table.column>
                    <flux:table.column>Nama Pasien</flux:table.column>
                    <flux:table.column>Umur</flux:table.column>
                    <flux:table.column>Status Askep</flux:table.column>
                    <flux:table.column></flux:table.column>
                </flux:table.columns>
                <flux:table.rows>
                    @foreach ($pasienTerakhir as $pasien)
                        <flux:table.row :key="$pasien->id">
                            <flux:table.cell class="font-mono text-sm">{{ $pasien->no_rm }}</flux:table.cell>
                            <flux:table.cell class="font-medium">{{ $pasien->nama_pasien }}</flux:table.cell>
                            <flux:table.cell>{{ $pasien->umur }} th</flux:table.cell>
                            <flux:table.cell>
                                @if ($pasien->isSelesai())
                                    <flux:badge color="green" size="sm">Selesai</flux:badge>
                                @else
                                    <flux:badge color="yellow" size="sm">Draft</flux:badge>
                                @endif
                            </flux:table.cell>
                            <flux:table.cell>
                                <flux:button
                                    :href="$pasien->isDraft() ? $pasien->nextAskepStep() : route('pasien.show', $pasien)"
                                    size="sm"
                                    variant="ghost"
                                    icon-trailing="arrow-right"
                                    wire:navigate
                                >
                                    {{ $pasien->isDraft() ? 'Lanjutkan' : 'Lihat' }}
                                </flux:button>
                            </flux:table.cell>
                        </flux:table.row>
                    @endforeach
                </flux:table.rows>
            </flux:table>

            @if ($jumlahPasien > 5)
                <div class="mt-4 text-center">
                    <flux:button :href="route('pasien.index')" variant="ghost" size="sm" wire:navigate>
                        Lihat Semua {{ $jumlahPasien }} Pasien →
                    </flux:button>
                </div>
            @endif
        @endif
    </flux:card>
</div>
