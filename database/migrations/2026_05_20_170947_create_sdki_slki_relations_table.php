<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('sdki_slki_relations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('diagnosa_id')->constrained('diagnosa_sdki')->cascadeOnDelete();
            $table->foreignId('luaran_id')->constrained('luaran_slki')->cascadeOnDelete();
            $table->unique(['diagnosa_id', 'luaran_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sdki_slki_relations');
    }
};
