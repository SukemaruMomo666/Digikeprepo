<?php

use App\Models\Askep;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Detail Askep')] class extends Component
{
    public Askep $askep;

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load([
            'pasien',
            'pengkajian',
            'diagnosa.sdki',
            'diagnosa.luaran.slki.kriteriaHasil',
            'diagnosa.intervensi.siki',
            'diagnosa.intervensi.implementasi',
            'diagnosa.evaluasi',
        ]);
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Header --}}
    <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
            <flux:button :href="route('pasien.show', $askep->pasien_id)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-2">
                Kembali ke Pasien
            </flux:button>
            <h1 class="text-2xl font-bold text-[#1B4F72]">Laporan Asuhan Keperawatan</h1>
            <p class="mt-1 text-sm text-[#7A8FA6]">
                Pasien: <span class="font-bold text-[#1B4F72]">{{ $askep->pasien->nama_pasien }}</span>
                <span class="mx-2 text-[#C4D3DF]">|</span>
                No. RM: <span class="font-mono font-semibold">{{ $askep->pasien->no_rm }}</span>
            </p>
        </div>

        <div class="flex items-center gap-3">
            <span class="rounded-full border px-3 py-1 text-xs font-bold uppercase tracking-wider
                @if ($askep->status === 'disetujui' || $askep->status === 'selesai') border-green-200 bg-green-50 text-green-700
                @elseif ($askep->status === 'menunggu_review') border-amber-200 bg-amber-50 text-amber-700
                @elseif ($askep->status === 'perlu_revisi') border-red-200 bg-red-50 text-red-700
                @else border-[#85B7EB] bg-[#EBF5FB] text-[#2E86C1]
                @endif">
                {{ str_replace('_', ' ', $askep->status) }}
            </span>

            @if ($askep->isDraft() || $askep->status === \App\Models\Askep::STATUS_PERLU_REVISI)
                <flux:button :href="$askep->nextStepUrl()" variant="primary" icon="pencil-square" size="sm" wire:navigate>
                    Lanjutkan Edit
                </flux:button>
            @endif

            <flux:button :href="route('askep.download', $askep)" icon="printer" variant="ghost" size="sm">Cetak PDF</flux:button>
        </div>
    </div>

    {{-- Alert Revisi --}}
    @if ($askep->status === 'perlu_revisi' && $askep->catatan_dosen)
        <div class="mb-6 rounded-2xl border-2 border-red-200 bg-red-50 p-5">
            <div class="flex items-start gap-3">
                <flux:icon.exclamation-triangle class="mt-0.5 size-5 shrink-0 text-red-600" />
                <div>
                    <p class="font-bold text-red-800">Perlu Revisi!</p>
                    <p class="mt-1 text-sm text-red-700 leading-relaxed">{{ $askep->catatan_dosen }}</p>
                </div>
            </div>
        </div>
    @endif

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {{-- Konten Utama (Kiri) --}}
        <div class="lg:col-span-2 space-y-8">

            {{-- 1. Pengkajian --}}
            @if ($askep->pengkajian)
                @php $p = $askep->pengkajian; @endphp
                <div class="rounded-2xl border border-[#E0EBF5] bg-white overflow-hidden shadow-sm">
                    <div class="bg-[#F8FBFE] px-6 py-4 border-b border-[#E0EBF5] flex items-center gap-2">
                        <div class="flex size-6 items-center justify-center rounded bg-[#1A9B72] text-[10px] font-bold text-white uppercase">1</div>
                        <h2 class="font-bold text-[#1B4F72]">PENGKAJIAN DASAR</h2>
                    </div>
                    <div class="p-6 space-y-6">
                        {{-- TTV & EWS --}}
                        <div class="grid grid-cols-2 gap-3 sm:grid-cols-5">
                            @foreach (['TD' => $p->ews_td, 'Nadi' => $p->ews_nadi, 'RR' => $p->ews_rr, 'Suhu' => $p->ews_suhu, 'SpO₂' => $p->ews_spo2] as $label => $val)
                                <div class="rounded-xl border border-gray-100 bg-gray-50/50 p-2 text-center">
                                    <dt class="text-[9px] font-bold uppercase text-[#7A8FA6]">{{ $label }}</dt>
                                    <dd class="mt-0.5 text-sm font-black text-[#1B4F72]">{{ $val ?: '-' }}</dd>
                                </div>
                            @endforeach
                        </div>

                        {{-- Riwayat --}}
                        <div class="grid gap-4 md:grid-cols-2">
                            <div class="space-y-1">
                                <p class="text-[10px] font-bold uppercase text-[#C4D3DF] tracking-widest">Keluhan Utama</p>
                                <p class="text-sm text-[#1B4F72]">{{ is_array($p->riwayat_sekarang) ? ($p->riwayat_sekarang['keluhan_utama'] ?? '-') : '-' }}</p>
                            </div>
                            <div class="space-y-1">
                                <p class="text-[10px] font-bold uppercase text-[#C4D3DF] tracking-widest">Diagnosa Medis</p>
                                <p class="text-sm font-bold text-[#D95C3A]">{{ $askep->pasien->diagnosa_medis ?? '-' }}</p>
                            </div>
                        </div>

                        {{-- Section Biologis (Ringkasan) --}}
                        <div class="rounded-xl bg-[#F4F8FB] p-4 border border-[#E0EBF5]">
                            <p class="mb-2 text-[10px] font-bold uppercase text-[#7A8FA6]">Pola Biologis (Masalah Terdeteksi)</p>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4 gap-y-2">
                                @php
                                    $bioFields = [
                                        'biologis_nyeri' => 'Nyeri',
                                        'biologis_nutrisi' => 'Nutrisi',
                                        'biologis_eliminasi_feses' => 'Eliminasi Feses',
                                        'biologis_oksigenasi' => 'Oksigenasi',
                                    ];
                                @endphp
                                @foreach ($bioFields as $field => $label)
                                    @php $val = $p->$field; @endphp
                                    <div class="flex items-start gap-2 text-xs">
                                        <flux:icon.check-circle class="size-3.5 mt-0.5 text-[#2E86C1]" />
                                        <div>
                                            <span class="font-bold text-[#1B4F72]">{{ $label }}:</span>
                                            <span class="text-gray-600">{{ is_array($val) ? ($val['keterangan'] ?? 'Normal') : 'Normal' }}</span>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            {{-- 2 & 3. Diagnosa & Perencanaan --}}
            @if ($askep->diagnosa->isNotEmpty())
                <div class="rounded-2xl border border-[#E0EBF5] bg-white overflow-hidden shadow-sm">
                    <div class="bg-[#F8FBFE] px-6 py-4 border-b border-[#E0EBF5] flex items-center gap-2">
                        <div class="flex size-6 items-center justify-center rounded bg-[#1A9B72] text-[10px] font-bold text-white uppercase">2 & 3</div>
                        <h2 class="font-bold text-[#1B4F72]">DIAGNOSA & PERENCANAAN</h2>
                    </div>
                    <div class="divide-y divide-gray-100">
                        @foreach ($askep->diagnosa->sortBy('prioritas') as $d)
                            <div class="p-6">
                                <div class="flex items-start gap-3 mb-4">
                                    <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#EBF5FB] text-[10px] font-bold text-[#2E86C1] border border-[#85B7EB]">
                                        {{ $d->prioritas }}
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-xs font-mono font-bold text-[#2E86C1]">{{ $d->sdki?->kode_diagnosa }}</p>
                                        <h3 class="text-base font-black text-[#1B4F72] leading-tight">{{ $d->sdki?->label_diagnosa }}</h3>
                                        
                                        @if(!empty($d->etiologi_dipilih))
                                            <p class="mt-2 text-[11px] text-[#7A8FA6] leading-relaxed">
                                                <span class="font-bold uppercase text-[9px]">Berhubungan dengan:</span> 
                                                {{ implode(', ', $d->etiologi_dipilih) }}
                                            </p>
                                        @endif
                                    </div>
                                </div>

                                {{-- SLKI Table --}}
                                <div class="ml-9 space-y-4">
                                    @foreach ($d->luaran as $l)
                                        <div class="rounded-xl border border-teal-100 bg-teal-50/20 p-4">
                                            <div class="flex justify-between items-start mb-3 border-b border-teal-100 pb-2">
                                                <div>
                                                    <p class="text-[10px] font-bold text-teal-600 uppercase tracking-widest">Luaran (SLKI)</p>
                                                    <p class="text-sm font-bold text-teal-900">{{ $l->slki?->label_luaran }}</p>
                                                </div>
                                                <span class="rounded bg-teal-100 px-2 py-0.5 text-[10px] font-bold text-teal-700">Target: {{ $l->target_waktu }}</span>
                                            </div>

                                            {{-- Indikator Scores --}}
                                            <div class="space-y-2">
                                                @php 
                                                    $skorPlan = is_array($l->skor_indikator) ? $l->skor_indikator : json_decode($l->skor_indikator ?? '{}', true);
                                                    $eval = $d->evaluasi->first();
                                                    $skorEval = $eval?->skor_indikator ?? [];
                                                @endphp
                                                @foreach ($l->slki?->kriteriaHasil ?? [] as $k)
                                                    @if(isset($skorPlan[$k->id]))
                                                        <div class="flex items-center justify-between text-xs py-1 border-b border-teal-50 last:border-0">
                                                            <span class="text-[#1B4F72]">{{ $k->deskripsi }}</span>
                                                            <div class="flex items-center gap-3 font-mono font-bold">
                                                                <span class="text-[#7A8FA6]" title="Skor Awal">{{ $skorPlan[$k->id]['awal'] }}</span>
                                                                <flux:icon.arrow-right class="size-2.5 text-gray-300" />
                                                                <span class="text-[#1A9B72]" title="Target">{{ $skorPlan[$k->id]['target'] }}</span>
                                                                @if(isset($skorEval[$k->id]))
                                                                    <div class="h-4 w-px bg-gray-200 mx-1"></div>
                                                                    <span class="text-[#2E86C1]" title="Hasil Evaluasi">{{ $skorEval[$k->id] }}</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif

            {{-- 4. Implementasi --}}
            <div class="rounded-2xl border border-[#E0EBF5] bg-white overflow-hidden shadow-sm">
                <div class="bg-[#F8FBFE] px-6 py-4 border-b border-[#E0EBF5] flex items-center gap-2">
                    <div class="flex size-6 items-center justify-center rounded bg-[#1A9B72] text-[10px] font-bold text-white uppercase">4</div>
                    <h2 class="font-bold text-[#1B4F72]">LOG IMPLEMENTASI</h2>
                </div>
                <div class="p-6">
                    @php
                        $semuaLog = $askep->diagnosa->flatMap->intervensi->flatMap->implementasi->sortByDesc('tanggal');
                    @endphp
                    @if ($semuaLog->isEmpty())
                        <p class="text-sm text-gray-400 italic text-center py-4">Belum ada implementasi dicatat.</p>
                    @else
                        <div class="space-y-4">
                            @foreach ($semuaLog as $log)
                                <div class="flex gap-4">
                                    <div class="flex flex-col items-center">
                                        <div class="size-2 rounded-full bg-[#2E86C1] mt-1.5"></div>
                                        <div class="w-px flex-1 bg-gray-100"></div>
                                    </div>
                                    <div class="flex-1 pb-4">
                                        <div class="flex items-center gap-2 mb-1">
                                            <span class="text-xs font-bold text-[#1B4F72]">{{ $log->tanggal->translatedFormat('d M Y') }}</span>
                                            <span class="text-[10px] font-semibold text-[#7A8FA6] bg-gray-50 px-1.5 py-0.5 rounded border">{{ $log->shift }} - {{ $log->waktu }}</span>
                                        </div>
                                        <p class="text-xs text-gray-600 italic leading-relaxed">{{ $log->catatan }}</p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>

            {{-- 5. Evaluasi --}}
            <div class="rounded-2xl border border-[#E0EBF5] bg-white overflow-hidden shadow-sm">
                <div class="bg-[#F8FBFE] px-6 py-4 border-b border-[#E0EBF5] flex items-center gap-2">
                    <div class="flex size-6 items-center justify-center rounded bg-[#1A9B72] text-[10px] font-bold text-white uppercase">5</div>
                    <h2 class="font-bold text-[#1B4F72]">EVALUASI KEPERAWATAN (SOAP)</h2>
                </div>
                <div class="divide-y divide-gray-100">
                    @foreach ($askep->diagnosa as $d)
                        @php $ev = $d->evaluasi->first(); @endphp
                        <div class="p-6">
                            <div class="flex items-start gap-3 mb-4">
                                <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#F4F8FB] text-[10px] font-bold text-[#7A8FA6] border border-[#D0DCE8]">
                                    {{ $d->prioritas }}
                                </div>
                                <div class="flex-1">
                                    <h3 class="text-sm font-bold text-[#1B4F72]">{{ $d->sdki?->label_diagnosa }}</h3>
                                    @if($ev)
                                        <div class="mt-1 flex items-center gap-2">
                                            <span class="text-[10px] font-bold text-[#7A8FA6] uppercase">{{ $ev->tanggal->translatedFormat('d M Y') }}</span>
                                            <span class="text-[10px] text-gray-300">|</span>
                                            <flux:badge size="sm" color="{{ $ev->analisis === 'Tercapai' ? 'green' : ($ev->analisis === 'Membaik' ? 'blue' : 'amber') }}">
                                                {{ $ev->analisis }}
                                            </flux:badge>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            @if($ev)
                                <div class="ml-9 grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div class="space-y-3">
                                        <div>
                                            <p class="text-[10px] font-bold text-[#7A8FA6] uppercase tracking-wider mb-1">Catatan SOAP</p>
                                            <div class="rounded-xl bg-gray-50 p-3 text-xs text-gray-700 leading-relaxed whitespace-pre-line border border-gray-100 italic">
                                                {{ $ev->catatan_soap ?: 'Tidak ada catatan SOAP.' }}
                                            </div>
                                        </div>
                                        <div>
                                            <p class="text-[10px] font-bold text-[#7A8FA6] uppercase tracking-wider mb-1">Tindak Lanjut</p>
                                            <flux:badge size="sm" variant="outline">{{ $ev->tindak_lanjut }}</flux:badge>
                                        </div>
                                    </div>

                                    <div class="space-y-4">
                                        <div>
                                            <p class="text-[10px] font-bold text-[#7A8FA6] uppercase tracking-wider mb-2">Tanda Vital Evaluasi</p>
                                            <div class="grid grid-cols-3 gap-2">
                                                <div class="rounded-lg bg-white border border-gray-100 p-2 text-center">
                                                    <p class="text-[8px] font-bold text-gray-400 uppercase">TD</p>
                                                    <p class="text-xs font-bold text-[#1B4F72]">{{ $ev->tv_td ?: '-' }}</p>
                                                </div>
                                                <div class="rounded-lg bg-white border border-gray-100 p-2 text-center">
                                                    <p class="text-[8px] font-bold text-gray-400 uppercase">Nadi</p>
                                                    <p class="text-xs font-bold text-[#1B4F72]">{{ $ev->tv_nadi ?: '-' }}</p>
                                                </div>
                                                <div class="rounded-lg bg-white border border-gray-100 p-2 text-center">
                                                    <p class="text-[8px] font-bold text-gray-400 uppercase">SpO2</p>
                                                    <p class="text-xs font-bold text-[#1B4F72]">{{ $ev->tv_spo2 ?: '-' }}%</p>
                                                </div>
                                            </div>
                                        </div>
                                        @if($ev->analisis_narasi)
                                            <div>
                                                <p class="text-[10px] font-bold text-[#7A8FA6] uppercase tracking-wider mb-1">Analisis Narasi</p>
                                                <p class="text-xs text-gray-600 leading-relaxed">{{ $ev->analisis_narasi }}</p>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            @else
                                <div class="ml-9 p-4 rounded-xl bg-amber-50 border border-amber-100 text-center">
                                    <p class="text-xs text-amber-700 italic">Evaluasi belum dilakukan untuk diagnosa ini.</p>
                                </div>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>

        </div>

        {{-- Sidebar Info (Kanan) --}}
        <div class="space-y-6">
            <div class="rounded-2xl border border-[#E0EBF5] bg-[#F8FBFE] p-6 shadow-sm">
                <h3 class="text-sm font-black text-[#1B4F72] mb-4 uppercase tracking-tighter">Status Evaluasi Akhir</h3>
                <div class="space-y-4">
                    @foreach ($askep->diagnosa as $d)
                        @php $ev = $d->evaluasi->first(); @endphp
                        <div class="rounded-xl bg-white p-4 border border-[#E0EBF5]">
                            <p class="text-[10px] font-bold text-[#2E86C1] uppercase leading-tight mb-2">{{ $d->sdki?->label_diagnosa }}</p>
                            @if ($ev)
                                <flux:badge size="sm" color="{{ $ev->analisis === 'Tercapai' ? 'green' : ($ev->analisis === 'Membaik' ? 'blue' : 'amber') }}">
                                    {{ $ev->analisis }}
                                </flux:badge>
                                <p class="mt-2 text-xs text-gray-600 line-clamp-3 italic">"{{ $ev->catatan_soap }}"</p>
                            @else
                                <span class="text-[10px] text-gray-400 italic">Evaluasi belum diisi</span>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>

            <flux:card>
                <h4 class="text-xs font-bold text-[#7A8FA6] uppercase mb-3">Informasi Tambahan</h4>
                <div class="space-y-3 text-sm">
                    <div>
                        <p class="text-[10px] font-bold text-gray-400 uppercase">Dibuat Oleh</p>
                        <p class="font-bold text-[#1B4F72]">{{ auth()->user()->name }}</p>
                    </div>
                    <div>
                        <p class="text-[10px] font-bold text-gray-400 uppercase">Pembimbing</p>
                        <p class="font-bold text-[#1B4F72]">
                            {{ $askep->mahasiswa->penugasanSebagaiMahasiswa->first()?->dosen?->name ?? 'Belum ditentukan' }}
                        </p>
                    </div>
                </div>
            </flux:card>
        </div>
    </div>
</div>
