<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HasilMdRelationsSeeder extends Seeder
{
    public function run(): void
    {
        $path = $this->resolveSourcePath();

        if (! $path) {
            $this->command->error('File hasil.md tidak ditemukan.');
            $this->command->info('Letakkan file di: ' . database_path('seeders/data/hasil.md'));
            $this->command->info('Atau di: C:/Users/kur/Downloads/hasil.md');

            return;
        }

        $this->command->info("Membaca: {$path}");

        // Hanya truncate slki_siki_relations (sebelumnya kosong, tidak diisi batch SQL).
        // sdki_slki_relations TIDAK di-truncate — DataMaster3SSeeder sudah mengisinya,
        // seeder ini hanya menambahkan relasi yang belum ada via insertOrIgnore.
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::table('slki_siki_relations')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        // Build lookup: kode → id
        $sdkiMap = DB::table('diagnosa_sdki')->pluck('id', 'kode_diagnosa')->all();
        $slkiMap = DB::table('luaran_slki')->pluck('id', 'kode_luaran')->all();
        $sikiMap = DB::table('intervensi_siki')->pluck('id', 'kode_intervensi')->all();

        $sdkiSlkiRows = [];
        $slkiSikiRows = [];
        $sqlLines     = [
            '-- Relations dari hasil.md',
            '-- Dihasilkan oleh HasilMdRelationsSeeder',
            '-- Jalankan ulang: php artisan db:seed --class=HasilMdRelationsSeeder',
            '',
            'SET FOREIGN_KEY_CHECKS=0;',
            'TRUNCATE TABLE sdki_slki_relations;',
            'TRUNCATE TABLE slki_siki_relations;',
            'SET FOREIGN_KEY_CHECKS=1;',
            '',
        ];
        $skipped  = [];
        $rowCount = 0;

        $handle = fopen($path, 'r');

        while (($line = fgets($handle)) !== false) {
            $line = rtrim($line);

            // Hanya proses baris data (diawali | angka |)
            if (! preg_match('/^\|\s*\d+\s*\|/', $line)) {
                continue;
            }

            // Split kolom: | No | SDKI | SLKI | SIKI | Rasional |
            $parts = array_map('trim', explode('|', $line));
            // index: 0=empty, 1=No, 2=SDKI, 3=SLKI, 4=SIKI, 5=Rasional, 6=empty

            if (count($parts) < 5) {
                continue;
            }

            $sdkiCol = $parts[2] ?? '';
            $slkiCol = $parts[3] ?? '';
            $sikiCol = $parts[4] ?? '';

            preg_match('/\((D\.\d+)\)/', $sdkiCol, $sdkiMatch);
            preg_match('/\((L\.\d+)\)/', $slkiCol, $slkiMatch);
            preg_match_all('/\((I\.\d+)\)/', $sikiCol, $sikiMatches);

            if (empty($sdkiMatch[1]) || empty($slkiMatch[1])) {
                continue;
            }

            $sdkiKode = $sdkiMatch[1];
            $slkiKode = $slkiMatch[1];
            $sikiKodes = $sikiMatches[1] ?? [];
            $rowCount++;

            $diagnosaId = $sdkiMap[$sdkiKode] ?? null;
            $luaranId   = $slkiMap[$slkiKode] ?? null;

            if (! $diagnosaId) {
                $skipped[] = "Row {$rowCount}: SDKI {$sdkiKode} tidak ada di diagnosa_sdki";
                continue;
            }
            if (! $luaranId) {
                $skipped[] = "Row {$rowCount}: SLKI {$slkiKode} tidak ada di luaran_slki";
                continue;
            }

            $sdkiSlkiRows[] = ['diagnosa_id' => $diagnosaId, 'luaran_id' => $luaranId];
            $sqlLines[] = "INSERT IGNORE INTO `sdki_slki_relations` (`diagnosa_id`, `luaran_id`) VALUES ({$diagnosaId}, {$luaranId}); -- {$sdkiKode} -> {$slkiKode}";

            foreach ($sikiKodes as $sikiKode) {
                $intervensiId = $sikiMap[$sikiKode] ?? null;

                if (! $intervensiId) {
                    $skipped[] = "Row {$rowCount}: SIKI {$sikiKode} tidak ada di intervensi_siki";
                    continue;
                }

                $slkiSikiRows[] = ['luaran_id' => $luaranId, 'intervensi_id' => $intervensiId];
                $sqlLines[] = "INSERT IGNORE INTO `slki_siki_relations` (`luaran_id`, `intervensi_id`) VALUES ({$luaranId}, {$intervensiId}); -- {$slkiKode} -> {$sikiKode}";
            }
        }

        fclose($handle);

        // Batch insert
        foreach (array_chunk($sdkiSlkiRows, 100) as $chunk) {
            DB::table('sdki_slki_relations')->insertOrIgnore($chunk);
        }
        foreach (array_chunk($slkiSikiRows, 100) as $chunk) {
            DB::table('slki_siki_relations')->insertOrIgnore($chunk);
        }

        // Simpan SQL sebagai dokumentasi
        $sqlFile = database_path('seeders/data/relations_dari_hasil_md.sql');
        $sqlLines[] = '';
        $sqlLines[] = '-- sdki_slki_relations: ' . count($sdkiSlkiRows) . ' rows';
        $sqlLines[] = '-- slki_siki_relations: ' . count($slkiSikiRows) . ' rows';
        file_put_contents($sqlFile, implode("\n", $sqlLines));

        // Laporan
        $this->command->info('sdki_slki_relations: ' . count($sdkiSlkiRows) . ' baris');
        $this->command->info('slki_siki_relations: ' . count($slkiSikiRows) . ' baris');
        $this->command->info('SQL dokumentasi: ' . $sqlFile);

        if ($skipped) {
            $this->command->warn(count($skipped) . ' item dilewati (kode tidak ada di DB):');
            foreach ($skipped as $msg) {
                $this->command->warn('  ' . $msg);
            }
        }
    }

    private function resolveSourcePath(): ?string
    {
        $candidates = [
            database_path('seeders/data/hasil.md'),
            'C:/Users/kur/Downloads/hasil.md',
        ];

        foreach ($candidates as $path) {
            if (file_exists($path)) {
                return $path;
            }
        }

        return null;
    }
}
