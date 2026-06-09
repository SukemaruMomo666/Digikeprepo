<x-layouts::auth :title="__('Masuk')">

    {{-- Heading --}}
    <div class="mb-8">
        <h2 class="text-2xl font-extrabold text-[#1B4F72] dark:text-white">Selamat datang!</h2>
        <p class="mt-1 text-sm text-[#7A8FA6] dark:text-zinc-400">
            Masuk ke akun DIGIKEP Anda untuk melanjutkan.
        </p>
    </div>

    {{-- Session status --}}
    <x-auth-session-status class="mb-4 rounded-lg bg-[#E1F5EE] px-4 py-3 text-sm text-[#0F6E56]" :status="session('status')" />

    {{-- Validation errors --}}
    @if ($errors->any())
        <div class="mb-4 rounded-lg border border-[#D95C3A]/30 bg-[#FDE8E8] px-4 py-3 text-sm text-[#D95C3A]">
            @foreach ($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <form method="POST" action="{{ route('login.store') }}" class="space-y-5">
        @csrf

        {{-- NIM / NIP / Username --}}
        <div class="space-y-1.5">
            <label for="nim_nip" class="block text-sm font-semibold text-[#1B4F72] dark:text-zinc-300">
                NIM / NIP / Username
            </label>
            <input
                id="nim_nip"
                name="nim_nip"
                type="text"
                value="{{ old('nim_nip') }}"
                required
                autofocus
                autocomplete="username"
                placeholder="Masukkan NIM, NIP, atau Username"
                class="w-full rounded-xl border border-[#D0DCE8] bg-white px-4 py-3 text-sm text-[#1B4F72] outline-none placeholder:text-[#7A8FA6] transition
                       focus:border-[#2E86C1] focus:ring-2 focus:ring-[#2E86C1]/20
                       dark:border-zinc-700 dark:bg-zinc-800 dark:text-white
                       @error('nim_nip') border-[#D95C3A] focus:border-[#D95C3A] focus:ring-[#D95C3A]/20 @enderror"
            />
            <p class="text-xs text-[#7A8FA6] dark:text-zinc-500">Gunakan NIM (Mhs) atau Username (Dosen) Anda. Password default = NIM Anda.</p>
        </div>

        {{-- Password --}}
        <div class="space-y-1.5" x-data="{ show: false }">
            <label for="password" class="block text-sm font-semibold text-[#1B4F72] dark:text-zinc-300">
                Password
            </label>
            <div class="relative">
                <input
                    id="password"
                    name="password"
                    :type="show ? 'text' : 'password'"
                    required
                    autocomplete="current-password"
                    placeholder="Password"
                    class="w-full rounded-xl border border-[#D0DCE8] bg-white px-4 py-3 pr-11 text-sm text-[#1B4F72] outline-none placeholder:text-[#7A8FA6] transition
                           focus:border-[#2E86C1] focus:ring-2 focus:ring-[#2E86C1]/20
                           dark:border-zinc-700 dark:bg-zinc-800 dark:text-white
                           @error('password') border-[#D95C3A] focus:border-[#D95C3A] focus:ring-[#D95C3A]/20 @enderror"
                />
                <button
                    type="button"
                    @click="show = !show"
                    class="absolute right-3 top-1/2 -translate-y-1/2 text-[#7A8FA6] hover:text-[#1B4F72] dark:hover:text-zinc-300"
                    tabindex="-1"
                >
                    <svg x-show="!show" class="size-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                    <svg x-show="show" class="size-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="display:none">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 4.411m0 0L21 21" />
                    </svg>
                </button>
            </div>
        </div>

        {{-- Remember me --}}
        <div class="flex items-center gap-2">
            <input
                id="remember"
                name="remember"
                type="checkbox"
                {{ old('remember') ? 'checked' : '' }}
                class="size-4 rounded border-[#D0DCE8] text-[#2E86C1] focus:ring-[#2E86C1] dark:border-zinc-600 dark:bg-zinc-800"
            />
            <label for="remember" class="text-sm text-[#7A8FA6] dark:text-zinc-400">Ingat saya</label>
        </div>

        {{-- Submit --}}
        <button
            type="submit"
            class="w-full rounded-xl px-6 py-3 text-sm font-bold text-white shadow-primary transition hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-[#2E86C1]/40"
            style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
        >
            Masuk ke DIGIKEP
        </button>
    </form>

    {{-- Help text --}}
    <p class="mt-6 text-center text-xs text-[#7A8FA6] dark:text-zinc-500">
        Belum punya akun atau lupa password?
        <span class="font-medium text-[#1B4F72] dark:text-zinc-400">Hubungi admin kampus.</span>
    </p>

</x-layouts::auth>
