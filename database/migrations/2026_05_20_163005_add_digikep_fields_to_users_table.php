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
            $table->string('nim_nip', 30)->unique()->after('id');
            $table->enum('role', ['mahasiswa', 'admin'])->default('mahasiswa')->after('email');
            $table->boolean('is_first_login')->default(true)->after('role');
            $table->string('email')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropUnique(['nim_nip']);
            $table->dropColumn(['nim_nip', 'role', 'is_first_login']);
            $table->string('email')->nullable(false)->change();
        });
    }
};
