<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            AdminSeeder::class,
            MahasiswaSeeder::class,
            DosenSeeder::class,
            ImportMahasiswaExcelSeeder::class, // Import 367 mahasiswa & 12 dosen dari CSV
            ExcelDataMaster3SSeeder::class, // Data master 3S dari Excel DATA MASTER_INI RIL.xlsx
        ]);
    }
}
