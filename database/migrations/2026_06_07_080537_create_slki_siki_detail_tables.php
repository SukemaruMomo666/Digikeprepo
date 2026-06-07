<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('slki_kriteria_hasil', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('luaran_id')->constrained('luaran_slki')->cascadeOnDelete();
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->enum('arah', ['Meningkat', 'Menurun', 'Membaik']);
            $table->index('luaran_id');
        });

        Schema::create('siki_tindakan', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('intervensi_id')->constrained('intervensi_siki')->cascadeOnDelete();
            $table->enum('jenis', ['Observasi', 'Terapeutik', 'Edukasi', 'Kolaborasi']);
            $table->unsignedTinyInteger('urutan')->default(1);
            $table->text('deskripsi');
            $table->index(['intervensi_id', 'jenis']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('siki_tindakan');
        Schema::dropIfExists('slki_kriteria_hasil');
    }
};
