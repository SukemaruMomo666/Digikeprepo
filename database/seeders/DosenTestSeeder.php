<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Penugasan;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DosenTestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 1. Buat Akun Dosen
        $dosen = User::updateOrCreate(
            ['nim_nip' => '12345678'],
            [
                'name' => 'Dr. Dosen Penguji, M.Kep',
                'email' => 'dosen.test@digikep.com',
                'password' => Hash::make('password'),
                'role' => 'dosen',
                'is_first_login' => false,
            ]
        );

        // 2. Pastikan ada Mahasiswa untuk dibimbing
        $mahasiswa = User::where('role', 'mahasiswa')->first();
        
        if (!$mahasiswa) {
            $mahasiswa = User::create([
                'name' => 'Mahasiswa Demo',
                'nim_nip' => '87654321',
                'email' => 'mhs.demo@digikep.com',
                'password' => Hash::make('password'),
                'role' => 'mahasiswa',
                'is_first_login' => false,
            ]);
        }

        // 3. Buat Penugasan (Link Dosen ke Mahasiswa)
        Penugasan::updateOrCreate(
            [
                'mahasiswa_id' => $mahasiswa->id,
                'dosen_id' => $dosen->id,
            ],
            [
                'angkatan' => 2024,
                'kelas' => '3A',
                'stase' => 'Keperawatan Medikal Bedah',
                'rs' => 'RSUD Kelas B Subang',
                'bangsal' => 'Ruang Teratai',
                'periode_mulai' => now(),
                'periode_selesai' => now()->addWeeks(4),
            ]
        );
    }
}
