<?php

use Database\Seeders\DataMaster3SSeeder;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Artisan;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Jalankan seeder master data 3S secara otomatis
        Artisan::call('db:seed', [
            '--class' => DataMaster3SSeeder::class,
            '--force' => true,
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Tidak ada aksi reverse khusus karena data master bersifat akumulatif
    }
};
