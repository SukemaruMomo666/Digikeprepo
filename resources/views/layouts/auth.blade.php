@props(['title' => 'DIGIKEP'])

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-full">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>{{ $title }} — DIGIKEP</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @fluxAppearance
</head>
<body class="h-full antialiased">

<div class="flex min-h-screen">

    {{-- ── Left branding panel (desktop only) ────────────────────────────────── --}}
    <div class="relative hidden w-[52%] flex-col overflow-hidden lg:flex"
         style="background: linear-gradient(145deg, #2E86C1 0%, #1B4F72 55%, #0A2D45 100%);">

        {{-- Decorative blobs --}}
        <div class="pointer-events-none absolute -top-24 -left-24 h-96 w-96 rounded-full bg-white/10 blur-3xl"></div>
        <div class="pointer-events-none absolute bottom-0 right-0 h-80 w-80 rounded-full bg-black/15 blur-3xl"></div>
        <div class="pointer-events-none absolute top-1/2 -right-12 h-56 w-56 rounded-full bg-white/10 blur-2xl"></div>

        {{-- Dot grid overlay --}}
        <div class="pointer-events-none absolute inset-0 opacity-[0.06]"
             style="background-image: radial-gradient(circle, #fff 1.2px, transparent 1.2px); background-size: 28px 28px;"></div>

        {{-- Content --}}
        <div class="relative z-10 flex flex-1 flex-col justify-between p-10 xl:p-14">

            {{-- Top logo --}}
            <div class="flex items-center gap-3">
                <div class="flex size-11 items-center justify-center rounded-xl bg-white/20 backdrop-blur-sm">
                    <svg class="size-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                    </svg>
                </div>
                <div>
                    <p class="text-xl font-extrabold tracking-tight text-white">DIGIKEP</p>
                    <p class="text-xs font-medium text-white/70">Politeknik Negeri Subang</p>
                </div>
            </div>

            {{-- Hero copy --}}
            <div class="space-y-5">
                <div>
                    <h1 class="text-4xl font-extrabold leading-tight text-white xl:text-5xl">
                        Digital<br>Asuhan<br>Keperawatan
                    </h1>
                    <p class="mt-4 text-base leading-relaxed text-white/80">
                        Platform dokumentasi keperawatan berbasis standar <strong class="text-white">SDKI · SLKI · SIKI</strong>
                        untuk mahasiswa keperawatan Politeknik Negeri Subang.
                    </p>
                </div>

                {{-- Feature list --}}
                <ul class="space-y-3">
                    @foreach ([
                        ['icon' => 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2', 'text' => 'Terstandar SDKI, SLKI & SIKI resmi'],
                        ['icon' => 'M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z', 'text' => 'Dokumentasi 5 tahap asuhan keperawatan'],
                        ['icon' => 'M13 10V3L4 14h7v7l9-11h-7z', 'text' => 'Akses cepat, aman & real-time'],
                    ] as $f)
                        <li class="flex items-center gap-3">
                            <span class="flex size-8 shrink-0 items-center justify-center rounded-lg bg-white/15">
                                <svg class="size-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="{{ $f['icon'] }}" />
                                </svg>
                            </span>
                            <span class="text-sm font-medium text-white/90">{{ $f['text'] }}</span>
                        </li>
                    @endforeach
                </ul>
            </div>

            {{-- Bottom badge --}}
            <div class="flex items-center gap-2 rounded-xl bg-white/10 px-4 py-3 backdrop-blur-sm">
                <svg class="size-5 text-white/80" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                </svg>
                <p class="text-xs text-white/80">Akses dibatasi hanya untuk civitas akademika Polsub</p>
            </div>
        </div>
    </div>

    {{-- ── Right form panel ────────────────────────────────────────────────────── --}}
    <div class="flex flex-1 flex-col items-center justify-center bg-[#F4F8FB] px-6 py-12 dark:bg-zinc-900 sm:px-10 lg:px-16 xl:px-24">

        {{-- Mobile logo (only visible when left panel hidden) --}}
        <div class="mb-8 flex flex-col items-center gap-2 lg:hidden">
            <div class="flex size-14 items-center justify-center rounded-2xl shadow-primary"
                 style="background: linear-gradient(135deg, #2E86C1, #1B4F72)">
                <svg class="size-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                </svg>
            </div>
            <p class="text-lg font-extrabold text-[#1B4F72] dark:text-white">DIGIKEP</p>
            <p class="text-xs text-[#7A8FA6] dark:text-zinc-400">Politeknik Negeri Subang</p>
        </div>

        {{-- Form card --}}
        <div class="w-full max-w-md">
            {{ $slot }}
        </div>

        {{-- Footer note --}}
        <p class="mt-8 text-center text-xs text-[#7A8FA6] dark:text-zinc-600">
            © {{ date('Y') }} Politeknik Negeri Subang · DIGIKEP
        </p>
    </div>

</div>

@fluxScripts
</body>
</html>
