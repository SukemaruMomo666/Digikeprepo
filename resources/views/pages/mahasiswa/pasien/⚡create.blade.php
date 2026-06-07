<?php

use App\Models\Pasien;
use Flux\Flux;
use Illuminate\Validation\Rule;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Tambah Pasien')] class extends Component
{
    public string $no_rm = '';
    public string $nama_pasien = '';
    public string $umur = '';
    public string $jenis_kelamin = 'L';
    public string $ruang_rawat = '';
    public string $tanggal_masuk = '';

    public function save(): void
    {
        $validated = $this->validate([
            'no_rm'         => ['required', 'string', 'max:20', 'regex:/^[A-Za-z0-9\-\/]+$/', Rule::unique('pasien')->where('user_id', auth()->id())],
            'nama_pasien'   => ['required', 'string', 'max:255'],
            'umur'          => ['required', 'integer', 'min:0', 'max:150'],
            'jenis_kelamin' => ['required', 'in:L,P'],
            'ruang_rawat'   => ['nullable', 'string', 'max:100'],
            'tanggal_masuk' => ['required', 'date'],
        ], [
            'no_rm.required'         => 'No. RM wajib diisi.',
            'no_rm.regex'            => 'No. RM hanya boleh berisi huruf, angka, tanda hubung, dan garis miring.',
            'no_rm.max'              => 'No. RM maksimal 20 karakter.',
            'no_rm.unique'           => 'No. RM ini sudah terdaftar. Gunakan nomor rekam medis yang berbeda.',
            'nama_pasien.required'   => 'Nama pasien wajib diisi.',
            'umur.required'          => 'Umur wajib diisi.',
            'umur.integer'           => 'Umur harus berupa angka.',
            'umur.min'               => 'Umur tidak valid.',
            'umur.max'               => 'Umur tidak valid.',
            'jenis_kelamin.required' => 'Jenis kelamin wajib dipilih.',
            'tanggal_masuk.required' => 'Tanggal masuk wajib diisi.',
            'tanggal_masuk.date'     => 'Format tanggal tidak valid.',
        ]);

        $pasien = Pasien::create([
            ...$validated,
            'user_id' => auth()->id(),
        ]);

        $pasien->catatRiwayat('Pasien ditambahkan ke sistem.');

        Flux::toast(variant: 'success', text: 'Pasien berhasil ditambahkan. Silakan mulai pengkajian.');

        $this->redirectRoute('pasien.askep.create', $pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.index')" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali
        </flux:button>
        <flux:heading size="xl" level="1">Tambah Pasien Baru</flux:heading>
        <flux:text class="mt-1">Isi data pasien, lalu lanjutkan ke langkah pengkajian.</flux:text>
    </div>

    <flux:card class="max-w-2xl">
        <form wire:submit="save" class="flex flex-col gap-5">
            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                <flux:input
                    wire:model="no_rm"
                    label="No. Rekam Medis"
                    placeholder="Contoh: RM-2024-001"
                    required
                    description="Nomor unik rekam medis pasien."
                />

                <flux:input
                    wire:model="nama_pasien"
                    label="Nama Lengkap Pasien"
                    placeholder="Nama sesuai KTP"
                    required
                />
            </div>

            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                <flux:input
                    wire:model="umur"
                    label="Umur"
                    type="number"
                    min="0"
                    max="150"
                    placeholder="Tahun"
                    required
                />

                <flux:select wire:model="jenis_kelamin" label="Jenis Kelamin" required>
                    <flux:select.option value="L">Laki-laki</flux:select.option>
                    <flux:select.option value="P">Perempuan</flux:select.option>
                </flux:select>
            </div>

            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                <flux:input
                    wire:model="ruang_rawat"
                    label="Ruang Rawat"
                    placeholder="Contoh: Bougenville, ICU"
                    description="Opsional."
                />

                <flux:input
                    wire:model="tanggal_masuk"
                    label="Tanggal Masuk"
                    type="date"
                    required
                />
            </div>

            <div class="flex items-center gap-3 pt-2">
                <flux:button type="submit" variant="primary" icon-trailing="arrow-right">
                    Simpan & Mulai Pengkajian
                </flux:button>
                <flux:button :href="route('pasien.index')" variant="ghost" wire:navigate>
                    Batal
                </flux:button>
            </div>
        </form>
    </flux:card>
</div>
