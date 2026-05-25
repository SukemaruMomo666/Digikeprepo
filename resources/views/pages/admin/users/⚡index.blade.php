<?php

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

new #[Layout('layouts.admin')] #[Title('Kelola Mahasiswa')] class extends Component
{
    use WithPagination;

    public string $search = '';

    // Form fields
    public string $name = '';
    public string $nim_nip = '';
    public string $email = '';

    // Edit / Reset state
    public ?int $editId = null;
    public ?int $resetId = null;
    public string $resetPassword = '';

    public bool $showForm = false;

    public function updatingSearch(): void { $this->resetPage(); }

    // ── Create ────────────────────────────────────────────────────────────────

    public function openCreate(): void
    {
        $this->reset('name', 'nim_nip', 'email', 'editId');
        $this->showForm = true;
    }

    public function openEdit(int $id): void
    {
        $user = User::findOrFail($id);
        $this->editId = $id;
        $this->name = $user->name;
        $this->nim_nip = $user->nim_nip;
        $this->email = $user->email ?? '';
        $this->showForm = true;
    }

    public function saveUser(): void
    {
        $rules = [
            'name'    => ['required', 'string', 'max:100'],
            'nim_nip' => ['required', 'regex:/^[0-9]+$/', 'max:30', Rule::unique('users', 'nim_nip')->ignore($this->editId)],
            'email'   => ['nullable', 'email', 'max:100', Rule::unique('users', 'email')->ignore($this->editId)->whereNotNull('email')],
        ];

        $data = $this->validate($rules, [
            'nim_nip.regex' => 'NIM/NIP hanya boleh berisi angka.',
        ]);

        if ($this->editId) {
            User::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Data mahasiswa diperbarui.');
        } else {
            User::create([
                ...$data,
                'password'       => Hash::make($data['nim_nip']),
                'role'           => 'mahasiswa',
                'is_first_login' => true,
            ]);
            $this->dispatch('toast', variant: 'success', message: 'Mahasiswa ditambahkan. Password default: NIM.');
        }

        $this->showForm = false;
        $this->reset('name', 'nim_nip', 'email', 'editId');
    }

    // ── Reset Password ────────────────────────────────────────────────────────

    public function openReset(int $id): void
    {
        $this->resetId = $id;
        $this->resetPassword = '';
    }

    public function resetPassword(): void
    {
        $this->validate(['resetPassword' => ['required', 'string', 'min:6']]);

        User::findOrFail($this->resetId)->update([
            'password'       => Hash::make($this->resetPassword),
            'is_first_login' => true,
        ]);

        $this->dispatch('toast', variant: 'success', message: 'Password berhasil direset.');
        $this->reset('resetId', 'resetPassword');
    }

    // ── Delete ────────────────────────────────────────────────────────────────

    public function hapus(int $id): void
    {
        $user = User::findOrFail($id);
        abort_if($user->isAdmin(), 403);
        $user->delete();
        $this->dispatch('toast', variant: 'success', message: 'Mahasiswa dihapus.');
    }

    public function with(): array
    {
        return [
            'users' => User::where('role', 'mahasiswa')
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('name', 'like', "%{$this->search}%")
                        ->orWhere('nim_nip', 'like', "%{$this->search}%");
                }))
                ->withCount('pasien')
                ->latest()
                ->paginate(15),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Kelola Mahasiswa</flux:heading>
            <flux:text class="mt-1">Daftar akun mahasiswa yang terdaftar di sistem.</flux:text>
        </div>
        <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Mahasiswa</flux:button>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari nama atau NIM..."
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Nama</flux:table.column>
                <flux:table.column>NIM/NIP</flux:table.column>
                <flux:table.column>Email</flux:table.column>
                <flux:table.column>Pasien</flux:table.column>
                <flux:table.column>Status</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($users as $user)
                    <flux:table.row :key="$user->id" wire:key="user-{{ $user->id }}">
                        <flux:table.cell class="font-medium">{{ $user->name }}</flux:table.cell>
                        <flux:table.cell class="font-mono text-sm">{{ $user->nim_nip }}</flux:table.cell>
                        <flux:table.cell class="text-sm text-zinc-500">{{ $user->email ?? '—' }}</flux:table.cell>
                        <flux:table.cell>{{ $user->pasien_count }}</flux:table.cell>
                        <flux:table.cell>
                            @if ($user->is_first_login)
                                <flux:badge color="yellow" size="sm">Belum Login</flux:badge>
                            @else
                                <flux:badge color="green" size="sm">Aktif</flux:badge>
                            @endif
                        </flux:table.cell>
                        <flux:table.cell>
                            <flux:dropdown>
                                <flux:button size="sm" variant="ghost" icon="ellipsis-horizontal" inset="top bottom" />
                                <flux:menu>
                                    <flux:menu.item icon="pencil" wire:click="openEdit({{ $user->id }})">Edit</flux:menu.item>
                                    <flux:menu.item icon="key" wire:click="openReset({{ $user->id }})">Reset Password</flux:menu.item>
                                    <flux:menu.separator />
                                    <flux:menu.item
                                        icon="trash"
                                        variant="danger"
                                        wire:click="hapus({{ $user->id }})"
                                        wire:confirm="Hapus mahasiswa ini? Semua data pasien miliknya akan ikut terhapus."
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="6" class="py-10 text-center text-zinc-500">
                            Belum ada mahasiswa terdaftar.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $users->links() }}</div>
    </flux:card>

    {{-- Modal Tambah / Edit --}}
    <flux:modal wire:model="showForm" class="max-w-md">
        <flux:heading size="lg">{{ $editId ? 'Edit Mahasiswa' : 'Tambah Mahasiswa' }}</flux:heading>
        <flux:text class="mb-4 text-sm">{{ $editId ? 'Perbarui data akun mahasiswa.' : 'Buat akun baru. Password default adalah NIM mahasiswa.' }}</flux:text>

        <div class="space-y-4">
            <flux:input wire:model="name" label="Nama Lengkap" placeholder="Nama sesuai KTP" required />
            <flux:input
                wire:model="nim_nip"
                label="NIM / NIP"
                placeholder="Contoh: 10602001"
                inputmode="numeric"
                description="Hanya angka. Password default = NIM yang dimasukkan."
                required
            />
            <flux:input wire:model="email" label="Email (opsional)" type="email" placeholder="mahasiswa@example.com" />
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="saveUser">{{ $editId ? 'Simpan' : 'Tambah' }}</flux:button>
        </div>
    </flux:modal>

    {{-- Modal Reset Password --}}
    <flux:modal wire:model.live="resetId" class="max-w-sm">
        <flux:heading size="lg">Reset Password</flux:heading>
        <flux:text class="mb-4 text-sm">Masukkan password baru. Mahasiswa akan diwajibkan ganti password saat login berikutnya.</flux:text>

        <flux:input
            wire:model="resetPassword"
            label="Password Baru"
            type="password"
            placeholder="Minimal 6 karakter"
            viewable
        />

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('resetId', null)">Batal</flux:button>
            <flux:button variant="primary" wire:click="resetPassword">Reset</flux:button>
        </div>
    </flux:modal>
</div>
