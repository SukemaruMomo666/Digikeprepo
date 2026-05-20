<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('intervensi_siki', function (Blueprint $table) {
            $table->id();
            $table->string('kode_intervensi', 10)->unique();
            $table->string('label_intervensi');
            $table->text('definisi')->nullable();
            $table->text('tindakan')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('intervensi_siki');
    }
};
