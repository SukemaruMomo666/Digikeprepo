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
        foreach ($this->data() as $row) {
            $sdki = DiagnosaSdki::updateOrCreate(
                ['kode_diagnosa' => $row['kode_sdki']],
                [
                    'label_diagnosa' => $row['label_sdki'],
                    'definisi' => $row['definisi_sdki'],
                ]
            );

            $slki = LuaranSlki::updateOrCreate(
                ['kode_luaran' => $row['kode_slki']],
                [
                    'label_luaran' => $row['label_slki'],
                    'kriteria_hasil' => $row['kriteria_hasil'],
                ]
            );

            $siki = IntervensiSiki::updateOrCreate(
                ['kode_intervensi' => $row['kode_siki']],
                [
                    'label_intervensi' => $row['label_siki'],
                    'tindakan' => $row['tindakan'],
                ]
            );

            // Relasi SDKI → SLKI
            $sdki->luaranSlki()->syncWithoutDetaching([$slki->id]);

            // Relasi SLKI → SIKI
            $slki->intervensiSiki()->syncWithoutDetaching([$siki->id]);
        }

        $this->command->info('DataMasterSeeder: 10 SDKI, 10 SLKI, 10 SIKI berhasil dibuat beserta relasinya.');
    }

    /** @return array<int, array<string, string>> */
    private function data(): array
    {
        return [
            [
                'kode_sdki' => 'D.0077',
                'label_sdki' => 'Nyeri Akut',
                'definisi_sdki' => 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional',
                'kode_slki' => 'L.08066',
                'label_slki' => 'Tingkat Nyeri',
                'kriteria_hasil' => 'Keluhan nyeri menurun, meringis menurun, gelisah menurun',
                'kode_siki' => 'I.08238',
                'label_siki' => 'Manajemen Nyeri',
                'tindakan' => 'Observasi: Identifikasi lokasi, karakteristik, durasi, frekuensi, kualitas, intensitas nyeri. Terapeutik: Berikan teknik nonfarmakologis. Edukasi: Jelaskan penyebab dan pemicu nyeri. Kolaborasi: Pemberian analgesik.',
            ],
            [
                'kode_sdki' => 'D.0142',
                'label_sdki' => 'Risiko Infeksi',
                'definisi_sdki' => 'Rentan mengalami invasi dan multiplikasi organisme patogenik yang dapat mengganggu kesehatan',
                'kode_slki' => 'L.14137',
                'label_slki' => 'Tingkat Infeksi',
                'kriteria_hasil' => 'Demam menurun, kemerahan menurun, cairan berbau busuk menurun',
                'kode_siki' => 'I.14539',
                'label_siki' => 'Pencegahan Infeksi',
                'tindakan' => 'Observasi: Monitor tanda dan gejala infeksi lokal dan sistemik. Terapeutik: Cuci tangan sebelum dan sesudah tindakan. Edukasi: Jelaskan tanda dan gejala infeksi.',
            ],
            [
                'kode_sdki' => 'D.0056',
                'label_sdki' => 'Intoleransi Aktivitas',
                'definisi_sdki' => 'Ketidakcukupan energi psikologis atau fisiologis untuk mempertahankan atau menyelesaikan aktivitas harian',
                'kode_slki' => 'L.05047',
                'label_slki' => 'Toleransi Aktivitas',
                'kriteria_hasil' => 'Kemudahan dalam melakukan aktivitas harian meningkat, keluhan lelah menurun',
                'kode_siki' => 'I.05178',
                'label_siki' => 'Manajemen Energi',
                'tindakan' => 'Observasi: Monitor kelelahan fisik dan emosional. Terapeutik: Sediakan lingkungan nyaman dan rendah stimulus. Edukasi: Anjurkan tirah baring.',
            ],
            [
                'kode_sdki' => 'D.0003',
                'label_sdki' => 'Gangguan Pertukaran Gas',
                'definisi_sdki' => 'Kelebihan atau kekurangan oksigenasi dan/atau eliminasi karbondioksida pada membran alveolus-kapiler',
                'kode_slki' => 'L.01003',
                'label_slki' => 'Pertukaran Gas',
                'kriteria_hasil' => 'Dispnea menurun, PCO2 membaik, PO2 membaik, takikardia menurun',
                'kode_siki' => 'I.01014',
                'label_siki' => 'Pemantauan Respirasi',
                'tindakan' => 'Observasi: Monitor frekuensi, kedalaman, dan upaya napas. Terapeutik: Atur interval pemantauan respirasi sesuai kondisi pasien. Edukasi: Jelaskan tujuan dan prosedur pemantauan.',
            ],
            [
                'kode_sdki' => 'D.0019',
                'label_sdki' => 'Defisit Nutrisi',
                'definisi_sdki' => 'Asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme',
                'kode_slki' => 'L.03030',
                'label_slki' => 'Status Nutrisi',
                'kriteria_hasil' => 'Porsi makan yang dihabiskan meningkat, berat badan membaik, indeks massa tubuh membaik',
                'kode_siki' => 'I.03119',
                'label_siki' => 'Manajemen Nutrisi',
                'tindakan' => 'Observasi: Identifikasi status nutrisi dan asupan makanan. Terapeutik: Lakukan oral hygiene sebelum makan, jika perlu. Edukasi: Ajarkan diet yang diprogramkan.',
            ],
            [
                'kode_sdki' => 'D.0022',
                'label_sdki' => 'Hipervolemia',
                'definisi_sdki' => 'Peningkatan volume cairan intravaskular, interstisial, dan/atau intraselular',
                'kode_slki' => 'L.03020',
                'label_slki' => 'Keseimbangan Cairan',
                'kriteria_hasil' => 'Edema menurun, tekanan darah membaik, membran mukosa lembab meningkat',
                'kode_siki' => 'I.03114',
                'label_siki' => 'Manajemen Hipervolemia',
                'tindakan' => 'Observasi: Periksa tanda hipervolemia (e.g. ortopnea, edema). Terapeutik: Timbang berat badan setiap hari pada waktu yang sama. Kolaborasi: Pemberian diuretik.',
            ],
            [
                'kode_sdki' => 'D.0055',
                'label_sdki' => 'Gangguan Pola Tidur',
                'definisi_sdki' => 'Gangguan kualitas dan kuantitas waktu tidur akibat faktor eksternal',
                'kode_slki' => 'L.05045',
                'label_slki' => 'Pola Tidur',
                'kriteria_hasil' => 'Keluhan sulit tidur menurun, keluhan tidak puas tidur menurun, keluhan lelah menurun',
                'kode_siki' => 'I.05174',
                'label_siki' => 'Dukungan Tidur',
                'tindakan' => 'Observasi: Identifikasi pola aktivitas dan tidur. Terapeutik: Modifikasi lingkungan (e.g. pencahayaan, kebisingan, suhu). Edukasi: Jelaskan pentingnya tidur cukup.',
            ],
            [
                'kode_sdki' => 'D.0080',
                'label_sdki' => 'Ansietas',
                'definisi_sdki' => 'Kondisi emosi dan pengalaman subjektif terhadap objek yang tidak jelas dan spesifik akibat antisipasi bahaya',
                'kode_slki' => 'L.09093',
                'label_slki' => 'Tingkat Ansietas',
                'kriteria_hasil' => 'Verbalisasi khawatir akibat kondisi yang dihadapi menurun, perilaku tegang menurun',
                'kode_siki' => 'I.09314',
                'label_siki' => 'Reduksi Ansietas',
                'tindakan' => 'Observasi: Identifikasi saat tingkat ansietas berubah. Terapeutik: Ciptakan suasana terapeutik untuk menumbuhkan kepercayaan. Edukasi: Latih teknik relaksasi.',
            ],
            [
                'kode_sdki' => 'D.0143',
                'label_sdki' => 'Risiko Jatuh',
                'definisi_sdki' => 'Rentan mengalami peningkatan risiko jatuh yang dapat menyebabkan kerusakan fisik dan cedera',
                'kode_slki' => 'L.14136',
                'label_slki' => 'Tingkat Cedera',
                'kriteria_hasil' => 'Kejadian cedera menurun, luka/lecet menurun, ketegangan otot menurun',
                'kode_siki' => 'I.14540',
                'label_siki' => 'Pencegahan Jatuh',
                'tindakan' => 'Observasi: Identifikasi faktor risiko jatuh. Terapeutik: Pastikan roda tempat tidur dan kursi roda selalu dalam kondisi terkunci. Edukasi: Anjurkan memanggil perawat jika butuh bantuan.',
            ],
            [
                'kode_sdki' => 'D.0129',
                'label_sdki' => 'Gangguan Integritas Kulit',
                'definisi_sdki' => 'Kerusakan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang)',
                'kode_slki' => 'L.14125',
                'label_slki' => 'Integritas Kulit/Jaringan',
                'kriteria_hasil' => 'Kerusakan jaringan menurun, kerusakan lapisan kulit menurun, nyeri menurun',
                'kode_siki' => 'I.11353',
                'label_siki' => 'Perawatan Integritas Kulit',
                'tindakan' => 'Observasi: Identifikasi penyebab gangguan integritas kulit. Terapeutik: Ubah posisi tiap 2 jam jika tirah baring. Edukasi: Anjurkan menggunakan pelembab.',
            ],
        ];
    }
}
