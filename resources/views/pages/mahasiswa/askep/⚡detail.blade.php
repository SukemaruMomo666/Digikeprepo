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
            'diagnosa.luaran.slki',
            'diagnosa.intervensi.siki',
            'diagnosa.intervensi.implementasi',
            'diagnosa.evaluasi',
        ]);
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Header --}}
    <div class="mb-6">
        <flux:button :href="route('pasien.show', $askep->pasien_id)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Pasien
        </flux:button>

        <div class="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
            <div>
                <h1 class="text-2xl font-bold text-[#1B4F72]">
                    Asuhan Keperawatan — {{ $askep->pasien->nama_pasien }}
                </h1>
                <p class="mt-1 text-sm text-[#7A8FA6]">
                    No. RM: <span class="font-mono font-semibold">{{ $askep->pasien->no_rm }}</span>
                    <span class="mx-2">·</span>
                    Dibuat {{ $askep->created_at->translatedFormat('d F Y') }}
                </p>
            </div>
            <div class="flex items-center gap-2 shrink-0">
                <span class="rounded-full px-3 py-1 text-sm font-semibold
                    @if ($askep->status === 'selesai') bg-[#E1F5EE] text-[#0F6E56]
                    @elseif ($askep->status === 'menunggu_review') bg-[#FEF3C7] text-amber-700
                    @elseif ($askep->status === 'perlu_revisi') bg-[#FDE8E8] text-[#D95C3A]
                    @elseif ($askep->status === 'disetujui') bg-[#E1F5EE] text-[#0F6E56]
                    @else bg-[#EBF5FB] text-[#1B4F72]
                    @endif">
                    {{ $askep->statusLabel() }}
                </span>
                @if ($askep->isDraft() || $askep->status === \App\Models\Askep::STATUS_PERLU_REVISI)
                    <a
                        href="{{ $askep->nextStepUrl() }}"
                        wire:navigate
                        class="flex items-center gap-1.5 rounded-xl px-3 py-1.5 text-sm font-semibold text-white"
                        style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
                    >
                        <flux:icon.pencil class="size-4" />
                        Lanjutkan
                    </a>
                @endif
            </div>
        </div>
    </div>

    {{-- Progress Bar --}}
    <div class="mb-6 rounded-2xl border border-[#E0EBF5] bg-white p-5">
        <div class="flex items-center justify-between gap-2">
            @foreach (['Pengkajian', 'Diagnosa', 'Perencanaan', 'Implementasi', 'Evaluasi'] as $i => $namaStep)
                @php $num = $i + 1; $selesai = $num <= $askep->step_terakhir; @endphp
                <div class="flex flex-1 flex-col items-center gap-1">
                    <div class="flex size-9 items-center justify-center rounded-full border-2 text-sm font-bold
                        {{ $selesai ? 'border-[#1A9B72] bg-[#1A9B72] text-white' : 'border-[#D0DCE8] text-[#C4D3DF]' }}">
                        @if ($selesai)
                            <flux:icon.check class="size-4" />
                        @else
                            {{ $num }}
                        @endif
                    </div>
                    <span class="hidden text-center text-[10px] font-medium sm:block {{ $selesai ? 'text-[#1A9B72]' : 'text-[#C4D3DF]' }}">{{ $namaStep }}</span>
                </div>
                @if (! $loop->last)
                    <div class="h-0.5 flex-1 rounded {{ $num < $askep->step_terakhir ? 'bg-[#1A9B72]' : 'bg-[#E0EBF5]' }}"></div>
                @endif
            @endforeach
        </div>
    </div>

    {{-- Catatan Dosen (jika ada) --}}
    @if ($askep->catatan_dosen)
        <div class="mb-6 rounded-2xl border border-amber-200 bg-amber-50 p-5">
            <div class="flex items-start gap-3">
                <flux:icon.chat-bubble-left-ellipsis class="mt-0.5 size-5 shrink-0 text-amber-600" />
                <div>
                    <p class="font-semibold text-amber-800">Catatan Dosen Pembimbing</p>
                    <p class="mt-1 text-sm text-amber-700">{{ $askep->catatan_dosen }}</p>
                </div>
            </div>
        </div>
    @endif

    <div class="space-y-6">

        {{-- Step 1: Pengkajian --}}
        @if ($askep->pengkajian)
            @php $p = $askep->pengkajian; @endphp
            <div class="rounded-2xl border border-[#E0EBF5] bg-white">
                <div class="flex items-center gap-3 border-b border-[#E0EBF5] px-6 py-4">
                    <div class="flex size-7 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">1</div>
                    <h2 class="font-semibold text-[#1B4F72]">Pengkajian</h2>
                    @if ($askep->step_terakhir >= 1)
                        <a href="{{ route('askep.pengkajian', $askep) }}" wire:navigate class="ml-auto text-xs text-[#2E86C1] hover:underline">Edit</a>
                    @endif
                </div>
                <div class="px-6 py-4">
                    {{-- TTV --}}
                    @if ($p->ttv)
                        <div class="mb-4">
                            <p class="mb-2 text-xs font-semibold uppercase tracking-wide text-[#7A8FA6]">Tanda-Tanda Vital</p>
                            <dl class="grid grid-cols-2 gap-3 sm:grid-cols-5">
                                @foreach (['td' => 'Tekanan Darah', 'nadi' => 'Nadi', 'rr' => 'RR', 'suhu' => 'Suhu', 'spo2' => 'SpO₂'] as $key => $label)
                                    @if (isset($p->ttv[$key]))
                                        <div class="rounded-xl bg-[#F4F8FB] p-3 text-center">
                                            <dt class="text-[10px] text-[#7A8FA6]">{{ $label }}</dt>
                                            <dd class="mt-1 font-bold text-[#1B4F72]">{{ $p->ttv[$key] }}</dd>
                                        </div>
                                    @endif
                                @endforeach
                            </dl>
                        </div>
                    @endif

                    {{-- EWS Score --}}
                    @if ($p->ews_score !== null)
                        @php
                            $ews = $p->ews_score;
                            $ewsColor = $ews <= 2 ? 'bg-[#E1F5EE] text-[#0F6E56]' : ($ews <= 5 ? 'bg-[#FEF3C7] text-amber-700' : 'bg-[#FDE8E8] text-[#D95C3A]');
                            $ewsLabel = $ews <= 2 ? 'Risiko Rendah' : ($ews <= 5 ? 'Risiko Sedang' : 'Risiko Tinggi');
                        @endphp
                        <div class="inline-flex items-center gap-2 rounded-xl {{ $ewsColor }} px-3 py-1.5">
                            <span class="text-xs font-semibold">EWS Score: {{ $ews }}</span>
                            <span class="text-xs">({{ $ewsLabel }})</span>
                        </div>
                    @endif
                </div>
            </div>
        @endif

        {{-- Step 2: Diagnosa --}}
        @if ($askep->diagnosa->isNotEmpty())
            <div class="rounded-2xl border border-[#E0EBF5] bg-white">
                <div class="flex items-center gap-3 border-b border-[#E0EBF5] px-6 py-4">
                    <div class="flex size-7 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">2</div>
                    <h2 class="font-semibold text-[#1B4F72]">
                        Diagnosa Keperawatan
                        <span class="ml-1 rounded-full bg-[#EBF5FB] px-2 py-0.5 text-xs text-[#2E86C1]">{{ $askep->diagnosa->count() }}</span>
                    </h2>
                    @if ($askep->step_terakhir >= 2)
                        <a href="{{ route('askep.diagnosa', $askep) }}" wire:navigate class="ml-auto text-xs text-[#2E86C1] hover:underline">Edit</a>
                    @endif
                </div>
                <div class="divide-y divide-[#E0EBF5]">
                    @foreach ($askep->diagnosa->sortBy('prioritas') as $d)
                        <div class="px-6 py-4">
                            <div class="flex items-start gap-3">
                                <div class="flex size-6 shrink-0 items-center justify-center rounded-full bg-[#EBF5FB] text-xs font-bold text-[#2E86C1]">
                                    {{ $d->prioritas }}
                                </div>
                                <div class="flex-1 min-w-0">
                                    <div class="flex flex-wrap items-center gap-1.5">
                                        <span class="font-mono text-xs font-bold text-[#2E86C1]">{{ $d->sdki?->kode_diagnosa }}</span>
                                        <span class="font-medium text-[#1B4F72]">{{ $d->sdki?->label_diagnosa }}</span>
                                    </div>

                                    {{-- Luaran --}}
                                    @if ($d->luaran->isNotEmpty())
                                        <div class="mt-2 space-y-1">
                                            @foreach ($d->luaran as $l)
                                                <div class="flex items-center gap-1.5 text-xs text-[#0F6E56]">
                                                    <flux:icon.check-circle class="size-3.5 shrink-0" />
                                                    <span class="font-mono">{{ $l->slki?->kode_luaran }}</span>
                                                    <span>{{ $l->slki?->label_luaran }}</span>
                                                    @if ($l->target_waktu)
                                                        <span class="text-[#7A8FA6]">({{ $l->target_waktu }})</span>
                                                    @endif
                                                </div>
                                            @endforeach
                                        </div>
                                    @endif

                                    {{-- Intervensi --}}
                                    @if ($d->intervensi->isNotEmpty())
                                        <div class="mt-2 space-y-1">
                                            @foreach ($d->intervensi as $i)
                                                <div class="flex items-center gap-1.5 text-xs text-[#1B4F72]">
                                                    <flux:icon.arrow-right class="size-3.5 shrink-0 text-[#2E86C1]" />
                                                    @if ($i->siki)
                                                        <span class="font-mono text-[#2E86C1]">{{ $i->siki->kode_intervensi }}</span>
                                                        <span>{{ $i->siki->label_intervensi }}</span>
                                                    @else
                                                        <span>{{ $i->nama_manual ?? 'Intervensi manual' }}</span>
                                                    @endif
                                                </div>
                                            @endforeach
                                        </div>
                                    @endif

                                    {{-- Evaluasi --}}
                                    @if ($d->evaluasi->isNotEmpty())
                                        @php $ev = $d->evaluasi->first(); @endphp
                                        <div class="mt-2">
                                            <span class="rounded-full px-2 py-0.5 text-[10px] font-semibold
                                                @if ($ev->analisis === 'teratasi') bg-[#E1F5EE] text-[#0F6E56]
                                                @elseif ($ev->analisis === 'teratasi_sebagian') bg-[#FEF3C7] text-amber-700
                                                @else bg-[#FDE8E8] text-[#D95C3A]
                                                @endif">
                                                {{ match ($ev->analisis) {
                                                    'teratasi' => 'Teratasi',
                                                    'teratasi_sebagian' => 'Teratasi Sebagian',
                                                    default => 'Belum Teratasi',
                                                } }}
                                            </span>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif

        {{-- Implementasi Summary --}}
        @php
            $totalImpl = $askep->diagnosa->flatMap->intervensi->flatMap->implementasi->count();
        @endphp
        @if ($totalImpl > 0)
            <div class="rounded-2xl border border-[#E0EBF5] bg-white">
                <div class="flex items-center gap-3 border-b border-[#E0EBF5] px-6 py-4">
                    <div class="flex size-7 items-center justify-center rounded-full bg-[#2E86C1] text-xs font-bold text-white">4</div>
                    <h2 class="font-semibold text-[#1B4F72]">
                        Implementasi
                        <span class="ml-1 rounded-full bg-[#EBF5FB] px-2 py-0.5 text-xs text-[#2E86C1]">{{ $totalImpl }} log</span>
                    </h2>
                    @if ($askep->step_terakhir >= 4)
                        <a href="{{ route('askep.implementasi', $askep) }}" wire:navigate class="ml-auto text-xs text-[#2E86C1] hover:underline">Lihat Detail</a>
                    @endif
                </div>
                <div class="px-6 py-4">
                    <p class="text-sm text-[#7A8FA6]">Total <strong class="text-[#1B4F72]">{{ $totalImpl }} log tindakan</strong> telah dicatat.</p>
                </div>
            </div>
        @endif

    </div>

    {{-- Footer Actions --}}
    <div class="mt-6 flex items-center justify-between">
        <flux:button :href="route('pasien.show', $askep->pasien_id)" variant="ghost" icon="arrow-left" wire:navigate>
            Kembali ke Pasien
        </flux:button>

        @if ($askep->isDraft() || $askep->status === \App\Models\Askep::STATUS_PERLU_REVISI)
            <a
                href="{{ $askep->nextStepUrl() }}"
                wire:navigate
                class="inline-flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold text-white"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <flux:icon.arrow-right class="size-4" />
                Lanjutkan Pengerjaan
            </a>
        @endif
    </div>
</div>
