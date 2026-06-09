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
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien->load(['riwayat', 'askep']);
    }
};
?>

<div class="p-4 md:p-6">
    <div class="mb-6">
        <flux:button :href="route('mahasiswa.pasien.index')" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Daftar Pasien
        </flux:button>
        <div class="flex items-start justify-between">
            <div>
                <h1 class="text-2xl font-bold text-[#1B4F72]">{{ $pasien->nama_pasien }}</h1>
                <p class="mt-1 font-mono text-sm text-[#7A8FA6]">No. RM: {{ $pasien->no_rm }}</p>
            </div>
            <div class="flex items-center gap-2">
                @if ($pasien->isSelesai())
                    <span class="rounded-full border border-[#5DCAA5] bg-[#E1F5EE] px-3 py-1 text-xs font-semibold text-[#0F6E56]">Askep Selesai</span>
                @elseif ($pasien->isDraft())
                    <span class="rounded-full border border-[#85B7EB] bg-[#EBF5FB] px-3 py-1 text-xs font-semibold text-[#1B4F72]">Dalam Pengerjaan</span>
                @else
                    <span class="rounded-full border border-zinc-200 bg-zinc-50 px-3 py-1 text-xs font-semibold text-zinc-500">Belum Ada Askep</span>
                @endif
            </div>
        </div>
    </div>

    <div class="grid gap-6 lg:grid-cols-3">
        {{-- Kolom Utama --}}
        <div class="lg:col-span-2 flex flex-col gap-6">

            {{-- Info Pasien --}}
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <div class="mb-4 flex items-center justify-between">
                    <h2 class="font-semibold text-[#1B4F72]">Informasi Pasien</h2>
                    <flux:button :href="route('mahasiswa.pasien.edit', $pasien)" variant="ghost" icon="pencil" size="sm" wire:navigate>
                        Edit
                    </flux:button>
                </div>
                <dl class="grid grid-cols-2 gap-x-6 gap-y-4 sm:grid-cols-3">
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Umur</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->umur }} tahun</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Jenis Kelamin</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</dd>
                    </div>
                    @if ($pasien->tanggal_lahir)
                        <div>
                            <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Tanggal Lahir</dt>
                            <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->tanggal_lahir->translatedFormat('d F Y') }}</dd>
                        </div>
                    @endif
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Agama</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->agama ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Status Nikah</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->status_perkawinan ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Pekerjaan</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->pekerjaan ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Pendidikan</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->pendidikan ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">BB / TB</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">
                            @if($pasien->bb || $pasien->tb)
                                {{ $pasien->bb ?? '-' }} kg / {{ $pasien->tb ?? '-' }} cm
                            @else
                                -
                            @endif
                        </dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Ruang Rawat</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->ruang_rawat ?? '-' }}</dd>
                    </div>
                    <div class="sm:col-span-3">
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Alamat</dt>
                        <dd class="mt-0.5 text-sm font-medium text-[#1B4F72]">{{ $pasien->alamat ?? '-' }}</dd>
                    </div>
                    <div class="sm:col-span-3">
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Diagnosa Medis</dt>
                        <dd class="mt-0.5 text-sm font-bold text-[#D95C3A]">{{ $pasien->diagnosa_medis ?? '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-[10px] uppercase tracking-wider font-bold text-[#7A8FA6]">Tanggal Masuk</dt>
                        <dd class="mt-0.5 text-sm font-semibold text-[#1B4F72]">{{ $pasien->tanggal_masuk->translatedFormat('d F Y') }}</dd>
                    </div>
                </dl>
            </div>

            {{-- Daftar Askep --}}
            <div class="rounded-2xl border border-[#E0EBF5] bg-white">
                <div class="flex items-center justify-between border-b border-[#E0EBF5] px-6 py-4">
                    <h2 class="font-semibold text-[#1B4F72]">
                        Asuhan Keperawatan
                        <span class="ml-1 rounded-full bg-[#EBF5FB] px-2 py-0.5 text-xs text-[#2E86C1]">{{ $pasien->askep->count() }}</span>
                    </h2>
                    <a
                        href="{{ route('mahasiswa.pasien.askep.create', $pasien) }}"
                        wire:navigate
                        class="flex items-center gap-1.5 rounded-xl px-3 py-1.5 text-xs font-semibold text-white"
                        style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
                    >
                        <flux:icon.plus class="size-3.5" />
                        Buat Askep Baru
                    </a>
                </div>

                @if ($pasien->askep->isEmpty())
                    <div class="py-14 text-center">
                        <flux:icon.clipboard-document-list class="mx-auto mb-3 size-12 text-[#85B7EB]" />
                        <p class="text-sm text-[#7A8FA6]">Belum ada askep untuk pasien ini.</p>
                        <div class="mt-4">
                            <a
                                href="{{ route('mahasiswa.pasien.askep.create', $pasien) }}"
                                wire:navigate
                                class="inline-flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold text-white"
                                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
                            >
                                <flux:icon.plus class="size-4" />
                                Mulai Asuhan Keperawatan
                            </a>
                        </div>
                    </div>
                @else
                    <div class="divide-y divide-[#E0EBF5]">
                        @foreach ($pasien->askep as $askep)
                            <div class="flex items-center justify-between px-6 py-4 hover:bg-[#F4F8FB] transition">
                                <div class="flex-1 min-w-0">
                                    <div class="flex items-center gap-2">
                                        <span class="text-sm font-semibold text-[#1B4F72]">Askep #{{ $askep->id }}</span>
                                        <span class="rounded-full px-2.5 py-0.5 text-xs font-semibold
                                            @if ($askep->status === 'selesai') bg-[#E1F5EE] text-[#0F6E56]
                                            @elseif ($askep->status === 'menunggu_review') bg-[#FEF3C7] text-amber-700
                                            @elseif ($askep->status === 'perlu_revisi') bg-[#FDE8E8] text-[#D95C3A]
                                            @elseif ($askep->status === 'disetujui') bg-[#E1F5EE] text-[#0F6E56]
                                            @else bg-[#EBF5FB] text-[#1B4F72]
                                            @endif">
                                            {{ $askep->statusLabel() }}
                                        </span>
                                    </div>
                                    <div class="mt-0.5 flex items-center gap-2 text-xs text-[#7A8FA6]">
                                        <span>Step {{ $askep->step_terakhir }}/5</span>
                                        <span>•</span>
                                        <span>{{ $askep->created_at->translatedFormat('d M Y') }}</span>
                                    </div>
                                </div>
                                <div class="flex items-center gap-2 shrink-0">
                                    {{-- Progress bar --}}
                                    <div class="hidden sm:flex items-center gap-1">
                                        @for ($s = 1; $s <= 5; $s++)
                                            <div class="h-1.5 w-6 rounded-full {{ $s <= $askep->step_terakhir ? 'bg-[#2E86C1]' : 'bg-[#E0EBF5]' }}"></div>
                                        @endfor
                                    </div>
                                    <a
                                        href="{{ $askep->nextStepUrl() }}"
                                        wire:navigate
                                        class="flex items-center gap-1 rounded-lg border border-[#85B7EB] px-3 py-1.5 text-xs font-semibold text-[#2E86C1] hover:bg-[#EBF5FB] transition"
                                    >
                                        @if ($askep->isSelesai())
                                            <flux:icon.eye class="size-3.5" />
                                            Lihat
                                        @else
                                            <flux:icon.arrow-right class="size-3.5" />
                                            Lanjutkan
                                        @endif
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>

        {{-- Sidebar: Riwayat --}}
        <div class="flex flex-col gap-6">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-5">
                <h2 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Aktivitas</h2>
                @if ($pasien->riwayat->isEmpty())
                    <p class="text-sm text-[#7A8FA6]">Belum ada riwayat.</p>
                @else
                    <ol class="relative border-s border-[#D0DCE8] space-y-4">
                        @foreach ($pasien->riwayat->take(10) as $log)
                            <li class="ms-4">
                                <div class="absolute -start-1.5 mt-1 size-3 rounded-full border border-white bg-[#85B7EB]"></div>
                                <p class="text-sm font-medium text-[#1B4F72]">{{ $log->aktivitas }}</p>
                                <p class="text-xs text-[#7A8FA6]">{{ $log->created_at->diffForHumans() }}</p>
                            </li>
                        @endforeach
                    </ol>
                @endif
            </div>
        </div>
    </div>
</div>
