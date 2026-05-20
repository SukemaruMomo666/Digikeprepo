<?php

namespace App\Models;

use Database\Factories\DiagnosaPasienFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['pasien_id', 'diagnosa_id', 'data_subjektif', 'data_objektif'])]
class DiagnosaPasien extends Model
{
    /** @use HasFactory<DiagnosaPasienFactory> */
    use HasFactory;

    protected $table = 'diagnosa_pasien';

    public function pasien(): BelongsTo
    {
        return $this->belongsTo(Pasien::class);
    }

    public function diagnosa(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'diagnosa_id');
    }

    public function luaranPasien(): HasMany
    {
        return $this->hasMany(LuaranPasien::class);
    }
}
