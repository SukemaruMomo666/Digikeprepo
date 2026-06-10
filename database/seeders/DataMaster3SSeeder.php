<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class DataMaster3SSeeder extends Seeder
{
    public function run(): void
    {
        $dataDir = database_path('seeders/data/data-3s');
        
        if (!File::isDirectory($dataDir)) {
            $this->command->error("Directory not found: {$dataDir}");
            return;
        }

        $files = collect(File::files($dataDir))
            ->filter(fn($file) => $file->getExtension() === 'sql')
            ->sortBy(fn($file) => $file->getFilename());

        foreach ($files as $file) {
            $this->command->info("Seeding: " . $file->getFilename());
            $this->executeSqlFile($file->getPathname());
        }

        $this->command->info('Data master 3S berhasil diintegrasikan.');
    }

    private function executeSqlFile(string $path): void
    {
        $sql = File::get($path);
        
        // Transformasi nama tabel dari SQL lama ke schema baru
        $replacements = [
            'INSERT IGNORE INTO slki ' => 'INSERT IGNORE INTO luaran_slki ',
            'INSERT IGNORE INTO siki ' => 'INSERT IGNORE INTO intervensi_siki ',
            'INSERT IGNORE INTO sdki ' => 'INSERT IGNORE INTO diagnosa_sdki ',
            
            // Mapping ID references dalam subquery dan statement lain
            'FROM slki' => 'FROM luaran_slki',
            'FROM siki' => 'FROM intervensi_siki',
            'FROM sdki' => 'FROM diagnosa_sdki',
            
            'UPDATE siki ' => 'UPDATE intervensi_siki ',
            'UPDATE slki ' => 'UPDATE luaran_slki ',
            'UPDATE sdki ' => 'UPDATE diagnosa_sdki ',

            'INSERT IGNORE INTO sdki_slki ' => 'INSERT IGNORE INTO sdki_slki_relations ',
            'INSERT IGNORE INTO slki_siki ' => 'INSERT IGNORE INTO slki_siki_relations ',
            
            // Transformasi kolom
            'nama_luaran' => 'label_luaran',
            'nama_intervensi' => 'label_intervensi',
            'nama_diagnosa' => 'label_diagnosa',
        ];

        // Khusus untuk mapping relasi dan foreign keys
        // Gunakan regex untuk menghindari penggantian parsial yang salah
        $sql = str_replace('sdki_id', 'diagnosa_id', $sql);
        $sql = str_replace('siki_id', 'intervensi_id', $sql);
        
        foreach ($replacements as $old => $new) {
            $sql = str_replace($old, $new, $sql);
        }

        // Hapus BOM jika ada
        $sql = preg_replace('/^\xEF\xBB\xBF/', '', $sql) ?? $sql;

        // Split dan eksekusi
        $statements = array_filter(array_map('trim', explode(";\n", $sql)));

        DB::transaction(function () use ($statements) {
            foreach ($statements as $statement) {
                if (empty($statement) || str_starts_with($statement, '--')) {
                    continue;
                }
                try {
                    DB::unprepared($statement . ';');
                } catch (\Exception $e) {
                    // Log error tapi lanjut jika insert ignore gagal karena duplikat
                    if (!str_contains($e->getMessage(), 'Duplicate entry')) {
                        $this->command->warn("Error in statement: " . substr($statement, 0, 100) . "...");
                        $this->command->error($e->getMessage());
                    }
                }
            }
        });
    }
}
