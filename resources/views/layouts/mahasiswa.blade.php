<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="dark">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-white dark:bg-zinc-800">
        <flux:sidebar sticky collapsible="mobile" class="border-e border-zinc-200 bg-zinc-50 dark:border-zinc-700 dark:bg-zinc-900">
            <flux:sidebar.header>
                <div class="flex items-center gap-2 px-1 py-1">
                    <div class="flex size-8 items-center justify-center rounded-lg bg-blue-600">
                        <flux:icon.heart class="size-4 text-white" />
                    </div>
                    <flux:heading class="text-base font-bold">DIGIKEP</flux:heading>
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
                    Data Pasien
                </flux:sidebar.item>

                <flux:sidebar.group heading="Asuhan Keperawatan">
                    <flux:sidebar.item
                        icon="clipboard-document-list"
                        :href="route('askep.index')"
                        :current="request()->routeIs('askep.index')"
                        wire:navigate
                    >
                        Semua Askep
                    </flux:sidebar.item>

                    <flux:sidebar.item
                        icon="clock"
                        :href="route('riwayat.index')"
                        :current="request()->routeIs('riwayat.index')"
                        wire:navigate
                    >
                        Riwayat
                    </flux:sidebar.item>

                    <flux:sidebar.item
                        icon="archive-box"
                        :href="route('arsip.index')"
                        :current="request()->routeIs('arsip.index')"
                        wire:navigate
                    >
                        Arsip Pengkajian
                    </flux:sidebar.item>
                </flux:sidebar.group>
            </flux:sidebar.nav>

            <flux:spacer />

            <x-desktop-user-menu class="hidden lg:block" :name="auth()->user()->name" />
        </flux:sidebar>

        {{-- Mobile Header --}}
        <flux:header class="lg:hidden">
            <flux:sidebar.toggle class="lg:hidden" icon="bars-2" inset="left" />
            <div class="flex items-center gap-2 ms-2">
                <div class="flex size-6 items-center justify-center rounded bg-blue-600">
                    <flux:icon.heart class="size-3.5 text-white" />
                </div>
                <span class="text-sm font-bold">DIGIKEP</span>
            </div>
            <flux:spacer />
            <flux:dropdown position="top" align="end">
                <flux:profile :initials="auth()->user()->initials()" icon-trailing="chevron-down" />
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
