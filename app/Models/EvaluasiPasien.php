<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

#[Fillable(['luaran_pasien_id', 'hasil', 'catatan'])]
class EvaluasiPasien extends Model
{
    protected $table = 'evaluasi_pasien';

    /** @return array<string, string> */
    public static function labelHasil(): array
    {
        return [
            'tercapai' => 'Tercapai',
            'sebagian' => 'Tercapai Sebagian',
            'belum_tercapai' => 'Belum Tercapai',
        ];
    }

    public function luaranPasien(): BelongsTo
    {
        return $this->belongsTo(LuaranPasien::class);
    }
}
