<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome')->name('home');

// Ganti password saat first login (auth tapi belum tentu sudah ganti password)
Route::middleware(['auth'])->group(function () {
    Route::livewire('password/change', 'pages::auth.change-password')
        ->name('password.change');
});

// Mahasiswa
Route::middleware(['auth', 'role:mahasiswa'])->group(function () {
    Route::view('dashboard', 'dashboard')->name('dashboard');
});

// Admin
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::view('dashboard', 'dashboard')->name('dashboard');
});

require __DIR__.'/settings.php';
