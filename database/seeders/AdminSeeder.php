<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Seed akun admin.
     *
     * Admin tidak menggunakan is_first_login karena password sudah dikonfigurasi
     * langsung di sini — bukan default NIM seperti mahasiswa.
     */
    public function run(): void
    {
        $admins = [
            [
                'nim_nip' => 'admin',
                'name' => 'Administrator',
                'email' => 'admin@digikep.test',
                'password' => Hash::make('password'),
            ],
            [
                'nim_nip' => '197001012000031001',
                'name' => 'Dr. Hendra Kusuma, S.Kep., M.Kep.',
                'email' => 'hendra@polsub.ac.id',
                'password' => Hash::make('password'),
            ],
        ];

        foreach ($admins as $data) {
            User::factory()->admin()->create($data);
        }

        $this->command->info('AdminSeeder: '.count($admins).' akun admin berhasil dibuat.');
    }
}
