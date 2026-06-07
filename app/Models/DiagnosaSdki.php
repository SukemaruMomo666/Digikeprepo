<?php

namespace App\Models;

use Database\Factories\DiagnosaSdkiFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

#[Fillable(['kode_diagnosa', 'label_diagnosa', 'kategori', 'subkategori', 'tipe_diagnosa', 'definisi'])]
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

    /** Diagnosa askep mahasiswa yang menggunakan SDKI ini. */
    public function askepDiagnosa(): HasMany
    {
        return $this->hasMany(AskepDiagnosa::class, 'sdki_id');
    }

    /** Penyebab diagnosa (untuk tipe Aktual & Promosi Kesehatan). */
    public function penyebab(): HasMany
    {
        return $this->hasMany(SdkiPenyebab::class, 'sdki_id')->orderBy('kelompok')->orderBy('urutan');
    }

    /** Faktor risiko (untuk tipe Risiko). */
    public function faktorRisiko(): HasMany
    {
        return $this->hasMany(SdkiFaktorRisiko::class, 'sdki_id')->orderBy('urutan');
    }

    /** Gejala dan tanda (Mayor/Minor × Subjektif/Objektif). */
    public function gejala(): HasMany
    {
        return $this->hasMany(SdkiGejala::class, 'sdki_id')->orderBy('tipe')->orderBy('jenis')->orderBy('urutan');
    }

    /** Kondisi klinis terkait. */
    public function kondisiKlinis(): HasMany
    {
        return $this->hasMany(SdkiKondisiKlinis::class, 'sdki_id')->orderBy('urutan');
    }
}
