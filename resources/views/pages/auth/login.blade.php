<x-layouts::auth :title="__('Masuk')">
    <div class="flex flex-col gap-6">
        <x-auth-header
            title="DIGIKEP"
            :description="__('Digital Asuhan Keperawatan — Politeknik Negeri Subang')"
        />

        <!-- Session Status -->
        <x-auth-session-status class="text-center" :status="session('status')" />

        <form method="POST" action="{{ route('login.store') }}" class="flex flex-col gap-6">
            @csrf

            <!-- NIM / NIP -->
            <flux:input
                name="nim_nip"
                :label="__('NIM / NIP')"
                :value="old('nim_nip')"
                type="text"
                required
                autofocus
                autocomplete="username"
                placeholder="Masukkan NIM atau NIP Anda"
            />

            <!-- Password -->
            <div class="relative">
                <flux:input
                    name="password"
                    :label="__('Password')"
                    type="password"
                    required
                    autocomplete="current-password"
                    :placeholder="__('Password')"
                    viewable
                />
            </div>

            <!-- Remember Me -->
            <flux:checkbox name="remember" :label="__('Ingat saya')" :checked="old('remember')" />

            <flux:button variant="primary" type="submit" class="w-full">
                {{ __('Masuk') }}
            </flux:button>
        </form>

        <flux:text class="text-center text-sm text-zinc-500 dark:text-zinc-400">
            Hubungi admin jika lupa password atau belum memiliki akun.
        </flux:text>
    </div>
</x-layouts::auth>
