<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['sdki_id', 'tipe', 'jenis', 'urutan', 'deskripsi', 'tersedia'])]
class SdkiGejala extends Model
{
    public $timestamps = false;

    protected $table = 'sdki_gejala';

    protected function casts(): array
    {
        return ['tersedia' => 'boolean'];
    }

    public function diagnosa(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'sdki_id');
    }
}
