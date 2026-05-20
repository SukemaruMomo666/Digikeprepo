<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['pasien_id', 'aktivitas'])]
class RiwayatPasien extends Model
{
    protected $table = 'riwayat_pasien';

    /** Tabel ini hanya append — tidak ada updated_at. */
    const UPDATED_AT = null;

    public function pasien(): BelongsTo
    {
        return $this->belongsTo(Pasien::class);
    }
}
