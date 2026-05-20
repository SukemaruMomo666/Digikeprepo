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
    public string $jenis_kelamin = 'L';
    public string $ruang_rawat = '';
    public string $tanggal_masuk = '';

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien;
        $this->nama_pasien   = $pasien->nama_pasien;
        $this->umur          = (string) $pasien->umur;
        $this->jenis_kelamin = $pasien->jenis_kelamin;
        $this->ruang_rawat   = $pasien->ruang_rawat ?? '';
        $this->tanggal_masuk = $pasien->tanggal_masuk->format('Y-m-d');
    }

    public function save(): void
    {
        $validated = $this->validate([
            'nama_pasien'   => ['required', 'string', 'max:255'],
            'umur'          => ['required', 'integer', 'min:0', 'max:150'],
            'jenis_kelamin' => ['required', 'in:L,P'],
            'ruang_rawat'   => ['nullable', 'string', 'max:100'],
            'tanggal_masuk' => ['required', 'date'],
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

        $this->redirectRoute('pasien.show', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Detail
        </flux:button>
        <flux:heading size="xl" level="1">Edit Data Pasien</flux:heading>
        <flux:text class="mt-1 font-mono text-sm">No. RM: {{ $pasien->no_rm }}</flux:text>
    </div>

    <flux:card class="max-w-2xl">
        <form wire:submit="save" class="flex flex-col gap-5">
            <flux:input
                wire:model="nama_pasien"
                label="Nama Lengkap Pasien"
                placeholder="Nama sesuai KTP"
                required
            />

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

            <flux:callout icon="information-circle" color="blue">
                <flux:callout.text>
                    No. Rekam Medis tidak dapat diubah setelah pasien dibuat.
                </flux:callout.text>
            </flux:callout>

            <div class="flex items-center gap-3 pt-2">
                <flux:button type="submit" variant="primary">
                    Simpan Perubahan
                </flux:button>
                <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                    Batal
                </flux:button>
            </div>
        </form>
    </flux:card>
</div>
