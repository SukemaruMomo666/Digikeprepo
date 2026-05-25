<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.head')
        <style>
            .hero-grid {
                background-image:
                    linear-gradient(rgba(243,156,18,0.06) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(243,156,18,0.06) 1px, transparent 1px);
                background-size: 40px 40px;
            }
        </style>
    </head>
    <body class="bg-white antialiased">

        {{-- ═══════════════════════════════════════
             NAVBAR
        ═══════════════════════════════════════ --}}
        <header
            x-data="{ scrolled: false }"
            x-on:scroll.window="scrolled = window.scrollY > 20"
            :class="scrolled ? 'shadow-sm border-b border-gray-100' : 'border-b border-transparent'"
            class="fixed inset-x-0 top-0 z-50 bg-white/95 backdrop-blur transition-all duration-200"
        >
            <div class="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
                {{-- Logo --}}
                <a href="{{ route('home') }}" class="flex items-center gap-2.5">
                    <div class="flex size-9 items-center justify-center rounded-xl bg-gradient-polsub shadow-polsub">
                        <svg class="size-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z" />
                        </svg>
                    </div>
                    <div>
                        <p class="text-sm font-bold leading-none text-gray-900">DIGIKEP</p>
                        <p class="text-[10px] leading-none text-gray-400">Nursing Care System</p>
                    </div>
                </a>

                {{-- Nav Links --}}
                <nav class="hidden items-center gap-6 md:flex">
                    <a href="#fitur" class="text-sm font-medium text-gray-600 hover:text-polsub transition-colors">Fitur</a>
                    <a href="#langkah" class="text-sm font-medium text-gray-600 hover:text-polsub transition-colors">Alur Kerja</a>
                    <a href="#tentang" class="text-sm font-medium text-gray-600 hover:text-polsub transition-colors">Tentang</a>
                </nav>

                {{-- CTA --}}
                <div class="flex items-center gap-2">
                    @auth
                        <a
                            href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}"
                            class="inline-flex items-center gap-1.5 rounded-xl bg-gradient-polsub px-4 py-2 text-sm font-semibold text-white shadow-polsub transition-all hover:shadow-polsub-lg"
                        >
                            Buka Dashboard
                            <svg class="size-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                        </a>
                    @else
                        <a href="{{ route('login') }}" class="text-sm font-medium text-gray-600 hover:text-polsub transition-colors px-3 py-2">
                            Masuk
                        </a>
                        <a
                            href="{{ route('login') }}"
                            class="inline-flex items-center gap-1.5 rounded-xl bg-gradient-polsub px-4 py-2 text-sm font-semibold text-white shadow-polsub transition-all hover:shadow-polsub-lg"
                        >
                            Mulai Sekarang
                        </a>
                    @endauth
                </div>
            </div>
        </header>

        <main>
            {{-- ═══════════════════════════════════════
                 HERO
            ═══════════════════════════════════════ --}}
            <section class="hero-grid relative overflow-hidden pt-16">
                {{-- Decorative blobs --}}
                <div class="pointer-events-none absolute inset-0">
                    <div class="absolute -top-32 left-1/2 -translate-x-1/2 size-[700px] rounded-full bg-orange-400/10 blur-3xl"></div>
                    <div class="absolute top-1/2 -right-40 size-[400px] rounded-full bg-amber-300/15 blur-3xl"></div>
                </div>

                <div class="relative mx-auto max-w-6xl px-4 py-24 sm:px-6 sm:py-32 text-center">
                    {{-- Badge --}}
                    <div class="mb-6 inline-flex items-center gap-2 rounded-full border border-orange-200 bg-orange-50 px-4 py-1.5">
                        <div class="size-1.5 rounded-full bg-polsub animate-pulse"></div>
                        <span class="text-xs font-semibold text-polsub">Politeknik Negeri Subang — Jurusan Kesehatan</span>
                    </div>

                    {{-- Headline --}}
                    <h1 class="mx-auto max-w-4xl text-4xl font-extrabold tracking-tight text-gray-900 sm:text-6xl lg:text-7xl">
                        Dokumentasi Asuhan
                        <br />
                        <span class="bg-gradient-to-r from-[#f39c12] to-[#e67e22] bg-clip-text text-transparent">
                            Keperawatan Digital
                        </span>
                    </h1>

                    {{-- Subtitle --}}
                    <p class="mx-auto mt-6 max-w-2xl text-lg text-gray-500 sm:text-xl">
                        Platform panduan <strong class="text-gray-700 font-semibold">SDKI · SLKI · SIKI</strong> untuk mahasiswa keperawatan.
                        Buat, kelola, dan cetak dokumentasi askep secara sistematis dan terstandar.
                    </p>

                    {{-- CTA Buttons --}}
                    <div class="mt-10 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
                        @auth
                            <a
                                href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}"
                                class="inline-flex items-center gap-2 rounded-2xl bg-gradient-polsub px-8 py-3.5 text-base font-semibold text-white shadow-polsub-lg transition-all hover:scale-[1.02]"
                            >
                                Buka Dashboard
                                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                            </a>
                        @else
                            <a
                                href="{{ route('login') }}"
                                class="inline-flex items-center gap-2 rounded-2xl bg-gradient-polsub px-8 py-3.5 text-base font-semibold text-white shadow-polsub-lg transition-all hover:scale-[1.02]"
                            >
                                Mulai Sekarang — Gratis
                                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                            </a>
                            <a href="#langkah" class="inline-flex items-center gap-2 rounded-2xl border border-gray-200 bg-white px-8 py-3.5 text-base font-semibold text-gray-700 shadow-sm transition-all hover:border-orange-300 hover:text-polsub">
                                Pelajari Caranya
                            </a>
                        @endauth
                    </div>

                    {{-- Trust badges --}}
                    <div class="mt-12 flex flex-wrap items-center justify-center gap-6 text-sm text-gray-400">
                        <div class="flex items-center gap-1.5">
                            <svg class="size-4 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"/></svg>
                            Berbasis standar PPNI
                        </div>
                        <div class="flex items-center gap-1.5">
                            <svg class="size-4 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"/></svg>
                            Panduan 11 Pola Gordon
                        </div>
                        <div class="flex items-center gap-1.5">
                            <svg class="size-4 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"/></svg>
                            5 Tahap Asuhan Keperawatan
                        </div>
                        <div class="flex items-center gap-1.5">
                            <svg class="size-4 text-emerald-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"/></svg>
                            Login dengan NIM
                        </div>
                    </div>
                </div>
            </section>

            {{-- ═══════════════════════════════════════
                 STATS BAR
            ═══════════════════════════════════════ --}}
            <section class="border-y border-gray-100 bg-gray-50">
                <div class="mx-auto max-w-6xl px-4 py-10 sm:px-6">
                    <div class="grid grid-cols-2 gap-8 md:grid-cols-4">
                        @foreach ([
                            ['value' => '10', 'label' => 'Diagnosa SDKI', 'icon' => 'M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z'],
                            ['value' => '10', 'label' => 'Luaran SLKI', 'icon' => 'M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z'],
                            ['value' => '10', 'label' => 'Intervensi SIKI', 'icon' => 'M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z'],
                            ['value' => '11', 'label' => 'Pola Kesehatan Gordon', 'icon' => 'M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z'],
                        ] as $stat)
                            <div class="text-center">
                                <div class="mx-auto mb-3 flex size-12 items-center justify-center rounded-xl bg-orange-50">
                                    <svg class="size-6 text-polsub" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="{{ $stat['icon'] }}" />
                                    </svg>
                                </div>
                                <div class="text-3xl font-extrabold text-gray-900">{{ $stat['value'] }}+</div>
                                <div class="mt-1 text-sm text-gray-500">{{ $stat['label'] }}</div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>

            {{-- ═══════════════════════════════════════
                 FITUR UTAMA
            ═══════════════════════════════════════ --}}
            <section id="fitur" class="py-24">
                <div class="mx-auto max-w-6xl px-4 sm:px-6">
                    {{-- Section header --}}
                    <div class="mx-auto max-w-2xl text-center">
                        <span class="inline-block rounded-full bg-orange-50 px-4 py-1.5 text-xs font-semibold uppercase tracking-widest text-polsub">Fitur Unggulan</span>
                        <h2 class="mt-4 text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                            Semua yang Anda butuhkan<br class="hidden sm:block" /> ada di satu tempat
                        </h2>
                        <p class="mt-4 text-gray-500">
                            DIGIKEP dirancang khusus untuk memudahkan mahasiswa keperawatan membuat dokumentasi askep yang lengkap dan terstandar.
                        </p>
                    </div>

                    <div class="mt-16 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
                        @foreach ([
                            [
                                'icon' => 'M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z',
                                'color' => 'orange',
                                'title' => 'Manajemen Pasien',
                                'desc' => 'Input dan kelola data pasien dengan mudah. Setiap pasien memiliki rekam medis digital yang lengkap dan terorganisir.'
                            ],
                            [
                                'icon' => 'M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z',
                                'color' => 'violet',
                                'title' => 'Pengkajian 11 Pola Gordon',
                                'desc' => 'Panduan pengkajian terstruktur menggunakan 11 Pola Fungsional Gordon. Identifikasi data subjektif dan objektif pasien secara komprehensif.'
                            ],
                            [
                                'icon' => 'M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z',
                                'color' => 'red',
                                'title' => 'Diagnosa SDKI',
                                'desc' => 'Pilih diagnosa keperawatan dari basis data SDKI yang lengkap. Sistem membantu mencocokkan diagnosa dengan data pengkajian.'
                            ],
                            [
                                'icon' => 'M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z',
                                'color' => 'emerald',
                                'title' => 'Luaran SLKI',
                                'desc' => 'Tetapkan target luaran keperawatan berdasarkan SLKI yang telah dipetakan sesuai diagnosa. Kriteria hasil sudah tersedia.'
                            ],
                            [
                                'icon' => 'M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z',
                                'color' => 'amber',
                                'title' => 'Intervensi SIKI',
                                'desc' => 'Rencana intervensi keperawatan dari database SIKI yang sudah dipetakan. Tindakan observasi, terapeutik, edukasi, dan kolaborasi tersedia lengkap.'
                            ],
                            [
                                'icon' => 'M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z',
                                'color' => 'blue',
                                'title' => 'Cetak Dokumen',
                                'desc' => 'Ekspor dokumentasi askep menjadi dokumen yang siap dicetak atau dikumpulkan. Format rapi dan profesional sesuai standar akademik.'
                            ],
                            [
                                'icon' => 'M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z',
                                'color' => 'teal',
                                'title' => 'Evaluasi Keperawatan',
                                'desc' => 'Evaluasi pencapaian luaran SLKI per diagnosa — tercapai, tercapai sebagian, atau belum tercapai — lengkap dengan catatan perkembangan pasien.'
                            ],
                        ] as $fitur)
                            @php
                                $colors = [
                                    'orange' => ['bg' => 'bg-orange-50', 'icon' => 'text-polsub', 'border' => 'border-orange-200', 'hover' => 'hover:border-orange-300'],
                                    'violet' => ['bg' => 'bg-violet-50', 'icon' => 'text-violet-600', 'border' => 'border-violet-200', 'hover' => 'hover:border-violet-300'],
                                    'red'    => ['bg' => 'bg-red-50',    'icon' => 'text-red-600',    'border' => 'border-red-200',    'hover' => 'hover:border-red-300'],
                                    'emerald'=> ['bg' => 'bg-emerald-50','icon' => 'text-emerald-600','border' => 'border-emerald-200','hover' => 'hover:border-emerald-300'],
                                    'amber'  => ['bg' => 'bg-amber-50',  'icon' => 'text-amber-600',  'border' => 'border-amber-200',  'hover' => 'hover:border-amber-300'],
                                    'blue'   => ['bg' => 'bg-blue-50',   'icon' => 'text-blue-600',   'border' => 'border-blue-200',   'hover' => 'hover:border-blue-300'],
                                    'teal'   => ['bg' => 'bg-teal-50',   'icon' => 'text-teal-600',   'border' => 'border-teal-200',   'hover' => 'hover:border-teal-300'],
                                ];
                                $c = $colors[$fitur['color']];
                            @endphp
                            <div class="group rounded-2xl border {{ $c['border'] }} bg-white p-6 transition-all duration-200 {{ $c['hover'] }} hover:shadow-md">
                                <div class="mb-4 flex size-12 items-center justify-center rounded-xl {{ $c['bg'] }}">
                                    <svg class="size-6 {{ $c['icon'] }}" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="{{ $fitur['icon'] }}" />
                                    </svg>
                                </div>
                                <h3 class="mb-2 font-semibold text-gray-900">{{ $fitur['title'] }}</h3>
                                <p class="text-sm leading-relaxed text-gray-500">{{ $fitur['desc'] }}</p>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>

            {{-- ═══════════════════════════════════════
                 ALUR KERJA (HOW IT WORKS)
            ═══════════════════════════════════════ --}}
            <section id="langkah" class="bg-gray-50 py-24">
                <div class="mx-auto max-w-6xl px-4 sm:px-6">
                    <div class="mx-auto max-w-2xl text-center">
                        <span class="inline-block rounded-full bg-orange-50 px-4 py-1.5 text-xs font-semibold uppercase tracking-widest text-polsub">Alur Kerja</span>
                        <h2 class="mt-4 text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                            5 Tahap Asuhan Keperawatan
                        </h2>
                        <p class="mt-4 text-gray-500">Mengikuti standar nasional PPNI — dari pengkajian hingga evaluasi secara digital.</p>
                    </div>

                    <div class="mt-16 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-5">
                        @foreach ([
                            [
                                'step' => '01',
                                'title' => 'Pengkajian',
                                'desc' => 'Catat data subjektif & objektif pasien berdasarkan 11 Pola Fungsional Kesehatan Gordon secara sistematis.',
                                'icon' => 'M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z',
                                'active' => true,
                            ],
                            [
                                'step' => '02',
                                'title' => 'Diagnosa SDKI',
                                'desc' => 'Pilih diagnosa keperawatan dari Standar Diagnosa Keperawatan Indonesia yang sesuai kondisi pasien.',
                                'icon' => 'M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z',
                                'active' => false,
                            ],
                            [
                                'step' => '03',
                                'title' => 'Luaran SLKI',
                                'desc' => 'Tentukan target luaran keperawatan dari SLKI berdasarkan diagnosa yang dipilih beserta kriteria hasilnya.',
                                'icon' => 'M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z',
                                'active' => false,
                            ],
                            [
                                'step' => '04',
                                'title' => 'Intervensi SIKI',
                                'desc' => 'Susun rencana tindakan keperawatan dari SIKI — observasi, terapeutik, edukasi, dan kolaborasi.',
                                'icon' => 'M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z',
                                'active' => false,
                            ],
                            [
                                'step' => '05',
                                'title' => 'Evaluasi',
                                'desc' => 'Evaluasi pencapaian luaran keperawatan — tercapai, tercapai sebagian, atau belum tercapai — dan selesaikan dokumentasi.',
                                'icon' => 'M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z',
                                'active' => false,
                            ],
                        ] as $i => $langkah)
                            <div class="relative">
                                {{-- Connector line --}}
                                @if ($i < 4)
                                    <div class="absolute top-8 left-1/2 hidden h-0.5 w-full bg-gray-200 lg:block"></div>
                                @endif

                                <div class="relative flex flex-col items-center text-center">
                                    <div class="relative z-10 flex size-16 items-center justify-center rounded-2xl {{ $langkah['active'] ? 'bg-gradient-polsub shadow-polsub' : 'border-2 border-gray-200 bg-white' }}">
                                        <svg class="size-7 {{ $langkah['active'] ? 'text-white' : 'text-gray-400' }}" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="{{ $langkah['icon'] }}" />
                                        </svg>
                                    </div>
                                    <div class="mt-4">
                                        <span class="text-xs font-bold uppercase tracking-widest text-polsub">Langkah {{ $langkah['step'] }}</span>
                                        <h3 class="mt-1 text-base font-bold text-gray-900">{{ $langkah['title'] }}</h3>
                                        <p class="mt-2 text-sm leading-relaxed text-gray-500">{{ $langkah['desc'] }}</p>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>

            {{-- ═══════════════════════════════════════
                 TENTANG / INSTITUSI
            ═══════════════════════════════════════ --}}
            <section id="tentang" class="py-24">
                <div class="mx-auto max-w-6xl px-4 sm:px-6">
                    <div class="overflow-hidden rounded-3xl bg-gradient-polsub shadow-polsub-lg">
                        <div class="grid grid-cols-1 gap-0 lg:grid-cols-2">
                            {{-- Text --}}
                            <div class="p-10 lg:p-14">
                                <span class="inline-block rounded-full bg-white/20 px-4 py-1.5 text-xs font-semibold uppercase tracking-widest text-white">
                                    Tentang DIGIKEP
                                </span>
                                <h2 class="mt-6 text-3xl font-extrabold text-white sm:text-4xl">
                                    Solusi Digital untuk<br />Jurusan Kesehatan
                                </h2>
                                <p class="mt-4 text-base leading-relaxed text-white/80">
                                    DIGIKEP adalah sistem informasi asuhan keperawatan yang dikembangkan untuk mendukung proses pembelajaran mahasiswa
                                    di Jurusan Kesehatan Politeknik Negeri Subang.
                                </p>
                                <p class="mt-4 text-base leading-relaxed text-white/80">
                                    Dengan mengintegrasikan standar SDKI, SLKI, dan SIKI dari PPNI, mahasiswa dapat belajar menyusun dokumentasi askep
                                    yang benar, terstruktur, dan siap dikumpulkan.
                                </p>
                                <div class="mt-8">
                                    <a
                                        href="{{ route('login') }}"
                                        class="inline-flex items-center gap-2 rounded-xl bg-white px-6 py-3 text-sm font-semibold text-polsub shadow-sm transition-all hover:shadow-md"
                                    >
                                        Masuk ke Sistem
                                        <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                                    </a>
                                </div>
                            </div>

                            {{-- Info cards --}}
                            <div class="flex items-center justify-center bg-white/10 p-10 lg:p-14">
                                <div class="grid grid-cols-2 gap-4 w-full">
                                    @foreach ([
                                        ['label' => 'Standar SDKI', 'sub' => 'Standar Diagnosa Keperawatan Indonesia', 'icon' => '📋'],
                                        ['label' => 'Standar SLKI', 'sub' => 'Standar Luaran Keperawatan Indonesia', 'icon' => '🎯'],
                                        ['label' => 'Standar SIKI', 'sub' => 'Standar Intervensi Keperawatan Indonesia', 'icon' => '⚕️'],
                                        ['label' => 'Pola Gordon', 'sub' => '11 Pola Fungsional Kesehatan', 'icon' => '🩺'],
                                    ] as $info)
                                        <div class="rounded-2xl bg-white/15 p-4 backdrop-blur">
                                            <div class="text-2xl mb-2">{{ $info['icon'] }}</div>
                                            <p class="text-sm font-bold text-white">{{ $info['label'] }}</p>
                                            <p class="text-xs text-white/70 mt-0.5">{{ $info['sub'] }}</p>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {{-- ═══════════════════════════════════════
                 FINAL CTA
            ═══════════════════════════════════════ --}}
            <section class="bg-gray-50 py-20">
                <div class="mx-auto max-w-3xl px-4 text-center sm:px-6">
                    <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                        Siap memulai dokumentasi<br />askep digital?
                    </h2>
                    <p class="mx-auto mt-4 max-w-xl text-gray-500">
                        Masuk menggunakan NIM Anda dan mulai buat dokumentasi asuhan keperawatan yang terstandar hari ini.
                    </p>
                    <div class="mt-8 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
                        @auth
                            <a
                                href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}"
                                class="inline-flex items-center gap-2 rounded-2xl bg-gradient-polsub px-8 py-3.5 text-base font-semibold text-white shadow-polsub-lg transition-all hover:scale-[1.02]"
                            >
                                Buka Dashboard Saya
                            </a>
                        @else
                            <a
                                href="{{ route('login') }}"
                                class="inline-flex items-center gap-2 rounded-2xl bg-gradient-polsub px-8 py-3.5 text-base font-semibold text-white shadow-polsub-lg transition-all hover:scale-[1.02]"
                            >
                                Masuk Sekarang
                                <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"/></svg>
                            </a>
                            <p class="text-sm text-gray-400">Gunakan NIM Anda untuk masuk. Hubungi admin jika belum punya akun.</p>
                        @endauth
                    </div>
                </div>
            </section>
        </main>

        {{-- ═══════════════════════════════════════
             FOOTER
        ═══════════════════════════════════════ --}}
        <footer class="border-t border-gray-100 bg-white">
            <div class="mx-auto max-w-6xl px-4 py-10 sm:px-6">
                <div class="flex flex-col items-center justify-between gap-6 sm:flex-row">
                    {{-- Brand --}}
                    <div class="flex items-center gap-2.5">
                        <div class="flex size-8 items-center justify-center rounded-xl bg-gradient-polsub shadow-polsub">
                            <svg class="size-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75m-3-7.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285z" />
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm font-bold text-gray-900">DIGIKEP</p>
                            <p class="text-xs text-gray-400">Jurusan Kesehatan · Politeknik Negeri Subang</p>
                        </div>
                    </div>

                    {{-- Nav --}}
                    <nav class="flex items-center gap-6">
                        <a href="#fitur" class="text-sm text-gray-500 hover:text-polsub transition-colors">Fitur</a>
                        <a href="#langkah" class="text-sm text-gray-500 hover:text-polsub transition-colors">Alur Kerja</a>
                        <a href="#tentang" class="text-sm text-gray-500 hover:text-polsub transition-colors">Tentang</a>
                        <a href="{{ route('login') }}" class="text-sm text-gray-500 hover:text-polsub transition-colors">Masuk</a>
                    </nav>

                    {{-- Copyright --}}
                    <p class="text-sm text-gray-400">&copy; {{ date('Y') }} DIGIKEP</p>
                </div>
            </div>
        </footer>

        @fluxScripts
    </body>
</html>
