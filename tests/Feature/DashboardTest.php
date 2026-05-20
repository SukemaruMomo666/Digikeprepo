<?php

use App\Models\User;

test('guests are redirected to the login page', function () {
    $response = $this->get(route('dashboard'));
    $response->assertRedirect(route('login'));
});

test('mahasiswa dapat mengakses dashboard', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $this->actingAs($mahasiswa);

    $response = $this->get(route('dashboard'));
    $response->assertOk();
});

test('admin diarahkan ke dashboard admin', function () {
    $admin = User::factory()->admin()->create();
    $this->actingAs($admin);

    $response = $this->get(route('dashboard'));
    $response->assertForbidden();

    $response = $this->get(route('admin.dashboard'));
    $response->assertOk();
});

test('mahasiswa tidak bisa akses dashboard admin', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);
    $this->actingAs($mahasiswa);

    $response = $this->get(route('admin.dashboard'));
    $response->assertForbidden();
});
