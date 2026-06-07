<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['sdki_id', 'kelompok', 'urutan', 'deskripsi'])]
class SdkiPenyebab extends Model
{
    public $timestamps = false;

    protected $table = 'sdki_penyebab';

    public function diagnosa(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'sdki_id');
    }
}
