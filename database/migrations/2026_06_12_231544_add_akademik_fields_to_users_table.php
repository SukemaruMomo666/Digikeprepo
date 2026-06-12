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
        Schema::table('users', function (Blueprint $table) {
            $table->string('kelas', 10)->nullable()->after('role');
            $table->string('semester', 5)->nullable()->after('kelas');
            $table->string('angkatan', 10)->nullable()->after('semester');
            $table->string('prodi', 100)->nullable()->after('angkatan');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['kelas', 'semester', 'angkatan', 'prodi']);
        });
    }
};
