<?php

use App\Models\Askep;
use App\Models\Penugasan;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.dosen')] #[Title('Dashboard Dosen')] class extends Component
{
    public function with(): array
    {
        $dosenId = auth()->id();

        // Ambil ID mahasiswa yang dibimbing
        $mahasiswaIds = Penugasan::where('dosen_id', $dosenId)->pluck('mahasiswa_id');

        return [
            'stats' => [
                'total_mahasiswa' => $mahasiswaIds->count(),
                'pending_review' => Askep::whereIn('user_id', $mahasiswaIds)
                    ->where('status', Askep::STATUS_MENUNGGU_REVIEW)
                    ->count(),
                'total_askep' => Askep::whereIn('user_id', $mahasiswaIds)->count(),
                'disetujui' => Askep::whereIn('user_id', $mahasiswaIds)
                    ->where('status', Askep::STATUS_DISETUJUI)
                    ->count(),
            ],
            'pendingAskep' => Askep::query()
                ->whereIn('user_id', $mahasiswaIds)
                ->where('status', Askep::STATUS_MENUNGGU_REVIEW)
                ->with(['pasien', 'user'])
                ->latest('submitted_at')
                ->take(5)
                ->get(),
        ];
    }
};
?>

<div>
    <div class="mb-8">
        <flux:heading size="xl" level="1">Selamat Datang, {{ auth()->user()->name }}</flux:heading>
        <flux:text class="mt-1 text-zinc-500">Berikut adalah ringkasan bimbingan asuhan keperawatan mahasiswa Anda.</flux:text>
    </div>

    {{-- Stats Grid --}}
    <div class="grid grid-cols-1 gap-4 mb-8 sm:grid-cols-2 lg:grid-cols-4">
        <flux:card class="flex items-center gap-4">
            <div class="flex size-12 items-center justify-center rounded-xl bg-blue-50 text-blue-600 dark:bg-blue-900/20">
                <flux:icon.users class="size-6" />
            </div>
            <div>
                <flux:text size="sm" class="text-zinc-500">Total Mahasiswa</flux:text>
                <flux:heading size="xl" class="font-bold">{{ $stats['total_mahasiswa'] }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4">
            <div class="flex size-12 items-center justify-center rounded-xl bg-amber-50 text-amber-600 dark:bg-amber-900/20">
                <flux:icon.clock class="size-6" />
            </div>
            <div>
                <flux:text size="sm" class="text-zinc-500">Menunggu Review</flux:text>
                <flux:heading size="xl" class="font-bold text-amber-600">{{ $stats['pending_review'] }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4">
            <div class="flex size-12 items-center justify-center rounded-xl bg-purple-50 text-purple-600 dark:bg-purple-900/20">
                <flux:icon.clipboard-document-list class="size-6" />
            </div>
            <div>
                <flux:text size="sm" class="text-zinc-500">Total Askep</flux:text>
                <flux:heading size="xl" class="font-bold">{{ $stats['total_askep'] }}</flux:heading>
            </div>
        </flux:card>

        <flux:card class="flex items-center gap-4">
            <div class="flex size-12 items-center justify-center rounded-xl bg-green-50 text-green-600 dark:bg-green-900/20">
                <flux:icon.check-circle class="size-6" />
            </div>
            <div>
                <flux:text size="sm" class="text-zinc-500">Askep Disetujui</flux:text>
                <flux:heading size="xl" class="font-bold text-green-600">{{ $stats['disetujui'] }}</flux:heading>
            </div>
        </flux:card>
    </div>

    <div class="grid grid-cols-1 gap-8 lg:grid-cols-3">
        {{-- Pending Reviews --}}
        <div class="lg:col-span-2">
            <div class="flex items-center justify-between mb-4">
                <flux:heading size="lg">Review Terbaru</flux:heading>
                <flux:button :href="route('dosen.askep.index')" variant="ghost" size="sm" wire:navigate>Lihat Semua</flux:button>
            </div>

            <flux:card class="p-0 overflow-hidden">
                @if ($pendingAskep->isEmpty())
                    <div class="py-12 text-center">
                        <flux:icon.check-badge class="mx-auto mb-3 size-10 text-green-500/50" />
                        <flux:text>Tidak ada askep yang menunggu review saat ini.</flux:text>
                    </div>
                @else
                    <flux:table>
                        <flux:table.columns>
                            <flux:table.column>Mahasiswa</flux:table.column>
                            <flux:table.column>Pasien</flux:table.column>
                            <flux:table.column>Tgl. Submit</flux:table.column>
                            <flux:table.column></flux:table.column>
                        </flux:table.columns>
                        <flux:table.rows>
                            @foreach ($pendingAskep as $askep)
                                <flux:table.row :key="$askep->id">
                                    <flux:table.cell>
                                        <div class="font-medium">{{ $askep->user->name }}</div>
                                        <div class="text-xs text-zinc-500">NIM: {{ $askep->user->nim_nip }}</div>
                                    </flux:table.cell>
                                    <flux:table.cell>
                                        <div class="font-medium text-zinc-700">{{ $askep->pasien->nama_pasien }}</div>
                                        <div class="text-xs text-zinc-500">RM: {{ $askep->pasien->no_rm }}</div>
                                    </flux:table.cell>
                                    <flux:table.cell>
                                        <div class="text-sm">{{ $askep->submitted_at?->format('d/m/Y H:i') ?? '-' }}</div>
                                    </flux:table.cell>
                                    <flux:table.cell>
                                        <flux:button :href="route('dosen.askep.review', $askep)" size="sm" variant="primary" wire:navigate>
                                            Review
                                        </flux:button>
                                    </flux:table.cell>
                                </flux:table.row>
                            @endforeach
                        </flux:table.rows>
                    </flux:table>
                @endif
            </flux:card>
        </div>

        {{-- Quick Links / Information --}}
        <div>
            <flux:heading size="lg" class="mb-4">Informasi</flux:heading>
            <flux:card class="space-y-4">
                <div class="flex gap-3">
                    <flux:icon.information-circle class="size-5 text-blue-500 shrink-0" />
                    <flux:text size="sm">
                        Mahasiswa akan muncul di dashboard Anda setelah Anda ditugaskan sebagai pembimbing mereka oleh Admin.
                    </flux:text>
                </div>
                <div class="flex gap-3">
                    <flux:icon.light-bulb class="size-5 text-amber-500 shrink-0" />
                    <flux:text size="sm">
                        Gunakan fitur <strong>Review Askep</strong> untuk memberikan masukan mendetail per langkah atau persetujuan akhir.
                    </flux:text>
                </div>
                <div class="pt-2 border-t border-zinc-100">
                    <flux:button variant="ghost" class="w-full justify-start" icon="book-open">
                        Panduan Pembimbing
                    </flux:button>
                </div>
            </flux:card>
        </div>
    </div>
</div>
