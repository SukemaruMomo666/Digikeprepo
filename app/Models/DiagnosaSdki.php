<?php

namespace App\Models;

use Database\Factories\DiagnosaSdkiFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

#[Fillable(['kode_diagnosa', 'label_diagnosa', 'kategori', 'subkategori', 'definisi'])]
class DiagnosaSdki extends Model
{
    /** @use HasFactory<DiagnosaSdkiFactory> */
    use HasFactory, SoftDeletes;

    protected $table = 'diagnosa_sdki';

    /** Luaran SLKI yang relevan untuk diagnosa ini (via relasi mapping). */
    public function luaranSlki(): BelongsToMany
    {
        return $this->belongsToMany(LuaranSlki::class, 'sdki_slki_relations', 'diagnosa_id', 'luaran_id');
    }

    /** Diagnosa yang sudah dipilih oleh mahasiswa. */
    public function diagnosaPasien(): HasMany
    {
        return $this->hasMany(DiagnosaPasien::class, 'diagnosa_id');
    }
}
