<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('diagnosa_sdki', function (Blueprint $table): void {
            $table->string('kategori')->nullable()->after('label_diagnosa');
            $table->string('subkategori')->nullable()->after('kategori');
        });
    }

    public function down(): void
    {
        Schema::table('diagnosa_sdki', function (Blueprint $table): void {
            $table->dropColumn(['kategori', 'subkategori']);
        });
    }
};
