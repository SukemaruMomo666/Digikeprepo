<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        @php($title = 'Digital Asuhan Keperawatan')
        @include('partials.head')
        <style>
            .hero-pattern {
                background-image:
                    linear-gradient(rgba(255, 255, 255, 0.06) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(255, 255, 255, 0.06) 1px, transparent 1px);
                background-size: 44px 44px;
            }
        </style>
    </head>
    <body class="bg-[#F4F8FB] text-[#1B4F72] antialiased">
        <header
            x-data="{ scrolled: false }"
            x-on:scroll.window="scrolled = window.scrollY > 20"
            :class="scrolled ? 'border-[#D8E8F5] bg-white/95 shadow-sm' : 'border-transparent bg-white/80'"
            class="fixed inset-x-0 top-0 z-50 border-b backdrop-blur transition-all duration-200"
        >
            <div class="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
                <a href="{{ route('home') }}" class="flex items-center gap-3">
                    <span class="flex size-10 items-center justify-center rounded-xl bg-white shadow-primary ring-1 ring-[#D8E8F5]">
                        @if (file_exists(public_path('images/logo-polsub.png')))
                            <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Politeknik Negeri Subang" class="size-8 object-contain" />
                        @else
                            <svg class="size-5 text-[#2E86C1]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                            </svg>
                        @endif
                    </span>
                    <span>
                        <span class="block text-sm font-extrabold leading-tight text-[#0A2D45]">DIGIKEP</span>
                        <span class="block text-[11px] font-medium leading-tight text-[#7A8FA6]">Politeknik Negeri Subang</span>
                    </span>
                </a>

                <nav class="hidden items-center gap-7 md:flex">
                    <a href="#fitur" class="text-sm font-semibold text-[#456B88] transition hover:text-[#2E86C1]">Fitur</a>
                    <a href="#alur" class="text-sm font-semibold text-[#456B88] transition hover:text-[#2E86C1]">Alur Askep</a>
                    <a href="#data-master" class="text-sm font-semibold text-[#456B88] transition hover:text-[#2E86C1]">Data 3S</a>
                    <a href="#peran" class="text-sm font-semibold text-[#456B88] transition hover:text-[#2E86C1]">Peran</a>
                </nav>

                <div class="flex items-center gap-2">
                    @auth
                        <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}" class="inline-flex items-center gap-2 rounded-xl bg-[#1B4F72] px-4 py-2 text-sm font-bold text-white shadow-primary transition hover:bg-[#0A2D45]">
                            Buka Dashboard
                            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5 21 12m0 0-7.5 7.5M21 12H3" />
                            </svg>
                        </a>
                    @else
                        <a href="{{ route('login') }}" class="hidden rounded-xl px-4 py-2 text-sm font-bold text-[#1B4F72] transition hover:bg-[#EBF5FB] sm:inline-flex">
                            Masuk
                        </a>
                        <a href="{{ route('login') }}" class="inline-flex items-center gap-2 rounded-xl bg-[#1B4F72] px-4 py-2 text-sm font-bold text-white shadow-primary transition hover:bg-[#0A2D45]">
                            Mulai
                            <svg class="size-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5 21 12m0 0-7.5 7.5M21 12H3" />
                            </svg>
                        </a>
                    @endauth
                </div>
            </div>
        </header>

        <main>
            <section class="hero-pattern relative min-h-[760px] overflow-hidden bg-[#0A2D45] pt-16 text-white">
                <div class="absolute inset-0 bg-[#1B4F72]/30"></div>
                <div class="absolute inset-x-0 bottom-0 h-40 bg-[#F4F8FB]"></div>
                @if (file_exists(public_path('images/logo-polsub.png')))
                    <img src="{{ asset('images/logo-polsub.png') }}" alt="" class="pointer-events-none absolute left-1/2 top-28 h-[380px] w-[380px] -translate-x-1/2 object-contain opacity-[0.08]" />
                @endif

                <div class="relative mx-auto flex max-w-7xl flex-col items-center px-4 py-20 text-center sm:px-6 sm:py-28 lg:px-8">
                    <div class="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/10 px-4 py-2 text-xs font-bold uppercase tracking-[0.18em] text-white/80">
                        <span class="size-2 rounded-full bg-[#5DCAA5]"></span>
                        Jurusan Kesehatan Polsub
                    </div>

                    <h1 class="mt-8 max-w-5xl text-4xl font-black tracking-tight text-white sm:text-6xl lg:text-7xl">
                        Digitalisasi Asuhan Keperawatan untuk Mahasiswa
                    </h1>

                    <p class="mt-6 max-w-3xl text-base leading-8 text-white/75 sm:text-xl">
                        DIGIKEP membantu mahasiswa menyusun dokumentasi Askep dari pengkajian, diagnosa SDKI,
                        luaran SLKI, intervensi SIKI, sampai evaluasi dalam satu alur yang rapi dan terukur.
                    </p>

                    <div class="mt-9 flex flex-col items-center gap-3 sm:flex-row">
                        @auth
                            <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('dashboard') }}" class="inline-flex items-center justify-center gap-2 rounded-2xl bg-white px-7 py-3.5 text-base font-extrabold text-[#0A2D45] shadow-lg transition hover:bg-[#EBF5FB]">
                                Masuk ke Dashboard
                            </a>
                        @else
                            <a href="{{ route('login') }}" class="inline-flex items-center justify-center gap-2 rounded-2xl bg-white px-7 py-3.5 text-base font-extrabold text-[#0A2D45] shadow-lg transition hover:bg-[#EBF5FB]">
                                Masuk dengan NIM
                            </a>
                        @endauth
                        <a href="#alur" class="inline-flex items-center justify-center rounded-2xl border border-white/20 px-7 py-3.5 text-base font-bold text-white transition hover:bg-white/10">
                            Lihat Alur
                        </a>
                    </div>

                    <div class="mt-14 grid w-full max-w-5xl grid-cols-1 gap-4 sm:grid-cols-3">
                        <div class="rounded-2xl border border-white/10 bg-white/10 p-5 text-left backdrop-blur">
                            <p class="text-sm font-semibold text-white/60">Basis Standar</p>
                            <p class="mt-2 text-2xl font-black text-white">SDKI, SLKI, SIKI</p>
                            <p class="mt-2 text-sm leading-6 text-white/65">Master data 3S menjadi referensi utama proses perencanaan Askep.</p>
                        </div>
                        <div class="rounded-2xl border border-white/10 bg-white/10 p-5 text-left backdrop-blur">
                            <p class="text-sm font-semibold text-white/60">Pengkajian</p>
                            <p class="mt-2 text-2xl font-black text-white">32 Section</p>
                            <p class="mt-2 text-sm leading-6 text-white/65">Riwayat, biologis, psikososial, dan pemeriksaan fisik dipisah jelas.</p>
                        </div>
                        <div class="rounded-2xl border border-white/10 bg-white/10 p-5 text-left backdrop-blur">
                            <p class="text-sm font-semibold text-white/60">Akun Mahasiswa</p>
                            <p class="mt-2 text-2xl font-black text-white">NIM = Login</p>
                            <p class="mt-2 text-sm leading-6 text-white/65">Password default mahasiswa memakai NIM dan wajib diganti saat login awal.</p>
                        </div>
                    </div>
                </div>
            </section>

            {{-- <section id="data-master" class="py-16">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="grid grid-cols-2 gap-4 lg:grid-cols-4">
                        @foreach ([
                            ['value' => '149', 'label' => 'Diagnosa SDKI', 'text' => 'text-[#2E86C1]', 'dot' => 'bg-[#2E86C1]'],
                            ['value' => '110', 'label' => 'Luaran SLKI', 'text' => 'text-[#1A9B72]', 'dot' => 'bg-[#1A9B72]'],
                            ['value' => '73', 'label' => 'Intervensi SIKI', 'text' => 'text-[#1B4F72]', 'dot' => 'bg-[#2E86C1]'],
                            ['value' => '5', 'label' => 'Tahap Askep', 'text' => 'text-[#0A2D45]', 'dot' => 'bg-[#1A9B72]'],
                        ] as $item)
                            <div class="rounded-2xl border border-[#D8E8F5] bg-white p-6 shadow-[0_1px_4px_rgba(27,79,114,0.06)]">
                                <div class="flex items-center justify-between gap-3">
                                    <p class="text-sm font-bold text-[#7A8FA6]">{{ $item['label'] }}</p>
                                    <span class="size-2 rounded-full {{ $item['dot'] }}"></span>
                                </div>
                                <p class="mt-4 text-4xl font-black {{ $item['text'] }}">{{ $item['value'] }}</p>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section> --}}

            <section id="fitur" class="py-20">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="max-w-3xl">
                        <p class="text-sm font-extrabold uppercase tracking-[0.18em] text-[#2E86C1]">Fitur inti</p>
                        <h2 class="mt-3 text-3xl font-black tracking-tight text-[#0A2D45] sm:text-4xl">Dibangun untuk proses belajar Askep yang terstruktur.</h2>
                        <p class="mt-4 text-base leading-7 text-[#7A8FA6]">Konten landing ini mengikuti README, rencana pengembangan, dan kondisi aplikasi terbaru: mahasiswa mengelola pasien, menyusun Askep, dan admin mengelola data master serta monitoring.</p>
                    </div>

                    <div class="mt-10 grid grid-cols-1 gap-5 md:grid-cols-2 xl:grid-cols-3">
                        @foreach ([
                            ['title' => 'Kelola Pasien', 'desc' => 'Mahasiswa dapat membuat data pasien, menyimpan draft, melihat riwayat, dan melanjutkan Askep dari posisi terakhir.', 'icon' => 'M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z'],
                            ['title' => 'Pengkajian Per Section', 'desc' => 'Form pengkajian dipisah menjadi riwayat penyakit, biologis, psikososial, dan pemeriksaan fisik agar tidak terasa seperti satu form panjang.', 'icon' => 'M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H5.625A1.125 1.125 0 0 0 4.5 3.375v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V14.25Z'],
                            ['title' => 'Data Master 3S', 'desc' => 'SDKI, SLKI, dan SIKI menjadi referensi digital untuk memilih diagnosa, target luaran, dan intervensi keperawatan.', 'icon' => 'M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25A8.966 8.966 0 0 1 18 3.75c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25'],
                            ['title' => 'Riwayat Aktivitas', 'desc' => 'Aktivitas pasien dan perubahan data tercatat sebagai timeline sehingga proses pengerjaan mudah ditelusuri.', 'icon' => 'M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z'],
                            ['title' => 'Evaluasi Keperawatan', 'desc' => 'Tahap evaluasi menilai luaran apakah tercapai, tercapai sebagian, atau belum tercapai lengkap dengan catatan.', 'icon' => 'M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z'],
                            ['title' => 'Monitoring Admin', 'desc' => 'Admin dapat mengelola mahasiswa, data master, relasi 3S, log aktivitas, dan progres mahasiswa.', 'icon' => 'M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z'],
                        ] as $feature)
                            <article class="rounded-2xl border border-[#D8E8F5] bg-white p-6 shadow-[0_1px_4px_rgba(27,79,114,0.06)] transition hover:-translate-y-1 hover:shadow-primary">
                                <div class="flex size-12 items-center justify-center rounded-xl bg-[#EBF5FB]">
                                    <svg class="size-6 text-[#2E86C1]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.7">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="{{ $feature['icon'] }}" />
                                    </svg>
                                </div>
                                <h3 class="mt-5 text-lg font-black text-[#0A2D45]">{{ $feature['title'] }}</h3>
                                <p class="mt-3 text-sm leading-6 text-[#7A8FA6]">{{ $feature['desc'] }}</p>
                            </article>
                        @endforeach
                    </div>
                </div>
            </section>

            <section id="alur" class="bg-white py-20">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="mx-auto max-w-3xl text-center">
                        <p class="text-sm font-extrabold uppercase tracking-[0.18em] text-[#1A9B72]">Alur kerja</p>
                        <h2 class="mt-3 text-3xl font-black tracking-tight text-[#0A2D45] sm:text-4xl">5 tahap dokumentasi Asuhan Keperawatan.</h2>
                    </div>

                    <div class="mt-12 grid grid-cols-1 gap-4 md:grid-cols-5">
                        @foreach ([
                            ['n' => '01', 'title' => 'Pengkajian', 'desc' => 'Kumpulkan data pasien per section.'],
                            ['n' => '02', 'title' => 'SDKI', 'desc' => 'Tentukan diagnosa keperawatan.'],
                            ['n' => '03', 'title' => 'SLKI', 'desc' => 'Pilih luaran dan kriteria hasil.'],
                            ['n' => '04', 'title' => 'SIKI', 'desc' => 'Susun intervensi dan tindakan.'],
                            ['n' => '05', 'title' => 'Evaluasi', 'desc' => 'Nilai pencapaian luaran pasien.'],
                        ] as $step)
                            <div class="rounded-2xl border border-[#D8E8F5] bg-[#F4F8FB] p-5">
                                <span class="inline-flex size-10 items-center justify-center rounded-xl bg-[#1B4F72] text-sm font-black text-white">{{ $step['n'] }}</span>
                                <h3 class="mt-5 text-base font-black text-[#0A2D45]">{{ $step['title'] }}</h3>
                                <p class="mt-2 text-sm leading-6 text-[#7A8FA6]">{{ $step['desc'] }}</p>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>

            <section id="peran" class="py-20">
                <div class="mx-auto grid max-w-7xl grid-cols-1 gap-6 px-4 sm:px-6 lg:grid-cols-2 lg:px-8">
                    <article class="rounded-3xl border border-[#D8E8F5] bg-white p-8 shadow-[0_1px_4px_rgba(27,79,114,0.06)]">
                        <p class="text-sm font-extrabold uppercase tracking-[0.18em] text-[#2E86C1]">Mahasiswa</p>
                        <h2 class="mt-3 text-2xl font-black text-[#0A2D45]">Fokus menyusun Askep.</h2>
                        <ul class="mt-6 space-y-3 text-sm leading-6 text-[#456B88]">
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#1A9B72]"></span>Login memakai NIM dan password default NIM.</li>
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#1A9B72]"></span>Kelola pasien, pengkajian, diagnosa, luaran, intervensi, dan evaluasi.</li>
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#1A9B72]"></span>Lihat riwayat dan arsip pengkajian.</li>
                        </ul>
                    </article>
                    <article class="rounded-3xl border border-[#D8E8F5] bg-[#0A2D45] p-8 text-white shadow-primary-lg">
                        <p class="text-sm font-extrabold uppercase tracking-[0.18em] text-[#85B7EB]">Admin</p>
                        <h2 class="mt-3 text-2xl font-black">Kontrol data dan monitoring.</h2>
                        <ul class="mt-6 space-y-3 text-sm leading-6 text-white/75">
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#5DCAA5]"></span>Kelola akun mahasiswa dan reset password.</li>
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#5DCAA5]"></span>Kelola master SDKI, SLKI, SIKI, dan relasinya.</li>
                            <li class="flex gap-3"><span class="mt-2 size-2 rounded-full bg-[#5DCAA5]"></span>Pantau log aktivitas dan progres mahasiswa.</li>
                        </ul>
                    </article>
                </div>
            </section>

            <section class="pb-20">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="rounded-3xl bg-[#1B4F72] px-6 py-12 text-center text-white shadow-primary-lg sm:px-12">
                        <h2 class="text-3xl font-black tracking-tight sm:text-4xl">Siap mulai dokumentasi Askep digital?</h2>
                        <p class="mx-auto mt-4 max-w-2xl text-base leading-7 text-white/75">Masuk ke DIGIKEP menggunakan akun kampus. Mahasiswa memakai NIM, admin memakai NIP atau akun yang sudah dibuat.</p>
                        <a href="{{ route('login') }}" class="mt-8 inline-flex items-center justify-center rounded-2xl bg-white px-7 py-3.5 text-base font-extrabold text-[#0A2D45] shadow-lg transition hover:bg-[#EBF5FB]">
                            Masuk ke Sistem
                        </a>
                    </div>
                </div>
            </section>
        </main>

        <footer class="border-t border-[#D8E8F5] bg-white">
            <div class="mx-auto flex max-w-7xl flex-col items-center justify-between gap-5 px-4 py-8 sm:px-6 md:flex-row lg:px-8">
                <div class="flex items-center gap-3">
                    <span class="flex size-9 items-center justify-center rounded-xl bg-[#EBF5FB]">
                        @if (file_exists(public_path('images/logo-polsub.png')))
                            <img src="{{ asset('images/logo-polsub.png') }}" alt="Logo Polsub" class="size-7 object-contain" />
                        @else
                            <span class="text-sm font-black text-[#2E86C1]">D</span>
                        @endif
                    </span>
                    <div>
                        <p class="text-sm font-black text-[#0A2D45]">DIGIKEP</p>
                        <p class="text-xs font-medium text-[#7A8FA6]">Jurusan Kesehatan - Politeknik Negeri Subang</p>
                    </div>
                </div>
                <p class="text-sm text-[#7A8FA6]">&copy; {{ date('Y') }} DIGIKEP. Digital Asuhan Keperawatan.</p>
            </div>
        </footer>

        @fluxScripts
    </body>
</html>
