<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable([
    'askep_id',
    // Penanggung jawab
    'pj_nama', 'pj_umur', 'pj_pendidikan', 'pj_pekerjaan', 'pj_alamat',
    // EWS / Tanda vital
    'ews_td', 'ews_nadi', 'ews_rr', 'ews_suhu', 'ews_spo2', 'ews_kesadaran', 'ews_skor',
    // Anthropometri
    'bb', 'tb',
    // Riwayat
    'riwayat_sekarang', 'riwayat_lalu', 'riwayat_keluarga',
    // Biologis
    'biologis_nyeri', 'biologis_aktivitas', 'biologis_istirahat', 'biologis_tidur',
    'biologis_cairan', 'biologis_nutrisi', 'biologis_eliminasi_feses', 'biologis_eliminasi_urine',
    'biologis_oksigenasi', 'biologis_kardiovaskuler', 'biologis_hygiene', 'biologis_seksualitas',
    // Psikososial
    'psiko_emosi', 'psiko_konsep_diri', 'psiko_sosial', 'psiko_spiritual',
    // Pemeriksaan fisik
    'fisik_umum', 'fisik_penglihatan', 'fisik_pendengaran', 'fisik_wicara',
    'fisik_pernapasan', 'fisik_kardiovaskuler', 'fisik_hematologi', 'fisik_saraf',
    'fisik_pencernaan', 'fisik_endokrin', 'fisik_urogenital', 'fisik_integumen',
    'fisik_muskuloskeletal', 'fisik_imun',
])]
class AskepPengkajian extends Model
{
    use HasFactory;

    protected $table = 'askep_pengkajian';

    protected function casts(): array
    {
        return [
            'pj_umur' => 'integer',
            'ews_nadi' => 'integer',
            'ews_rr' => 'integer',
            'ews_suhu' => 'float',
            'ews_spo2' => 'integer',
            'ews_skor' => 'integer',
            'bb' => 'float',
            'tb' => 'integer',
            'riwayat_sekarang' => 'array',
            'riwayat_lalu' => 'array',
            'riwayat_keluarga' => 'array',
            'biologis_nyeri' => 'array',
            'biologis_aktivitas' => 'array',
            'biologis_istirahat' => 'array',
            'biologis_tidur' => 'array',
            'biologis_cairan' => 'array',
            'biologis_nutrisi' => 'array',
            'biologis_eliminasi_feses' => 'array',
            'biologis_eliminasi_urine' => 'array',
            'biologis_oksigenasi' => 'array',
            'biologis_kardiovaskuler' => 'array',
            'biologis_hygiene' => 'array',
            'biologis_seksualitas' => 'array',
            'psiko_emosi' => 'array',
            'psiko_konsep_diri' => 'array',
            'psiko_sosial' => 'array',
            'psiko_spiritual' => 'array',
            'fisik_penglihatan' => 'array',
            'fisik_pendengaran' => 'array',
            'fisik_wicara' => 'array',
            'fisik_pernapasan' => 'array',
            'fisik_kardiovaskuler' => 'array',
            'fisik_hematologi' => 'array',
            'fisik_saraf' => 'array',
            'fisik_pencernaan' => 'array',
            'fisik_endokrin' => 'array',
            'fisik_urogenital' => 'array',
            'fisik_integumen' => 'array',
            'fisik_muskuloskeletal' => 'array',
            'fisik_imun' => 'array',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function askep(): BelongsTo
    {
        return $this->belongsTo(Askep::class);
    }

    // ── EWS Helper ────────────────────────────────────────────────────────────

    /**
     * Hitung Early Warning Score berdasarkan parameter TTV.
     * Skor 0–14 (semakin tinggi semakin kritis).
     */
    public static function hitungEws(
        string $td,
        int $nadi,
        int $rr,
        float $suhu,
        int $spo2,
        string $kesadaran
    ): int {
        $skor = 0;

        [$sistolik] = array_map('intval', explode('/', $td));
        $skor += match (true) {
            $sistolik <= 70 => 3,
            $sistolik <= 80 => 2,
            $sistolik <= 100 => 1,
            $sistolik <= 199 => 0,
            default => 3,
        };

        $skor += match (true) {
            $nadi <= 40 => 3,
            $nadi <= 50 => 1,
            $nadi <= 100 => 0,
            $nadi <= 110 => 1,
            $nadi <= 129 => 2,
            default => 3,
        };

        $skor += match (true) {
            $rr <= 8 => 3,
            $rr <= 11 => 1,
            $rr <= 20 => 0,
            $rr <= 24 => 2,
            default => 3,
        };

        $skor += match (true) {
            $suhu <= 35.0 => 3,
            $suhu <= 36.0 => 1,
            $suhu <= 38.0 => 0,
            $suhu <= 38.5 => 1,
            $suhu <= 39.0 => 2,
            default => 3,
        };

        $skor += match (true) {
            $spo2 <= 85 => 3,
            $spo2 <= 89 => 2,
            $spo2 <= 93 => 1,
            default => 0,
        };

        $skor += match (strtolower($kesadaran)) {
            'alert', 'composmentis' => 0,
            'voice', 'apatis' => 1,
            'pain', 'somnolen' => 2,
            'unresponsive', 'koma' => 3,
            default => 0,
        };

        return $skor;
    }
}
