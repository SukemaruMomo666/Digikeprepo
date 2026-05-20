<?php

use App\Models\User;
use Illuminate\Support\Facades\Hash;

test('login screen can be rendered', function () {
    $this->get(route('login'))->assertOk();
});

test('users can authenticate using the login screen', function () {
    $user = User::factory()->mahasiswa()->create([
        'password' => Hash::make('password'),
        'is_first_login' => false,
    ]);

    $this->post(route('login.store'), [
        'nim_nip' => $user->nim_nip,
        'password' => 'password',
    ])
        ->assertSessionHasNoErrors()
        ->assertRedirect(route('dashboard', absolute: false));

    $this->assertAuthenticated();
});

test('users can not authenticate with invalid password', function () {
    $user = User::factory()->mahasiswa()->create();

    $this->post(route('login.store'), [
        'nim_nip' => $user->nim_nip,
        'password' => 'wrong-password',
    ])->assertSessionHasErrors();

    $this->assertGuest();
});

test('users can logout', function () {
    $user = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    $this->actingAs($user)
        ->post(route('logout'))
        ->assertRedirect(route('home'));

    $this->assertGuest();
});
