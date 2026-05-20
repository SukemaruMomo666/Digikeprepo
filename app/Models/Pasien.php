<?php

namespace App\Models;

use Database\Factories\PasienFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

#[Fillable(['user_id', 'no_rm', 'nama_pasien', 'umur', 'jenis_kelamin', 'ruang_rawat', 'tanggal_masuk', 'status_askep'])]
class Pasien extends Model
{
    /** @use HasFactory<PasienFactory> */
    use HasFactory;

    protected $table = 'pasien';

    protected function casts(): array
    {
        return [
            'tanggal_masuk' => 'date',
            'umur' => 'integer',
        ];
    }

    // ── Relationships ─────────────────────────────────────────────────────────

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function pengkajian(): HasMany
    {
        return $this->hasMany(Pengkajian::class);
    }

    public function diagnosaPasien(): HasMany
    {
        return $this->hasMany(DiagnosaPasien::class);
    }

    public function riwayat(): HasMany
    {
        return $this->hasMany(RiwayatPasien::class)->latest();
    }

    public function luaranPasien(): HasManyThrough
    {
        return $this->hasManyThrough(LuaranPasien::class, DiagnosaPasien::class);
    }

    public function intervensiPasien(): Builder
    {
        return IntervensiPasien::whereHas(
            'luaranPasien.diagnosaPasien',
            fn ($q) => $q->where('pasien_id', $this->id)
        );
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    /**
     * Kembalikan URL langkah Askep berikutnya yang belum selesai.
     * Digunakan oleh tombol "Lanjutkan Askep".
     */
    public function nextAskepStep(): string
    {
        if (! $this->pengkajian()->exists()) {
            return route('pasien.pengkajian', $this);
        }

        if (! $this->diagnosaPasien()->exists()) {
            return route('pasien.diagnosa', $this);
        }

        if (! $this->luaranPasien()->exists()) {
            return route('pasien.luaran', $this);
        }

        if (! $this->intervensiPasien()->exists()) {
            return route('pasien.intervensi', $this);
        }

        return route('pasien.askep', $this);
    }

    /** Catat aktivitas ke tabel riwayat_pasien. */
    public function catatRiwayat(string $aktivitas): void
    {
        $this->riwayat()->create(['aktivitas' => $aktivitas]);
    }

    public function isDraft(): bool
    {
        return $this->status_askep === 'draft';
    }

    public function isSelesai(): bool
    {
        return $this->status_askep === 'selesai';
    }
}
