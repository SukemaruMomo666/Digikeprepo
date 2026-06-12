<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ExcelDataMasterSeeder extends Seeder
{
    public function run(): void
    {
        $csvDir = database_path('seeders/data/csv-master');

        if (!File::isDirectory($csvDir)) {
            $this->command->error("Directory not found: {$csvDir}");
            return;
        }

        $this->command->info("Truncating existing 3S data...");
        $this->truncateTables();

        $this->command->info("Importing SDKI...");
        $this->importSdki($csvDir . '/detail_sdki.csv');

        $this->command->info("Importing SLKI...");
        $this->importSlki($csvDir . '/detail_slki.csv');

        $this->command->info("Importing SIKI...");
        $this->importSiki($csvDir . '/detail_siki.csv');

        $this->command->info("Importing Relations from Data Rapi...");
        $this->importRelations($csvDir . '/data_rapi.csv');

        $this->command->info("Data master from Excel successfully imported!");
    }

    private function truncateTables(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::table('sdki_penyebab')->truncate();
        DB::table('sdki_gejala')->truncate();
        DB::table('sdki_faktor_risiko')->truncate();
        DB::table('sdki_kondisi_klinis')->truncate();
        DB::table('slki_kriteria_hasil')->truncate();
        DB::table('siki_tindakan')->truncate();
        DB::table('sdki_slki_relations')->truncate();
        DB::table('slki_siki_relations')->truncate();
        DB::table('diagnosa_sdki')->truncate();
        DB::table('luaran_slki')->truncate();
        DB::table('intervensi_siki')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }

    private function importSdki(string $path): void
    {
        if (!file_exists($path)) return;
        $handle = fopen($path, 'r');
        $header = fgetcsv($handle);
        
        while (($row = fgetcsv($handle)) !== FALSE) {
            if (empty($row[0])) continue; // Skip if Kode SDKI is empty
            
            $kode = trim($row[0]);
            $nama = trim($row[1]);
            $kategori = trim($row[2]);
            $subkategori = trim($row[3]);
            $definisi = trim($row[4]);
            
            // Determine tipe_diagnosa from name or context (default to Aktual if not sure)
            $tipe = 'Aktual';
            if (str_contains(strtolower($nama), 'risiko')) $tipe = 'Risiko';
            if (str_contains(strtolower($nama), 'kesiapan')) $tipe = 'Promosi Kesehatan';

            $sdki = DB::table('diagnosa_sdki')->where('kode_diagnosa', $kode)->first();
            if ($sdki) {
                $sdkiId = $sdki->id;
                DB::table('diagnosa_sdki')->where('id', $sdkiId)->update([
                    'label_diagnosa' => $nama,
                    'kategori' => $kategori,
                    'subkategori' => $subkategori,
                    'definisi' => $definisi,
                    'tipe_diagnosa' => $tipe,
                    'updated_at' => now(),
                ]);
            } else {
                $sdkiId = DB::table('diagnosa_sdki')->insertGetId([
                    'kode_diagnosa' => $kode,
                    'label_diagnosa' => $nama,
                    'kategori' => $kategori,
                    'subkategori' => $subkategori,
                    'definisi' => $definisi,
                    'tipe_diagnosa' => $tipe,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            // Parse Penyebab
            $this->parseListToTable($row[5], 'sdki_penyebab', ['sdki_id' => $sdkiId, 'kelompok' => 'Umum']);
            
            // Parse Gejala Mayor Subjektif
            $this->parseGejala($row[6], $sdkiId, 'Mayor', 'Subjektif');
            // Parse Gejala Mayor Objektif
            $this->parseGejala($row[7], $sdkiId, 'Mayor', 'Objektif');
            // Parse Gejala Minor Subjektif
            $this->parseGejala($row[8], $sdkiId, 'Minor', 'Subjektif');
            // Parse Gejala Minor Objektif
            $this->parseGejala($row[9], $sdkiId, 'Minor', 'Objektif');
            
            // Parse Kondisi Klinis
            $this->parseListToTable($row[10], 'sdki_kondisi_klinis', ['sdki_id' => $sdkiId]);
        }
        fclose($handle);
    }

    private function importSlki(string $path): void
    {
        if (!file_exists($path)) return;
        $handle = fopen($path, 'r');
        $header = fgetcsv($handle);
        
        while (($row = fgetcsv($handle)) !== FALSE) {
            if (empty($row[0])) continue;
            
            $kode = trim($row[0]);
            $nama = trim($row[1] ?: 'Tanpa Nama');
            
            $slki = DB::table('luaran_slki')->where('kode_luaran', $kode)->first();
            if ($slki) {
                $slkiId = $slki->id;
                DB::table('luaran_slki')->where('id', $slkiId)->update([
                    'label_luaran' => $nama,
                    'updated_at' => now(),
                ]);
            } else {
                $slkiId = DB::table('luaran_slki')->insertGetId([
                    'kode_luaran' => $kode,
                    'label_luaran' => $nama,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            // Parse Kriteria Hasil
            $lines = explode("\n", $row[2]);
            foreach ($lines as $i => $line) {
                $cleanLine = trim(preg_replace('/^\d+\.\s*/', '', $line));
                if (empty($cleanLine)) continue;
                
                $arah = 'Membaik';
                if (str_contains(strtolower($cleanLine), 'meningkat')) $arah = 'Meningkat';
                if (str_contains(strtolower($cleanLine), 'menurun')) $arah = 'Menurun';

                DB::table('slki_kriteria_hasil')->insert([
                    'luaran_id' => $slkiId,
                    'urutan' => $i + 1,
                    'deskripsi' => $cleanLine,
                    'arah' => $arah,
                ]);
            }
        }
        fclose($handle);
    }

    private function importSiki(string $path): void
    {
        if (!file_exists($path)) return;
        $handle = fopen($path, 'r');
        $header = fgetcsv($handle);
        
        while (($row = fgetcsv($handle)) !== FALSE) {
            if (empty($row[1])) continue; // Kode SIKI
            
            $kode = trim($row[1]);
            $nama = trim($row[2] ?: 'Tanpa Nama');
            $definisi = trim($row[3]);

            $sikiId = DB::table('intervensi_siki')->insertOrIgnore([
                'kode_intervensi' => $kode,
                'label_intervensi' => $nama,
                'definisi' => $definisi,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            
            // Re-fetch ID if insertOrIgnore skipped
            if (!$sikiId) {
                $sikiId = DB::table('intervensi_siki')->where('kode_intervensi', $kode)->value('id');
            }

            // Parse Tindakan
            $this->parseTindakan($row[4], $sikiId, 'Observasi');
            $this->parseTindakan($row[5], $sikiId, 'Terapeutik');
            $this->parseTindakan($row[6], $sikiId, 'Edukasi');
            $this->parseTindakan($row[7], $sikiId, 'Kolaborasi');
        }
        fclose($handle);
    }

    private function importRelations(string $path): void
    {
        if (!file_exists($path)) return;
        $handle = fopen($path, 'r');
        $header = fgetcsv($handle);
        
        while (($row = fgetcsv($handle)) !== FALSE) {
            $kodeSdki = trim($row[0]);
            $kodeSlki = trim($row[4]);
            $kodesSiki = trim($row[6]); // Can be multiple separated by comma

            $sdkiId = DB::table('diagnosa_sdki')->where('kode_diagnosa', $kodeSdki)->value('id');
            $slki = DB::table('luaran_slki')->where('kode_luaran', $kodeSlki)->first();
            
            if ($slki) {
                $slkiId = $slki->id;
                // Update label if empty or 'Tanpa Nama'
                if (empty($slki->label_luaran) || $slki->label_luaran == 'Tanpa Nama') {
                    DB::table('luaran_slki')->where('id', $slkiId)->update(['label_luaran' => trim($row[5])]);
                }
            } else {
                $slkiId = null;
            }

            if ($sdkiId && $slkiId) {
                DB::table('sdki_slki_relations')->insertOrIgnore([
                    'diagnosa_id' => $sdkiId,
                    'luaran_id' => $slkiId,
                ]);
            }

            if ($slkiId && !empty($kodesSiki)) {
                $sikiKodeList = explode(',', $kodesSiki);
                $sikiNamaList = explode(';', trim($row[7]));
                
                foreach ($sikiKodeList as $idx => $sikiKode) {
                    $sikiKode = trim($sikiKode);
                    $sikiNama = isset($sikiNamaList[$idx]) ? trim($sikiNamaList[$idx]) : null;
                    
                    $siki = DB::table('intervensi_siki')->where('kode_intervensi', $sikiKode)->first();
                    if ($siki) {
                        $sikiId = $siki->id;
                        if ($sikiNama && (empty($siki->label_intervensi) || $siki->label_intervensi == 'Tanpa Nama')) {
                            DB::table('intervensi_siki')->where('id', $sikiId)->update(['label_intervensi' => $sikiNama]);
                        }
                        
                        DB::table('slki_siki_relations')->insertOrIgnore([
                            'luaran_id' => $slkiId,
                            'intervensi_id' => $sikiId,
                        ]);
                    }
                }
            }
        }
        fclose($handle);
    }

    private function parseListToTable(string $text, string $table, array $extraData): void
    {
        $lines = explode("\n", $text);
        foreach ($lines as $i => $line) {
            $cleanLine = trim(preg_replace('/^\d+\.\s*/', '', $line));
            if (empty($cleanLine) || $cleanLine == '-') continue;

            $data = array_merge($extraData, [
                'urutan' => $i + 1,
                'deskripsi' => $cleanLine,
            ]);
            DB::table($table)->insert($data);
        }
    }

    private function parseGejala(string $text, int $sdkiId, string $tipe, string $jenis): void
    {
        $lines = explode("\n", $text);
        foreach ($lines as $i => $line) {
            $cleanLine = trim(preg_replace('/^\d+\.\s*/', '', $line));
            if (empty($cleanLine) || $cleanLine == '-') continue;

            DB::table('sdki_gejala')->insert([
                'sdki_id' => $sdkiId,
                'tipe' => $tipe,
                'jenis' => $jenis,
                'urutan' => $i + 1,
                'deskripsi' => $cleanLine,
            ]);
        }
    }

    private function parseTindakan(string $text, int $sikiId, string $jenis): void
    {
        $lines = explode("\n", $text);
        foreach ($lines as $i => $line) {
            $cleanLine = trim(preg_replace('/^\d+\.\s*/', '', $line));
            if (empty($cleanLine) || $cleanLine == '-') continue;

            DB::table('siki_tindakan')->insert([
                'intervensi_id' => $sikiId,
                'jenis' => $jenis,
                'urutan' => $i + 1,
                'deskripsi' => $cleanLine,
            ]);
        }
    }
}
