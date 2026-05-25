<?php

use App\Models\DiagnosaPasien;
use App\Models\DiagnosaSdki;
use App\Models\EvaluasiPasien;
use App\Models\IntervensiPasien;
use App\Models\IntervensiSiki;
use App\Models\LuaranPasien;
use App\Models\LuaranSlki;
use App\Models\Pasien;
use App\Models\Pengkajian;

// ── nextAskepStep ─────────────────────────────────────────────────────────────

test('nextAskepStep mengarahkan ke pengkajian ketika belum ada data', function () {
    $pasien = Pasien::factory()->create();

    expect($pasien->nextAskepStep())->toBe(route('pasien.pengkajian', $pasien));
});

test('nextAskepStep mengarahkan ke diagnosa setelah pengkajian ada', function () {
    $pasien = Pasien::factory()->create();
    Pengkajian::factory()->create(['pasien_id' => $pasien->id]);

    expect($pasien->nextAskepStep())->toBe(route('pasien.diagnosa', $pasien));
});

test('nextAskepStep mengarahkan ke luaran setelah diagnosa ada', function () {
    $pasien = Pasien::factory()->create();
    Pengkajian::factory()->create(['pasien_id' => $pasien->id]);
    $diagnosa = DiagnosaSdki::factory()->create();
    DiagnosaPasien::factory()->create([
        'pasien_id' => $pasien->id,
        'diagnosa_id' => $diagnosa->id,
    ]);

    expect($pasien->nextAskepStep())->toBe(route('pasien.luaran', $pasien));
});

test('nextAskepStep mengarahkan ke intervensi setelah luaran ada', function () {
    $pasien = Pasien::factory()->create();
    Pengkajian::factory()->create(['pasien_id' => $pasien->id]);
    $diagnosa = DiagnosaSdki::factory()->create();
    $diagnosaPasien = DiagnosaPasien::factory()->create([
        'pasien_id' => $pasien->id,
        'diagnosa_id' => $diagnosa->id,
    ]);
    $luaran = LuaranSlki::factory()->create();
    LuaranPasien::factory()->create([
        'diagnosa_pasien_id' => $diagnosaPasien->id,
        'luaran_id' => $luaran->id,
    ]);

    expect($pasien->nextAskepStep())->toBe(route('pasien.intervensi', $pasien));
});

test('nextAskepStep mengarahkan ke evaluasi setelah intervensi ada', function () {
    $pasien = Pasien::factory()->create();
    Pengkajian::factory()->create(['pasien_id' => $pasien->id]);
    $diagnosa = DiagnosaSdki::factory()->create();
    $diagnosaPasien = DiagnosaPasien::factory()->create([
        'pasien_id' => $pasien->id,
        'diagnosa_id' => $diagnosa->id,
    ]);
    $luaran = LuaranSlki::factory()->create();
    $luaranPasien = LuaranPasien::factory()->create([
        'diagnosa_pasien_id' => $diagnosaPasien->id,
        'luaran_id' => $luaran->id,
    ]);
    $intervensi = IntervensiSiki::factory()->create();
    IntervensiPasien::factory()->create([
        'luaran_pasien_id' => $luaranPasien->id,
        'intervensi_id' => $intervensi->id,
    ]);

    expect($pasien->nextAskepStep())->toBe(route('pasien.evaluasi', $pasien));
});

test('nextAskepStep mengarahkan ke askep setelah semua langkah selesai termasuk evaluasi', function () {
    $pasien = Pasien::factory()->create();
    Pengkajian::factory()->create(['pasien_id' => $pasien->id]);
    $diagnosa = DiagnosaSdki::factory()->create();
    $diagnosaPasien = DiagnosaPasien::factory()->create([
        'pasien_id' => $pasien->id,
        'diagnosa_id' => $diagnosa->id,
    ]);
    $luaran = LuaranSlki::factory()->create();
    $luaranPasien = LuaranPasien::factory()->create([
        'diagnosa_pasien_id' => $diagnosaPasien->id,
        'luaran_id' => $luaran->id,
    ]);
    $intervensi = IntervensiSiki::factory()->create();
    IntervensiPasien::factory()->create([
        'luaran_pasien_id' => $luaranPasien->id,
        'intervensi_id' => $intervensi->id,
    ]);
    EvaluasiPasien::create([
        'luaran_pasien_id' => $luaranPasien->id,
        'hasil' => 'tercapai',
    ]);

    expect($pasien->nextAskepStep())->toBe(route('pasien.askep', $pasien));
});

// ── intervensiPasien ──────────────────────────────────────────────────────────

test('intervensiPasien exists mengembalikan false ketika belum ada', function () {
    $pasien = Pasien::factory()->create();

    expect($pasien->intervensiPasien()->exists())->toBeFalse();
});

test('intervensiPasien exists mengembalikan true setelah data ditambahkan', function () {
    $pasien = Pasien::factory()->create();
    $diagnosa = DiagnosaSdki::factory()->create();
    $diagnosaPasien = DiagnosaPasien::factory()->create([
        'pasien_id' => $pasien->id,
        'diagnosa_id' => $diagnosa->id,
    ]);
    $luaran = LuaranSlki::factory()->create();
    $luaranPasien = LuaranPasien::factory()->create([
        'diagnosa_pasien_id' => $diagnosaPasien->id,
        'luaran_id' => $luaran->id,
    ]);
    $intervensi = IntervensiSiki::factory()->create();
    IntervensiPasien::factory()->create([
        'luaran_pasien_id' => $luaranPasien->id,
        'intervensi_id' => $intervensi->id,
    ]);

    expect($pasien->intervensiPasien()->exists())->toBeTrue();
});

test('intervensiPasien tidak mengembalikan data milik pasien lain', function () {
    $pasienA = Pasien::factory()->create();
    $pasienB = Pasien::factory()->create();

    // Hanya pasien B yang punya intervensi
    $diagnosa = DiagnosaSdki::factory()->create();
    $diagnosaPasien = DiagnosaPasien::factory()->create([
        'pasien_id' => $pasienB->id,
        'diagnosa_id' => $diagnosa->id,
    ]);
    $luaran = LuaranSlki::factory()->create();
    $luaranPasien = LuaranPasien::factory()->create([
        'diagnosa_pasien_id' => $diagnosaPasien->id,
        'luaran_id' => $luaran->id,
    ]);
    $intervensi = IntervensiSiki::factory()->create();
    IntervensiPasien::factory()->create([
        'luaran_pasien_id' => $luaranPasien->id,
        'intervensi_id' => $intervensi->id,
    ]);

    // pasien A tetap tidak punya intervensi
    expect($pasienA->intervensiPasien()->exists())->toBeFalse();
    expect($pasienB->intervensiPasien()->exists())->toBeTrue();
});
