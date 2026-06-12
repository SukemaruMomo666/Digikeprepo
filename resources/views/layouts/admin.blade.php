<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @include('partials.head')
    </head>
    <body class="min-h-screen bg-[#F4F8FB] dark:bg-zinc-900">
        {{-- Dark navy sidebar --}}
        <flux:sidebar sticky collapsible="mobile"
            class="dark border-e-0 bg-[#0A2D45] dark:bg-[#050F1A]"
            style="--sidebar-width: 240px"
        >
            <flux:sidebar.header>
                <div class="flex items-center gap-2.5 px-1 py-1">
                    <div class="flex size-9 shrink-0 items-center justify-center rounded-xl bg-white backdrop-blur-sm overflow-hidden p-1.5">
                        <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Polsub" class="size-full object-contain">
                    </div>
                    <div>
                        <p class="text-sm font-bold leading-tight text-white">DIGIKEP</p>
                        <p class="text-[10px] leading-tight text-white/60">Admin Panel</p>
                    </div>
                </div>
                <flux:sidebar.collapse class="lg:hidden text-white/70 hover:bg-white/10" />
            </flux:sidebar.header>

            <flux:sidebar.nav>
                <flux:sidebar.item
                    icon="home"
                    :href="route('admin.dashboard')"
                    :current="request()->routeIs('admin.dashboard')"
                    wire:navigate
                >
                    Dashboard
                </flux:sidebar.item>

                <flux:sidebar.group heading="Kelola User" class="grid">
                    <flux:sidebar.item
                        icon="academic-cap"
                        :href="route('admin.data-mahasiswa.index')"
                        :current="request()->routeIs('admin.data-mahasiswa.*')"
                        wire:navigate
                    >
                        Data Mahasiswa
                        @php $countPending = \App\Models\Askep::where('status', \App\Models\Askep::STATUS_MENUNGGU_REVIEW)->count(); @endphp
                        @if($countPending > 0)
                            <flux:badge size="sm" color="amber" inset="top bottom">{{ $countPending }}</flux:badge>
                        @endif
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="user-group"
                        :href="route('admin.users.index')"
                        :current="request()->routeIs('admin.users.*')"
                        wire:navigate
                    >
                        Kelola Akun
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="identification"
                        :href="route('admin.dosen.index')"
                        :current="request()->routeIs('admin.dosen.*')"
                        wire:navigate
                    >
                        Dosen
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="briefcase"
                        :href="route('admin.penugasan.index')"
                        :current="request()->routeIs('admin.penugasan.*')"
                        wire:navigate
                    >
                        Penugasan
                    </flux:sidebar.item>
                </flux:sidebar.group>

                <flux:sidebar.group heading="Data Master" class="grid">
                    <flux:sidebar.item
                        icon="book-open"
                        :href="route('admin.sdki.index')"
                        :current="request()->routeIs('admin.sdki.*')"
                        wire:navigate
                    >
                        Diagnosa SDKI
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="clipboard-document-check"
                        :href="route('admin.slki.index')"
                        :current="request()->routeIs('admin.slki.*')"
                        wire:navigate
                    >
                        Luaran SLKI
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="clipboard-document-list"
                        :href="route('admin.siki.index')"
                        :current="request()->routeIs('admin.siki.*')"
                        wire:navigate
                    >
                        Intervensi SIKI
                    </flux:sidebar.item>
                    <flux:sidebar.item
                        icon="arrows-right-left"
                        :href="route('admin.relasi.index')"
                        :current="request()->routeIs('admin.relasi.*')"
                        wire:navigate
                    >
                        Mapping Relasi
                    </flux:sidebar.item>
                </flux:sidebar.group>

            </flux:sidebar.nav>

            <flux:spacer />

            {{-- Admin profile desktop --}}
            <flux:dropdown position="top" align="start" class="hidden lg:block">
                <flux:sidebar.profile
                    :name="auth()->user()->name"
                    :initials="auth()->user()->initials()"
                    icon:trailing="chevrons-up-down"
                />
                <flux:menu>
                    <div class="px-3 py-2">
                        <p class="text-sm font-medium">{{ auth()->user()->name }}</p>
                        <p class="text-xs text-zinc-500">{{ auth()->user()->nim_nip }}</p>
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
        </flux:sidebar>

        {{-- Mobile Header --}}
        <flux:header class="lg:hidden border-b-0 bg-[#0A2D45] shadow-primary">
            <flux:sidebar.toggle class="lg:hidden text-white hover:bg-white/20" icon="bars-2" inset="left" />
            <div class="flex items-center gap-2 ms-2">
                <div class="flex size-7 shrink-0 items-center justify-center rounded-lg bg-white overflow-hidden p-1">
                    <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Polsub" class="size-full object-contain">
                </div>
                <span class="text-sm font-bold text-white">DIGIKEP Admin</span>
            </div>
            <flux:spacer />
            <flux:dropdown position="top" align="end">
                <flux:profile :initials="auth()->user()->initials()" icon-trailing="chevron-down" class="text-white" />
                <flux:menu>
                    <div class="px-3 py-2">
                        <p class="text-sm font-medium">{{ auth()->user()->name }}</p>
                        <p class="text-xs text-zinc-500">{{ auth()->user()->nim_nip }}</p>
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
