<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="dark">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-white antialiased dark:bg-zinc-950">

        {{-- Navbar --}}
        <header class="fixed top-0 inset-x-0 z-50 border-b border-zinc-200/60 bg-white/80 backdrop-blur dark:border-zinc-800/60 dark:bg-zinc-950/80">
            <div class="mx-auto flex h-14 max-w-6xl items-center justify-between px-4 sm:px-6">
                <a href="{{ route('home') }}" class="flex items-center gap-2">
                    <div class="flex size-7 items-center justify-center rounded-md bg-blue-600">
                        <svg class="size-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                        </svg>
                    </div>
                    <span class="font-bold text-zinc-900 dark:text-white">DIGIKEP</span>
                </a>
                <nav class="flex items-center gap-2">
                    @auth
                        <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}"
                            class="rounded-lg px-4 py-1.5 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-zinc-800 transition-colors">
                            Dashboard
                        </a>
                    @else
                        <a href="{{ route('login') }}"
                            class="rounded-lg px-4 py-1.5 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-zinc-800 transition-colors">
                            Masuk
                        </a>
                    @endauth
                </nav>
            </div>
        </header>

        {{-- Hero --}}
        <main>
            <section class="relative flex min-h-screen flex-col items-center justify-center px-4 pt-14 text-center">
                {{-- Background blur decorations --}}
                <div class="pointer-events-none absolute inset-0 overflow-hidden">
                    <div class="absolute -top-40 left-1/2 -translate-x-1/2 size-[600px] rounded-full bg-blue-500/10 blur-3xl dark:bg-blue-500/5"></div>
                    <div class="absolute bottom-0 right-1/4 size-[400px] rounded-full bg-violet-500/10 blur-3xl dark:bg-violet-500/5"></div>
                </div>

                <div class="relative max-w-3xl">
                    <span class="mb-4 inline-flex items-center gap-1.5 rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-medium text-blue-700 dark:border-blue-800 dark:bg-blue-950 dark:text-blue-300">
                        <svg class="size-3" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"/></svg>
                        Politeknik Negeri Subang
                    </span>

                    <h1 class="mt-2 text-5xl font-bold tracking-tight text-zinc-900 dark:text-white sm:text-6xl">
                        Digital
                        <span class="bg-gradient-to-r from-blue-600 to-violet-600 bg-clip-text text-transparent">
                            Asuhan
                        </span>
                        Keperawatan
                    </h1>

                    <p class="mt-6 text-lg text-zinc-600 dark:text-zinc-400 max-w-xl mx-auto">
                        Platform panduan Asuhan Keperawatan digital berbasis SDKI, SLKI, dan SIKI
                        untuk mahasiswa keperawatan Politeknik Negeri Subang.
                    </p>

                    <div class="mt-8 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
                        @auth
                            <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}"
                                class="inline-flex items-center gap-2 rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white shadow-md hover:bg-blue-700 transition-colors">
                                Buka Dashboard
                                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                            </a>
                        @else
                            <a href="{{ route('login') }}"
                                class="inline-flex items-center gap-2 rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white shadow-md hover:bg-blue-700 transition-colors">
                                Mulai Sekarang
                                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                            </a>
                        @endauth
                    </div>
                </div>
            </section>

            {{-- Fitur --}}
            <section class="mx-auto max-w-6xl px-4 pb-24 sm:px-6">
                <div class="text-center mb-12">
                    <h2 class="text-2xl font-bold text-zinc-900 dark:text-white">Alur Asuhan Keperawatan</h2>
                    <p class="mt-2 text-zinc-500 dark:text-zinc-400">4 langkah sistematis sesuai standar nasional</p>
                </div>

                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    @foreach ([
                        ['step' => '1', 'color' => 'blue', 'icon' => 'M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z', 'label' => 'Pengkajian', 'desc' => '11 Pola Kesehatan Gordon untuk mengidentifikasi kondisi pasien secara menyeluruh'],
                        ['step' => '2', 'color' => 'violet', 'icon' => 'M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z', 'label' => 'Diagnosa SDKI', 'desc' => 'Penetapan diagnosa keperawatan berdasarkan Standar Diagnosa Keperawatan Indonesia'],
                        ['step' => '3', 'color' => 'emerald', 'icon' => 'M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z', 'label' => 'Luaran SLKI', 'desc' => 'Penetapan target luaran sesuai Standar Luaran Keperawatan Indonesia'],
                        ['step' => '4', 'color' => 'orange', 'icon' => 'M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z', 'label' => 'Intervensi SIKI', 'desc' => 'Rencana tindakan keperawatan dari Standar Intervensi Keperawatan Indonesia'],
                    ] as $item)
                        <div class="group relative rounded-2xl border border-zinc-200 bg-white p-6 dark:border-zinc-800 dark:bg-zinc-900 hover:border-{{ $item['color'] }}-300 dark:hover:border-{{ $item['color'] }}-700 transition-colors">
                            <div class="mb-4 flex items-center gap-3">
                                <div class="flex size-10 items-center justify-center rounded-xl
                                    @if($item['color'] === 'blue') bg-blue-100 dark:bg-blue-900/40 @endif
                                    @if($item['color'] === 'violet') bg-violet-100 dark:bg-violet-900/40 @endif
                                    @if($item['color'] === 'emerald') bg-emerald-100 dark:bg-emerald-900/40 @endif
                                    @if($item['color'] === 'orange') bg-orange-100 dark:bg-orange-900/40 @endif
                                ">
                                    <svg class="size-5
                                        @if($item['color'] === 'blue') text-blue-600 dark:text-blue-400 @endif
                                        @if($item['color'] === 'violet') text-violet-600 dark:text-violet-400 @endif
                                        @if($item['color'] === 'emerald') text-emerald-600 dark:text-emerald-400 @endif
                                        @if($item['color'] === 'orange') text-orange-600 dark:text-orange-400 @endif
                                    " fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="{{ $item['icon'] }}" />
                                    </svg>
                                </div>
                                <span class="text-xs font-semibold text-zinc-400 dark:text-zinc-600">LANGKAH {{ $item['step'] }}</span>
                            </div>
                            <h3 class="font-semibold text-zinc-900 dark:text-white">{{ $item['label'] }}</h3>
                            <p class="mt-1 text-sm text-zinc-500 dark:text-zinc-400">{{ $item['desc'] }}</p>
                        </div>
                    @endforeach
                </div>
            </section>
        </main>

        {{-- Footer --}}
        <footer class="border-t border-zinc-200 dark:border-zinc-800 py-6 text-center text-xs text-zinc-400 dark:text-zinc-600">
            &copy; {{ date('Y') }} DIGIKEP &bull; Politeknik Negeri Subang
        </footer>

        @fluxScripts
    </body>
</html>
