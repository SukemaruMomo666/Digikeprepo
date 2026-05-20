<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diagnosa_sdki', function (Blueprint $table) {
            $table->id();
            $table->string('kode_diagnosa', 10)->unique();
            $table->string('label_diagnosa');
            $table->text('definisi')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('diagnosa_sdki');
    }
};
