<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('luaran_slki', function (Blueprint $table) {
            $table->id();
            $table->string('kode_luaran', 10)->unique();
            $table->string('label_luaran');
            $table->text('definisi')->nullable();
            $table->text('kriteria_hasil')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('luaran_slki');
    }
};
