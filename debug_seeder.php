<?php

$batchFile = __DIR__ . '/database/seeders/data/data-3s/batch1_d0001_d0010.sql';
$sql = file_get_contents($batchFile);
$sql = preg_replace('/^\xEF\xBB\xBF/', '', $sql) ?? $sql;

// Step 1
$tableRenames = [
    'INSERT IGNORE INTO slki '      => 'INSERT IGNORE INTO luaran_slki ',
    'INSERT IGNORE INTO siki '      => 'INSERT IGNORE INTO intervensi_siki ',
    'INSERT IGNORE INTO sdki '      => 'INSERT IGNORE INTO diagnosa_sdki ',
    'FROM slki WHERE'               => 'FROM luaran_slki WHERE',
    'FROM siki WHERE'               => 'FROM intervensi_siki WHERE',
    'FROM sdki WHERE'               => 'FROM diagnosa_sdki WHERE',
    'UPDATE siki '                  => 'UPDATE intervensi_siki ',
    'UPDATE slki '                  => 'UPDATE luaran_slki ',
    'UPDATE sdki '                  => 'UPDATE diagnosa_sdki ',
    'INSERT IGNORE INTO sdki_slki ' => 'INSERT IGNORE INTO sdki_slki_relations ',
    'INSERT IGNORE INTO slki_siki ' => 'INSERT IGNORE INTO slki_siki_relations ',
    'nama_luaran'                   => 'label_luaran',
    'nama_intervensi'               => 'label_intervensi',
    'nama_diagnosa'                 => 'label_diagnosa',
];
foreach ($tableRenames as $old => $new) {
    $sql = str_replace($old, $new, $sql);
}

// Step 2
$sql = preg_replace(
    '/INSERT IGNORE INTO sdki_slki_relations\s*\(sdki_id,\s*slki_id\)/',
    'INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id)',
    $sql
);

// Step 3
$sql = str_replace('siki_tindakan (siki_id,', 'siki_tindakan (intervensi_id,', $sql);

// Step 4: scoped
$sql = str_replace('slki_kriteria_hasil (kode_luaran,', 'slki_kriteria_hasil (luaran_id,', $sql);
$sql = preg_replace_callback(
    '/INSERT INTO slki_kriteria_hasil\b.*?;/s',
    fn ($m) => preg_replace(
        "/\('(L\.\d+)',/",
        "((SELECT id FROM luaran_slki WHERE kode_luaran='$1'),",
        $m[0]
    ),
    $sql
);

// Step 5
$sql = preg_replace('/INSERT\s+(?:IGNORE\s+)?INTO sdki_siki\b[^;]*;/s', '-- skipped sdki_siki', $sql);
$sql = preg_replace('/CREATE TABLE IF NOT EXISTS siki_rasional\b[^;]*;/s', '-- skipped create siki_rasional', $sql);
$sql = preg_replace('/INSERT\s+(?:IGNORE\s+)?INTO siki_rasional\b[^;]*;/s', '-- skipped siki_rasional', $sql);

// Step 6
$statements = array_values(array_filter(array_map('trim', explode(";\n", $sql))));

echo "Total statements: " . count($statements) . "\n\n";

// Find and show kriteria, tindakan, relasi statements
foreach ($statements as $i => $s) {
    $lower = strtolower(substr(ltrim($s), 0, 80));
    if (str_contains($lower, 'kriteria_hasil') || str_contains($lower, 'siki_tindakan') || str_contains($lower, 'sdki_slki_rel')) {
        echo "--- STMT $i ---\n" . substr($s, 0, 400) . "\n\n";
    }
}

// Check for issues
echo "=== PATTERN CHECKS ===\n";
echo "luaran_slki_kriteria: " . (str_contains($sql, 'luaran_slki_kriteria') ? 'BUG' : 'ok') . "\n";
echo "kode_luaran='\\\\': " . (str_contains($sql, "kode_luaran='\\'") ? 'BUG - empty capture' : 'ok') . "\n";
echo "kode_luaran='L.: " . (str_contains($sql, "kode_luaran='L.") ? 'ok - subqueries correct' : 'NOT FOUND') . "\n";
