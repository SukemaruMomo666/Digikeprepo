<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;

$stats = [
    'Diagnosa (SDKI)' => DB::table('diagnosa_sdki')->count(),
    'Penyebab SDKI' => DB::table('sdki_penyebab')->count(),
    'Gejala SDKI' => DB::table('sdki_gejala')->count(),
    'Kondisi Klinis' => DB::table('sdki_kondisi_klinis')->count(),
    'Luaran (SLKI)' => DB::table('luaran_slki')->count(),
    'Kriteria Hasil SLKI' => DB::table('slki_kriteria_hasil')->count(),
    'Intervensi (SIKI)' => DB::table('intervensi_siki')->count(),
    'Tindakan SIKI' => DB::table('siki_tindakan')->count(),
    'Relasi SDKI-SLKI' => DB::table('sdki_slki_relations')->count(),
    'Relasi SLKI-SIKI' => DB::table('slki_siki_relations')->count(),
];

echo "Statistik Data Master Hasil Impor:\n";
foreach ($stats as $label => $count) {
    echo "- $label: $count records\n";
}
