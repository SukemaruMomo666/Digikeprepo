<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['sdki_id', 'urutan', 'deskripsi'])]
class SdkiKondisiKlinis extends Model
{
    public $timestamps = false;

    protected $table = 'sdki_kondisi_klinis';

    public function diagnosa(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'sdki_id');
    }
}
