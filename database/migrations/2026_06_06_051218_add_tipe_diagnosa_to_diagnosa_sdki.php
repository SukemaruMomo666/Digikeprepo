<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('diagnosa_sdki', function (Blueprint $table): void {
            $table->enum('tipe_diagnosa', ['Aktual', 'Risiko', 'Promosi Kesehatan'])
                ->nullable()
                ->after('subkategori');
        });
    }

    public function down(): void
    {
        Schema::table('diagnosa_sdki', function (Blueprint $table): void {
            $table->dropColumn('tipe_diagnosa');
        });
    }
};
