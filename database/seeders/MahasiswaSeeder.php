<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class MahasiswaSeeder extends Seeder
{
    /**
     * Daftar mahasiswa untuk di-seed.
     *
     * Password default setiap mahasiswa = NIM mereka.
     * Kolom is_first_login = true → sistem akan memaksa ganti password saat login pertama.
     *
     * @var array<int, array<string, string>>
     */
    private array $mahasiswa = [
        ['nim_nip' => '10602001', 'name' => 'Budi Santoso'],
        ['nim_nip' => '10602002', 'name' => 'Ani Pratiwi'],
        ['nim_nip' => '10602003', 'name' => 'Andi Gunawan'],
        ['nim_nip' => '10602004', 'name' => 'Sri Wulandari'],
        ['nim_nip' => '10602005', 'name' => 'Dedi Supriatna'],
        ['nim_nip' => '10602006', 'name' => 'Rina Kusumawati'],
        ['nim_nip' => '10602007', 'name' => 'Agus Setiawan'],
        ['nim_nip' => '10602008', 'name' => 'Siti Nurhaliza'],
        ['nim_nip' => '10602009', 'name' => 'Eko Prabowo'],
        ['nim_nip' => '10602010', 'name' => 'Lina Marlina'],

    ];

    /**
     * Seed akun mahasiswa.
     */
    public function run(): void
    {
        foreach ($this->mahasiswa as $data) {
            User::factory()->mahasiswa()->create([
                'nim_nip' => $data['nim_nip'],
                'name' => $data['name'],
                'email' => null,
                'password' => Hash::make($data['nim_nip']), // password default = NIM
                'is_first_login' => true,
            ]);
        }

        $this->command->info('MahasiswaSeeder: '.count($this->mahasiswa).' akun mahasiswa berhasil dibuat.');
        $this->command->line('  Password default = NIM masing-masing (wajib diganti saat login pertama).');
    }
}
