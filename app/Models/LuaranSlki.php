<?php

namespace App\Models;

use Database\Factories\LuaranSlkiFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

#[Fillable(['kode_luaran', 'label_luaran', 'definisi', 'kriteria_hasil'])]
class LuaranSlki extends Model
{
    /** @use HasFactory<LuaranSlkiFactory> */
    use HasFactory, SoftDeletes;

    protected $table = 'luaran_slki';

    /** Diagnosa SDKI yang terkait dengan luaran ini. */
    public function diagnosaSdki(): BelongsToMany
    {
        return $this->belongsToMany(DiagnosaSdki::class, 'sdki_slki_relations', 'luaran_id', 'diagnosa_id');
    }

    /** Intervensi SIKI yang relevan untuk luaran ini (via relasi mapping). */
    public function intervensiSiki(): BelongsToMany
    {
        return $this->belongsToMany(IntervensiSiki::class, 'slki_siki_relations', 'luaran_id', 'intervensi_id');
    }

    /** Luaran askep mahasiswa yang menggunakan SLKI ini. */
    public function askepDiagnosaLuaran(): HasMany
    {
        return $this->hasMany(AskepDiagnosaLuaran::class, 'slki_id');
    }
}
