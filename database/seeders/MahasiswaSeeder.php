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
        ['nim_nip' => '231010001', 'name' => 'Budi Santoso'],
        ['nim_nip' => '231010002', 'name' => 'Siti Rahayu'],
        ['nim_nip' => '231010003', 'name' => 'Ahmad Fauzi'],
        ['nim_nip' => '231010004', 'name' => 'Dewi Lestari'],
        ['nim_nip' => '231010005', 'name' => 'Rizky Pratama'],
        ['nim_nip' => '231010006', 'name' => 'Nur Aisyah'],
        ['nim_nip' => '231010007', 'name' => 'Eko Purnomo'],
        ['nim_nip' => '231010008', 'name' => 'Fitri Handayani'],
        ['nim_nip' => '231010009', 'name' => 'Bagas Setiawan'],
        ['nim_nip' => '231010010', 'name' => 'Lina Marlina'],
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
