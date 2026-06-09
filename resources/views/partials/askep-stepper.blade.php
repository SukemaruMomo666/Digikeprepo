{{--
    Askep Stepper
    Props:
        $askep      — App\Models\Askep
        $step       — int (1–5) halaman saat ini
--}}
@php
    $steps = [
        1 => ['label' => 'Pengkajian',     'short' => 'P1', 'route' => 'askep.pengkajian'],
        2 => ['label' => 'Diagnosa',       'short' => 'P2', 'route' => 'askep.diagnosa'],
        3 => ['label' => 'Perencanaan',    'short' => 'P3', 'route' => 'askep.perencanaan'],
        4 => ['label' => 'Implementasi',   'short' => 'P4', 'route' => 'askep.implementasi'],
        5 => ['label' => 'Evaluasi',       'short' => 'P5', 'route' => 'askep.evaluasi'],
    ];
    $stepTerakhir = $askep->step_terakhir ?? 0;
@endphp

<nav class="mb-6 overflow-x-auto">
    {{-- Pasien info header --}}
    <div class="mb-3 flex items-center justify-between">
        <div class="flex items-center gap-2 text-sm text-[#7A8FA6]">
            <a href="{{ route('pasien.show', $askep->pasien_id) }}" wire:navigate class="hover:text-[#2E86C1]">
                <!-- {{ $askep->pasien->nama_pasien ?? 'Pasien' }} -->
                  {{ route('pasien.show', $askep->pasien_id) }}
            </a>
            <flux:icon.chevron-right class="size-3.5" />
            <span class="font-medium text-[#1B4F72]">
                {{ $steps[$step]['label'] ?? 'Askep' }}
            </span>
        </div>
        <span class="rounded-full px-2.5 py-0.5 text-xs font-semibold
            @if ($askep->status === 'selesai') bg-[#E1F5EE] text-[#0F6E56]
            @elseif ($askep->status === 'menunggu_review') bg-[#FEF3C7] text-amber-700
            @elseif ($askep->status === 'perlu_revisi') bg-[#FDE8E8] text-[#D95C3A]
            @else bg-[#EBF5FB] text-[#1B4F72]
            @endif">
            {{ $askep->statusLabel() }}
        </span>
    </div>

    {{-- Step pills --}}
    <div class="flex items-center rounded-xl bg-[#F4F8FB] p-1.5 gap-1">
        @foreach ($steps as $num => $s)
            @php
                $isCurrent  = $num === $step;
                $isDone     = $num <= $stepTerakhir;
                $isAccessible = $num <= $stepTerakhir + 1;
            @endphp

            @if ($isAccessible)
                <a href="{{ route($s['route'], $askep) }}"
                    wire:navigate
                    class="flex flex-1 min-w-0 items-center justify-center gap-1.5 rounded-lg px-2 py-2 text-sm font-medium transition-colors
                        @if ($isCurrent) bg-white shadow-sm text-[#2E86C1] ring-1 ring-[#85B7EB]/50
                        @elseif ($isDone) text-[#1A9B72] hover:bg-white/60
                        @else text-[#7A8FA6] hover:bg-white/60
                        @endif"
                >
            @else
                <span class="flex flex-1 min-w-0 items-center justify-center gap-1.5 rounded-lg px-2 py-2 text-sm font-medium text-[#C4D3DF] cursor-not-allowed">
            @endif
                    @if ($isDone && !$isCurrent)
                        <flux:icon.check-circle class="size-4 shrink-0 text-[#1A9B72]" />
                    @else
                        <span class="flex size-5 shrink-0 items-center justify-center rounded-full text-xs font-bold border
                            @if ($isCurrent) border-[#2E86C1] text-[#2E86C1] bg-[#EBF5FB]
                            @elseif (!$isAccessible) border-[#D0DCE8] text-[#C4D3DF]
                            @else border-[#85B7EB] text-[#7A8FA6]
                            @endif">
                            {{ $num }}
                        </span>
                    @endif
                    <span class="hidden sm:inline truncate">{{ $s['label'] }}</span>
                    <span class="sm:hidden truncate">{{ $s['short'] }}</span>
            @if ($isAccessible)
                </a>
            @else
                </span>
            @endif

            @if (!$loop->last)
                <flux:icon.chevron-right class="size-3.5 shrink-0 text-[#C4D3DF]" />
            @endif
        @endforeach
    </div>
</nav>
