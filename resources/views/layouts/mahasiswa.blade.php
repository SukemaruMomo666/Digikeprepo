<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-[#F4F8FB] dark:bg-zinc-900">
        {{-- Dark navy sidebar --}}
        <flux:sidebar sticky collapsible="mobile"
            class="dark border-e-0 bg-[#1B4F72] dark:bg-[#0A2D45]"
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
                        <p class="text-[10px] leading-tight text-white/60">Politeknik Negeri Subang</p>
                    </div>
                </div>
                <flux:sidebar.collapse class="lg:hidden text-white/70 hover:bg-white/10" />
            </flux:sidebar.header>

            <flux:sidebar.nav>
                {{-- ── Menu Utama ── --}}
                <flux:sidebar.item
                    icon="home"
                    :href="route('mahasiswa.dashboard')"
                    :current="request()->routeIs('mahasiswa.dashboard')"
                    wire:navigate
                >
                    Beranda
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="users"
                    :href="route('mahasiswa.pasien.index')"
                    :current="request()->routeIs('mahasiswa.pasien.*') && !request()->routeIs('mahasiswa.pasien.askep*')"
                    wire:navigate
                >
                    Data Pasien
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="clipboard-document-list"
                    :href="route('mahasiswa.askep.index')"
                    :current="request()->routeIs('mahasiswa.askep.*')"
                    wire:navigate
                >
                    Asuhan Keperawatan
                    @php
                        $countRevisi = \App\Models\Askep::where('user_id', auth()->id())
                            ->where('status', \App\Models\Askep::STATUS_PERLU_REVISI)
                            ->count();
                    @endphp
                    @if ($countRevisi > 0)
                        <flux:badge size="sm" color="red" inset="top bottom">{{ $countRevisi }}</flux:badge>
                    @endif
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="clock"
                    :href="route('mahasiswa.riwayat.index')"
                    :current="request()->routeIs('mahasiswa.riwayat.index')"
                    wire:navigate
                >
                    Riwayat
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="book-open"
                    :href="route('mahasiswa.log.index')"
                    :current="request()->routeIs('mahasiswa.log.*')"
                    wire:navigate
                >
                    Log Pembelajaran
                </flux:sidebar.item>

                {{-- ── Separator ── --}}
                <div class="mx-3 my-1 border-t border-white/10"></div>

                {{-- ── Panduan & Referensi ── --}}
                <flux:sidebar.item
                    icon="book-open"
                    :href="route('mahasiswa.panduan.index')"
                    :current="request()->routeIs('mahasiswa.panduan.*')"
                    wire:navigate
                >
                    Panduan
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="play-circle"
                    :href="route('mahasiswa.video.index')"
                    :current="request()->routeIs('mahasiswa.video.*')"
                    wire:navigate
                >
                    Video Tutorial
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="question-mark-circle"
                    :href="route('mahasiswa.faq.index')"
                    :current="request()->routeIs('mahasiswa.faq.*')"
                    wire:navigate
                >
                    FAQ
                </flux:sidebar.item>
            </flux:sidebar.nav>

            <flux:spacer />

            {{-- New Assessment Button --}}
            <div class="px-3 pb-2">
                <a
                    href="{{ route('mahasiswa.pasien.create') }}"
                    wire:navigate
                    class="flex w-full items-center justify-center gap-2 rounded-xl bg-white/15 px-4 py-2.5 text-sm font-semibold text-white ring-1 ring-white/20 transition-all hover:bg-white/25 hover:ring-white/40"
                >
                    <flux:icon.plus class="size-4" />
                    Tambah Pasien
                </a>
            </div>

            {{-- Desktop user profile --}}
            <x-desktop-user-menu class="hidden lg:block" :name="auth()->user()->name" />
        </flux:sidebar>

        {{-- Mobile Header --}}
        <flux:header class="lg:hidden border-b-0 bg-[#1B4F72] shadow-primary">
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
                        <p class="text-xs text-zinc-500">NIM: {{ auth()->user()->nim_nip }}</p>
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
            {{-- Search --}}
            <div class="relative w-72">
                <div class="pointer-events-none absolute inset-y-0 left-3 flex items-center">
                    <flux:icon.magnifying-glass class="size-4 text-[#7A8FA6]" />
                </div>
                <input
                    type="text"
                    placeholder="Cari rekam medis..."
                    class="w-full rounded-lg border border-[#E0EBF5] bg-[#F4F8FB] py-2 pl-9 pr-4 text-sm text-[#1B4F72] placeholder:text-[#7A8FA6] focus:border-[#2E86C1] focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/20 dark:border-zinc-700 dark:bg-zinc-800 dark:text-white"
                />
            </div>

            {{-- Right side actions --}}
            <div class="flex items-center gap-2">
                <button class="flex size-9 items-center justify-center rounded-full border border-[#E0EBF5] bg-white text-[#7A8FA6] transition-colors hover:bg-[#EBF5FB] hover:text-[#1B4F72] dark:border-zinc-700 dark:bg-zinc-800">
                    <flux:icon.bell class="size-5" />
                </button>
                <button class="flex size-9 items-center justify-center rounded-full border border-[#E0EBF5] bg-white text-[#7A8FA6] transition-colors hover:bg-[#EBF5FB] hover:text-[#1B4F72] dark:border-zinc-700 dark:bg-zinc-800">
                    <flux:icon.cog-6-tooth class="size-5" />
                </button>

                <div class="mx-1 h-6 w-px bg-[#E0EBF5] dark:bg-zinc-700"></div>

                {{-- User dropdown --}}
                <flux:dropdown position="bottom" align="end">
                    <button class="flex items-center gap-2.5 rounded-xl px-2 py-1.5 transition-colors hover:bg-[#EBF5FB] dark:hover:bg-zinc-800">
                        <div class="text-right">
                            <p class="text-sm font-semibold text-[#1B4F72] dark:text-white">{{ auth()->user()->name }}</p>
                            <p class="text-xs text-[#7A8FA6]">Mahasiswa Keperawatan</p>
                        </div>
                        <div class="flex size-9 items-center justify-center rounded-full bg-gradient-primary text-xs font-bold text-white shadow-primary">
                            {{ auth()->user()->initials() }}
                        </div>
                    </button>
                    <flux:menu>
                        <div class="px-3 py-2">
                            <p class="text-sm font-medium">{{ auth()->user()->name }}</p>
                            <p class="text-xs text-zinc-500">NIM: {{ auth()->user()->nim_nip }}</p>
                        </div>
                        <flux:menu.separator />
                        <flux:menu.item :href="route('profile.edit')" icon="cog" wire:navigate>
                            Pengaturan
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
