<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome')->name('home');

// Ganti password saat first login
Route::middleware(['auth'])->group(function () {
    Route::livewire('password/change', 'pages::auth.change-password')
        ->name('password.change');
});

// ── Redirect Dashboard Berdasarkan Role ──────────────────────────────────
Route::get('/dashboard', function () {
    $user = auth()->user();
    if ($user->isAdmin()) return redirect()->route('admin.dashboard');
    if ($user->isDosen()) return redirect()->route('dosen.dashboard');
    return redirect()->route('mahasiswa.dashboard');
})->middleware(['auth'])->name('dashboard');

// ── Shared (Panduan, FAQ, dll) ─────────────────────────────────────────────
Route::middleware(['auth'])->group(function () {
    Route::livewire('/faq', 'pages::mahasiswa.faq.index')->name('faq.index');
    Route::livewire('/panduan', 'pages::mahasiswa.panduan.index')->name('panduan.index');
    Route::livewire('/video', 'pages::mahasiswa.video.index')->name('video.index');

    // ── Export PDF ──
    Route::get('/askep/{askep}/download', [\App\Http\Controllers\AskepPdfController::class, 'download'])
        ->name('askep.download');
});

// ── Mahasiswa ──────────────────────────────────────────────────────────────
Route::middleware(['auth', 'role:mahasiswa'])->name('mahasiswa.')->group(function () {
    Route::livewire('mahasiswa/dashboard', 'pages::mahasiswa.dashboard')->name('dashboard');

    Route::prefix('pasien')->name('pasien.')->group(function () {
        Route::livewire('/', 'pages::mahasiswa.pasien.index')->name('index');
        Route::livewire('/create', 'pages::mahasiswa.pasien.create')->name('create');
        Route::livewire('/{pasien}', 'pages::mahasiswa.pasien.show')->name('show');
        Route::livewire('/{pasien}/edit', 'pages::mahasiswa.pasien.edit')->name('edit');
        Route::livewire('/{pasien}/pengkajian', 'pages::mahasiswa.askep.pengkajian')->name('pengkajian');
        Route::livewire('/{pasien}/diagnosa', 'pages::mahasiswa.askep.diagnosa')->name('diagnosa');
        Route::livewire('/{pasien}/luaran', 'pages::mahasiswa.askep.luaran')->name('luaran');
        Route::livewire('/{pasien}/intervensi', 'pages::mahasiswa.askep.intervensi')->name('intervensi');
        Route::livewire('/{pasien}/evaluasi', 'pages::mahasiswa.askep.evaluasi')->name('evaluasi');
        Route::livewire('/{pasien}/askep', 'pages::mahasiswa.askep.show')->name('askep');
    });

    Route::livewire('/askep', 'pages::mahasiswa.askep.index')->name('askep.index');

    Route::prefix('pasien/{pasien}/askep')->name('pasien.askep.')->group(function () {
        Route::livewire('/baru', 'pages::mahasiswa.askep.create')->name('create');
    });

    Route::prefix('askep/{askep}')->name('askep.')->group(function () {
        Route::livewire('/', 'pages::mahasiswa.askep.detail')->name('show');
        Route::livewire('/pengkajian', 'pages::mahasiswa.askep.pengkajian')->name('pengkajian');
        Route::livewire('/diagnosa', 'pages::mahasiswa.askep.diagnosa')->name('diagnosa');
        Route::livewire('/perencanaan', 'pages::mahasiswa.askep.perencanaan')->name('perencanaan');
        Route::livewire('/implementasi', 'pages::mahasiswa.askep.implementasi')->name('implementasi');
        Route::livewire('/evaluasi', 'pages::mahasiswa.askep.evaluasi')->name('evaluasi');
    });

    Route::livewire('/riwayat', 'pages::mahasiswa.riwayat.index')->name('riwayat.index');
    Route::livewire('/arsip', 'pages::mahasiswa.arsip.index')->name('arsip.index');
});

// ── Admin ──────────────────────────────────────────────────────────────────
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::livewire('dashboard', 'pages::admin.dashboard')->name('dashboard');

    Route::prefix('users')->name('users.')->group(function () {
        Route::livewire('/', 'pages::admin.users.index')->name('index');
    });

    Route::prefix('dosen')->name('dosen.')->group(function () {
        Route::livewire('/', 'pages::admin.dosen.index')->name('index');
    });

    Route::prefix('penugasan')->name('penugasan.')->group(function () {
        Route::livewire('/', 'pages::admin.penugasan.index')->name('index');
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

    Route::prefix('data-mahasiswa')->name('data-mahasiswa.')->group(function () {
        Route::livewire('/', 'pages::admin.data-mahasiswa.index')->name('index');
    });
});

// ── Dosen ──────────────────────────────────────────────────────────────────
Route::middleware(['auth', 'role:dosen'])->prefix('dosen')->name('dosen.')->group(function () {
    Route::livewire('dashboard', 'pages::dosen.dashboard')->name('dashboard');

    Route::prefix('mahasiswa')->name('mahasiswa.')->group(function () {
        Route::livewire('/', 'pages::dosen.mahasiswa.index')->name('index');
        Route::livewire('/{mahasiswa}', 'pages::dosen.mahasiswa.show')->name('show');
    });

    Route::prefix('askep')->name('askep.')->group(function () {
        Route::livewire('/', 'pages::dosen.askep.index')->name('index');
        Route::livewire('/{askep}', 'pages::dosen.askep.review')->name('review');
    });

    Route::prefix('monitoring')->name('monitoring.')->group(function () {
        Route::livewire('/', 'pages::dosen.monitoring.index')->name('index');
    });

});

require __DIR__.'/settings.php';
