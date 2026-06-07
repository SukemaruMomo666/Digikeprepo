<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable([
    'askep_diagnosa_id', 'siki_id', 'nama_manual',
    'frekuensi', 'tindakan_dipilih', 'is_included',
])]
class AskepIntervensi extends Model
{
    use HasFactory;

    protected $table = 'askep_intervensi';

    protected function casts(): array
    {
        return [
            'tindakan_dipilih' => 'array',
            'is_included' => 'boolean',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function askepDiagnosa(): BelongsTo
    {
        return $this->belongsTo(AskepDiagnosa::class);
    }

    public function siki(): BelongsTo
    {
        return $this->belongsTo(IntervensiSiki::class, 'siki_id');
    }

    public function implementasi(): HasMany
    {
        return $this->hasMany(AskepImplementasi::class);
    }
}
