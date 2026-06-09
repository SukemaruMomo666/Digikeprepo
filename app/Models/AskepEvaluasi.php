<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable([
    'askep_diagnosa_id', 'tanggal', 'jam', 'hari_ke',
    'komplikasi', 'catatan_soap',
    'tv_td', 'tv_rr', 'tv_nadi', 'tv_spo2', 'tv_suhu',
    'skor_indikator', 'analisis', 'analisis_narasi',
    'tindak_lanjut', 'penanggung_jawab',
])]
class AskepEvaluasi extends Model
{
    use HasFactory;

    protected $table = 'askep_evaluasi';

    protected function casts(): array
    {
        return [
            'tanggal' => 'date',
            'hari_ke' => 'integer',
            'tv_rr' => 'integer',
            'tv_nadi' => 'integer',
            'tv_spo2' => 'integer',
            'tv_suhu' => 'float',
            'skor_indikator' => 'array',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function askepDiagnosa(): BelongsTo
    {
        return $this->belongsTo(AskepDiagnosa::class);
    }

    /**
     * Get the label for the analysis attribute.
     */
    public function analisisLabel(): string
    {
        return match ($this->analisis) {
            'Tercapai' => 'Tercapai',
            'Membaik' => 'Membaik / Teratasi Sebagian',
            'Belum Tercapai' => 'Belum Tercapai',
            default => $this->analisis ?? '-',
        };
    }
}
