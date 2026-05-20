<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diagnosa_pasien', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pasien_id')->constrained('pasien')->cascadeOnDelete();
            $table->foreignId('diagnosa_id')->constrained('diagnosa_sdki');
            $table->text('data_subjektif')->nullable();
            $table->text('data_objektif')->nullable();
            $table->timestamps();

            $table->unique(['pasien_id', 'diagnosa_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('diagnosa_pasien');
    }
};
