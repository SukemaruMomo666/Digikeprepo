<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('slki_siki_relations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('luaran_id')->constrained('luaran_slki')->cascadeOnDelete();
            $table->foreignId('intervensi_id')->constrained('intervensi_siki')->cascadeOnDelete();
            $table->unique(['luaran_id', 'intervensi_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('slki_siki_relations');
    }
};
