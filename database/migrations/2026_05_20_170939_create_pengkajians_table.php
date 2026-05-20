<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pengkajian', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pasien_id')->constrained('pasien')->cascadeOnDelete();
            $table->enum('pola_kesehatan', [
                'persepsi_kesehatan',
                'nutrisi_metabolik',
                'eliminasi',
                'aktivitas_latihan',
                'tidur_istirahat',
                'kognitif_perseptual',
                'persepsi_diri',
                'peran_hubungan',
                'seksualitas_reproduksi',
                'koping_toleransi_stres',
                'nilai_kepercayaan',
            ]);
            $table->text('observasi')->nullable();
            $table->boolean('is_abnormal')->default(false);
            $table->enum('tipe_data', ['DS', 'DO'])->nullable();
            $table->timestamps();

            $table->unique(['pasien_id', 'pola_kesehatan']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pengkajian');
    }
};
