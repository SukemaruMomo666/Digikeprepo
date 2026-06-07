<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['luaran_id', 'urutan', 'deskripsi', 'arah'])]
class SlkiKriteriaHasil extends Model
{
    public $timestamps = false;

    protected $table = 'slki_kriteria_hasil';

    public function luaran(): BelongsTo
    {
        return $this->belongsTo(LuaranSlki::class, 'luaran_id');
    }
}
