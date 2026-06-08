<?php

namespace Database\Seeders;

use App\Models\IntervensiSiki;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;

class SikiMasterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $filePath = database_path('seeders/data/siki_data_master.sql');

        if (! File::exists($filePath)) {
            $this->command->error("File siki_data_master.sql tidak ditemukan di $filePath");
            return;
        }

        $sql = File::get($filePath);

        // Menangkap: VALUES (id, 'kode', 'nama', 'definisi')
        // Menggunakan /s agar dot mencocokkan newline dan /u untuk unicode
        preg_match_all("/INSERT INTO siki \(id, kode_intervensi, nama_intervensi, definisi\) VALUES \(\d+,\s*'(.*?)',\s*'(.*?)',\s*'(.*?)'\);/su", $sql, $matches, PREG_SET_ORDER);

        if (empty($matches)) {
            $this->command->warn("Tidak ada data yang cocok ditemukan di siki_data_master.sql");
            return;
        }

        $this->command->info("Memproses " . count($matches) . " master SIKI dari siki_data_master.sql...");

        $count = 0;
        foreach ($matches as $match) {
            $kode = $match[1];
            $label = $match[2];
            $definisi = $match[3];

            // Pembersihan noise:
            // 1. Hapus prefix statis yang panjang
            $label = str_replace('Penerimaan pasien STANDAR INTERVENSI KEPERAWATAN INDONESIA ', '', $label);
            
            // 2. Jika ada karakter bullet atau instruksi yang diakhiri titik/bullet, ambil bagian terakhir (judul)
            // Contoh: " Ajarkan ... dingin Kompres Panas" -> "Kompres Panas"
            // Kita asumsikan judul SIKI diawali huruf kapital dan biasanya di akhir jika ada noise instruksi
            if (preg_match('/[.]\s+([A-Z][a-z]+(\s+[A-Z][a-z]+)*)$/u', $label, $subMatches)) {
                $label = $subMatches[1];
            } else {
                // Fallback: hapus bullet saja di awal
                $label = preg_replace('/^[\s]*/u', '', $label);
            }
            
            // 3. Hapus noise kata "Edukasi" atau "Kaloborasi" yang nempel di awal jika diikuti instruksi
            $label = preg_replace('/^(Edukasi|Kaloborasi|Kolaborasi)\s+.*?\s+([A-Z])/', '$2', $label);

            $label = str_replace("''", "'", $label);
            $definisi = str_replace("''", "'", $definisi);
            $label = trim($label);

            IntervensiSiki::withTrashed()->updateOrCreate(
                ['kode_intervensi' => $kode],
                [
                    'label_intervensi' => $label,
                    'definisi' => $definisi,
                    'deleted_at' => null
                ]
            );
            $count++;
        }

        $this->command->info("Berhasil mengimpor/memperbarui $count master SIKI.");
    }
}
