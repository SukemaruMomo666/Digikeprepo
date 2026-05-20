<?php

namespace App\Models;

use Database\Factories\IntervensiPasienFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['luaran_pasien_id', 'intervensi_id'])]
class IntervensiPasien extends Model
{
    /** @use HasFactory<IntervensiPasienFactory> */
    use HasFactory;

    protected $table = 'intervensi_pasien';

    public function luaranPasien(): BelongsTo
    {
        return $this->belongsTo(LuaranPasien::class);
    }

    public function intervensi(): BelongsTo
    {
        return $this->belongsTo(IntervensiSiki::class, 'intervensi_id');
    }
}
