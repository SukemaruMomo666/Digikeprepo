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

        if (! File::isDirectory($dataDir)) {
            $this->command->error("Directory not found: {$dataDir}");

            return;
        }

        // Truncate detail tables (no unique constraints) so re-runs are idempotent.
        // Main 3S tables use INSERT IGNORE with their unique kode_* columns.
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::table('slki_kriteria_hasil')->truncate();
        DB::table('siki_tindakan')->truncate();
        DB::table('sdki_penyebab')->truncate();
        DB::table('sdki_gejala')->truncate();
        DB::table('sdki_faktor_risiko')->truncate();
        DB::table('sdki_kondisi_klinis')->truncate();
        DB::table('sdki_slki_relations')->truncate();
        DB::table('slki_siki_relations')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        $files = collect(File::files($dataDir))
            ->filter(fn ($file) => $file->getExtension() === 'sql')
            ->sortBy(fn ($file) => $file->getFilename());

        foreach ($files as $file) {
            $this->command->info('Seeding: '.$file->getFilename());
            $this->executeSqlFile($file->getPathname());
        }

        $this->command->info('Data master 3S berhasil diintegrasikan.');
    }

    private function executeSqlFile(string $path): void
    {
        $sql = File::get($path);
        $sql = preg_replace('/^\xEF\xBB\xBF/', '', $sql) ?? $sql;

        // ── Step 0: Fix typos present in some batch files ─────────────────────
        $sql = str_replace('descripsi', 'deskripsi', $sql);

        // ── Step 1: Rename legacy table names → actual schema names ──────────
        $tableRenames = [
            'INSERT IGNORE INTO slki '      => 'INSERT IGNORE INTO luaran_slki ',
            'INSERT IGNORE INTO siki '      => 'INSERT IGNORE INTO intervensi_siki ',
            'INSERT IGNORE INTO sdki '      => 'INSERT IGNORE INTO diagnosa_sdki ',
            'FROM slki WHERE'               => 'FROM luaran_slki WHERE',
            'FROM siki WHERE'               => 'FROM intervensi_siki WHERE',
            'FROM sdki WHERE'               => 'FROM diagnosa_sdki WHERE',
            'UPDATE siki '                  => 'UPDATE intervensi_siki ',
            'UPDATE slki '                  => 'UPDATE luaran_slki ',
            'UPDATE sdki '                  => 'UPDATE diagnosa_sdki ',
            'INSERT IGNORE INTO sdki_slki ' => 'INSERT IGNORE INTO sdki_slki_relations ',
            'INSERT IGNORE INTO slki_siki ' => 'INSERT IGNORE INTO slki_siki_relations ',
            'nama_luaran'                   => 'label_luaran',
            'nama_intervensi'               => 'label_intervensi',
            'nama_diagnosa'                 => 'label_diagnosa',
        ];
        foreach ($tableRenames as $old => $new) {
            $sql = str_replace($old, $new, $sql);
        }

        // ── Step 1b: Strip tipe_intervensi — column not in intervensi_siki schema ─
        $sql = str_replace(', tipe_intervensi', '', $sql);
        $sql = preg_replace_callback(
            '/INSERT IGNORE INTO intervensi_siki\b.*?;/s',
            fn ($m) => preg_replace("/, '(?:Utama|Pendukung)'/", '', $m[0]),
            $sql
        );

        // ── Step 2: Fix FK column names in relation tables ────────────────────
        $sql = preg_replace(
            '/INSERT IGNORE INTO sdki_slki_relations\s*\(sdki_id,\s*slki_id\)/',
            'INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id)',
            $sql
        );
        $sql = preg_replace(
            '/INSERT IGNORE INTO slki_siki_relations\s*\(slki_id,\s*siki_id/',
            'INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id',
            $sql
        );

        // ── Step 3: Fix siki_tindakan FK column: siki_id → intervensi_id ─────
        $sql = str_replace('siki_tindakan (siki_id,', 'siki_tindakan (intervensi_id,', $sql);

        // ── Step 4: Fix slki_kriteria_hasil column + value format ─────────────
        // Column header: kode_luaran → luaran_id
        $sql = str_replace('slki_kriteria_hasil (kode_luaran,', 'slki_kriteria_hasil (luaran_id,', $sql);
        // Values: ('L.XXXXX', ...) → ((SELECT id FROM luaran_slki WHERE kode_luaran='L.XXXXX'), ...)
        // Scoped to only slki_kriteria_hasil INSERT blocks to avoid touching luaran_slki INSERTs.
        $sql = preg_replace_callback(
            '/INSERT INTO slki_kriteria_hasil\b.*?;/s',
            fn ($m) => preg_replace(
                "/\('(L\.\d+)',/",
                "((SELECT id FROM luaran_slki WHERE kode_luaran='$1'),",
                $m[0]
            ),
            $sql
        );

        // ── Step 5: Skip tables not present in current schema ─────────────────
        $sql = preg_replace('/INSERT\s+(?:IGNORE\s+)?INTO sdki_siki\b[^;]*;/s', '-- skipped sdki_siki', $sql);
        $sql = preg_replace('/CREATE TABLE IF NOT EXISTS siki_rasional\b[^;]*;/s', '-- skipped create siki_rasional', $sql);
        $sql = preg_replace('/INSERT\s+(?:IGNORE\s+)?INTO siki_rasional\b[^;]*;/s', '-- skipped siki_rasional', $sql);

        // ── Step 6: Split and execute statements ──────────────────────────────
        $statements = array_values(array_filter(array_map('trim', explode(";\n", $sql))));

        foreach ($statements as $statement) {
            // Strip comments to check if there's actual SQL — MySQL handles comments natively
            $sqlOnly = trim(preg_replace('/--[^\n]*\n?/', '', $statement) ?? '');
            if (empty($sqlOnly)) {
                continue;
            }
            try {
                DB::unprepared($statement.';');
            } catch (\Exception $e) {
                if (! str_contains($e->getMessage(), 'Duplicate entry')) {
                    $this->command->warn('Error ['.basename($path).']: '.substr($statement, 0, 120).'...');
                    $this->command->error($e->getMessage());
                }
            }
        }
    }
}
