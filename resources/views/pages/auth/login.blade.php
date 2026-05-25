<x-layouts::auth :title="__('Masuk')">

    {{-- Heading --}}
    <div class="mb-8">
        <h2 class="text-2xl font-extrabold text-gray-900 dark:text-white">Selamat datang!</h2>
        <p class="mt-1 text-sm text-gray-500 dark:text-zinc-400">
            Masuk ke akun DIGIKEP Anda untuk melanjutkan.
        </p>
    </div>

    {{-- Session status --}}
    <x-auth-session-status class="mb-4 rounded-lg bg-emerald-50 px-4 py-3 text-sm text-emerald-700" :status="session('status')" />

    {{-- Validation errors --}}
    @if ($errors->any())
        <div class="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 dark:border-red-800 dark:bg-red-900/20 dark:text-red-400">
            @foreach ($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
    @endif

    <form method="POST" action="{{ route('login.store') }}" class="space-y-5">
        @csrf

        {{-- NIM / NIP --}}
        <div class="space-y-1.5">
            <label for="nim_nip" class="block text-sm font-semibold text-gray-700 dark:text-zinc-300">
                NIM / NIP
            </label>
            <input
                id="nim_nip"
                name="nim_nip"
                type="text"
                inputmode="numeric"
                pattern="[0-9]*"
                value="{{ old('nim_nip') }}"
                required
                autofocus
                autocomplete="username"
                placeholder="Masukkan NIM atau NIP"
                class="w-full rounded-xl border border-gray-200 bg-white px-4 py-3 text-sm text-gray-900 outline-none placeholder:text-gray-400 transition
                       focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20
                       dark:border-zinc-700 dark:bg-zinc-800 dark:text-white dark:placeholder:text-zinc-500
                       @error('nim_nip') border-red-400 focus:border-red-400 focus:ring-red-400/20 @enderror"
            />
            <p class="text-xs text-gray-400 dark:text-zinc-500">Gunakan NIM/NIP Anda (angka saja). Password default = NIM Anda.</p>
        </div>

        {{-- Password --}}
        <div class="space-y-1.5" x-data="{ show: false }">
            <label for="password" class="block text-sm font-semibold text-gray-700 dark:text-zinc-300">
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
                    class="w-full rounded-xl border border-gray-200 bg-white px-4 py-3 pr-11 text-sm text-gray-900 outline-none placeholder:text-gray-400 transition
                           focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20
                           dark:border-zinc-700 dark:bg-zinc-800 dark:text-white dark:placeholder:text-zinc-500
                           @error('password') border-red-400 focus:border-red-400 focus:ring-red-400/20 @enderror"
                />
                <button
                    type="button"
                    @click="show = !show"
                    class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 dark:hover:text-zinc-300"
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
                class="size-4 rounded border-gray-300 text-orange-500 focus:ring-orange-400 dark:border-zinc-600 dark:bg-zinc-800"
            />
            <label for="remember" class="text-sm text-gray-600 dark:text-zinc-400">Ingat saya</label>
        </div>

        {{-- Submit --}}
        <button
            type="submit"
            class="w-full rounded-xl px-6 py-3 text-sm font-bold text-white shadow-polsub transition hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-orange-400/40"
            style="background: linear-gradient(135deg, #f39c12, #e67e22)"
        >
            Masuk ke DIGIKEP
        </button>
    </form>

    {{-- Help text --}}
    <p class="mt-6 text-center text-xs text-gray-400 dark:text-zinc-500">
        Belum punya akun atau lupa password?
        <span class="font-medium text-gray-600 dark:text-zinc-400">Hubungi admin kampus.</span>
    </p>

</x-layouts::auth>
