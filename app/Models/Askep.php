<?php

namespace App\Models;

use Database\Factories\AskepFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

#[Fillable([
    'pasien_id', 'user_id', 'status', 'step_terakhir',
    'catatan_dosen', 'submitted_at', 'reviewed_at',
])]
class Askep extends Model
{
    /** @use HasFactory<AskepFactory> */
    use HasFactory;

    protected $table = 'askep';

    protected function casts(): array
    {
        return [
            'step_terakhir' => 'integer',
            'submitted_at' => 'datetime',
            'reviewed_at' => 'datetime',
        ];
    }

    // ── Status constants ──────────────────────────────────────────────────────

    const STATUS_DRAFT = 'draft';

    const STATUS_MENUNGGU_REVIEW = 'menunggu_review';

    const STATUS_PERLU_REVISI = 'perlu_revisi';

    const STATUS_DISETUJUI = 'disetujui';

    const STATUS_SELESAI = 'selesai';

    // ── Relationships ─────────────────────────────────────────────────────────

    public function pasien(): BelongsTo
    {
        return $this->belongsTo(Pasien::class);
    }

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function feedbacks(): HasMany
    {
        return $this->hasMany(AskepFeedback::class);
    }

    public function pengkajian(): HasOne
    {
        return $this->hasOne(AskepPengkajian::class);
    }

    public function diagnosa(): HasMany
    {
        return $this->hasMany(AskepDiagnosa::class)->orderBy('prioritas');
    }

    // ── Step helpers ──────────────────────────────────────────────────────────

    /**
     * URL langkah Askep berikutnya yang belum selesai.
     * Digunakan oleh tombol "Lanjutkan Askep".
     */
    public function nextStepUrl(): string
    {
        return match (true) {
            $this->step_terakhir < 1 => route('askep.pengkajian', $this),
            $this->step_terakhir < 2 => route('askep.diagnosa', $this),
            $this->step_terakhir < 3 => route('askep.perencanaan', $this),
            $this->step_terakhir < 4 => route('askep.implementasi', $this),
            $this->step_terakhir < 5 => route('askep.evaluasi', $this),
            default => route('askep.show', $this),
        };
    }

    // ── Status helpers ────────────────────────────────────────────────────────

    public function isDraft(): bool
    {
        return $this->status === self::STATUS_DRAFT;
    }

    public function isSelesai(): bool
    {
        return $this->status === self::STATUS_SELESAI;
    }

    public function isMenungguReview(): bool
    {
        return $this->status === self::STATUS_MENUNGGU_REVIEW;
    }

    public function isDisetujui(): bool
    {
        return $this->status === self::STATUS_DISETUJUI;
    }

    /** Label status dalam Bahasa Indonesia. */
    public function statusLabel(): string
    {
        return match ($this->status) {
            self::STATUS_DRAFT => 'Draft',
            self::STATUS_MENUNGGU_REVIEW => 'Menunggu Review',
            self::STATUS_PERLU_REVISI => 'Perlu Revisi',
            self::STATUS_DISETUJUI => 'Disetujui',
            self::STATUS_SELESAI => 'Selesai',
            default => ucfirst($this->status),
        };
    }
}
