<?php

namespace Database\Seeders;

use App\Models\DiagnosaSdki;
use App\Models\IntervensiSiki;
use App\Models\LuaranSlki;
use Illuminate\Database\Seeder;

class DataMasterSeeder extends Seeder
{
    public function run(): void
    {
        // ── 1. Intervensi SIKI ────────────────────────────────────────────────
        $siki = $this->seedIntervensi();

        // ── 2. Luaran SLKI ────────────────────────────────────────────────────
        $slki = $this->seedLuaran();

        // ── 3. Diagnosa SDKI ──────────────────────────────────────────────────
        $sdki = $this->seedDiagnosa();

        // ── 4. Mapping SDKI → SLKI → SIKI ────────────────────────────────────
        $this->seedRelasi($sdki, $slki, $siki);

        $this->command->info('DataMasterSeeder: data master SDKI/SLKI/SIKI berhasil dibuat.');
    }

    // ─────────────────────────────────────────────────────────────────────────

    /** @return array<string, IntervensiSiki> */
    private function seedIntervensi(): array
    {
        $data = [
            'I.08238' => ['label' => 'Manajemen Nyeri', 'tindakan' => "- Identifikasi lokasi, karakteristik, durasi, frekuensi, kualitas, intensitas nyeri\n- Identifikasi skala nyeri\n- Berikan teknik nonfarmakologis (relaksasi napas dalam, kompres hangat/dingin)\n- Kontrol lingkungan yang memperberat nyeri\n- Fasilitasi istirahat dan tidur\n- Jelaskan penyebab, periode, dan pemicu nyeri\n- Kolaborasi pemberian analgetik"],
            'I.08239' => ['label' => 'Pemberian Analgesik', 'tindakan' => "- Identifikasi karakteristik nyeri\n- Identifikasi kesesuaian jenis analgesik dengan tingkat keparahan nyeri\n- Monitor tanda-tanda vital sebelum dan sesudah pemberian analgesik\n- Dokumentasikan respons terhadap efek analgesik\n- Kolaborasi pemberian dosis dan jenis analgesik sesuai indikasi"],
            'I.14539' => ['label' => 'Pencegahan Infeksi', 'tindakan' => "- Monitor tanda dan gejala infeksi lokal dan sistemik\n- Batasi jumlah pengunjung\n- Cuci tangan sebelum dan sesudah kontak dengan pasien\n- Pertahankan teknik aseptik pada pasien berisiko tinggi\n- Jelaskan tanda dan gejala infeksi\n- Anjurkan meningkatkan asupan nutrisi dan cairan"],
            'I.02060' => ['label' => 'Manajemen Energi', 'tindakan' => "- Identifikasi gangguan fungsi tubuh yang mengakibatkan kelelahan\n- Monitor kelelahan fisik dan emosional\n- Monitor pola dan jam tidur\n- Sediakan lingkungan nyaman dan rendah stimulus\n- Anjurkan tirah baring\n- Anjurkan melakukan aktivitas secara bertahap\n- Kolaborasi dengan ahli gizi tentang cara meningkatkan asupan makanan"],
            'I.01011' => ['label' => 'Pemantauan Respirasi', 'tindakan' => "- Monitor frekuensi, irama, kedalaman, dan upaya napas\n- Monitor pola napas (bradipnea, takipnea, hiperventilasi, Kussmaul)\n- Monitor saturasi oksigen\n- Auskultasi bunyi napas\n- Dokumentasikan hasil pemantauan\n- Informasikan hasil pemantauan"],
            'I.01014' => ['label' => 'Manajemen Jalan Napas', 'tindakan' => "- Monitor pola napas (frekuensi, kedalaman, usaha napas)\n- Monitor bunyi napas tambahan\n- Posisikan semi-Fowler atau Fowler\n- Berikan minum hangat\n- Lakukan fisioterapi dada\n- Kolaborasi pemberian bronkodilator, ekspektoran"],
            'I.03119' => ['label' => 'Manajemen Nutrisi', 'tindakan' => "- Identifikasi status nutrisi\n- Identifikasi alergi dan intoleransi makanan\n- Monitor asupan makanan\n- Monitor berat badan\n- Berikan makanan tinggi kalori dan tinggi protein\n- Anjurkan posisi duduk saat makan\n- Kolaborasi dengan ahli gizi untuk menentukan jumlah kalori dan jenis nutrien yang dibutuhkan"],
            'I.03121' => ['label' => 'Pemantauan Nutrisi', 'tindakan' => "- Identifikasi faktor yang mempengaruhi asupan gizi\n- Monitor mual dan muntah\n- Monitor berat badan\n- Monitor hasil laboratorium (albumin, Hb)\n- Dokumentasikan hasil pemantauan"],
            'I.03114' => ['label' => 'Manajemen Hipervolemia', 'tindakan' => "- Periksa tanda dan gejala hipervolemia (edema, dyspnea, suara napas tambahan)\n- Monitor intake dan output cairan\n- Monitor kecepatan infus secara ketat\n- Batasi asupan cairan dan garam\n- Tinggikan kepala tempat tidur 30–40°\n- Kolaborasi pemberian diuretik"],
            'I.05178' => ['label' => 'Dukungan Tidur', 'tindakan' => "- Identifikasi pola aktivitas dan tidur\n- Identifikasi faktor pengganggu tidur\n- Modifikasi lingkungan (pencahayaan, kebisingan, suhu)\n- Batasi waktu tidur siang\n- Fasilitasi menghilangkan stres sebelum tidur\n- Anjurkan menepati kebiasaan waktu tidur"],
            'I.09294' => ['label' => 'Reduksi Ansietas', 'tindakan' => "- Monitor tanda-tanda ansietas\n- Ciptakan suasana terapeutik untuk menumbuhkan kepercayaan\n- Temani pasien untuk mengurangi kecemasan\n- Pahami situasi yang membuat ansietas\n- Anjurkan keluarga untuk tetap bersama pasien\n- Latih teknik relaksasi"],
            'I.14584' => ['label' => 'Pencegahan Jatuh', 'tindakan' => "- Identifikasi faktor risiko jatuh\n- Identifikasi risiko jatuh setiap hari\n- Pasang handrail tempat tidur\n- Atur tempat tidur mekanis pada posisi terendah\n- Tempatkan nurse call dalam jangkauan pasien\n- Anjurkan memanggil perawat jika membutuhkan bantuan"],
            'I.11353' => ['label' => 'Perawatan Integritas Kulit', 'tindakan' => "- Identifikasi penyebab gangguan integritas kulit\n- Ubah posisi tiap 2 jam jika tirah baring\n- Lakukan pemijatan pada area penonjolan tulang\n- Bersihkan perineal dengan air hangat\n- Gunakan produk berbahan petroleum atau minyak pada kulit kering\n- Anjurkan minum air yang cukup"],
        ];

        $result = [];
        foreach ($data as $kode => $item) {
            $result[$kode] = IntervensiSiki::create([
                'kode_intervensi' => $kode,
                'label_intervensi' => $item['label'],
                'tindakan' => $item['tindakan'],
            ]);
        }

        return $result;
    }

