<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Penyebab — khusus diagnosa Aktual & Promosi Kesehatan
        Schema::create('sdki_penyebab', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('sdki_id')->constrained('diagnosa_sdki')->cascadeOnDelete();
            $table->enum('kelompok', ['Fisiologis', 'Psikologis', 'Situasional', 'Umum'])->default('Umum');
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->index(['sdki_id', 'kelompok']);
        });

        // Faktor Risiko — khusus diagnosa Risiko
        Schema::create('sdki_faktor_risiko', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('sdki_id')->constrained('diagnosa_sdki')->cascadeOnDelete();
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->index('sdki_id');
        });

        // Gejala & Tanda — Mayor/Minor × Subjektif/Objektif
        Schema::create('sdki_gejala', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('sdki_id')->constrained('diagnosa_sdki')->cascadeOnDelete();
            $table->enum('tipe', ['Mayor', 'Minor']);
            $table->enum('jenis', ['Subjektif', 'Objektif']);
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->boolean('tersedia')->default(true)->comment('false = tidak tersedia sesuai buku');
            $table->index(['sdki_id', 'tipe', 'jenis']);
        });

        // Kondisi Klinis Terkait
        Schema::create('sdki_kondisi_klinis', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('sdki_id')->constrained('diagnosa_sdki')->cascadeOnDelete();
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->index('sdki_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sdki_kondisi_klinis');
        Schema::dropIfExists('sdki_gejala');
        Schema::dropIfExists('sdki_faktor_risiko');
        Schema::dropIfExists('sdki_penyebab');
    }
};
