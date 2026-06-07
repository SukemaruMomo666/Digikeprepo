<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable([
    'askep_intervensi_id', 'tanggal', 'waktu', 'shift', 'durasi_menit',
    'tindakan_dilakukan', 'spo2_sebelum', 'spo2_setelah', 'catatan', 'respons_pasien',
])]
class AskepImplementasi extends Model
{
    use HasFactory;

    protected $table = 'askep_implementasi';

    public $timestamps = false;

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'tindakan_dilakukan' => 'array',
            'durasi_menit' => 'integer',
            'spo2_sebelum' => 'integer',
            'spo2_setelah' => 'integer',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function intervensi(): BelongsTo
    {
        return $this->belongsTo(AskepIntervensi::class, 'askep_intervensi_id');
    }
}
