<?php

use App\Models\Askep;
use App\Models\AskepDiagnosa;
use App\Models\DiagnosaSdki;
use App\Models\Pasien;
use App\Models\User;

// ── Pasien.nextAskepStep ──────────────────────────────────────────────────────

test('nextAskepStep mengarahkan ke create askep ketika belum ada askep', function () {
    $pasien = Pasien::factory()->create();

    expect($pasien->nextAskepStep())->toBe(route('pasien.askep.create', $pasien));
});

test('nextAskepStep mendelegasikan ke askepAktif ketika ada askep draft', function () {
    $pasien = Pasien::factory()->create();
    $askep = Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $pasien->user_id,
        'status' => Askep::STATUS_DRAFT,
        'step_terakhir' => 1,
    ]);

    // step_terakhir 1 → pengkajian sudah selesai → lanjut ke diagnosa
    expect($pasien->nextAskepStep())->toBe(route('askep.diagnosa', $askep));
});

// ── Askep.nextStepUrl ────────────────────────────────────────────────────────

test('nextStepUrl mengarahkan ke pengkajian ketika step_terakhir kurang dari 1', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 0]);

    expect($askep->nextStepUrl())->toBe(route('askep.pengkajian', $askep));
});

test('nextStepUrl mengarahkan ke diagnosa ketika step_terakhir 1', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 1]);

    expect($askep->nextStepUrl())->toBe(route('askep.diagnosa', $askep));
});

test('nextStepUrl mengarahkan ke perencanaan ketika step_terakhir 2', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 2]);

    expect($askep->nextStepUrl())->toBe(route('askep.perencanaan', $askep));
});

test('nextStepUrl mengarahkan ke implementasi ketika step_terakhir 3', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 3]);

    expect($askep->nextStepUrl())->toBe(route('askep.implementasi', $askep));
});

test('nextStepUrl mengarahkan ke evaluasi ketika step_terakhir 4', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 4]);

    expect($askep->nextStepUrl())->toBe(route('askep.evaluasi', $askep));
});

test('nextStepUrl mengarahkan ke show ketika step_terakhir 5 atau lebih', function () {
    $askep = Askep::factory()->create(['step_terakhir' => 5]);

    expect($askep->nextStepUrl())->toBe(route('askep.show', $askep));
});

// ── Pasien status helpers ────────────────────────────────────────────────────

test('isDraft mengembalikan false ketika tidak ada askep sama sekali', function () {
    $pasien = Pasien::factory()->create();

    expect($pasien->isDraft())->toBeFalse();
});

test('isDraft mengembalikan true ketika ada askep berstatus draft', function () {
    $pasien = Pasien::factory()->create();
    Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $pasien->user_id,
        'status' => Askep::STATUS_DRAFT,
    ]);

    expect($pasien->isDraft())->toBeTrue();
});

test('isSelesai mengembalikan false ketika tidak ada askep', function () {
    $pasien = Pasien::factory()->create();

    expect($pasien->isSelesai())->toBeFalse();
});

test('isSelesai mengembalikan true ketika semua askep berstatus selesai', function () {
    $pasien = Pasien::factory()->create();
    Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $pasien->user_id,
        'status' => Askep::STATUS_SELESAI,
    ]);

    expect($pasien->isSelesai())->toBeTrue();
});

test('isSelesai mengembalikan false ketika masih ada askep draft', function () {
    $pasien = Pasien::factory()->create();
    Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $pasien->user_id,
        'status' => Askep::STATUS_SELESAI,
    ]);
    Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $pasien->user_id,
        'status' => Askep::STATUS_DRAFT,
    ]);

    expect($pasien->isSelesai())->toBeFalse();
});

// ── Askep status helpers ──────────────────────────────────────────────────────

test('Askep.isDraft mengembalikan true ketika status draft', function () {
    $askep = Askep::factory()->create(['status' => Askep::STATUS_DRAFT]);

    expect($askep->isDraft())->toBeTrue();
    expect($askep->isSelesai())->toBeFalse();
});

test('Askep.isSelesai mengembalikan true ketika status selesai', function () {
    $askep = Askep::factory()->create(['status' => Askep::STATUS_SELESAI]);

    expect($askep->isSelesai())->toBeTrue();
    expect($askep->isDraft())->toBeFalse();
});

test('Askep memiliki relasi diagnosa yang menampilkan urutan prioritas', function () {
    $askep = Askep::factory()->create();
    $sdki = DiagnosaSdki::inRandomOrder()->first() ?? DiagnosaSdki::factory()->create();

    AskepDiagnosa::factory()->create(['askep_id' => $askep->id, 'sdki_id' => $sdki->id, 'prioritas' => 2]);
    AskepDiagnosa::factory()->create(['askep_id' => $askep->id, 'sdki_id' => $sdki->id, 'prioritas' => 1]);

    $prioritas = $askep->diagnosa()->pluck('prioritas')->toArray();
    expect($prioritas)->toBe([1, 2]);
});

test('mahasiswa bisa membuka daftar semua askep', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);

    Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $mahasiswa->id,
    ]);

    $this->actingAs($mahasiswa)
        ->get(route('askep.index'))
        ->assertOk()
        ->assertSee($pasien->nama_pasien);
});

test('mahasiswa bisa membuka halaman implementasi askep', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);
    $askep = Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $mahasiswa->id,
        'step_terakhir' => 3,
    ]);

    $this->actingAs($mahasiswa)
        ->get(route('askep.implementasi', $askep))
        ->assertOk()
        ->assertSee('Tahap 4: Implementasi Keperawatan');
});

test('mahasiswa bisa membuka halaman pengkajian askep', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);
    $askep = Askep::factory()->create([
        'pasien_id' => $pasien->id,
        'user_id' => $mahasiswa->id,
        'step_terakhir' => 0,
    ]);

    $this->actingAs($mahasiswa)
        ->get(route('askep.pengkajian', $askep))
        ->assertOk()
        ->assertSee('Tahap 1: Pengkajian Dasar');
});
