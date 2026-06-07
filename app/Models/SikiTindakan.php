<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['intervensi_id', 'jenis', 'urutan', 'deskripsi'])]
class SikiTindakan extends Model
{
    public $timestamps = false;

    protected $table = 'siki_tindakan';

    public function intervensi(): BelongsTo
    {
        return $this->belongsTo(IntervensiSiki::class, 'intervensi_id');
    }
}
