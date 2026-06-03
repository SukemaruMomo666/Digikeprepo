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
            SdkiSlkiSikiSeeder::class, // 148 SDKI + 109 SLKI + 72 SIKI dari Excel resmi
            DataMasterSeeder::class,   // Relasi SDKI→SLKI→SIKI + definisi/tindakan sample
        ]);
    }
}
