<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('evaluasi_pasien', function (Blueprint $table) {
            $table->id();
            $table->foreignId('luaran_pasien_id')->constrained('luaran_pasien')->cascadeOnDelete();
            $table->enum('hasil', ['tercapai', 'sebagian', 'belum_tercapai']);
            $table->text('catatan')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('evaluasi_pasien');
    }
};
