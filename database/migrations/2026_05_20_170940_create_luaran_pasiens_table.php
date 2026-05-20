<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('luaran_pasien', function (Blueprint $table) {
            $table->id();
            $table->foreignId('diagnosa_pasien_id')->constrained('diagnosa_pasien')->cascadeOnDelete();
            $table->foreignId('luaran_id')->constrained('luaran_slki');
            $table->timestamps();

            $table->unique(['diagnosa_pasien_id', 'luaran_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('luaran_pasien');
    }
};
