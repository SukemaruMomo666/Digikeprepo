<?php

namespace Database\Seeders;

use App\Models\Askep;
use App\Models\Penugasan;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DosenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 1. Buat Dosen
        $dosen = User::create([
            'nim_nip' => '12345678',
            'name' => 'Dr. Budi Santoso, M.Kep',
            'email' => 'budi@polsub.ac.id',
            'role' => 'dosen',
            'password' => Hash::make('password'),
            'is_first_login' => false,
        ]);

        // 2. Ambil beberapa mahasiswa yang sudah ada (dari MahasiswaSeeder)
        $mahasiswas = User::where('role', 'mahasiswa')->take(3)->get();

        foreach ($mahasiswas as $mhs) {
            // 3. Buat Penugasan
            Penugasan::create([
                'mahasiswa_id' => $mhs->id,
                'dosen_id' => $dosen->id,
                'angkatan' => 2024,
                'kelas' => 'A',
                'stase' => 'KMB I',
                'rs' => 'RSUD Subang',
                'bangsal' => 'Teratai',
                'periode_mulai' => now()->subMonth(),
                'periode_selesai' => now()->addMonth(),
            ]);

            // 4. Update status Askep mahasiswa agar bisa di-review
            $askep = Askep::where('user_id', $mhs->id)->first();
            if ($askep) {
                $askep->update([
                    'status' => Askep::STATUS_MENUNGGU_REVIEW,
                    'submitted_at' => now()->subDays(rand(1, 5)),
                ]);
            }
        }
    }
}
