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
            DataMaster3SSeeder::class, // Menggantikan SdkiSlkiSikiSeeder, SdkiDetailSeeder, SlkiSikiDetailSeeder, dan DataMasterSeeder
        ]);
    }
}
