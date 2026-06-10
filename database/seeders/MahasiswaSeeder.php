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
    ];

    /**
     * Seed akun mahasiswa.
     */
    public function run(): void
    {
        foreach ($this->mahasiswa as $data) {
            User::updateOrCreate(
                ['nim_nip' => $data['nim_nip']],
                [
                    'name' => $data['name'],
                    'email' => 'mahasiswa@digikep.test',
                    'role' => 'mahasiswa',
                    'password' => Hash::make($data['nim_nip']),
                    'is_first_login' => true,
                    'email_verified_at' => now(),
                ]
            );
        }

        $this->command->info('MahasiswaSeeder: '.count($this->mahasiswa).' akun mahasiswa berhasil dibuat.');
        $this->command->line('  Password default = NIM masing-masing (wajib diganti saat login pertama).');
    }
}
