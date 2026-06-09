<?php

namespace Database\Seeders;

use App\Models\Penugasan;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ImportMahasiswaExcelSeeder extends Seeder
{
    /**
     * Jalankan seeder untuk mengimpor data mahasiswa & dosen dari CSV hasil ekstraksi.
     */
    public function run(): void
    {
        $csvFile = base_path('students_extracted.csv');
        
        if (!file_exists($csvFile)) {
            $this->command->error("File students_extracted.csv tidak ditemukan!");
            return;
        }

        $file = fopen($csvFile, 'r');
        $header = fgetcsv($file); // Skip header: Nama,NIM,Kelas,Dosen Wali

        $countMhs = 0;
        $countDosen = 0;
        $dosenMap = []; // Cache ID dosen berdasarkan nama asli

        while (($row = fgetcsv($file)) !== FALSE) {
            $namaMhs = trim($row[0]);
            $nimMhs = trim($row[1]);
            $kelas = trim($row[2]);
            $namaDosenAsli = trim($row[3]);

            // 1. Tangani Dosen
            if (!isset($dosenMap[$namaDosenAsli])) {
                $usernameDosen = $this->generateDosenUsername($namaDosenAsli);
                
                $dosen = User::updateOrCreate(
                    ['nim_nip' => $usernameDosen],
                    [
                        'name' => $namaDosenAsli,
                        'email' => null,
                        'password' => Hash::make($usernameDosen),
                        'role' => 'dosen',
                        'is_first_login' => true,
                    ]
                );
                
                $dosenMap[$namaDosenAsli] = $dosen->id;
                $countDosen++;
                $this->command->info("Dosen Dibuat: {$namaDosenAsli} (Username: {$usernameDosen})");
            }

            // 2. Tangani Mahasiswa
            $mhs = User::updateOrCreate(
                ['nim_nip' => $nimMhs],
                [
                    'name' => $namaMhs,
                    'email' => null,
                    'password' => Hash::make($nimMhs),
                    'role' => 'mahasiswa',
                    'is_first_login' => true,
                ]
            );

            // 3. Tangani Penugasan (Plotting)
            Penugasan::updateOrCreate(
                ['mahasiswa_id' => $mhs->id],
                [
                    'dosen_id' => $dosenMap[$namaDosenAsli],
                    'kelas' => $kelas,
                    'stase' => 'KMB', // Default stase
                    'rs' => 'RSUD Subang', // Default RS
                    'periode_mulai' => now(),
                    'periode_selesai' => now()->addMonths(6),
                ]
            );

            $countMhs++;
        }

        fclose($file);

        $this->command->info("Selesai! Berhasil mengimpor {$countMhs} Mahasiswa dan {$countDosen} Dosen Wali.");
    }

    /**
     * Membersihkan nama dosen dari gelar dan menjadikannya username (lowercase.dot).
     */
    private function generateDosenUsername(string $name): string
    {
        // Hilangkan gelar-gelar umum
        $titles = [
            'S.Kep.', 'Ners.', 'M.Kep', 'M.N.Sc', 'M.Kes', 'MM', 'Ns.', 'S.Tr.Kep.', 
            'S.Kep', 'Ners', 'S.Tr.Kep', ',', '.',
        ];
        
        $cleanName = str_replace($titles, '', $name);
        $cleanName = trim($cleanName);
        
        // Ambil maksimal 2 kata pertama
        $words = explode(' ', $cleanName);
        $username = isset($words[1]) ? $words[0] . '.' . $words[1] : $words[0];
        
        return Str::lower($username);
    }
}
