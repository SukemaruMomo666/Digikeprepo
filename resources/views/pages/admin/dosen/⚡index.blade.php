<?php

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;
use Livewire\WithFileUploads;

new #[Layout('layouts.admin')] #[Title('Kelola Dosen')] class extends Component
{
    use WithPagination, WithFileUploads;

    public string $search = '';

    // Form fields
    public string $name = '';
    public string $nim_nip = '';
    public string $email = '';

    // Mass Import
    public $file;
    public bool $showImport = false;

    // Edit / Reset state
    public ?int $editId = null;
    public ?int $resetId = null;
    public bool $showReset = false;
    public string $newPassword = '';

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
            'nim_nip.regex' => 'NIP hanya boleh berisi angka.',
        ]);

        if ($this->editId) {
            User::findOrFail($this->editId)->update($data);
            $this->dispatch('toast', variant: 'success', message: 'Data dosen diperbarui.');
        } else {
            User::create([
                ...$data,
                'password'       => Hash::make($data['nim_nip']),
                'role'           => 'dosen',
                'is_first_login' => true,
            ]);
            $this->dispatch('toast', variant: 'success', message: 'Dosen ditambahkan. Password default: NIP.');
        }

        $this->showForm = false;
        $this->reset('name', 'nim_nip', 'email', 'editId');
    }

    // ── Mass Import ───────────────────────────────────────────────────────────

    public function importMassal(): void
    {
        $this->validate([
            'file' => ['required', 'file', 'mimes:csv,txt', 'max:2048'],
        ]);

        $path = $this->file->getRealPath();
        $handle = fopen($path, 'r');

        // Skip header
        fgetcsv($handle);

        $successCount = 0;
        $failCount = 0;

        while (($row = fgetcsv($handle)) !== false) {
            if (count($row) < 2) {
                $failCount++;
                continue;
            }

            $name = trim($row[0] ?? '');
            $nim_nip = trim($row[1] ?? '');
            $email = trim($row[2] ?? '');

            if (empty($name) || empty($nim_nip) || !preg_match('/^[0-9]+$/', $nim_nip)) {
                $failCount++;
                continue;
            }

            if (User::where('nim_nip', $nim_nip)->exists()) {
                $failCount++;
                continue;
            }

            if ($email && User::where('email', $email)->exists()) {
                $failCount++;
                continue;
            }

            try {
                User::create([
                    'name'           => $name,
                    'nim_nip'        => $nim_nip,
                    'email'          => $email ?: null,
                    'password'       => Hash::make($nim_nip),
                    'role'           => 'dosen',
                    'is_first_login' => true,
                ]);
                $successCount++;
            } catch (\Exception $e) {
                $failCount++;
            }
        }

        fclose($handle);

        $this->reset('file', 'showImport');
        $this->dispatch('toast', variant: $successCount > 0 ? 'success' : 'warning', message: "Import selesai. {$successCount} berhasil, {$failCount} gagal.");
    }

    // ── Reset Password ────────────────────────────────────────────────────────

    public function openReset(int $id): void
    {
        $this->resetId = $id;
        $this->newPassword = '';
        $this->showReset = true;
    }

    public function resetPassword(): void
    {
        $this->validate(['newPassword' => ['required', 'string', 'min:6']]);

        User::findOrFail($this->resetId)->update([
            'password'       => Hash::make($this->newPassword),
            'is_first_login' => true,
        ]);

        $this->showReset = false;
        $this->dispatch('toast', variant: 'success', message: 'Password berhasil direset.');
        $this->reset('resetId', 'newPassword');
    }

    // ── Delete ────────────────────────────────────────────────────────────────

    public function hapus(int $id): void
    {
        $user = User::findOrFail($id);
        abort_if($user->isAdmin(), 403);
        $user->delete();
        $this->dispatch('toast', variant: 'success', message: 'Dosen dihapus.');
    }

    public function with(): array
    {
        return [
            'users' => User::where('role', 'dosen')
                ->when($this->search, fn ($q) => $q->where(function ($q) {
                    $q->where('name', 'like', "%{$this->search}%")
                        ->orWhere('nim_nip', 'like', "%{$this->search}%");
                }))
                ->latest()
                ->paginate(15),
        ];
    }
};
?>

