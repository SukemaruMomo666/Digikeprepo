<?php

use App\Models\Askep;
use App\Models\AskepFeedback;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.dosen')] #[Title('Review Askep')] class extends Component
{
    public Askep $askep;
    public string $catatan_umum = '';
    public string $status_baru = '';

    public function mount(Askep $askep): void
    {
        // Pastikan dosen ini memang pembimbing mahasiswa tersebut
        $isPembimbing = auth()->user()->penugasanSebagaiDosen()
            ->where('mahasiswa_id', $askep->user_id)
            ->exists();

        abort_unless($isPembimbing, 403, 'Anda bukan pembimbing mahasiswa ini.');

        $this->askep = $askep->load([
            'pasien',
            'user',
            'pengkajian',
            'diagnosa.sdki',
            'diagnosa.luaran.slki',
            'diagnosa.intervensi.siki',
            'diagnosa.intervensi.implementasi',
            'diagnosa.evaluasi',
        ]);

        $this->catatan_umum = $askep->catatan_dosen ?? '';
    }

    public function simpanReview(string $status): void
    {
        $this->validate([
            'catatan_umum' => 'required|min:10',
        ]);

        $this->askep->update([
            'status' => $status,
            'catatan_dosen' => $this->catatan_umum,
            'reviewed_at' => now(),
        ]);

        // Simpan ke history feedback
        AskepFeedback::create([
            'askep_id' => $this->askep->id,
            'dosen_id' => auth()->id(),
            'catatan_umum' => $this->catatan_umum,
            'status' => $status === Askep::STATUS_DISETUJUI ? 'disetujui' : 'perlu_revisi',
        ]);

        Flux::toast(
            variant: 'success',
            text: 'Review berhasil disimpan. Status askep: ' . $this->askep->statusLabel(),
        );

        $this->redirectRoute('dosen.dashboard', navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Header --}}
    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
            <flux:button :href="route('dosen.dashboard')" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-2">
                Kembali ke Dashboard
            </flux:button>
            <flux:heading size="xl">Review Asuhan Keperawatan</flux:heading>
            <flux:text class="mt-1">
                Mahasiswa: <span class="font-semibold text-zinc-900">{{ $askep->user->name }}</span>
                <span class="mx-2 text-zinc-300">|</span>
                Pasien: <span class="font-semibold text-zinc-900">{{ $askep->pasien->nama_pasien }}</span>
            </flux:text>
        </div>

        <div class="flex items-center gap-2">
            <flux:badge color="{{ $askep->status === 'menunggu_review' ? 'amber' : ($askep->status === 'disetujui' ? 'green' : 'zinc') }}">
                {{ $askep->statusLabel() }}
            </flux:badge>
        </div>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Konten Askep (Kiri) --}}
        <div class="lg:col-span-2 space-y-6">

            {{-- Step 1: Pengkajian --}}
            @if ($askep->pengkajian)
                <flux:card>
                    <div class="flex items-center gap-3 mb-4">
                        <div class="flex size-7 items-center justify-center rounded-full bg-[#1A9B72] text-xs font-bold text-white">1</div>
                        <flux:heading size="lg">Pengkajian</flux:heading>
                    </div>

                    <div class="space-y-4">
                        @php $p = $askep->pengkajian; @endphp
                        {{-- TTV --}}
                        <div class="grid grid-cols-2 gap-3 sm:grid-cols-5">
                            @foreach (['td' => 'TD', 'nadi' => 'Nadi', 'rr' => 'RR', 'suhu' => 'Suhu', 'spo2' => 'SpO₂'] as $key => $label)
                                <div class="rounded-xl bg-zinc-50 p-2 text-center border border-zinc-100">
                                    <dt class="text-[10px] text-zinc-500 uppercase">{{ $label }}</dt>
                                    <dd class="mt-0.5 font-bold text-zinc-800">{{ $p->ews_td ?? ($p->ttv[$key] ?? '-') }}</dd>
                                </div>
                            @endforeach
                        </div>

                        {{-- Riwayat --}}
                        <div class="space-y-3">
                            <div>
                                <flux:text size="xs" class="font-bold uppercase text-zinc-400">Keluhan Utama / Riwayat Sekarang</flux:text>
                                <div class="mt-1 text-sm text-zinc-700 leading-relaxed">
                                    {{ is_array($p->riwayat_sekarang) ? ($p->riwayat_sekarang['keluhan'] ?? '-') : '-' }}
                                </div>
                            </div>
                        </div>
                    </div>
                </flux:card>
            @endif

            {{-- Step 2 & 3: Diagnosa & Perencanaan --}}
            @if ($askep->diagnosa->isNotEmpty())
                <flux:card class="p-0 overflow-hidden">
                    <div class="flex items-center gap-3 p-4 border-b border-zinc-100">
                        <div class="flex size-7 items-center justify-center rounded-full bg-[#1A9B72] text-xs font-bold text-white">2 & 3</div>
                        <flux:heading size="lg">Diagnosa & Perencanaan</flux:heading>
                    </div>

                    <div class="divide-y divide-zinc-100">
                        @foreach ($askep->diagnosa as $d)
                            <div class="p-4">
                                <div class="flex items-start gap-3">
                                    <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-teal-50 text-xs font-bold text-teal-700 border border-teal-100">
                                        {{ $d->prioritas }}
                                    </div>
                                    <div class="flex-1">
                                        <div class="flex items-center gap-2 mb-2">
                                            <flux:badge size="sm" color="teal" variant="outline" class="font-mono">{{ $d->sdki?->kode_diagnosa }}</flux:badge>
                                            <span class="font-semibold text-zinc-800">{{ $d->sdki?->label_diagnosa }}</span>
                                        </div>

                                        {{-- Luaran (SLKI) --}}
                                        <div class="ml-2 pl-4 border-l-2 border-teal-50 space-y-3">
                                            @foreach ($d->luaran as $l)
                                                <div>
                                                    <div class="flex items-center gap-1.5 text-sm font-medium text-teal-800">
                                                        <flux:icon.check-circle class="size-4" />
                                                        {{ $l->slki?->label_luaran }}
                                                        <span class="text-xs text-zinc-400">({{ $l->target_waktu }})</span>
                                                    </div>

                                                    {{-- Intervensi (SIKI) --}}
                                                    <div class="mt-2 ml-6 space-y-2">
                                                        @foreach ($d->intervensi as $i)
                                                            <div class="text-sm text-zinc-600 flex items-start gap-2">
                                                                <flux:icon.arrow-right-circle class="size-4 mt-0.5 text-zinc-400" />
                                                                <div>
                                                                    <p class="font-medium text-zinc-800">{{ $i->siki?->label_intervensi ?? $i->nama_manual }}</p>
                                                                    @if ($i->tindakan_dipilih)
                                                                        <ul class="mt-1 list-disc list-inside text-xs text-zinc-500">
                                                                            @foreach (array_slice($i->tindakan_dipilih, 0, 3) as $t)
                                                                                <li>{{ $t }}</li>
                                                                            @endforeach
                                                                            @if (count($i->tindakan_dipilih) > 3)
                                                                                <li>... dan {{ count($i->tindakan_dipilih) - 3 }} lainnya</li>
                                                                            @endif
                                                                        </ul>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </flux:card>
            @endif

            {{-- Step 5: Evaluasi --}}
            @if ($askep->diagnosa->whereNotNull('evaluasi')->isNotEmpty())
                <flux:card>
                    <div class="flex items-center gap-3 mb-4">
                        <div class="flex size-7 items-center justify-center rounded-full bg-[#1A9B72] text-xs font-bold text-white">5</div>
                        <flux:heading size="lg">Evaluasi (SOAP)</flux:heading>
                    </div>

                    <div class="space-y-6">
                        @foreach ($askep->diagnosa as $d)
                            @if ($d->evaluasi)
                                @php $ev = $d->evaluasi->first(); @endphp
                                <div class="rounded-xl border border-zinc-100 p-4">
                                    <flux:text size="sm" class="font-bold text-zinc-400 uppercase mb-2">Diagnosa: {{ $d->sdki?->label_diagnosa }}</flux:text>
                                    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                                        <div class="md:col-span-3">
                                            <div class="whitespace-pre-line text-sm text-zinc-700 italic border-l-4 border-zinc-100 pl-4 py-1">
                                                {{ $ev->catatan_soap ?: 'Tidak ada catatan SOAP.' }}
                                            </div>
                                        </div>
                                        <div class="flex flex-col justify-center items-center rounded-lg bg-zinc-50 p-3">
                                            <flux:text size="xs" class="uppercase font-bold text-zinc-400 mb-1">Hasil</flux:text>
                                            <flux:badge color="{{ $ev->analisis === 'teratasi' ? 'green' : 'amber' }}">
                                                {{ $ev->analisisLabel() ?? $ev->analisis }}
                                            </flux:badge>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        @endforeach
                    </div>
                </flux:card>
            @endif

        </div>

        {{-- Panel Review (Kanan) --}}
        <div class="space-y-6">
            <flux:card class="sticky top-6">
                <flux:heading size="lg" class="mb-4">Formulir Review</flux:heading>

                <form wire:submit.prevent="simpanReview" class="space-y-4">
                    <flux:textarea
                        wire:model="catatan_umum"
                        label="Catatan & Masukan Bimbingan"
                        placeholder="Berikan masukan mendetail untuk mahasiswa..."
                        rows="8"
                    />

                    <div class="grid grid-cols-1 gap-2 pt-2">
                        <flux:button
                            variant="primary"
                            class="w-full bg-[#0F6E56] hover:bg-[#0A2D25]"
                            icon="check-badge"
                            wire:click="simpanReview('{{ Askep::STATUS_DISETUJUI }}')"
                        >
                            Setujui Askep
                        </flux:button>

                        <flux:button
                            variant="filled"
                            class="w-full bg-amber-500 text-white hover:bg-amber-600 border-none"
                            icon="arrow-path"
                            wire:click="simpanReview('{{ Askep::STATUS_PERLU_REVISI }}')"
                        >
                            Minta Revisi
                        </flux:button>

                        <flux:button :href="route('dosen.dashboard')" variant="ghost" class="w-full">
                            Batal
                        </flux:button>
                    </div>
                </form>
            </flux:card>

            <flux:card>
                <flux:heading size="md" class="mb-3">Detail Penugasan</flux:heading>
                <div class="space-y-2 text-sm">
                    <div class="flex justify-between">
                        <span class="text-zinc-500">Stase:</span>
                        <span class="font-medium text-zinc-800">KMB I</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-zinc-500">Rumah Sakit:</span>
                        <span class="font-medium text-zinc-800">RSUD Subang</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-zinc-500">Bangsal:</span>
                        <span class="font-medium text-zinc-800">Teratai</span>
                    </div>
                </div>
            </flux:card>
        </div>
    </div>
</div>
