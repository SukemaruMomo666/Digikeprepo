<?php

namespace App\Models;

use Database\Factories\PengkajianFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['pasien_id', 'pola_kesehatan', 'observasi', 'data', 'is_abnormal', 'tipe_data'])]
class Pengkajian extends Model
{
    /** @use HasFactory<PengkajianFactory> */
    use HasFactory;

    protected $table = 'pengkajian';

    protected function casts(): array
    {
        return [
            'is_abnormal' => 'boolean',
            'data' => 'array',
        ];
    }

    public function pasien(): BelongsTo
    {
        return $this->belongsTo(Pasien::class);
    }

    /** Semua label section pengkajian sesuai format keperawatan. */
    public static function labelPola(): array
    {
        return [
            // Riwayat Penyakit
            'riwayat_sekarang' => 'Riwayat Penyakit Sekarang',
            'riwayat_lalu' => 'Riwayat Penyakit Masa Lalu',
            'riwayat_keluarga' => 'Riwayat Kesehatan Keluarga',
            // Pengkajian Biologis
            'bio_nyaman' => 'Rasa Aman & Nyaman',
            'bio_aktivitas' => 'Aktivitas',
            'bio_istirahat' => 'Istirahat',
            'bio_tidur' => 'Tidur',
            'bio_cairan' => 'Cairan',
            'bio_nutrisi' => 'Nutrisi',
            'bio_eliminasi_feses' => 'Eliminasi Feses',
            'bio_eliminasi_urine' => 'Eliminasi Urine',
            'bio_oksigenasi' => 'Oksigenasi',
            'bio_kardiovaskuler' => 'Kardiovaskuler',
            'bio_hygiene' => 'Personal Hygiene',
            'bio_seks' => 'Seksualitas',
            // Psikososial & Spiritual
            'psiko_emosi' => 'Status Emosi',
            'psiko_konsep_diri' => 'Konsep Diri',
            'psiko_sosial' => 'Hubungan Sosial',
            'psiko_spiritual' => 'Spiritual',
            // Pemeriksaan Fisik
            'fisik_penglihatan' => 'Sistem Penglihatan',
            'fisik_pendengaran' => 'Sistem Pendengaran',
            'fisik_wicara' => 'Sistem Wicara',
            'fisik_pernafasan' => 'Sistem Pernafasan',
            'fisik_kardiovaskuler' => 'Sistem Kardiovaskuler',
            'fisik_hematologi' => 'Sistem Hematologi',
            'fisik_saraf' => 'Sistem Saraf Pusat',
            'fisik_pencernaan' => 'Sistem Pencernaan',
            'fisik_endokrin' => 'Sistem Endokrin',
            'fisik_urogenital' => 'Sistem Urogenital',
            'fisik_integumen' => 'Sistem Integumen',
            'fisik_muskuloskeletal' => 'Sistem Muskuloskeletal',
            'fisik_imun' => 'Sistem Kekebalan Tubuh',
        ];
    }

    /**
     * Pengelompokan section per tab.
     *
     * @return array<string, array{label: string, keys: list<string>}>
     */
    public static function sections(): array
    {
        return [
            'riwayat' => [
                'label' => 'Riwayat Penyakit',
                'keys' => ['riwayat_sekarang', 'riwayat_lalu', 'riwayat_keluarga'],
            ],
            'biologis' => [
                'label' => 'Pengkajian Biologis',
                'keys' => [
                    'bio_nyaman', 'bio_aktivitas', 'bio_istirahat', 'bio_tidur',
                    'bio_cairan', 'bio_nutrisi',
                    'bio_eliminasi_feses', 'bio_eliminasi_urine',
                    'bio_oksigenasi', 'bio_kardiovaskuler',
                    'bio_hygiene', 'bio_seks',
                ],
            ],
            'psikososial' => [
                'label' => 'Psikososial & Spiritual',
                'keys' => ['psiko_emosi', 'psiko_konsep_diri', 'psiko_sosial', 'psiko_spiritual'],
            ],
            'fisik' => [
                'label' => 'Pemeriksaan Fisik',
                'keys' => [
                    'fisik_penglihatan', 'fisik_pendengaran', 'fisik_wicara',
                    'fisik_pernafasan', 'fisik_kardiovaskuler', 'fisik_hematologi',
                    'fisik_saraf', 'fisik_pencernaan', 'fisik_endokrin',
                    'fisik_urogenital', 'fisik_integumen', 'fisik_muskuloskeletal',
                    'fisik_imun',
                ],
            ],
        ];
    }
}
