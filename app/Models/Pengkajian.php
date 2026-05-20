<?php

namespace App\Models;

use Database\Factories\PengkajianFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['pasien_id', 'pola_kesehatan', 'observasi', 'is_abnormal', 'tipe_data'])]
class Pengkajian extends Model
{
    /** @use HasFactory<PengkajianFactory> */
    use HasFactory;

    protected $table = 'pengkajian';

    protected function casts(): array
    {
        return [
            'is_abnormal' => 'boolean',
        ];
    }

    public function pasien(): BelongsTo
    {
        return $this->belongsTo(Pasien::class);
    }

    /** Daftar label 11 Pola Gordon yang bisa ditampilkan ke UI. */
    public static function labelPola(): array
    {
        return [
            'persepsi_kesehatan' => 'Persepsi Kesehatan',
            'nutrisi_metabolik' => 'Nutrisi-Metabolik',
            'eliminasi' => 'Eliminasi',
            'aktivitas_latihan' => 'Aktivitas-Latihan',
            'tidur_istirahat' => 'Tidur-Istirahat',
            'kognitif_perseptual' => 'Kognitif-Perseptual',
            'persepsi_diri' => 'Persepsi Diri',
            'peran_hubungan' => 'Peran-Hubungan',
            'seksualitas_reproduksi' => 'Seksualitas-Reproduksi',
            'koping_toleransi_stres' => 'Koping-Toleransi Stres',
            'nilai_kepercayaan' => 'Nilai-Kepercayaan',
        ];
    }
}
