<?php

namespace App\Observers;

use App\Models\Pasien;

class PasienObserver
{
    public function created(Pasien $pasien): void
    {
        $pasien->catatRiwayat('Pasien ditambahkan ke sistem.');
    }

    public function updated(Pasien $pasien): void
    {
        $trackedFields = ['no_rm', 'nama_pasien', 'umur', 'jenis_kelamin', 'ruang_rawat', 'tanggal_masuk'];

        if ($pasien->wasChanged($trackedFields)) {
            $pasien->catatRiwayat('Data pasien diperbarui.');
        }
    }

    public function deleted(Pasien $pasien): void
    {
        //
    }

    public function restored(Pasien $pasien): void
    {
        //
    }

    public function forceDeleted(Pasien $pasien): void
    {
        //
    }
}
