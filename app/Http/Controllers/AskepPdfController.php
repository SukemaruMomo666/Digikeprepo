<?php

namespace App\Http\Controllers;

use App\Models\Askep;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class AskepPdfController extends Controller
{
    /**
     * Generate PDF for the given Askep.
     */
    public function download(Askep $askep)
    {
        // Ensure the student owns the Askep or the lecturer is the mentor
        $user = auth()->user();
        $isOwner = $askep->user_id === $user->id;
        $isPembimbing = $user->role === 'dosen' && $user->penugasanSebagaiDosen()
            ->where('mahasiswa_id', $askep->user_id)
            ->exists();

        abort_unless($isOwner || $isPembimbing, 403);

        $askep->load([
            'pasien',
            'user',
            'pengkajian',
            'diagnosa.sdki',
            'diagnosa.luaran.slki.kriteriaHasil',
            'diagnosa.intervensi.siki',
            'diagnosa.intervensi.implementasi',
            'diagnosa.evaluasi',
        ]);

        $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('pdf.askep', compact('askep'));
        
        // Use standard nursing document naming convention
        $filename = 'ASKEP_' . str_replace(' ', '_', $askep->pasien->nama_pasien) . '_' . date('YmdHis') . '.pdf';

        return $pdf->download($filename);
    }
}
