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
    public array $catatan_detail = [
        'pengkajian' => '',
        'diagnosa' => '',
        'perencanaan' => '',
        'implementasi' => '',
        'evaluasi' => '',
    ];

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
            'diagnosa.luaran.slki.kriteriaHasil',
            'diagnosa.intervensi.siki',
            'diagnosa.evaluasi',
            'feedbacks' => fn($q) => $q->latest()
        ]);

        $this->catatan_umum = $askep->catatan_dosen ?? '';
        
        // Load feedback terakhir jika ada
        $lastFeedback = $this->askep->feedbacks->first();
        if ($lastFeedback && is_array($lastFeedback->catatan_detail)) {
            $this->catatan_detail = array_merge($this->catatan_detail, $lastFeedback->catatan_detail);
        }
    }

    public function simpanReview(string $status): void
    {
        $this->validate([
            'catatan_umum' => 'required|min:5',
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
            'catatan_detail' => $this->catatan_detail,
            'status' => $status === Askep::STATUS_DISETUJUI ? 'disetujui' : 'perlu_revisi',
        ]);

        Flux::toast(
            variant: 'success',
            text: 'Review berhasil disimpan. Status askep: ' . str_replace('_', ' ', $status),
        );

        $this->redirectRoute('dosen.dashboard', navigate: true);
    }
};
?>

