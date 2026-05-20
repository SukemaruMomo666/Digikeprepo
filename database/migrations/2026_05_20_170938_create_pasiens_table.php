<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pasien', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->string('no_rm', 20);
            $table->string('nama_pasien');
            $table->unsignedTinyInteger('umur');
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->string('ruang_rawat', 100)->nullable();
            $table->date('tanggal_masuk');
            $table->enum('status_askep', ['draft', 'selesai'])->default('draft');
            $table->timestamps();

            $table->unique(['user_id', 'no_rm']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pasien');
    }
};
