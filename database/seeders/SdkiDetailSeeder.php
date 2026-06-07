<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SdkiDetailSeeder extends Seeder
{
    /**
     * @return list<string>
     */
    private function files(): array
    {
        return [
            'sdki_adapted_d0001_d0021.sql',
            'sdki_adapted_d0022_d0047.sql',
            'sdki_adapted_d0048_d0073.sql',
            'sdki_adapted_d0072_d0096.sql',
        ];
    }

    public function run(): void
    {
        // Hapus detail lama supaya idempotent saat dijalankan ulang.
        DB::table('sdki_kondisi_klinis')->truncate();
        DB::table('sdki_gejala')->truncate();
        DB::table('sdki_faktor_risiko')->truncate();
        DB::table('sdki_penyebab')->truncate();

        $dataDir = database_path('seeders/data');

        foreach ($this->files() as $file) {
            $sql = file_get_contents("{$dataDir}/{$file}");
            $sql = preg_replace('/^\xEF\xBB\xBF/', '', $sql) ?? $sql;
            $codes = $this->diagnosaCodes($sql);

            // Pisahkan per statement (diakhiri ;\n)
            $parts = explode(";\n", $sql);

            DB::transaction(function () use ($codes, $parts): void {
                $this->deleteDetailsFor($codes);

                foreach ($parts as $part) {
                    // Hapus baris komentar di awal, ambil baris yang bukan komentar
                    $lines = array_filter(
                        explode("\n", $part),
                        fn ($line) => ! str_starts_with(ltrim($line), '--')
                    );

                    $stmt = trim(implode("\n", $lines));

                    if ($stmt === '') {
                        continue;
                    }

                    $stmt = $this->normalizeStatement($stmt);

                    DB::unprepared($stmt);
                }
            });

            $this->command->info("Imported: {$file}");
        }
    }

    /**
     * @return list<string>
     */
    private function diagnosaCodes(string $sql): array
    {
        preg_match_all("/'D\\.\\d{4}'/", $sql, $matches);

        return array_values(array_unique(array_map(
            fn (string $code): string => trim($code, "'"),
            $matches[0] ?? []
        )));
    }

    /**
     * @param  list<string>  $codes
     */
    private function deleteDetailsFor(array $codes): void
    {
        if ($codes === []) {
            return;
        }

        $diagnosaIds = DB::table('diagnosa_sdki')
            ->whereIn('kode_diagnosa', $codes)
            ->pluck('id');

        if ($diagnosaIds->isEmpty()) {
            return;
        }

        DB::table('sdki_kondisi_klinis')->whereIn('sdki_id', $diagnosaIds)->delete();
        DB::table('sdki_gejala')->whereIn('sdki_id', $diagnosaIds)->delete();
        DB::table('sdki_faktor_risiko')->whereIn('sdki_id', $diagnosaIds)->delete();
        DB::table('sdki_penyebab')->whereIn('sdki_id', $diagnosaIds)->delete();
    }

    private function normalizeStatement(string $stmt): string
    {
        if (! str_starts_with($stmt, 'INSERT INTO sdki_gejala')) {
            return $stmt;
        }

        return preg_replace(
            "/(\(\(SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D\.\d{4}'\),\s*'[^']+',\s*'[^']+',\s*\d+,\s*'(?:''|[^'])*')\)/",
            '$1, 1)',
            $stmt
        ) ?? $stmt;
    }
}
