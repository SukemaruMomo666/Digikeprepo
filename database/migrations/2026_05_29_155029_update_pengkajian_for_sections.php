<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Change pola_kesehatan from ENUM to VARCHAR(60) — MySQL only (SQLite has no ENUM type so already text)
        if (DB::getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE pengkajian MODIFY COLUMN pola_kesehatan VARCHAR(60) NOT NULL');
        }

        Schema::table('pengkajian', function (Blueprint $table): void {
            $table->json('data')->nullable()->after('observasi');
        });
    }

    public function down(): void
    {
        Schema::table('pengkajian', function (Blueprint $table): void {
            $table->dropColumn('data');
        });
    }
};
