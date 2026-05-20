<?php

use App\Models\User;
use Illuminate\Support\Facades\Hash;

// ── Login ─────────────────────────────────────────────────────────────────────

test('halaman login dapat diakses', function () {
    $this->get(route('login'))
        ->assertOk()
        ->assertSee('NIM / NIP');
});

test('mahasiswa dapat login dengan nim', function () {
    $user = User::factory()->mahasiswa()->create([
        'nim_nip' => '231010099',
        'password' => Hash::make('password'),
        'is_first_login' => false,
    ]);

    $this->post(route('login.store'), [
        'nim_nip' => '231010099',
        'password' => 'password',
    ])->assertRedirect(route('dashboard'));

    $this->assertAuthenticatedAs($user);
});

test('admin dapat login dan diarahkan ke dashboard admin', function () {
    $admin = User::factory()->admin()->create([
        'nim_nip' => 'admin99',
        'password' => Hash::make('password'),
        'is_first_login' => false,
    ]);

    $this->post(route('login.store'), [
        'nim_nip' => 'admin99',
        'password' => 'password',
    ])->assertRedirect(route('admin.dashboard'));

    $this->assertAuthenticatedAs($admin);
});

test('login gagal jika nim tidak ditemukan', function () {
    $this->post(route('login.store'), [
        'nim_nip' => '999999999',
        'password' => 'password',
    ])->assertSessionHasErrors();

    $this->assertGuest();
});

test('login gagal jika password salah', function () {
    User::factory()->mahasiswa()->create([
        'nim_nip' => '231010088',
        'password' => Hash::make('benar'),
    ]);

    $this->post(route('login.store'), [
        'nim_nip' => '231010088',
        'password' => 'salah',
    ])->assertSessionHasErrors();

    $this->assertGuest();
});

// ── First Login ───────────────────────────────────────────────────────────────

test('mahasiswa first login diarahkan ke halaman ganti password', function () {
    $user = User::factory()->mahasiswa()->firstLogin()->create();

    $this->post(route('login.store'), [
        'nim_nip' => $user->nim_nip,
        'password' => $user->nim_nip,
    ])->assertRedirect(route('password.change'));
});

test('halaman ganti password redirect jika bukan first login', function () {
    $user = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $this->actingAs($user)
        ->get(route('password.change'))
        ->assertRedirect(route('dashboard'));
});

// ── Role Access ───────────────────────────────────────────────────────────────

test('mahasiswa tidak bisa akses halaman admin', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $this->actingAs($mahasiswa)
        ->get(route('admin.dashboard'))
        ->assertForbidden();
});

test('admin tidak bisa akses halaman mahasiswa', function () {
    $admin = User::factory()->admin()->create();

    $this->actingAs($admin)
        ->get(route('dashboard'))
        ->assertForbidden();
});

test('tamu tidak bisa akses dashboard', function () {
    $this->get(route('dashboard'))
        ->assertRedirect(route('login'));
});

// ── Logout ────────────────────────────────────────────────────────────────────

test('user dapat logout', function () {
    $user = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $this->actingAs($user)
        ->post(route('logout'))
        ->assertRedirect('/');

    $this->assertGuest();
});
