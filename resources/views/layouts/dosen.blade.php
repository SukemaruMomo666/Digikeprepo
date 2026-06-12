<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-[#F4F8FB] dark:bg-zinc-900">
        {{-- Deep teal sidebar for Dosen --}}
        <flux:sidebar sticky collapsible="mobile"
            class="dark border-e-0 bg-[#0F6E56] dark:bg-[#0A2D25]"
            style="--sidebar-width: 240px"
        >
            <flux:sidebar.header>
                <div class="flex items-center gap-2.5 px-1 py-1">
                    {{-- Logo Polsub --}}
                    <div class="flex size-9 shrink-0 items-center justify-center rounded-xl bg-white/20 backdrop-blur-sm overflow-hidden">
                        @if (file_exists(public_path('images/logo-polsub.png')))
                            <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Polsub" class="size-7 object-contain" />
                        @else
                            <flux:icon.shield-check class="size-5 text-white" />
                        @endif
                    </div>
                    <div>
                        <p class="text-sm font-bold leading-tight text-white">DIGIKEP</p>
                        <p class="text-[10px] leading-tight text-white/60">Panel Dosen Pembimbing</p>
                    </div>
                </div>
                <flux:sidebar.collapse class="lg:hidden text-white/70 hover:bg-white/10" />
            </flux:sidebar.header>

            <flux:sidebar.nav>
                {{-- ── Menu Utama ── --}}
                <flux:sidebar.item
                    icon="home"
                    :href="route('dosen.dashboard')"
                    :current="request()->routeIs('dosen.dashboard')"
                    wire:navigate
                >
                    Beranda
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="academic-cap"
                    :href="route('dosen.mahasiswa.index')"
                    :current="request()->routeIs('dosen.mahasiswa.*')"
                    wire:navigate
                >
                    Daftar Mahasiswa
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="clipboard-document-check"
                    :href="route('dosen.askep.index')"
                    :current="request()->routeIs('dosen.askep.*')"
                    wire:navigate
                >
                    Review Askep
                    @php
                        $mhsIds = \App\Models\Penugasan::where('dosen_id', auth()->id())->pluck('mahasiswa_id')->all();
                        $countPending = \App\Models\Askep::whereIn('user_id', $mhsIds)
                            ->where('status', \App\Models\Askep::STATUS_MENUNGGU_REVIEW)
                            ->count();
                    @endphp
                    @if ($countPending > 0)
                        <flux:badge size="sm" color="amber" inset="top bottom">{{ $countPending }}</flux:badge>
                    @endif
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="chart-bar"
                    :href="route('dosen.monitoring.index')"
                    :current="request()->routeIs('dosen.monitoring.*')"
                    wire:navigate
                >
                    Monitoring
                </flux:sidebar.item>

                {{-- ── Separator ── --}}
                <div class="mx-3 my-1 border-t border-white/10"></div>

                {{-- ── Bantuan ── --}}
                <flux:sidebar.item
                    icon="question-mark-circle"
                    :href="route('faq.index')"
                    wire:navigate
                >
                    Pusat Bantuan
                </flux:sidebar.item>
            </flux:sidebar.nav>

            <flux:spacer />

            {{-- Desktop user profile --}}
            <x-desktop-user-menu class="hidden lg:block" :name="auth()->user()->name" />
        </flux:sidebar>

        {{-- Mobile Header --}}
        <flux:header class="lg:hidden border-b-0 bg-[#0F6E56] shadow-primary">
            <flux:sidebar.toggle class="lg:hidden text-white hover:bg-white/20" icon="bars-2" inset="left" />
            <div class="flex items-center gap-2 ms-2">
                <div class="flex size-7 shrink-0 items-center justify-center rounded-lg bg-white/20 overflow-hidden">
                    @if (file_exists(public_path('images/logo-polsub.png')))
                        <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Polsub" class="size-5 object-contain" />
                    @else
                        <flux:icon.shield-check class="size-4 text-white" />
                    @endif
                </div>
                <span class="text-sm font-bold text-white">DIGIKEP</span>
            </div>
            <flux:spacer />
            <flux:dropdown position="top" align="end">
                <flux:profile :initials="auth()->user()->initials()" icon-trailing="chevron-down" class="text-white" />
                <flux:menu>
                    <div class="px-3 py-2">
                        <p class="text-sm font-medium">{{ auth()->user()->name }}</p>
                        <p class="text-xs text-zinc-500">NIP: {{ auth()->user()->nim_nip }}</p>
                    </div>
                    <flux:menu.separator />
                    <form method="POST" action="{{ route('logout') }}" class="w-full">
                        @csrf
                        <flux:menu.item as="button" type="submit" icon="arrow-right-start-on-rectangle" class="w-full cursor-pointer">
                            Keluar
                        </flux:menu.item>
                    </form>
                </flux:menu>
            </flux:dropdown>
        </flux:header>

        {{-- Desktop Topbar --}}
        <div class="sticky top-0 z-40 hidden items-center justify-between border-b border-[#E0EBF5] bg-white px-6 py-3 dark:border-zinc-700 dark:bg-zinc-900 lg:flex">
            {{-- Title/Breadcrumbs --}}
            <div>
                <flux:heading size="lg">{{ $title ?? 'Dashboard Dosen' }}</flux:heading>
            </div>

            {{-- Right side actions --}}
            <div class="flex items-center gap-2">
                <button class="flex size-9 items-center justify-center rounded-full border border-[#E0EBF5] bg-white text-[#7A8FA6] transition-colors hover:bg-[#EBF5FB] hover:text-[#0F6E56] dark:border-zinc-700 dark:bg-zinc-800">
                    <flux:icon.bell class="size-5" />
                </button>

                <div class="mx-1 h-6 w-px bg-[#E0EBF5] dark:bg-zinc-700"></div>

                {{-- User dropdown --}}
                <flux:dropdown position="bottom" align="end">
                    <button class="flex items-center gap-2.5 rounded-xl px-2 py-1.5 transition-colors hover:bg-[#EBF5FB] dark:hover:bg-zinc-800">
                        <div class="text-right">
                            <p class="text-sm font-semibold text-[#0F6E56] dark:text-white">{{ auth()->user()->name }}</p>
                            <p class="text-xs text-[#7A8FA6]">Dosen Pembimbing</p>
                        </div>
                        <div class="flex size-9 items-center justify-center rounded-full bg-gradient-to-br from-[#1A9B72] to-[#0F6E56] text-xs font-bold text-white shadow-lg">
                            {{ auth()->user()->initials() }}
                        </div>
                    </button>
                    <flux:menu>
                        <div class="px-3 py-2">
                            <p class="text-sm font-medium">{{ auth()->user()->name }}</p>
                            <p class="text-xs text-zinc-500">NIP: {{ auth()->user()->nim_nip }}</p>
                        </div>
                        <flux:menu.separator />
                        <flux:menu.item :href="route('profile.edit')" icon="cog" wire:navigate>
                            Pengaturan Akun
                        </flux:menu.item>
                        <flux:menu.separator />
                        <form method="POST" action="{{ route('logout') }}" class="w-full">
                            @csrf
                            <flux:menu.item as="button" type="submit" icon="arrow-right-start-on-rectangle" class="w-full cursor-pointer">
                                Keluar
                            </flux:menu.item>
                        </form>
                    </flux:menu>
                </flux:dropdown>
            </div>
        </div>

        <flux:main>
            {{ $slot }}
        </flux:main>

        @persist('toast')
            <flux:toast.group>
                <flux:toast />
            </flux:toast.group>
        @endpersist

        @fluxScripts
    </body>
</html>