<div class="p-2 md:p-4">
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
            <flux:button :href="route('askep.download', $askep)" icon="printer" variant="ghost" size="sm">Cetak PDF</flux:button>
            
            @php
                $statusColor = match($askep->status) {
                    'menunggu_review' => 'amber',
                    'disetujui' => 'green',
                    'perlu_revisi' => 'blue',
                    default => 'zinc'
                };
            @endphp
            <flux:badge color="{{ $statusColor }}">
                {{ str_replace('_', ' ', $askep->status) }}
            </flux:badge>
        </div>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Konten Askep (Kiri) --}}
        <div class="lg:col-span-2 space-y-8">

            {{-- Step 1: Pengkajian --}}
            @if ($askep->pengkajian)
                <div class="space-y-4">
                    <flux:card>
                        <div class="flex items-center gap-3 mb-6">
                            <div class="flex size-8 items-center justify-center rounded-lg bg-[#1A9B72] text-sm font-bold text-white shadow-sm">1</div>
                            <flux:heading size="lg">Pengkajian Dasar</flux:heading>
                        </div>

                        <div class="space-y-6">
                            @php $p = $askep->pengkajian; @endphp
                            
                            {{-- Identitas PJ & EWS --}}
                            <div class="grid gap-6 md:grid-cols-2">
                                <div class="rounded-xl border border-zinc-100 p-4 bg-zinc-50/50">
                                    <flux:text size="xs" class="font-bold uppercase text-zinc-400 mb-3 block">Identitas Penanggung Jawab</flux:text>
                                    <dl class="grid grid-cols-2 gap-y-2 text-sm">
                                        <dt class="text-zinc-500">Nama:</dt> <dd class="font-semibold text-zinc-800">{{ $p->pj_nama ?? '-' }}</dd>
                                        <dt class="text-zinc-500">Umur:</dt> <dd class="font-semibold text-zinc-800">{{ $p->pj_umur ?? '-' }} th</dd>
                                        <dt class="text-zinc-500">Pendidikan:</dt> <dd class="font-semibold text-zinc-800">{{ $p->pj_pendidikan ?? '-' }}</dd>
                                    </dl>
                                </div>

                                <div class="rounded-xl border border-amber-100 p-4 bg-amber-50/30">
                                    <flux:text size="xs" class="font-bold uppercase text-amber-600 mb-3 block">Early Warning Score (EWS)</flux:text>
                                    <div class="flex items-center justify-between">
                                        <div class="text-sm font-bold text-amber-900">Skor Total: {{ $p->ews_skor ?? 0 }}</div>
                                        <div class="text-xs text-amber-700 font-semibold uppercase tracking-wider">{{ $p->ews_kesadaran ?? 'Composmentis' }}</div>
                                    </div>
                                </div>
                            </div>

                            {{-- TTV Metrics --}}
                            <div class="grid grid-cols-2 gap-3 sm:grid-cols-5">
                                @foreach ([
                                    'TD' => $p->ews_td ?? '-', 
                                    'Nadi' => ($p->ews_nadi ?? '-') . ' x/m', 
                                    'RR' => ($p->ews_rr ?? '-') . ' x/m', 
                                    'Suhu' => ($p->ews_suhu ?? '-') . ' °C', 
                                    'SpO₂' => ($p->ews_spo2 ?? '-') . ' %'
                                ] as $label => $val)
                                    <div class="rounded-xl bg-zinc-50 p-2 text-center border border-zinc-100">
                                        <dt class="text-[10px] text-zinc-500 uppercase font-bold">{{ $label }}</dt>
                                        <dd class="mt-0.5 font-black text-zinc-800">{{ $val }}</dd>
                                    </div>
                                @endforeach
                            </div>

                            {{-- Riwayat --}}
                            <div class="grid gap-4 md:grid-cols-2">
                                <div class="rounded-xl border border-zinc-100 p-4">
                                    <flux:text size="xs" class="font-bold uppercase text-zinc-400 mb-2 block">Keluhan Utama & Sekarang</flux:text>
                                    <div class="text-sm text-zinc-700 space-y-2">
                                        @if(is_array($p->riwayat_sekarang))
                                            <p><span class="font-bold text-zinc-500">Keluhan:</span> {{ $p->riwayat_sekarang['keluhan_utama'] ?? '-' }}</p>
                                            <p><span class="font-bold text-zinc-500">Kronologi:</span> {{ $p->riwayat_sekarang['kronologi'] ?? '-' }}</p>
                                        @else
                                            <p>-</p>
                                        @endif
                                    </div>
                                </div>
                                <div class="rounded-xl border border-zinc-100 p-4">
                                    <flux:text size="xs" class="font-bold uppercase text-zinc-400 mb-2 block">Riwayat Masa Lalu</flux:text>
                                    <div class="text-sm text-zinc-700 space-y-2">
                                        @if(is_array($p->riwayat_lalu))
                                            <p><span class="font-bold text-zinc-500">Penyakit:</span> {{ $p->riwayat_lalu['penyakit_anak'] ?? '-' }}</p>
                                            <p><span class="font-bold text-zinc-500">Alergi:</span> {{ $p->riwayat_lalu['alergi'] ?? '-' }}</p>
                                        @else
                                            <p>-</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </flux:card>
                    <flux:textarea wire:model="catatan_detail.pengkajian" placeholder="Beri masukan khusus untuk Pengkajian..." size="sm" rows="2" />
                </div>
            @endif

            {{-- Step 2 & 3: Diagnosa & Perencanaan --}}
            @if ($askep->diagnosa->isNotEmpty())
                <div class="space-y-4">
                    <flux:card class="p-0 overflow-hidden">
                        <div class="flex items-center gap-3 p-4 border-b border-zinc-100">
                            <div class="flex size-8 items-center justify-center rounded-lg bg-[#1A9B72] text-sm font-bold text-white shadow-sm">2 & 3</div>
                            <flux:heading size="lg">Diagnosa & Perencanaan</flux:heading>
                        </div>

                        <div class="divide-y divide-zinc-100">
                            @foreach ($askep->diagnosa as $d)
                                <div class="p-5">
                                    <div class="flex items-start gap-3">
                                        <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-teal-50 text-xs font-bold text-teal-700 border border-teal-100">
                                            {{ $d->prioritas }}
                                        </div>
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-3">
                                                <flux:badge size="sm" color="teal" variant="outline" class="font-mono">{{ $d->sdki?->kode_diagnosa }}</flux:badge>
                                                <span class="font-bold text-zinc-800 text-base">{{ $d->sdki?->label_diagnosa }}</span>
                                            </div>

                                            <div class="ml-2 pl-4 border-l-2 border-teal-50 space-y-6">
                                                {{-- Justifikasi Diagnosa --}}
                                                <div class="grid gap-3 md:grid-cols-2">
                                                    <div class="rounded-lg bg-zinc-50 p-3 border border-zinc-100">
                                                        <p class="text-[10px] font-bold uppercase text-zinc-400 mb-2">Penyebab / Faktor Risiko</p>
                                                        @if(!empty($d->etiologi_dipilih))
                                                            <ul class="list-inside list-disc text-xs text-zinc-700 space-y-1">
                                                                @foreach($d->etiologi_dipilih as $et) <li>{{ $et }}</li> @endforeach
                                                            </ul>
                                                        @else
                                                            <p class="text-xs italic text-zinc-400">Tidak ada penyebab dipilih</p>
                                                        @endif
                                                    </div>
                                                    <div class="rounded-lg bg-zinc-50 p-3 border border-zinc-100">
                                                        <p class="text-[10px] font-bold uppercase text-zinc-400 mb-2">Gejala & Tanda Klinis</p>
                                                        @if(!empty($d->gejala_dipilih))
                                                            <ul class="list-inside list-disc text-xs text-zinc-700 space-y-1">
                                                                @foreach($d->gejala_dipilih as $gj) <li>{{ $gj }}</li> @endforeach
                                                            </ul>
                                                        @else
                                                            <p class="text-xs italic text-zinc-400">Tidak ada gejala dipilih</p>
                                                        @endif
                                                    </div>
                                                </div>

                                                {{-- Luaran & Intervensi --}}
                                                <div class="space-y-4">
                                                    @foreach ($d->luaran as $l)
                                                        <div class="rounded-xl border border-teal-100 bg-white overflow-hidden shadow-sm">
                                                            <div class="bg-teal-50/50 px-4 py-2 border-b border-teal-100 flex justify-between items-center">
                                                                <span class="text-xs font-bold text-teal-800">{{ $l->slki?->kode_luaran }} - {{ $l->slki?->label_luaran }}</span>
                                                                <span class="text-[10px] font-bold text-teal-600 bg-white px-2 py-0.5 rounded-full border border-teal-100">Target: {{ $l->target_waktu }}</span>
                                                            </div>
                                                            <div class="p-4 space-y-4">
                                                                {{-- Intervensi SIKI yang terkait Luaran ini --}}
                                                                <div class="space-y-3">
                                                                    <p class="text-[10px] font-bold uppercase text-zinc-400 tracking-wider">Intervensi & Tindakan (SIKI)</p>
                                                                    @php
                                                                        $intervensis = $d->intervensi->where('is_included', true);
                                                                    @endphp
                                                                    @forelse ($intervensis as $i)
                                                                        <div class="flex items-start gap-3">
                                                                            <flux:icon.arrow-right-circle class="size-4 mt-0.5 text-teal-500" />
                                                                            <div>
                                                                                <p class="text-sm font-bold text-zinc-800">{{ $i->siki?->label_intervensi ?? $i->nama_manual }}</p>
                                                                                @if ($i->tindakan_dipilih)
                                                                                    <ul class="mt-1 list-disc list-inside text-xs text-zinc-500 space-y-0.5">
                                                                                        @foreach ($i->tindakan_dipilih as $t)
                                                                                            <li>{{ $t }}</li>
                                                                                        @endforeach
                                                                                    </ul>
                                                                                @endif
                                                                            </div>
                                                                        </div>
                                                                    @empty
                                                                        <p class="text-xs italic text-zinc-400 pl-7">Tidak ada intervensi dipilih</p>
                                                                    @endforelse
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </flux:card>
                    <div class="grid grid-cols-2 gap-4">
                        <flux:textarea wire:model="catatan_detail.diagnosa" placeholder="Catatan Diagnosa..." size="sm" rows="2" />
                        <flux:textarea wire:model="catatan_detail.perencanaan" placeholder="Catatan Perencanaan..." size="sm" rows="2" />
                    </div>
                </div>
            @endif

            {{-- Step 4 & 5: Implementasi & Evaluasi --}}
            <div class="space-y-4">
                <flux:card class="p-0 overflow-hidden">
                    <div class="flex items-center gap-3 p-4 border-b border-zinc-100">
                        <div class="flex size-8 items-center justify-center rounded-lg bg-[#1A9B72] text-sm font-bold text-white shadow-sm">4 & 5</div>
                        <flux:heading size="lg">Implementasi & Evaluasi</flux:heading>
                    </div>
                    
                    <div class="divide-y divide-zinc-100">
                        @foreach ($askep->diagnosa as $d)
                            <div class="p-5">
                                <flux:text size="sm" class="font-bold text-zinc-400 uppercase mb-4 block">Diagnosa: {{ $d->sdki?->label_diagnosa }}</flux:text>
                                
                                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                    {{-- Kolom Implementasi --}}
                                    <div class="space-y-3">
                                        <p class="text-[10px] font-bold uppercase text-zinc-400">Log Implementasi</p>
                                        @php $semuaLog = $d->intervensi->flatMap->implementasi->sortByDesc('tanggal'); @endphp
                                        @forelse ($semuaLog as $log)
                                            <div class="rounded-lg border border-zinc-100 bg-zinc-50/30 p-3 text-xs">
                                                <div class="flex justify-between font-bold text-zinc-700 mb-1">
                                                    <span>{{ $log->tanggal->translatedFormat('d M Y') }} ({{ $log->shift }})</span>
                                                    <span class="text-[10px] text-zinc-400">{{ $log->waktu }}</span>
                                                </div>
                                                <p class="text-zinc-600 line-clamp-2">{{ $log->catatan }}</p>
                                            </div>
                                        @empty
                                            <p class="text-xs italic text-zinc-400">Belum ada implementasi</p>
                                        @endforelse
                                    </div>

                                    {{-- Kolom Evaluasi --}}
                                    <div class="space-y-3">
                                        <p class="text-[10px] font-bold uppercase text-zinc-400">Evaluasi Akhir (SOAP)</p>
                                        @if ($d->evaluasi->isNotEmpty())
                                            @php $ev = $d->evaluasi->first(); @endphp
                                            <div class="rounded-xl border border-teal-100 bg-teal-50/20 p-4">
                                                <div class="mb-3">
                                                    <flux:badge color="{{ $ev->analisis === 'Tercapai' ? 'green' : ($ev->analisis === 'Membaik' ? 'blue' : 'amber') }}">
                                                        {{ $ev->analisisLabel() }}
                                                    </flux:badge>
                                                </div>
                                                <div class="text-sm text-zinc-700 whitespace-pre-line leading-relaxed">
                                                    {{ $ev->catatan_soap ?: 'Tidak ada catatan SOAP.' }}
                                                </div>
                                                <div class="mt-3 pt-3 border-t border-teal-100 flex justify-between items-center text-[10px] font-bold uppercase text-teal-700">
                                                    <span>Tindak Lanjut: {{ $ev->tindak_lanjut }}</span>
                                                    <span>Hari Ke-{{ $ev->hari_ke }}</span>
                                                </div>
                                            </div>
                                        @else
                                            <p class="text-xs italic text-zinc-400 text-center py-8 bg-zinc-50 rounded-xl border border-dashed">Belum ada evaluasi</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </flux:card>
                <div class="grid grid-cols-2 gap-4">
                    <flux:textarea wire:model="catatan_detail.implementasi" placeholder="Catatan Implementasi..." size="sm" rows="2" />
                    <flux:textarea wire:model="catatan_detail.evaluasi" placeholder="Catatan Evaluasi..." size="sm" rows="2" />
                </div>
            </div>

        </div>

        {{-- Panel Review (Kanan) --}}
        <div class="space-y-6">
            <flux:card class="sticky top-6">
                <flux:heading size="lg" class="mb-4 text-[#1B4F72]">Formulir Review</flux:heading>

                <div class="space-y-4">
                    <flux:textarea
                        wire:model="catatan_umum"
                        label="Masukan Umum (Kesimpulan)"
                        placeholder="Berikan masukan mendetail untuk mahasiswa..."
                        rows="6"
                    />

                    <div class="grid grid-cols-1 gap-2 pt-2">
                        <flux:button
                            variant="primary"
                            class="w-full bg-[#0F6E56] hover:bg-[#0A2D25]"
                            icon="check-badge"
                            wire:click="simpanReview('{{ Askep::STATUS_DISETUJUI }}')"
                            wire:confirm="Setujui asuhan keperawatan ini?"
                        >
                            Setujui Askep
                        </flux:button>

                        <flux:button
                            variant="filled"
                            class="w-full bg-amber-500 text-white hover:bg-amber-600 border-none"
                            icon="arrow-path"
                            wire:click="simpanReview('{{ Askep::STATUS_PERLU_REVISI }}')"
                            wire:confirm="Minta mahasiswa untuk melakukan revisi?"
                        >
                            Minta Revisi
                        </flux:button>

                        <flux:button :href="route('dosen.dashboard')" variant="ghost" class="w-full" wire:navigate>
                            Batal
                        </flux:button>
                    </div>
                </div>
            </flux:card>

            <flux:card>
                <flux:heading size="md" class="mb-3 text-[#1B4F72]">Info Mahasiswa</flux:heading>
                <div class="space-y-3 text-sm">
                    <div>
                        <p class="text-[10px] font-bold uppercase text-zinc-400">NIM</p>
                        <p class="font-semibold text-zinc-800">{{ $askep->user->nim_nip }}</p>
                    </div>
                    <div>
                        <p class="text-[10px] font-bold uppercase text-zinc-400">Tgl. Kirim</p>
                        <p class="font-semibold text-zinc-800">{{ $askep->submitted_at?->translatedFormat('d M Y H:i') ?? '-' }} WIB</p>
                    </div>
                </div>
            </flux:card>
        </div>
    </div>
</div>
