<?php
require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\User;

echo "Total Users: " . User::count() . "\n";
echo "Mahasiswa: " . User::where('role', 'mahasiswa')->count() . "\n";
echo "Dosen: " . User::where('role', 'dosen')->count() . "\n";
echo "Admin: " . User::where('role', 'admin')->count() . "\n";

echo "\n--- Mahasiswa Samples ---\n";
User::where('role', 'mahasiswa')->limit(3)->get()->each(function($u) {
    echo "- {$u->name} ({$u->nim_nip})\n";
});

echo "\n--- Dosen Samples ---\n";
User::where('role', 'dosen')->limit(3)->get()->each(function($u) {
    echo "- {$u->name} ({$u->nim_nip})\n";
});
