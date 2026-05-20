<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('intervensi_pasien', function (Blueprint $table) {
            $table->id();
            $table->foreignId('luaran_pasien_id')->constrained('luaran_pasien')->cascadeOnDelete();
            $table->foreignId('intervensi_id')->constrained('intervensi_siki');
            $table->timestamps();

            $table->unique(['luaran_pasien_id', 'intervensi_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('intervensi_pasien');
    }
};
