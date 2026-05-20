<?php

use Flux\Flux;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Title('Buat Password Baru')] class extends Component
{
    public string $password = '';

    public string $password_confirmation = '';

    /**
     * Redirect jika user sudah pernah ganti password.
     */
    public function mount(): void
    {
        if (! Auth::user()->is_first_login) {
            $this->redirectRoute(
                Auth::user()->isAdmin() ? 'admin.dashboard' : 'dashboard',
                navigate: true
            );
        }
    }

    /**
     * Simpan password baru dan tandai first login selesai.
     */
    public function save(): void
    {
        $this->validate([
            'password' => ['required', 'string', Password::min(8), 'confirmed'],
        ]);

        $user = Auth::user();
        $user->password = Hash::make($this->password);
        $user->is_first_login = false;
        $user->save();

        Flux::toast(variant: 'success', text: 'Password berhasil diperbarui. Selamat datang!');

        $this->redirectRoute(
            $user->isAdmin() ? 'admin.dashboard' : 'dashboard',
            navigate: true
        );
    }
}; ?>

<x-layouts::auth :title="__('Buat Password Baru')">
    <div class="flex flex-col gap-6">
        <x-auth-header
            :title="__('Buat Password Baru')"
            :description="__('Ini adalah login pertama Anda. Silakan buat password baru sebelum melanjutkan.')"
        />

        <form wire:submit="save" class="flex flex-col gap-6">
            <flux:input
                wire:model="password"
                :label="__('Password Baru')"
                type="password"
                required
                autocomplete="new-password"
                placeholder="Minimal 8 karakter"
                viewable
            />

            <flux:input
                wire:model="password_confirmation"
                :label="__('Konfirmasi Password')"
                type="password"
                required
                autocomplete="new-password"
                placeholder="Ulangi password baru"
                viewable
            />

            <flux:button variant="primary" type="submit" class="w-full">
                {{ __('Simpan & Lanjutkan') }}
            </flux:button>
        </form>
    </div>
</x-layouts::auth>
