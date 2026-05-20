<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome')->name('home');

// Ganti password saat first login
Route::middleware(['auth'])->group(function () {
    Route::livewire('password/change', 'pages::auth.change-password')
        ->name('password.change');
});

// ── Mahasiswa ──────────────────────────────────────────────────────────────
Route::middleware(['auth', 'role:mahasiswa'])->group(function () {
    Route::livewire('dashboard', 'pages::mahasiswa.dashboard')->name('dashboard');

    Route::prefix('pasien')->name('pasien.')->group(function () {
        Route::livewire('/', 'pages::mahasiswa.pasien.index')->name('index');
        Route::livewire('/create', 'pages::mahasiswa.pasien.create')->name('create');
        Route::livewire('/{pasien}', 'pages::mahasiswa.pasien.show')->name('show');
        Route::livewire('/{pasien}/edit', 'pages::mahasiswa.pasien.edit')->name('edit');
        Route::livewire('/{pasien}/pengkajian', 'pages::mahasiswa.askep.pengkajian')->name('pengkajian');
        Route::livewire('/{pasien}/diagnosa', 'pages::mahasiswa.askep.diagnosa')->name('diagnosa');
        Route::livewire('/{pasien}/luaran', 'pages::mahasiswa.askep.luaran')->name('luaran');
        Route::livewire('/{pasien}/intervensi', 'pages::mahasiswa.askep.intervensi')->name('intervensi');
        Route::livewire('/{pasien}/askep', 'pages::mahasiswa.askep.show')->name('askep');
    });
});

// ── Admin ──────────────────────────────────────────────────────────────────
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::livewire('dashboard', 'pages::admin.dashboard')->name('dashboard');

    Route::prefix('users')->name('users.')->group(function () {
        Route::livewire('/', 'pages::admin.users.index')->name('index');
    });

    Route::prefix('sdki')->name('sdki.')->group(function () {
        Route::livewire('/', 'pages::admin.sdki.index')->name('index');
    });

    Route::prefix('slki')->name('slki.')->group(function () {
        Route::livewire('/', 'pages::admin.slki.index')->name('index');
    });

    Route::prefix('siki')->name('siki.')->group(function () {
        Route::livewire('/', 'pages::admin.siki.index')->name('index');
    });

    Route::prefix('relasi')->name('relasi.')->group(function () {
        Route::livewire('/', 'pages::admin.relasi.index')->name('index');
    });

    Route::prefix('log')->name('log.')->group(function () {
        Route::livewire('/', 'pages::admin.log.index')->name('index');
    });

    Route::prefix('data-mahasiswa')->name('data-mahasiswa.')->group(function () {
        Route::livewire('/', 'pages::admin.data-mahasiswa.index')->name('index');
    });
});

require __DIR__.'/settings.php';
