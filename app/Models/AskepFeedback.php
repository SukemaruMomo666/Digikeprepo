<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AskepFeedback extends Model
{
    protected $table = 'askep_feedback';

    protected $fillable = [
        'askep_id',
        'dosen_id',
        'catatan_umum',
        'catatan_detail',
        'status',
    ];

    protected $casts = [
        'catatan_detail' => 'array',
    ];

    public function askep(): BelongsTo
    {
        return $this->belongsTo(Askep::class);
    }

    public function dosen(): BelongsTo
    {
        return $this->belongsTo(User::class, 'dosen_id');
    }
}
