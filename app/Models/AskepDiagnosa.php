<?php

namespace App\Models;

use Database\Factories\AskepDiagnosaFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable([
    'askep_id', 'sdki_id', 'prioritas', 'etiologi_dipilih', 'gejala_dipilih',
])]
class AskepDiagnosa extends Model
{
    /** @use HasFactory<AskepDiagnosaFactory> */
    use HasFactory;

    protected $table = 'askep_diagnosa';

    protected function casts(): array
    {
        return [
            'prioritas' => 'integer',
            'etiologi_dipilih' => 'array',
            'gejala_dipilih' => 'array',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function askep(): BelongsTo
    {
        return $this->belongsTo(Askep::class);
    }

    public function sdki(): BelongsTo
    {
        return $this->belongsTo(DiagnosaSdki::class, 'sdki_id');
    }

    public function luaran(): HasMany
    {
        return $this->hasMany(AskepDiagnosaLuaran::class);
    }

    public function intervensi(): HasMany
    {
        return $this->hasMany(AskepIntervensi::class);
    }

    public function evaluasi(): HasMany
    {
        return $this->hasMany(AskepEvaluasi::class);
    }
}
