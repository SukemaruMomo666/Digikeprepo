<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;
use App\Models\DiagnosaSdki;
use App\Models\LuaranSlki;
use App\Models\IntervensiSiki;

echo "--- MASTER DATA ---\n";
echo "SDKI: " . DiagnosaSdki::count() . " / 149\n";
echo "SLKI: " . LuaranSlki::count() . " / 110\n";
echo "SIKI: " . IntervensiSiki::count() . " / 73\n";

echo "\n--- DETAILS ---\n";
$tables = ['sdki_penyebab', 'sdki_gejala', 'sdki_faktor_risiko', 'sdki_kondisi_klinis', 'slki_kriteria_hasil', 'siki_tindakan'];
foreach ($tables as $table) {
    if (Schema::hasTable($table)) {
        echo ucfirst(str_replace('_', ' ', $table)) . ": " . DB::table($table)->count() . "\n";
    } else {
        echo "$table: Table not found\n";
    }
}

echo "\n--- RELATIONS ---\n";
echo "SDKI <-> SLKI: " . DB::table('sdki_slki_relations')->count() . "\n";
echo "SLKI <-> SIKI: " . DB::table('slki_siki_relations')->count() . "\n";

echo "\n--- SAMPLE CHECK (SDKI D.0001 Bersihan Jalan Napas) ---\n";
$d0001 = DiagnosaSdki::where('kode_diagnosa', 'D.0001')->first();
if ($d0001) {
    echo "D.0001 Found: " . $d0001->label_diagnosa . "\n";
    echo "Gejala: " . DB::table('sdki_gejala')->where('sdki_id', $d0001->id)->count() . "\n";
    echo "Penyebab: " . DB::table('sdki_penyebab')->where('sdki_id', $d0001->id)->count() . "\n";
    
    $relSlki = DB::table('sdki_slki_relations')->where('diagnosa_id', $d0001->id)->count();
    echo "Relasi ke SLKI: " . $relSlki . "\n";
} else {
    echo "D.0001 not found\n";
}
