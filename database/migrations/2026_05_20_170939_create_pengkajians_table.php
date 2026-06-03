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
            $table->string('pola_kesehatan', 60);
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
