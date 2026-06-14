<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class MasterData3SSeeder extends Seeder
{
    public function run(): void
    {
        $path = database_path('seeders/data/import_3s_master.sql');

        if (! File::exists($path)) {
            $this->command->error("File not found: {$path}");

            return;
        }

        $this->command->info('Importing master data 3S from SQL file...');

        $sql = File::get($path);
        $sql = preg_replace('/^\xEF\xBB\xBF/', '', $sql) ?? $sql;

        $statements = array_values(array_filter(array_map('trim', explode(";\n", $sql))));

        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        foreach ($statements as $statement) {
            $sqlOnly = trim(preg_replace('/--[^\n]*\n?/', '', $statement) ?? '');
            if (empty($sqlOnly)) {
                continue;
            }
            DB::unprepared($statement.';');
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        $sdkiCount = DB::table('diagnosa_sdki')->count();
        $slkiCount = DB::table('luaran_slki')->count();
        $sikiCount = DB::table('intervensi_siki')->count();

        $this->command->info("Selesai: {$sdkiCount} diagnosa SDKI, {$slkiCount} luaran SLKI, {$sikiCount} intervensi SIKI.");
    }
}
