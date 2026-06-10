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
        $dosen = User::updateOrCreate(
            ['nim_nip' => '19700101'],
            [
                'name' => 'Dr. Dosen Penguji, M.Kep',
                'email' => 'dosen@digikep.test',
                'role' => 'dosen',
                'password' => Hash::make('password'),
                'is_first_login' => false,
                'email_verified_at' => now(),
            ]
        );

        // 2. Ambil mahasiswa
        $mahasiswa = User::where('role', 'mahasiswa')->first();

        if ($mahasiswa) {
            // 3. Buat Penugasan (hanya jika belum ada)
            Penugasan::updateOrCreate(
                [
                    'mahasiswa_id' => $mahasiswa->id,
                    'dosen_id' => $dosen->id,
                    'stase' => 'KMB I',
                ],
                [
                    'angkatan' => 2024,
                    'kelas' => 'A',
                    'rs' => 'RSUD Subang',
                    'bangsal' => 'Teratai',
                    'periode_mulai' => now()->subMonth(),
                    'periode_selesai' => now()->addMonth(),
                ]
            );

            // 4. Update status Askep mahasiswa agar bisa di-review (opsional)
            $askep = Askep::where('user_id', $mahasiswa->id)->first();
            if ($askep) {
                $askep->update([
                    'status' => Askep::STATUS_MENUNGGU_REVIEW,
                    'submitted_at' => now()->subDays(rand(1, 5)),
                ]);
            }
        }

        $this->command->info('DosenSeeder: 1 akun dosen berhasil dibuat dan ditugaskan.');
    }
}
