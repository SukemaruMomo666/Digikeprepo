<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('askep_diagnosa_luaran', function (Blueprint $table) {
            $table->json('skor_indikator')->nullable()->after('target_waktu');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('askep_diagnosa_luaran', function (Blueprint $table) {
            $table->dropColumn('skor_indikator');
        });
    }
};
