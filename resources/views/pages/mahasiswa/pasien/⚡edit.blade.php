<?php

use App\Models\Pasien;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Edit Pasien')] class extends Component
{
    public Pasien $pasien;

    public string $nama_pasien = '';
    public string $umur = '';
    public string $tanggal_lahir = '';
    public string $jenis_kelamin = 'L';
    public string $agama = '';
    public string $status_perkawinan = '';
    public string $pekerjaan = '';
    public string $pendidikan = '';
    public string $alamat = '';
    public string $diagnosa_medis = '';
    public string $bb = '';
    public string $tb = '';
    public string $ruang_rawat = '';
    public string $tanggal_masuk = '';

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien;
        $this->nama_pasien       = $pasien->nama_pasien;
        $this->umur              = (string) $pasien->umur;
        $this->tanggal_lahir     = $pasien->tanggal_lahir?->format('Y-m-d') ?? '';
        $this->jenis_kelamin     = $pasien->jenis_kelamin;
        $this->agama             = $pasien->agama ?? '';
        $this->status_perkawinan = $pasien->status_perkawinan ?? '';
        $this->pekerjaan         = $pasien->pekerjaan ?? '';
        $this->pendidikan        = $pasien->pendidikan ?? '';
        $this->alamat            = $pasien->alamat ?? '';
        $this->diagnosa_medis    = $pasien->diagnosa_medis ?? '';
        $this->bb                = (string) ($pasien->bb ?? '');
        $this->tb                = (string) ($pasien->tb ?? '');
        $this->ruang_rawat       = $pasien->ruang_rawat ?? '';
        $this->tanggal_masuk     = $pasien->tanggal_masuk->format('Y-m-d');
    }

    public function save(): void
    {
        $validated = $this->validate([
            'nama_pasien'       => ['required', 'string', 'max:255'],
            'umur'              => ['required', 'integer', 'min:0', 'max:150'],
            'tanggal_lahir'     => ['nullable', 'date'],
            'jenis_kelamin'     => ['required', 'in:L,P'],
            'agama'             => ['nullable', 'string', 'max:50'],
            'status_perkawinan' => ['nullable', 'string', 'max:30'],
            'pekerjaan'         => ['nullable', 'string', 'max:100'],
            'pendidikan'        => ['nullable', 'string', 'max:50'],
            'alamat'            => ['nullable', 'string'],
            'diagnosa_medis'    => ['nullable', 'string', 'max:255'],
            'bb'                => ['nullable', 'numeric', 'min:0', 'max:500'],
            'tb'                => ['nullable', 'integer', 'min:0', 'max:300'],
            'ruang_rawat'       => ['nullable', 'string', 'max:100'],
            'tanggal_masuk'     => ['required', 'date'],
        ], [
            'nama_pasien.required'   => 'Nama pasien wajib diisi.',
            'umur.required'          => 'Umur wajib diisi.',
            'umur.integer'           => 'Umur harus berupa angka.',
            'jenis_kelamin.required' => 'Jenis kelamin wajib dipilih.',
            'tanggal_masuk.required' => 'Tanggal masuk wajib diisi.',
            'tanggal_masuk.date'     => 'Format tanggal tidak valid.',
        ]);

        $this->pasien->update($validated);

        Flux::toast(variant: 'success', text: 'Data pasien berhasil diperbarui.');

        $this->redirectRoute('mahasiswa.pasien.show', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('mahasiswa.pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Detail
        </flux:button>
        <flux:heading size="xl" level="1">Edit Data Pasien</flux:heading>
        <flux:text class="mt-1 font-mono text-sm">No. RM: {{ $pasien->no_rm }}</flux:text>
    </div>

    <flux:card class="max-w-3xl">
        <form wire:submit="save" class="flex flex-col gap-6">
            {{-- Bagian 1: Identitas Utama --}}
            <div class="space-y-4">
                <flux:heading size="lg">Identitas Pasien</flux:heading>
                <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                    <flux:input
                        :value="$pasien->no_rm"
                        label="No. Rekam Medis"
                        disabled
                        description="Nomor rekam medis tidak dapat diubah."
                    />

                    <flux:input
                        wire:model="nama_pasien"
                        label="Nama Lengkap Pasien"
                        placeholder="Nama sesuai KTP"
                        required
                    />
                </div>

                <div class="grid grid-cols-1 gap-5 sm:grid-cols-3">
                    <flux:input
                        wire:model="umur"
                        label="Umur"
                        type="number"
                        min="0"
                        placeholder="Tahun"
                        required
                    />

                    <flux:input
                        wire:model="tanggal_lahir"
                        label="Tanggal Lahir"
                        type="date"
                    />

                    <flux:select wire:model="jenis_kelamin" label="Jenis Kelamin" required>
                        <flux:select.option value="L">Laki-laki</flux:select.option>
                        <flux:select.option value="P">Perempuan</flux:select.option>
                    </flux:select>
                </div>
            </div>

            <hr class="border-gray-200 dark:border-zinc-700" />

            {{-- Bagian 2: Informasi Tambahan --}}
            <div class="space-y-4">
                <flux:heading size="lg">Informasi Tambahan</flux:heading>
                <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                    <flux:select wire:model="agama" label="Agama">
                        <flux:select.option value="">Pilih Agama</flux:select.option>
                        <flux:select.option value="Islam">Islam</flux:select.option>
                        <flux:select.option value="Kristen">Kristen</flux:select.option>
                        <flux:select.option value="Katolik">Katolik</flux:select.option>
                        <flux:select.option value="Hindu">Hindu</flux:select.option>
                        <flux:select.option value="Budha">Budha</flux:select.option>
                        <flux:select.option value="Konghucu">Konghucu</flux:select.option>
                    </flux:select>

                    <flux:select wire:model="status_perkawinan" label="Status Perkawinan">
                        <flux:select.option value="">Pilih Status</flux:select.option>
                        <flux:select.option value="Belum Kawin">Belum Kawin</flux:select.option>
                        <flux:select.option value="Kawin">Kawin</flux:select.option>
                        <flux:select.option value="Cerai Hidup">Cerai Hidup</flux:select.option>
                        <flux:select.option value="Cerai Mati">Cerai Mati</flux:select.option>
                    </flux:select>
                </div>

                <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                    <flux:input wire:model="pekerjaan" label="Pekerjaan" placeholder="Contoh: Buruh, PNS" />
                    <flux:input wire:model="pendidikan" label="Pendidikan Terakhir" placeholder="Contoh: SMA, S1" />
                </div>

                <flux:textarea wire:model="alamat" label="Alamat" placeholder="Alamat lengkap pasien" rows="2" />

                <flux:input wire:model="diagnosa_medis" label="Diagnosa Medis Awal" placeholder="Contoh: Dyspnea, Post Op Apendiks" />

                <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                    <flux:input wire:model="bb" label="Berat Badan (kg)" type="number" step="0.1" placeholder="0.0" />
                    <flux:input wire:model="tb" label="Tinggi Badan (cm)" type="number" placeholder="0" />
                </div>
            </div>

            <hr class="border-gray-200 dark:border-zinc-700" />

            {{-- Bagian 3: Data Masuk --}}
            <div class="space-y-4">
                <flux:heading size="lg">Data Ruang & Tanggal</flux:heading>
                <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
                    <flux:input
                        wire:model="ruang_rawat"
                        label="Ruang Rawat"
                        placeholder="Contoh: Bougenville, ICU"
                    />

                    <flux:input
                        wire:model="tanggal_masuk"
                        label="Tanggal Masuk"
                        type="date"
                        required
                    />
                </div>
            </div>

            <div class="flex items-center gap-3 pt-4">
                <flux:button type="submit" variant="primary">
                    Simpan Perubahan
                </flux:button>
                <flux:button :href="route('mahasiswa.pasien.show', $pasien)" variant="ghost" wire:navigate>
                    Batal
                </flux:button>
            </div>
        </form>
    </flux:card>
</div>
