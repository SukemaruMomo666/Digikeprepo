<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-gray-100 dark:bg-zinc-900">
        <flux:sidebar sticky collapsible="mobile" class="border-e border-zinc-200 bg-white dark:border-zinc-700 dark:bg-zinc-900">
            <flux:sidebar.header>
                <div class="flex items-center gap-2.5 px-1 py-1">
                    <div class="flex size-9 items-center justify-center rounded-xl bg-gradient-polsub shadow-polsub">
                        <flux:icon.shield-check class="size-5 text-white" />
                    </div>
                    <div>
                        <p class="text-sm font-bold leading-tight text-zinc-900 dark:text-white">DIGIKEP</p>
                        <p class="text-[10px] leading-tight text-zinc-400 dark:text-zinc-500">Nursing Care System</p>
                    </div>
                </div>
                <flux:sidebar.collapse class="lg:hidden" />
            </flux:sidebar.header>

            <flux:sidebar.nav>
                <flux:sidebar.item
                    icon="home"
                    :href="route('dashboard')"
                    :current="request()->routeIs('dashboard')"
                    wire:navigate
                >
                    Dashboard
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="users"
                    :href="route('pasien.index')"
                    :current="request()->routeIs('pasien.*')"
                    wire:navigate
                >
                    Patients
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="clock"
                    :href="route('riwayat.index')"
                    :current="request()->routeIs('riwayat.index')"
                    wire:navigate
                >
                    History
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="clipboard-document-list"
                    :href="route('askep.index')"
                    :current="request()->routeIs('askep.index')"
                    wire:navigate
                >
                    Semua Askep
                </flux:sidebar.item>

                <flux:sidebar.item
                    icon="archive-box"
                    :href="route('arsip.index')"
                    :current="request()->routeIs('arsip.index')"
                    wire:navigate
                >
                    Arsip Pengkajian
                </flux:sidebar.item>
            </flux:sidebar.nav>

            <flux:spacer />

            {{-- New Assessment Button --}}
            <div class="px-3 pb-2">
                <a
                    href="{{ route('pasien.create') }}"
                    wire:navigate
                    class="flex w-full items-center justify-center gap-2 rounded-xl bg-gradient-polsub px-4 py-2.5 text-sm font-semibold text-white shadow-polsub transition-all hover:shadow-polsub-lg"
                >
                    <flux:icon.plus class="size-4" />
                    New Assessment
                </a>
            </div>

            {{-- Desktop user profile --}}
            <x-desktop-user-menu class="hidden lg:block" :name="auth()->user()->name" />
        </flux:sidebar>

        {{-- Mobile Header --}}
        <flux:header class="lg:hidden bg-gradient-polsub border-b-0 shadow-polsub">
            <flux:sidebar.toggle class="lg:hidden text-white hover:bg-white/20" icon="bars-2" inset="left" />
            <div class="flex items-center gap-2 ms-2">
                <div class="flex size-7 items-center justify-center rounded-lg bg-white/20">
                    <flux:icon.shield-check class="size-4 text-white" />
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
        <div class="sticky top-0 z-40 hidden items-center justify-between border-b border-gray-200 bg-white px-6 py-3 dark:border-zinc-700 dark:bg-zinc-900 lg:flex">
            {{-- Search --}}
            <div class="relative w-72">
                <div class="pointer-events-none absolute inset-y-0 left-3 flex items-center">
                    <flux:icon.magnifying-glass class="size-4 text-gray-400" />
                </div>
                <input
                    type="text"
                    placeholder="Cari rekam medis..."
                    class="w-full rounded-lg border border-gray-200 bg-gray-50 py-2 pl-9 pr-4 text-sm text-gray-700 placeholder:text-gray-400 focus:border-orange-300 focus:outline-none focus:ring-2 focus:ring-orange-100 dark:border-zinc-700 dark:bg-zinc-800 dark:text-white dark:placeholder:text-zinc-500"
                />
            </div>

            {{-- Right side actions --}}
            <div class="flex items-center gap-2">
                <button class="flex size-9 items-center justify-center rounded-full border border-gray-200 bg-white text-gray-500 transition-colors hover:bg-gray-50 hover:text-gray-700 dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-400">
                    <flux:icon.bell class="size-5" />
                </button>
                <button class="flex size-9 items-center justify-center rounded-full border border-gray-200 bg-white text-gray-500 transition-colors hover:bg-gray-50 hover:text-gray-700 dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-400">
                    <flux:icon.cog-6-tooth class="size-5" />
                </button>

                <div class="mx-1 h-6 w-px bg-gray-200 dark:bg-zinc-700"></div>

                {{-- User dropdown --}}
                <flux:dropdown position="bottom" align="end">
                    <button class="flex items-center gap-2.5 rounded-xl px-2 py-1.5 transition-colors hover:bg-gray-50 dark:hover:bg-zinc-800">
                        <div class="text-right">
                            <p class="text-sm font-semibold text-gray-800 dark:text-white">{{ auth()->user()->name }}</p>
                            <p class="text-xs text-gray-500 dark:text-zinc-400">Student Nurse</p>
                        </div>
                        <div class="flex size-9 items-center justify-center rounded-full bg-gradient-polsub text-xs font-bold text-white shadow-polsub">
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
