<?php

use App\Models\Askep;
use App\Models\AskepDiagnosa;
use App\Models\DiagnosaSdki;
use App\Models\LuaranSlki;
use App\Models\Pasien;
use App\Models\SlkiKriteriaHasil;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Livewire\Livewire;

test('mahasiswa bisa melihat indikator kriteria hasil di halaman perencanaan', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);
    $askep = Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $mahasiswa->id,
        'step_terakhir' => 2,
    ]);
    $sdki = DiagnosaSdki::factory()->create([
        'kode_diagnosa' => 'D.0001',
        'label_diagnosa' => 'Bersihan jalan napas tidak efektif',
    ]);
    $slki = LuaranSlki::factory()->create([
        'kode_luaran' => 'L.01001',
        'label_luaran' => 'Bersihan Jalan Napas',
    ]);

    DB::table('sdki_slki_relations')->insert([
        'diagnosa_id' => $sdki->id,
        'luaran_id' => $slki->id,
    ]);

    SlkiKriteriaHasil::create([
        'luaran_id' => $slki->id,
        'urutan' => 1,
        'deskripsi' => 'Batuk efektif',
        'arah' => 'Meningkat',
    ]);

    AskepDiagnosa::factory()->create([
        'askep_id' => $askep->id,
        'sdki_id' => $sdki->id,
        'prioritas' => 1,
    ]);

    Livewire::actingAs($mahasiswa)
        ->test('pages::mahasiswa.askep.perencanaan', ['askep' => $askep])
        ->call('toggleLuaran', 0, 0)
        ->assertSee('Indikator Kriteria Hasil')
        ->assertSee('Batuk efektif')
        ->assertSee('1. Menurun')
        ->assertSee('5. Meningkat');
});

test('mahasiswa bisa menyimpan nilai indikator di perencanaan', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);
    $askep = Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $mahasiswa->id,
        'step_terakhir' => 2,
    ]);
    $sdki = DiagnosaSdki::factory()->create();
    $slki = LuaranSlki::factory()->create();

    DB::table('sdki_slki_relations')->insert([
        'diagnosa_id' => $sdki->id,
        'luaran_id' => $slki->id,
    ]);

    $kriteria = SlkiKriteriaHasil::create([
        'luaran_id' => $slki->id,
        'urutan' => 1,
        'deskripsi' => 'Batuk efektif',
        'arah' => 'Meningkat',
    ]);

    AskepDiagnosa::factory()->create([
        'askep_id' => $askep->id,
        'sdki_id' => $sdki->id,
        'prioritas' => 1,
    ]);

    Livewire::actingAs($mahasiswa)
        ->test('pages::mahasiswa.askep.perencanaan', ['askep' => $askep])
        ->call('toggleLuaran', 0, 0)
        ->set("rencana.0.luaran.0.skor_indikator.{$kriteria->id}", '5')
        ->call('simpanLanjut');

    $this->assertDatabaseHas('askep_diagnosa_luaran', [
        'slki_id' => $slki->id,
    ]);

    $skorIndikator = DB::table('askep_diagnosa_luaran')
        ->where('slki_id', $slki->id)
        ->value('skor_indikator');

    expect(json_decode($skorIndikator, true))->toBe([(string) $kriteria->id => 5]);
});
