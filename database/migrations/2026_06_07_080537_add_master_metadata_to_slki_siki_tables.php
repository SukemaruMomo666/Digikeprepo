<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('luaran_slki', function (Blueprint $table): void {
            if (! Schema::hasColumn('luaran_slki', 'kategori')) {
                $table->string('kategori')->nullable()->after('label_luaran');
            }

            if (! Schema::hasColumn('luaran_slki', 'subkategori')) {
                $table->string('subkategori')->nullable()->after('kategori');
            }
        });

        Schema::table('intervensi_siki', function (Blueprint $table): void {
            if (! Schema::hasColumn('intervensi_siki', 'kategori')) {
                $table->string('kategori')->nullable()->after('label_intervensi');
            }

            if (! Schema::hasColumn('intervensi_siki', 'subkategori')) {
                $table->string('subkategori')->nullable()->after('kategori');
            }
        });

        if (DB::getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE intervensi_siki MODIFY kode_intervensi VARCHAR(10) NULL');
        }
    }

    public function down(): void
    {
        Schema::table('intervensi_siki', function (Blueprint $table): void {
            if (Schema::hasColumn('intervensi_siki', 'subkategori')) {
                $table->dropColumn('subkategori');
            }

            if (Schema::hasColumn('intervensi_siki', 'kategori')) {
                $table->dropColumn('kategori');
            }
        });

        Schema::table('luaran_slki', function (Blueprint $table): void {
            if (Schema::hasColumn('luaran_slki', 'subkategori')) {
                $table->dropColumn('subkategori');
            }

            if (Schema::hasColumn('luaran_slki', 'kategori')) {
                $table->dropColumn('kategori');
            }
        });
    }
};
