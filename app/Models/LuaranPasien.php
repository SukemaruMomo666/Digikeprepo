<?php

namespace App\Models;

use Database\Factories\LuaranPasienFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

#[Fillable(['diagnosa_pasien_id', 'luaran_id'])]
class LuaranPasien extends Model
{
    /** @use HasFactory<LuaranPasienFactory> */
    use HasFactory;

    protected $table = 'luaran_pasien';

    public function diagnosaPasien(): BelongsTo
    {
        return $this->belongsTo(DiagnosaPasien::class);
    }

    public function luaran(): BelongsTo
    {
        return $this->belongsTo(LuaranSlki::class, 'luaran_id');
    }

    public function intervensiPasien(): HasMany
    {
        return $this->hasMany(IntervensiPasien::class);
    }

    public function evaluasi(): HasOne
    {
        return $this->hasOne(EvaluasiPasien::class);
    }
}
