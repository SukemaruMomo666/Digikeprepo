<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Update ENUM role di tabel users
        // Karena SQLite tidak mendukung MODIFY COLUMN ENUM, kita harus berhati-hati.
        // Untuk MySQL/MariaDB:
        if (DB::getDriverName() !== 'sqlite') {
            DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('mahasiswa', 'dosen', 'admin') NOT NULL DEFAULT 'mahasiswa'");
        }

        // 2. Tabel penugasan mahasiswa ke dosen
        Schema::create('penugasan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('mahasiswa_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('dosen_id')->constrained('users')->onDelete('cascade');
            $table->year('angkatan')->nullable();
            $table->string('kelas', 10)->nullable();
            $table->string('stase', 100)->nullable();
            $table->string('rs', 255)->nullable();
            $table->string('bangsal', 100)->nullable();
            $table->date('periode_mulai')->nullable();
            $table->date('periode_selesai')->nullable();
            $table->timestamps();
        });

        // 3. Tabel feedback dari dosen
        Schema::create('askep_feedback', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_id')->constrained('askep')->onDelete('cascade');
            $table->foreignId('dosen_id')->constrained('users')->onDelete('cascade');
            $table->text('catatan_umum')->nullable();
            $table->json('catatan_detail')->nullable(); // {step: catatan} per langkah
            $table->enum('status', ['disetujui', 'perlu_revisi']);
            $table->timestamps();
        });

        // 4. Tabel log pembelajaran (Gibbs Cycle)
        Schema::create('log_pembelajaran', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->date('tanggal_shift');
            $table->enum('shift', ['Pagi', 'Siang', 'Malam']);
            $table->string('ruang', 100)->nullable();
            $table->text('konteks_kasus')->nullable();
            $table->text('description')->nullable();
            $table->text('feelings')->nullable();
            $table->text('evaluation')->nullable();
            $table->text('analysis')->nullable();
            $table->text('conclusion')->nullable();
            $table->text('action_plan')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('log_pembelajaran');
        Schema::dropIfExists('askep_feedback');
        Schema::dropIfExists('penugasan');

        if (DB::getDriverName() !== 'sqlite') {
            DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('mahasiswa', 'admin') NOT NULL DEFAULT 'mahasiswa'");
        }
    }
};