<div>
    <div class="mb-6 flex items-center justify-between">
        <div>
            <flux:heading size="xl" level="1">Kelola Dosen</flux:heading>
            <flux:text class="mt-1">Daftar akun dosen yang terdaftar di sistem.</flux:text>
        </div>
        <div class="flex gap-2">
            <flux:button variant="ghost" icon="document-arrow-up" wire:click="$set('showImport', true)">Import Massal</flux:button>
            <flux:button variant="primary" icon="plus" wire:click="openCreate">Tambah Dosen</flux:button>
        </div>
    </div>

    <flux:card>
        <div class="mb-4">
            <flux:input
                wire:model.live.debounce.300ms="search"
                placeholder="Cari nama atau NIP..." autocomplete="off"
                icon="magnifying-glass"
                clearable
            />
        </div>

        <flux:table>
            <flux:table.columns>
                <flux:table.column>Nama</flux:table.column>
                <flux:table.column>NIP</flux:table.column>
                <flux:table.column>Email</flux:table.column>
                <flux:table.column>Status</flux:table.column>
                <flux:table.column></flux:table.column>
            </flux:table.columns>
            <flux:table.rows>
                @forelse ($users as $user)
                    <flux:table.row :key="$user->id" wire:key="user-{{ $user->id }}">
                        <flux:table.cell class="font-medium">{{ $user->name }}</flux:table.cell>
                        <flux:table.cell class="font-mono text-sm">{{ $user->nim_nip }}</flux:table.cell>
                        <flux:table.cell class="text-sm text-zinc-500">{{ $user->email ?? '—' }}</flux:table.cell>
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
                                        wire:confirm="Hapus dosen ini? Semua data penugasan miliknya akan ikut terhapus."
                                    >Hapus</flux:menu.item>
                                </flux:menu>
                            </flux:dropdown>
                        </flux:table.cell>
                    </flux:table.row>
                @empty
                    <flux:table.row>
                        <flux:table.cell colspan="5" class="py-10 text-center text-zinc-500">
                            Belum ada dosen terdaftar.
                        </flux:table.cell>
                    </flux:table.row>
                @endforelse
            </flux:table.rows>
        </flux:table>

        <div class="mt-4">{{ $users->links() }}</div>
    </flux:card>

    {{-- Modal Tambah / Edit --}}
    <flux:modal wire:model="showForm" class="max-w-md">
        <flux:heading size="lg">{{ $editId ? 'Edit Dosen' : 'Tambah Dosen' }}</flux:heading>
        <flux:text class="mb-4 text-sm">{{ $editId ? 'Perbarui data akun dosen.' : 'Buat akun baru. Password default adalah NIP dosen.' }}</flux:text>

        <div class="space-y-4">
            <flux:input wire:model="name" label="Nama Lengkap" placeholder="Nama sesuai KTP" required />
            <flux:input
                wire:model="nim_nip"
                label="NIP"
                placeholder="Contoh: 198001012010011001"
                inputmode="numeric"
                description="Hanya angka. Password default = NIP yang dimasukkan."
                required
            />
            <flux:input wire:model="email" label="Email (opsional)" type="email" placeholder="dosen@example.com" />
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showForm', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="saveUser">{{ $editId ? 'Simpan' : 'Tambah' }}</flux:button>
        </div>
    </flux:modal>

    {{-- Modal Import Massal --}}
    <flux:modal wire:model="showImport" class="max-w-md">
        <flux:heading size="lg">Import Massal Dosen</flux:heading>
        <flux:text class="mb-4 text-sm">Upload file CSV dengan format: <code>name, nim_nip, email</code>. Baris pertama dianggap sebagai header.</flux:text>

        <div class="space-y-4">
            <flux:input wire:model="file" type="file" accept=".csv" label="File CSV" />

            <flux:card variant="subtle" class="p-3 text-xs text-zinc-500">
                <p class="font-semibold mb-1">Ketentuan:</p>
                <ul class="list-disc list-inside space-y-1">
                    <li>Kolom 1: Nama Lengkap</li>
                    <li>Kolom 2: NIP (Hanya angka, unik)</li>
                    <li>Kolom 3: Email (Opsional, unik)</li>
                    <li>Password default otomatis diset sama dengan NIP.</li>
                </ul>
            </flux:card>
        </div>

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showImport', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="importMassal" wire:loading.attr="disabled">
                <span wire:loading.remove>Import</span>
                <span wire:loading>Memproses...</span>
            </flux:button>
        </div>
    </flux:modal>

    {{-- Modal Reset Password --}}
    <flux:modal wire:model="showReset" class="max-w-sm">
        <flux:heading size="lg">Reset Password</flux:heading>
        <flux:text class="mb-4 text-sm">Masukkan password baru. Dosen akan diwajibkan ganti password saat login berikutnya.</flux:text>

        <flux:input
            wire:model="newPassword"
            label="Password Baru"
            type="password"
            placeholder="Minimal 6 karakter"
            viewable
        />

        <div class="mt-6 flex justify-end gap-2">
            <flux:button variant="ghost" wire:click="$set('showReset', false)">Batal</flux:button>
            <flux:button variant="primary" wire:click="resetPassword">Reset</flux:button>
        </div>
    </flux:modal>
</div>