    /** @return array<string, LuaranSlki> */
    private function seedLuaran(): array
    {
        $data = [
            'L.08066' => ['label' => 'Tingkat Nyeri', 'kriteria' => "- Keluhan nyeri menurun\n- Meringis menurun\n- Sikap protektif menurun\n- Gelisah menurun\n- Kesulitan tidur menurun\n- Frekuensi nadi membaik\n- Tekanan darah membaik"],
            'L.08063' => ['label' => 'Kontrol Nyeri', 'kriteria' => "- Melaporkan nyeri terkontrol meningkat\n- Kemampuan mengenali onset nyeri meningkat\n- Kemampuan menggunakan teknik nonfarmakologis meningkat\n- Keluhan nyeri menurun\n- Penggunaan analgesik menurun"],
            'L.14137' => ['label' => 'Tingkat Infeksi', 'kriteria' => "- Kebersihan tangan meningkat\n- Kebersihan badan meningkat\n- Nafsu makan meningkat\n- Demam menurun\n- Kemerahan menurun\n- Nyeri menurun\n- Bengkak menurun\n- Kadar sel darah putih membaik"],
            'L.05047' => ['label' => 'Toleransi Aktivitas', 'kriteria' => "- Frekuensi nadi meningkat\n- Saturasi oksigen meningkat\n- Kemudahan dalam melakukan aktivitas sehari-hari meningkat\n- Kecepatan berjalan meningkat\n- Jarak berjalan meningkat\n- Kekuatan tubuh bagian atas dan bawah meningkat\n- Dyspnea saat aktivitas menurun\n- Perasaan lemah menurun"],
            'L.01003' => ['label' => 'Pertukaran Gas', 'kriteria' => "- Tingkat kesadaran meningkat\n- Dyspnea menurun\n- Bunyi napas tambahan menurun\n- Napas cuping hidung menurun\n- PCO2 membaik\n- PO2 membaik\n- pH arteri membaik\n- Saturasi oksigen membaik\n- Pola napas membaik"],
            'L.03030' => ['label' => 'Status Nutrisi', 'kriteria' => "- Porsi makan yang dihabiskan meningkat\n- Kekuatan otot menelan meningkat\n- Serum albumin meningkat\n- Verbalisasi keinginan untuk meningkatkan nutrisi meningkat\n- Berat badan membaik\n- Indeks massa tubuh (IMT) membaik\n- Frekuensi makan membaik\n- Nafsu makan membaik"],
            'L.03020' => ['label' => 'Keseimbangan Cairan', 'kriteria' => "- Asupan cairan meningkat\n- Keluaran urin meningkat\n- Edema menurun\n- Tekanan darah membaik\n- Frekuensi nadi membaik\n- Turgor kulit membaik\n- Berat badan membaik"],
            'L.05045' => ['label' => 'Pola Tidur', 'kriteria' => "- Keluhan sulit tidur menurun\n- Keluhan sering terjaga menurun\n- Keluhan tidak puas tidur menurun\n- Keluhan pola tidur berubah menurun\n- Keluhan istirahat tidak cukup menurun"],
            'L.09093' => ['label' => 'Tingkat Ansietas', 'kriteria' => "- Verbalisasi kebingungan menurun\n- Verbalisasi khawatir akibat kondisi yang dihadapi menurun\n- Perilaku gelisah menurun\n- Perilaku tegang menurun\n- Konsentrasi membaik\n- Pola tidur membaik\n- Perasaan keberdayaan membaik\n- Kontak mata membaik"],
            'L.14138' => ['label' => 'Tingkat Jatuh', 'kriteria' => "- Jatuh dari tempat tidur menurun\n- Jatuh saat berdiri menurun\n- Jatuh saat duduk menurun\n- Jatuh saat berjalan menurun\n- Jatuh saat dipindahkan menurun"],
            'L.14125' => ['label' => 'Integritas Kulit dan Jaringan', 'kriteria' => "- Elastisitas meningkat\n- Hidrasi meningkat\n- Perfusi jaringan meningkat\n- Kerusakan lapisan kulit menurun\n- Nyeri menurun\n- Perdarahan menurun\n- Kemerahan menurun\n- Tekstur membaik"],
        ];

        $result = [];
        foreach ($data as $kode => $item) {
            $result[$kode] = LuaranSlki::create([
                'kode_luaran' => $kode,
                'label_luaran' => $item['label'],
                'kriteria_hasil' => $item['kriteria'],
            ]);
        }

        return $result;
    }

