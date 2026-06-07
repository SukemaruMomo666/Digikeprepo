<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['sdki_id', 'urutan', 'deskripsi'])]
class SdkiFaktorRisiko extends Model
{
    public $timestamps = false;

    protected $table = 'sdki_faktor_risiko';

    public function diagnosa(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'sdki_id');
    }
}
