<?php

use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Hasil Askep')] class extends Component
{
    public Pasien $pasien;

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien->load([
            'pengkajian',
            'diagnosaPasien.diagnosa',
            'diagnosaPasien.luaranPasien.luaran',
            'diagnosaPasien.luaranPasien.intervensiPasien.intervensi',
        ]);
    }
};
?>

<div class="p-2 md:p-4">
    <div class="mb-6">
        <flux:button :href="route('mahasiswa.pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Detail Pasien
        </flux:button>
        <div class="flex items-start justify-between">
            <div>
                <flux:heading size="xl" level="1">Asuhan Keperawatan</flux:heading>
                <flux:text class="mt-1">{{ $pasien->nama_pasien }} &bull; No. RM: {{ $pasien->no_rm }}</flux:text>
            </div>
            <flux:badge color="{{ $pasien->isSelesai() ? 'green' : 'yellow' }}" size="lg">
                {{ $pasien->isSelesai() ? 'Selesai' : 'Draft' }}
            </flux:badge>
        </div>
    </div>

    {{-- Info Pasien --}}
    <flux:card class="mb-6">
        <flux:heading size="md" class="mb-3">Data Pasien</flux:heading>
        <dl class="grid grid-cols-2 gap-3 sm:grid-cols-4 text-sm">
            <div><flux:text class="text-xs text-zinc-500">Umur</flux:text><p class="font-medium">{{ $pasien->umur }} tahun</p></div>
            <div><flux:text class="text-xs text-zinc-500">Jenis Kelamin</flux:text><p class="font-medium">{{ $pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</p></div>
            <div><flux:text class="text-xs text-zinc-500">Ruang Rawat</flux:text><p class="font-medium">{{ $pasien->ruang_rawat ?? '-' }}</p></div>
            <div><flux:text class="text-xs text-zinc-500">Tanggal Masuk</flux:text><p class="font-medium">{{ $pasien->tanggal_masuk->translatedFormat('d F Y') }}</p></div>
        </dl>
    </flux:card>

    {{-- LANGKAH 1: Pengkajian --}}
    <flux:card class="mb-6">
        <div class="flex items-center justify-between mb-4">
            <flux:heading size="lg" level="2">1. Pengkajian</flux:heading>
            <flux:button :href="route('mahasiswa.pasien.pengkajian', $pasien)" variant="ghost" icon="pencil" size="sm" wire:navigate>
                Edit
            </flux:button>
        </div>

        @if ($pasien->pengkajian->isEmpty())
            <flux:text class="text-zinc-500">Belum ada data pengkajian.</flux:text>
        @else
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead>
                        <tr class="border-b border-zinc-200 dark:border-zinc-700 text-left text-xs text-zinc-500 uppercase">
                            <th class="pb-2 font-medium">Pola Kesehatan</th>
                            <th class="pb-2 font-medium">Observasi</th>
                            <th class="pb-2 font-medium text-center">Tipe</th>
                            <th class="pb-2 font-medium text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-zinc-100 dark:divide-zinc-800">
                        @foreach ($pasien->pengkajian as $pk)
                            <tr class="{{ $pk->is_abnormal ? 'bg-red-50 dark:bg-red-950/20' : '' }}">
                                <td class="py-2 font-medium">
                                    {{ App\Models\Pengkajian::labelPola()[$pk->pola_kesehatan] ?? $pk->pola_kesehatan }}
                                </td>
                                <td class="py-2 text-zinc-600 dark:text-zinc-400">
                                    {{ $pk->observasi ?? '-' }}
                                </td>
                                <td class="py-2 text-center">
                                    <flux:badge size="sm" color="zinc">{{ $pk->tipe_data }}</flux:badge>
                                </td>
                                <td class="py-2 text-center">
                                    @if ($pk->is_abnormal)
                                        <flux:badge size="sm" color="red">Abnormal</flux:badge>
                                    @else
                                        <flux:badge size="sm" color="green">Normal</flux:badge>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @endif
    </flux:card>

    {{-- LANGKAH 2-4: Diagnosa → Luaran → Intervensi --}}
    @if ($pasien->diagnosaPasien->isEmpty())
        <flux:card class="mb-6">
            <flux:heading size="lg" level="2" class="mb-2">2–4. Diagnosa, Luaran & Intervensi</flux:heading>
            <flux:text class="text-zinc-500">Belum ada diagnosa yang ditegakkan.</flux:text>
        </flux:card>
    @else
        @foreach ($pasien->diagnosaPasien as $dp)
            <flux:card class="mb-4" wire:key="dp-show-{{ $dp->id }}">
                {{-- Diagnosa --}}
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <div class="flex items-center gap-2 mb-1">
                            <flux:badge color="blue">{{ $dp->diagnosa->kode_diagnosa }}</flux:badge>
                            <flux:heading size="md" level="3">{{ $dp->diagnosa->label_diagnosa }}</flux:heading>
                        </div>
                        @if ($dp->data_subjektif || $dp->data_objektif)
                            <div class="mt-2 grid grid-cols-1 sm:grid-cols-2 gap-2 text-sm">
                                @if ($dp->data_subjektif)
                                    <div>
                                        <span class="font-medium text-zinc-500">DS: </span>
                                        <span>{{ $dp->data_subjektif }}</span>
                                    </div>
                                @endif
                                @if ($dp->data_objektif)
                                    <div>
                                        <span class="font-medium text-zinc-500">DO: </span>
                                        <span>{{ $dp->data_objektif }}</span>
                                    </div>
                                @endif
                            </div>
                        @endif
                    </div>
                    <flux:button :href="route('mahasiswa.pasien.diagnosa', $pasien)" variant="ghost" icon="pencil" size="sm" wire:navigate>
                        Edit
                    </flux:button>
                </div>

                {{-- Luaran per Diagnosa --}}
                @foreach ($dp->luaranPasien as $lp)
                    <div class="ml-4 mb-4 last:mb-0 pl-4 border-l-2 border-violet-300 dark:border-violet-700" wire:key="lp-show-{{ $lp->id }}">
                        <div class="flex items-center gap-2 mb-2">
                            <flux:icon.arrow-right class="size-4 text-violet-500" />
                            <flux:badge color="violet" size="sm">{{ $lp->luaran->kode_luaran }}</flux:badge>
                            <span class="font-medium text-sm">{{ $lp->luaran->label_luaran }}</span>
                        </div>

                        {{-- Intervensi per Luaran --}}
                        @if ($lp->intervensiPasien->isNotEmpty())
                            <div class="ml-6 flex flex-col gap-1">
                                @foreach ($lp->intervensiPasien as $ip)
                                    <div class="flex items-center gap-2 text-sm" wire:key="ip-show-{{ $ip->id }}">
                                        <flux:icon.arrow-right class="size-3 text-green-500 shrink-0" />
                                        <flux:badge color="green" size="sm">{{ $ip->intervensi->kode_intervensi }}</flux:badge>
                                        <span>{{ $ip->intervensi->label_intervensi }}</span>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div>
                @endforeach
            </flux:card>
        @endforeach
    @endif

    {{-- Aksi Footer --}}
    <div class="flex items-center gap-3 mt-6">
        @if ($pasien->isDraft())
            <flux:button :href="$pasien->nextAskepStep()" variant="primary" icon-trailing="arrow-right" wire:navigate>
                Lanjutkan Askep
            </flux:button>
        @endif
        <flux:button :href="route('mahasiswa.pasien.index')" variant="ghost" wire:navigate>
            Kembali ke Daftar Pasien
        </flux:button>
    </div>
</div>
