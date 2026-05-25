@php
    $steps = [
        1 => ['label' => 'Pengkajian',     'route' => 'pasien.pengkajian'],
        2 => ['label' => 'Diagnosa SDKI',  'route' => 'pasien.diagnosa'],
        3 => ['label' => 'Luaran SLKI',    'route' => 'pasien.luaran'],
        4 => ['label' => 'Intervensi SIKI','route' => 'pasien.intervensi'],
        5 => ['label' => 'Evaluasi',       'route' => 'pasien.evaluasi'],
    ];
@endphp

<nav class="flex items-center gap-1 overflow-x-auto rounded-xl bg-zinc-100 dark:bg-zinc-800 p-1.5">
    @foreach ($steps as $num => $s)
        @php
            $isCurrent  = $num === $step;
            $isDone     = $num < $step;
        @endphp
        <a href="{{ route($s['route'], $pasien) }}"
            wire:navigate
            class="flex flex-1 min-w-0 items-center justify-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium transition-colors
                @if ($isCurrent) bg-white dark:bg-zinc-900 shadow-sm text-blue-600 dark:text-blue-400
                @elseif ($isDone) text-green-600 dark:text-green-400 hover:bg-zinc-200 dark:hover:bg-zinc-700
                @else text-zinc-500 dark:text-zinc-400 hover:bg-zinc-200 dark:hover:bg-zinc-700
                @endif"
        >
            @if ($isDone)
                <flux:icon.check-circle class="size-4 shrink-0" />
            @else
                <span class="flex size-5 shrink-0 items-center justify-center rounded-full border text-xs
                    {{ $isCurrent ? 'border-blue-500 text-blue-600 dark:text-blue-400' : 'border-zinc-400' }}">
                    {{ $num }}
                </span>
            @endif
            <span class="truncate">{{ $s['label'] }}</span>
        </a>

        @if (! $loop->last)
            <flux:icon.chevron-right class="size-4 shrink-0 text-zinc-400" />
        @endif
    @endforeach
</nav>
