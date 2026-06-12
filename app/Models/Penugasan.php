<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Penugasan extends Model
{
    protected $table = 'penugasan';

    protected $fillable = [
        'mahasiswa_id',
        'dosen_id',
        'tipe_dosen',
        'angkatan',
        'kelas',
        'stase',
        'rs',
        'bangsal',
        'periode_mulai',
        'periode_selesai',
    ];

    const TIPE_OPTIONS = ['Dosen Wali', 'Dosen Klinik', 'Dosen Pengampu', 'Dosen Penguji', 'Lainnya'];

    protected $casts = [
        'periode_mulai' => 'date',
        'periode_selesai' => 'date',
    ];

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(User::class, 'mahasiswa_id');
    }

    public function dosen(): BelongsTo
    {
        return $this->belongsTo(User::class, 'dosen_id');
    }
}
