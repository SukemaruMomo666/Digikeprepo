<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['askep_diagnosa_id', 'slki_id', 'target_waktu'])]
class AskepDiagnosaLuaran extends Model
{
    use HasFactory;

    protected $table = 'askep_diagnosa_luaran';

    // ── Relationships ─────────────────────────────────────────────────────────

    public function askepDiagnosa(): BelongsTo
    {
        return $this->belongsTo(AskepDiagnosa::class);
    }

    public function slki(): BelongsTo
    {
        return $this->belongsTo(LuaranSlki::class, 'slki_id');
    }
}
