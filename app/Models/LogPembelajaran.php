<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LogPembelajaran extends Model
{
    protected $table = 'log_pembelajaran';

    protected $fillable = [
        'user_id',
        'tanggal_shift',
        'shift',
        'ruang',
        'konteks_kasus',
        'description',
        'feelings',
        'evaluation',
        'analysis',
        'conclusion',
        'action_plan',
    ];

    protected $casts = [
        'tanggal_shift' => 'date',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
