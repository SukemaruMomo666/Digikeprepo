<?php

namespace App\Models;

use Database\Factories\PasienFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable([
    'user_id', 'no_rm', 'nama_pasien', 'umur', 'jenis_kelamin',
    'ruang_rawat', 'tanggal_masuk', 'tanggal_lahir',
    'agama', 'status_perkawinan', 'pekerjaan', 'pendidikan',
    'alamat', 'diagnosa_medis', 'bb', 'tb',
])]
class Pasien extends Model
{
    /** @use HasFactory<PasienFactory> */
    use HasFactory;

    protected $table = 'pasien';

    protected function casts(): array
    {
        return [
            'tanggal_masuk' => 'date',
            'tanggal_lahir' => 'date',
            'umur' => 'integer',
            'bb' => 'float',
            'tb' => 'integer',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function askep(): HasMany
    {
        return $this->hasMany(Askep::class)->latest();
    }

    public function riwayat(): HasMany
    {
        return $this->hasMany(RiwayatPasien::class)->latest();
    }

    // ── Computed helpers ──────────────────────────────────────────────────────

    /** Ambil askep aktif (draft / in-progress) terakhir, atau null jika tidak ada. */
    public function askepAktif(): ?Askep
    {
        return $this->askep()
            ->whereNotIn('status', [Askep::STATUS_SELESAI])
            ->latest()
            ->first();
    }

    /** Cek apakah masih ada askep yang belum selesai. */
    public function isDraft(): bool
    {
        return $this->askep()
            ->whereNotIn('status', [Askep::STATUS_SELESAI])
            ->exists();
    }

    /** Cek apakah semua askep sudah selesai (dan minimal ada 1). */
    public function isSelesai(): bool
    {
        $total = $this->askep()->count();
        $selesai = $this->askep()->where('status', Askep::STATUS_SELESAI)->count();

        return $total > 0 && $total === $selesai;
    }

    /** URL langkah Askep aktif berikutnya. */
    public function nextAskepStep(): string
    {
        $aktif = $this->askepAktif();

        if (! $aktif) {
            return route('pasien.askep.create', $this);
        }

        return $aktif->nextStepUrl();
    }

    /** Catat aktivitas ke tabel riwayat_pasien. */
    public function catatRiwayat(string $aktivitas): void
    {
        $this->riwayat()->create(['aktivitas' => $aktivitas]);
    }
}
