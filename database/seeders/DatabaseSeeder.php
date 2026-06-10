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
            SdkiSlkiSikiSeeder::class, // 149 SDKI + 110 SLKI + 73 SIKI dari Excel resmi
            SdkiDetailSeeder::class,   // Penyebab, faktor risiko, gejala, kondisi klinis (D.0001-D.0096)
            DataMasterSeeder::class,   // Relasi SDKI→SLKI→SIKI + definisi/tindakan sample
            SlkiSikiDetailSeeder::class, // Kriteria Hasil SLKI & Tindakan SIKI dari file eksternal
        ]);
    }
}
