<?php

namespace App\Models;

use Database\Factories\IntervensiSikiFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

#[Fillable(['kode_intervensi', 'label_intervensi', 'definisi', 'tindakan'])]
class IntervensiSiki extends Model
{
    /** @use HasFactory<IntervensiSikiFactory> */
    use HasFactory, SoftDeletes;

    protected $table = 'intervensi_siki';

    /** Luaran SLKI yang terkait dengan intervensi ini. */
    public function luaranSlki(): BelongsToMany
    {
        return $this->belongsToMany(LuaranSlki::class, 'slki_siki_relations', 'intervensi_id', 'luaran_id');
    }

    /** Tindakan keperawatan per jenis (Observasi, Terapeutik, Edukasi, Kolaborasi). */
    public function sikiTindakan(): HasMany
    {
        return $this->hasMany(SikiTindakan::class, 'intervensi_id')->orderBy('urutan');
    }

    /** Intervensi askep mahasiswa yang menggunakan SIKI ini. */
    public function askepIntervensi(): HasMany
    {
        return $this->hasMany(AskepIntervensi::class, 'siki_id');
    }
}