    /** @return array<string, DiagnosaSdki> */
    private function seedDiagnosa(): array
    {
        $data = [
            'D.0077' => 'Nyeri Akut',
            'D.0142' => 'Risiko Infeksi',
            'D.0056' => 'Intoleransi Aktivitas',
            'D.0003' => 'Gangguan Pertukaran Gas',
            'D.0019' => 'Defisit Nutrisi',
            'D.0022' => 'Hipervolemia',
            'D.0055' => 'Gangguan Pola Tidur',
            'D.0080' => 'Ansietas',
            'D.0143' => 'Risiko Jatuh',
            'D.0129' => 'Gangguan Integritas Kulit/Jaringan',
        ];

        $result = [];
        foreach ($data as $kode => $label) {
            $result[$kode] = DiagnosaSdki::create([
                'kode_diagnosa' => $kode,
                'label_diagnosa' => $label,
            ]);
        }

        return $result;
    }

    /**
     * @param  array<string, DiagnosaSdki>  $sdki
     * @param  array<string, LuaranSlki>  $slki
     * @param  array<string, IntervensiSiki>  $siki
     */
    private function seedRelasi(array $sdki, array $slki, array $siki): void
    {
        // Format: 'KODE_SDKI' => ['KODE_SLKI' => ['KODE_SIKI', ...]]
        $mapping = [
            'D.0077' => [
                'L.08066' => ['I.08238', 'I.08239'],
                'L.08063' => ['I.08238', 'I.08239'],
            ],
            'D.0142' => [
                'L.14137' => ['I.14539'],
            ],
            'D.0056' => [
                'L.05047' => ['I.02060'],
            ],
            'D.0003' => [
                'L.01003' => ['I.01011', 'I.01014'],
            ],
            'D.0019' => [
                'L.03030' => ['I.03119', 'I.03121'],
            ],
            'D.0022' => [
                'L.03020' => ['I.03114'],
            ],
            'D.0055' => [
                'L.05045' => ['I.05178'],
            ],
            'D.0080' => [
                'L.09093' => ['I.09294'],
            ],
            'D.0143' => [
                'L.14138' => ['I.14584'],
            ],
            'D.0129' => [
                'L.14125' => ['I.11353'],
            ],
        ];

        foreach ($mapping as $kodeSdki => $luaranMap) {
            $diagnosa = $sdki[$kodeSdki];

            foreach ($luaranMap as $kodeSlki => $kodesSiki) {
                $luaran = $slki[$kodeSlki];

                // SDKI → SLKI
                $diagnosa->luaranSlki()->syncWithoutDetaching([$luaran->id]);

                // SLKI → SIKI
                $intervensiIds = collect($kodesSiki)
                    ->map(fn ($k) => $siki[$k]->id)
                    ->toArray();

                $luaran->intervensiSiki()->syncWithoutDetaching($intervensiIds);
            }
        }
    }
}
