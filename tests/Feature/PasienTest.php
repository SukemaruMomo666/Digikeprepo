<?php

use App\Models\Pasien;
use App\Models\User;
use Livewire\Livewire;

// ── Akses ─────────────────────────────────────────────────────────────────────

test('guest diarahkan ke login ketika akses halaman pasien', function () {
    $this->get(route('pasien.index'))->assertRedirect(route('login'));
});

test('mahasiswa bisa melihat daftar pasien miliknya', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    Pasien::factory()->count(3)->create(['user_id' => $mahasiswa->id]);

    $this->actingAs($mahasiswa)
        ->get(route('pasien.index'))
        ->assertOk();
});

test('mahasiswa tidak bisa melihat pasien milik mahasiswa lain', function () {
    $pemilik = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $lainnya = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $pemilik->id]);

    $this->actingAs($lainnya)
        ->get(route('pasien.show', $pasien))
        ->assertForbidden();
});

// ── Tambah Pasien ─────────────────────────────────────────────────────────────

test('mahasiswa bisa melihat form tambah pasien', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $this->actingAs($mahasiswa)
        ->get(route('pasien.create'))
        ->assertOk();
});

test('mahasiswa bisa menambah pasien baru', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    Livewire::actingAs($mahasiswa)
        ->test('pages::mahasiswa.pasien.create')
        ->set('no_rm', 'RM-001')
        ->set('nama_pasien', 'Budi Santoso')
        ->set('umur', '35')
        ->set('jenis_kelamin', 'L')
        ->set('ruang_rawat', 'Mawar')
        ->set('tanggal_masuk', '2026-01-15')
        ->call('save');

    $this->assertDatabaseHas('pasien', [
        'user_id' => $mahasiswa->id,
        'no_rm' => 'RM-001',
        'nama_pasien' => 'Budi Santoso',
    ]);
});

test('menambah pasien mencatat riwayat otomatis', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);

    $this->assertDatabaseHas('riwayat_pasien', [
        'pasien_id' => $pasien->id,
        'aktivitas' => 'Pasien ditambahkan ke sistem.',
    ]);
});

test('no rm harus unik per mahasiswa', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    Pasien::factory()->create(['user_id' => $mahasiswa->id, 'no_rm' => 'RM-001']);

    $this->actingAs($mahasiswa);

    $this->post(route('pasien.create'), [
        'no_rm' => 'RM-001',
        'nama_pasien' => 'Nama Lain',
        'umur' => 25,
        'jenis_kelamin' => 'P',
        'tanggal_masuk' => '2026-01-01',
    ]);

    // Hanya satu record RM-001 milik mahasiswa ini
    expect(
        Pasien::where('user_id', $mahasiswa->id)->where('no_rm', 'RM-001')->count()
    )->toBe(1);
});

// ── Edit Pasien ───────────────────────────────────────────────────────────────

test('mahasiswa bisa melihat form edit pasien miliknya', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);

    $this->actingAs($mahasiswa)
        ->get(route('pasien.edit', $pasien))
        ->assertOk();
});

test('mahasiswa bisa mengedit data pasien miliknya', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);

    Livewire::actingAs($mahasiswa)
        ->test('pages::mahasiswa.pasien.edit', ['pasien' => $pasien])
        ->set('nama_pasien', 'Nama Diperbarui')
        ->set('umur', '40')
        ->set('jenis_kelamin', 'L')
        ->set('ruang_rawat', 'ICU')
        ->set('tanggal_masuk', '2026-02-01')
        ->call('save');

    $this->assertDatabaseHas('pasien', [
        'id' => $pasien->id,
        'nama_pasien' => 'Nama Diperbarui',
        'ruang_rawat' => 'ICU',
    ]);
});

test('mahasiswa tidak bisa mengedit pasien milik orang lain', function () {
    $pemilik = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $lainnya = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $pemilik->id]);

    $this->actingAs($lainnya)
        ->get(route('pasien.edit', $pasien))
        ->assertForbidden();
});

// ── Hapus Pasien ──────────────────────────────────────────────────────────────

test('mahasiswa bisa menghapus pasien miliknya', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $pasien = Pasien::factory()->create(['user_id' => $mahasiswa->id]);

    Livewire::actingAs($mahasiswa)
        ->test('pages::mahasiswa.pasien.index')
        ->call('hapus', $pasien->id);

    $this->assertDatabaseMissing('pasien', ['id' => $pasien->id]);
});
