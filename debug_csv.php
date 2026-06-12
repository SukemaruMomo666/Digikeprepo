<?php
$path = 'database/seeders/data/csv-master/detail_sdki.csv';
$handle = fopen($path, 'r');
$header = fgetcsv($handle);
$count = 0;
while (($row = fgetcsv($handle)) !== FALSE) {
    if ($count < 3) {
        echo "Row $count: Kode=" . $row[0] . ", Gejala Mayor Subj=" . bin2hex($row[6]) . "\n";
    }
    $count++;
}
fclose($handle);
echo "Total rows: $count\n";
