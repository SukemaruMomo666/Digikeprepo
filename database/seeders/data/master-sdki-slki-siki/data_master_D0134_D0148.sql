SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- DATA MASTER DIGIKEP: D.0134 – D.0148
-- Generated: 2026-06-14
-- Sumber: PDF PPNI halaman 651–699
-- ============================================================

-- ============================================================
-- 1. DIAGNOSA_SDKI (master)
-- ============================================================
INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0134', 'Risiko Alergi', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami stimulasi respon yang berlebihan akibat terpapar alergen.'),
('D.0135', 'Risiko Bunuh Diri', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko melakukan upaya menyakiti diri sendiri untuk mengakhiri kehidupan.'),
('D.0136', 'Risiko Cedera', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami bahaya atau kerusakan fisik yang menyebabkan seseorang tidak lagi sepenuhnya sehat atau dalam kondisi baik.'),
('D.0137', 'Risiko Cedera pada Ibu', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami bahaya atau kerusakan fisik pada ibu selama masa kehamilan sampai dengan proses persalinan.'),
('D.0138', 'Risiko Cedera pada Janin', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami bahaya atau kerusakan fisik pada janin selama proses kehamilan dan persalinan.'),
('D.0139', 'Risiko Gangguan Integritas Kulit/Jaringan', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami kerusakan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan/atau ligamen).'),
('D.0140', 'Risiko Hipotermia', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami kegagalan termoregulasi yang dapat mengakibatkan suhu tubuh berada di bawah rentang normal.'),
('D.0141', 'Risiko Hipotermia Perioperatif', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami penurunan suhu tubuh di bawah 36°C secara tiba-tiba yang terjadi satu jam sebelum pembedahan hingga 24 jam setelah pembedahan.'),
('D.0142', 'Risiko Infeksi', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami peningkatan terserang organisme patogenik.'),
('D.0143', 'Risiko Jatuh', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami kerusakan fisik dan gangguan kesehatan akibat terjatuh.'),
('D.0144', 'Risiko Luka Tekan', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami cedera lokal pada kulit dan/atau jaringan, biasanya pada tonjolan tulang akibat tekanan dan/atau gesekan.'),
('D.0145', 'Risiko Mutilasi Diri', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko sengaja mencederai diri yang menyebabkan kerusakan fisik untuk memperoleh pemulihan ketegangan.'),
('D.0146', 'Risiko Perilaku Kekerasan', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko membahayakan secara fisik, emosi dan/atau seksual pada diri sendiri atau orang lain.'),
('D.0147', 'Risiko Perlambatan Pemulihan Pascabedah', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami pemanjangan jumlah hari pascabedah untuk memulai dan melakukan aktivitas sehari-hari.'),
('D.0148', 'Risiko Termoregulasi Tidak Efektif', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami kegagalan mempertahankan suhu tubuh dalam rentang normal.');

-- ============================================================
-- 2. SDKI_FAKTOR_RISIKO
-- ============================================================

-- D.0134 Risiko Alergi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 1, 'Makanan (mis. alpukat, pisang, kiwi, kacang, makanan olahan laut, buah tropis, jamur)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 2, 'Terpapar zat alergen (mis. zat kimia, agen farmakologis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 3, 'Terpapar alergen lingkungan (mis. debu, serbuk sari)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 4, 'Sengatan serangga');

-- D.0135 Risiko Bunuh Diri
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 1, 'Gangguan perilaku (mis. euforia mendadak setelah depresi, perilaku mencari senjata berbahaya, membeli obat dalam jumlah banyak, membuat surat wasiat)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 2, 'Demografi (mis. lansia, status perceraian, janda/duda, ekonomi rendah, pengangguran)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 3, 'Gangguan fisik (mis. nyeri kronis, penyakit terminal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 4, 'Masalah sosial (mis. berduka, tidak berdaya, putus asa, kesepian, kehilangan hubungan yang penting, isolasi sosial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 5, 'Gangguan psikologis (mis. penganiayaan masa kanak-kanak, riwayat bunuh diri sebelumnya, remaja homoseksual, gangguan psikiatrik, penyalahgunaan zat)');

-- D.0136 Risiko Cedera
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 1, 'Terpapar patogen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 2, 'Terpapar zat kimia toksik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 3, 'Terpapar agen nosokomial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 4, 'Ketidakamanan transportasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 5, 'Ketidaknormalan profil darah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 6, 'Perubahan orientasi afektif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 7, 'Perubahan sensasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 8, 'Disfungsi autoimun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 9, 'Disfungsi biokimia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 10, 'Hipoksia jaringan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 11, 'Kegagalan mekanisme pertahanan tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 12, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 13, 'Perubahan fungsi psikomotor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 14, 'Perubahan fungsi kognitif');

-- D.0137 Risiko Cedera pada Ibu
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 1, 'Besarnya ukuran janin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 2, 'Malposisi janin (posisi posterior)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 3, 'Induksi persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 4, 'Persalinan lama kala I, II dan III'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 5, 'Disfungsi uterus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 6, 'Efek metode/intervensi bedah selama persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 7, 'Kurangnya dukungan keluarga dan orang tua'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 8, 'Kurang adekuatnya observasi dan antisipasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 9, 'Keterlambatan pengambilan keputusan dan manajemen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 10, 'Skrining dan perawatan prenatal yang tidak adekuat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 11, 'Kecemasan berlebihan pada proses persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 12, 'Riwayat cedera pada persalinan sebelumnya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 13, 'Usia ibu (<15 tahun atau >35 tahun)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 14, 'Paritas banyak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 15, 'Perubahan hormonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 16, 'Perubahan postur tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 17, 'Ketuban pecah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 18, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 19, 'Penyakit penyerta'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 20, 'Masalah kontraksi');

-- D.0138 Risiko Cedera pada Janin
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 1, 'Besarnya ukuran janin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 2, 'Malposisi janin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 3, 'Induksi persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 4, 'Persalinan lama kala I, II, dan III'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 5, 'Disfungsi uterus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 6, 'Kecemasan yang berlebihan tentang persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 7, 'Riwayat persalinan sebelumnya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 8, 'Usia ibu (<15 tahun atau >35 tahun)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 9, 'Paritas banyak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 10, 'Efek metode/intervensi bedah selama persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 11, 'Nyeri pada abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 12, 'Nyeri pada jalan lahir'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 13, 'Penggunaan alat bantu persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 14, 'Kelelahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 15, 'Merokok'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 16, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 17, 'Pengaruh budaya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 18, 'Pola makan yang tidak sehat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 19, 'Faktor ekonomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 20, 'Konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 21, 'Terpapar agen teratogen');

-- D.0139 Risiko Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 1, 'Perubahan sirkulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 2, 'Perubahan status nutrisi (kelebihan atau kekurangan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 3, 'Kekurangan/kelebihan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 4, 'Penurunan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 5, 'Bahan kimia iritatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 6, 'Suhu lingkungan yang ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 7, 'Faktor mekanis (mis. penekanan, gesekan) atau faktor elektris (elektrodiatermi, energi listrik bertegangan tinggi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 8, 'Terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 9, 'Kelembaban'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 10, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 11, 'Neuropati perifer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 12, 'Perubahan pigmentasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 13, 'Perubahan hormonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 14, 'Penekanan pada tonjolan tulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 15, 'Kurang terpapar informasi tentang upaya mempertahankan/melindungi integritas jaringan');

-- D.0140 Risiko Hipotermia
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 1, 'Berat badan ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 2, 'Kerusakan hipotalamus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 3, 'Konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 4, 'Kurangnya lapisan lemak subkutan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 5, 'Suhu lingkungan rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 6, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 7, 'Pemakaian pakaian yang tipis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 8, 'Penurunan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 9, 'Terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 10, 'Tidak beraktivitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 11, 'Transfer panas (mis. konduksi, konveksi, evaporasi, radiasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 12, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 13, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 14, 'Penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 15, 'Bayi baru lahir'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 16, 'Berat badan lahir rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 17, 'Kurang terpapar informasi tentang pencegahan hipotermia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 18, 'Efek agen farmakologis');

-- D.0141 Risiko Hipotermia Perioperatif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 1, 'Prosedur pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 2, 'Kombinasi anestesi regional dan umum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 3, 'Skor American Society of Anesthesiologist (ASA) >1'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 4, 'Suhu pra-operasi rendah (<36°C)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 5, 'Berat badan rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 6, 'Neuropati diabetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 7, 'Komplikasi kardiovaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 8, 'Suhu lingkungan rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 9, 'Transfer panas (mis. volume tinggi infus yang tidak dihangatkan, irigasi >2 liter yang tidak dihangatkan)');

-- D.0142 Risiko Infeksi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 1, 'Penyakit kronis (mis. diabetes melitus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 2, 'Efek prosedur invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 3, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 4, 'Peningkatan paparan organisme patogen lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 5, 'Ketidakadekuatan pertahanan tubuh primer: gangguan peristaltik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 6, 'Ketidakadekuatan pertahanan tubuh primer: kerusakan integritas kulit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 7, 'Ketidakadekuatan pertahanan tubuh primer: perubahan sekresi pH'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 8, 'Ketidakadekuatan pertahanan tubuh primer: penurunan kerja siliaris'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 9, 'Ketidakadekuatan pertahanan tubuh primer: ketuban pecah lama'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 10, 'Ketidakadekuatan pertahanan tubuh primer: ketuban pecah sebelum waktunya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 11, 'Ketidakadekuatan pertahanan tubuh primer: merokok'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 12, 'Ketidakadekuatan pertahanan tubuh primer: stasis cairan tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 13, 'Ketidakadekuatan pertahanan tubuh sekunder: penurunan hemoglobin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 14, 'Ketidakadekuatan pertahanan tubuh sekunder: imunosupresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 15, 'Ketidakadekuatan pertahanan tubuh sekunder: leukopenia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 16, 'Ketidakadekuatan pertahanan tubuh sekunder: supresi respon inflamasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 17, 'Ketidakadekuatan pertahanan tubuh sekunder: vaksinasi tidak adekuat');

-- D.0143 Risiko Jatuh
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 1, 'Usia >65 tahun (pada dewasa) atau <2 tahun (pada anak)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 2, 'Riwayat jatuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 3, 'Anggota gerak bawah prostetis (buatan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 4, 'Penggunaan alat bantu berjalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 5, 'Penurunan tingkat kesadaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 6, 'Perubahan fungsi kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 7, 'Lingkungan tidak aman (mis. licin, gelap, lingkungan asing)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 8, 'Kondisi pasca operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 9, 'Hipotensi ortostatik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 10, 'Perubahan kadar glukosa darah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 11, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 12, 'Kekuatan otot menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 13, 'Gangguan pendengaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 14, 'Gangguan keseimbangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 15, 'Gangguan penglihatan (mis. glaukoma, katarak, ablasio retina, neuritis optikus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 16, 'Neuropati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 17, 'Efek agen farmakologis (mis. sedasi, alkohol, anestesi umum)');

-- D.0144 Risiko Luka Tekan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 1, 'Skor skala Braden Q ≤16 (anak) atau skor skala Braden ≤18 (dewasa)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 2, 'Perubahan fungsi kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 3, 'Perubahan sensasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 4, 'Skor ASA ≥2'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 5, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 6, 'Penurunan mobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 7, 'Penurunan kadar albumin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 8, 'Penurunan oksigenasi jaringan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 9, 'Penurunan perfusi jaringan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 10, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 11, 'Kulit kering'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 12, 'Edema'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 13, 'Peningkatan suhu kulit 1-2°C'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 14, 'Periode imobilisasi yang keras (mis. prosedur operasi ≥2 jam)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 15, 'Usia ≥65 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 16, 'Berat badan lebih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 17, 'Fraktur tungkai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 18, 'Riwayat stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 19, 'Riwayat luka tekan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 20, 'Riwayat trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 21, 'Hipertermi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 22, 'Inkontinensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 23, 'Ketidakadekuatan nutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 24, 'Skor RAPS (Risk Assessment Pressure Score) rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 25, 'Klasifikasi fungsional NYHA ≥2'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 26, 'Efek agen farmakologis (mis. anestesi umum, vasopressor, antidepresan, norepinefrin)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 27, 'Imobilisasi fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 28, 'Penekanan di atas tonjolan tulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 29, 'Penurunan tebal lipatan kulit trisep'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 30, 'Kulit bersisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 31, 'Gesekan permukaan kulit');

-- D.0145 Risiko Mutilasi Diri
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 1, 'Perkembangan remaja'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 2, 'Individu autistik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 3, 'Gangguan kepribadian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 4, 'Penyakit keturunan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 5, 'Penganiayaan (mis. fisik, psikologis, seksual)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 6, 'Gangguan hubungan interpersonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 7, 'Perceraian keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 8, 'Keterlambatan perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 9, 'Riwayat perilaku mencederai diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 10, 'Ancaman kehilangan hubungan yang bermakna'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 11, 'Ketidakmampuan mengungkapkan ketegangan secara verbal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 12, 'Ketidakmampuan mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 13, 'Harga diri rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 14, 'Peningkatan ketegangan yang tidak dapat ditoleransi');

-- D.0146 Risiko Perilaku Kekerasan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 1, 'Pemikiran waham/delusi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 2, 'Curiga pada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 3, 'Halusinasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 4, 'Berencana bunuh diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 5, 'Disfungsi sistem keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 6, 'Kerusakan kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 7, 'Disorientasi atau konfusi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 8, 'Kerusakan kontrol impuls'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 9, 'Persepsi pada lingkungan tidak akurat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 10, 'Alam perasaan depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 11, 'Riwayat kekerasan pada hewan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 12, 'Kelainan neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 13, 'Lingkungan tidak teratur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 14, 'Penganiayaan atau pengabaian anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 15, 'Riwayat atau ancaman kekerasan terhadap diri sendiri atau orang lain atau destruksi properti orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 16, 'Impulsif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 17, 'Ilusi');

-- D.0147 Risiko Perlambatan Pemulihan Pascabedah
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 1, 'Skor klasifikasi status fisik ASA ≥3'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 2, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 3, 'Edema di lokasi pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 4, 'Prosedur pembedahan ekstensif (luas)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 5, 'Usia ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 6, 'Riwayat perlambatan penyembuhan luka'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 7, 'Gangguan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 8, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 9, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 10, 'Infeksi luka perioperatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 11, 'Mual/muntah persisten'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 12, 'Respon emosional pasca operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 13, 'Pemanjangan proses operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 14, 'Gangguan psikologis pasca operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 15, 'Kontaminasi bedah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 16, 'Trauma luka operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 17, 'Efek agen farmakologis');

-- D.0148 Risiko Termoregulasi Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 1, 'Cedera otak akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 2, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 3, 'Pakaian yang tidak sesuai untuk suhu lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 4, 'Peningkatan area permukaan tubuh terhadap rasio berat badan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 5, 'Kebutuhan oksigen meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 6, 'Perubahan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 7, 'Proses penyakit (mis. infeksi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 8, 'Suhu lingkungan ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 9, 'Suplai lemak subkutan tidak memadai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 10, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 11, 'Berat badan ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 12, 'Efek agen farmakologis (mis. sedasi)');

-- ============================================================
-- 3. SDKI_KONDISI_KLINIS
-- ============================================================

-- D.0134
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 1, 'Kondisi penurunan imunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 2, 'Riwayat pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 3, 'Riwayat alergi sebelumnya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), 4, 'Asma');

-- D.0135
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 1, 'Sindrom otak akut/kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 2, 'Ketidakseimbangan hormon (mis. premenstrual syndrome, postpartum psychosis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 3, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 4, 'Post traumatic stress disorder (PTSD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), 5, 'Penyakit kronis/terminal (mis. kanker)');

-- D.0136
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 1, 'Kejang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 2, 'Sinkop'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 3, 'Vertigo'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 4, 'Gangguan penglihatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 5, 'Gangguan pendengaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 6, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 7, 'Hipotensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 8, 'Kelainan nervus vestibularis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), 9, 'Retardasi mental');

-- D.0137
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), 1, 'Penurunan kadar hemoglobin pascapersalinan');

-- D.0138
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 1, 'Ketuban pecah sebelum waktunya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 2, 'Penyakit penyerta: asma, hipertensi, penyakit menular seksual, AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 3, 'Masalah kontraksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), 4, 'Efek pengobatan pada ibu');

-- D.0139
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 1, 'Imobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 3, 'Gagal ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 4, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 5, 'Imunodefisiensi (mis. AIDS)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), 6, 'Kateterisasi jantung');

-- D.0140
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 1, 'Berat badan ekstrim'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 2, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), 3, 'Kurang mobilitas fisik');

-- D.0141
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), 1, 'Tindakan pembedahan');

-- D.0142
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 1, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 2, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 3, 'Penyakit paru obstruktif kronik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 4, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 5, 'Tindakan invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 6, 'Kondisi penggunaan terapi steroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 7, 'Penyalahgunaan obat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 8, 'Ketuban pecah sebelum waktunya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 9, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 10, 'Leukemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 11, 'Imunosupresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 12, 'Lymphedema'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 13, 'Leukositopenia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), 14, 'Gangguan fungsi hati');

-- D.0143
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 1, 'Osteoporosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 2, 'Kejang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 3, 'Penyakit serebrovaskular'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 4, 'Katarak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 5, 'Glaukoma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 6, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 7, 'Hipotensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 8, 'Amputasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 9, 'Intoksikasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), 10, 'Preeklamsi');

-- D.0144
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 1, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 3, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 4, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 5, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 6, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 7, 'Fraktur tungkai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 8, 'Cedera medula spinalis dan/atau kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), 9, 'Imobilisasi');

-- D.0145
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 1, 'Gangguan kepribadian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 2, 'Gangguan mental organik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 3, 'Autisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 4, 'Skizofrenia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 5, 'Depresi mayor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 6, 'Dissociative Identity Disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 7, 'Masokisme seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 8, 'Gangguan afektif atau mania'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'), 9, 'Riwayat penganiayaan');

-- D.0146
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 1, 'Penganiayaan fisik, psikologis atau seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 2, 'Sindrom otak organik (mis. penyakit Alzheimer)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 3, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 4, 'Oppositional defiant disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 5, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 6, 'Serangan panik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 7, 'Gangguan Tourette'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 8, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 9, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 10, 'Gangguan amnestik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 11, 'Halusinasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 12, 'Upaya bunuh diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), 13, 'Abnormalitas neurotransmitter otak');

-- D.0147
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 1, 'Tindakan operasi besar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), 2, 'Trauma yang memerlukan intervensi bedah');

-- D.0148
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 1, 'Cedera otak akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 2, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), 3, 'Trauma');

-- ============================================================
-- 4. LUARAN_SLKI
-- ============================================================
INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.14131', 'Respon Alergi Lokal', 'Lingkungan', 'Keamanan dan Proteksi', 'Perubahan daya reaksi tubuh secara lokal akibat terpapar alergen dan mengalami stimulasi respon imunitas yang berlebihan.'),
('L.09076', 'Kontrol Diri', 'Psikologis', 'Integritas Ego', 'Kemampuan untuk mengendalikan atau mengatur emosi, pikiran, dan perilaku dalam menghadapi masalah.'),
('L.14136', 'Tingkat Cedera', 'Lingkungan', 'Keamanan dan Proteksi', 'Keparahan dari cedera yang diamati atau dilaporkan.'),
('L.14125', 'Integritas Kulit dan Jaringan', 'Lingkungan', 'Keamanan dan Proteksi', 'Keutuhan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan/atau ligamen).'),
('L.14134', 'Termoregulasi', 'Fisiologis', 'Regulasi Metabolik', 'Pengaturan suhu tubuh agar tetap berada pada rentang normal.'),
('L.14137', 'Tingkat Infeksi', 'Lingkungan', 'Keamanan dan Proteksi', 'Derajat infeksi berdasarkan observasi atau sumber informasi.'),
('L.14138', 'Tingkat Jatuh', 'Lingkungan', 'Keamanan dan Proteksi', 'Derajat jatuh berdasarkan observasi atau sumber informasi.'),
('L.14129', 'Pemulihan Pascabedah', 'Lingkungan', 'Keamanan dan Proteksi', 'Proses penyembuhan setelah menjalani pembedahan untuk memulai dan melakukan aktivitas sehari-hari.');

-- ============================================================
-- 5. SLKI_KRITERIA_HASIL
-- ============================================================

-- L.14131 Respon Alergi Lokal (D.0134)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 1, 'Nyeri lokal', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 2, 'Gatal lokal', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 3, 'Sekresi mukus', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 4, 'Bersin', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 5, 'Eritema lokal', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 6, 'Konjungtivitis', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), 7, 'Lakrimasi', 'Menurun');

-- L.09076 Kontrol Diri (D.0135 & D.0146)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 1, 'Perilaku melukai diri sendiri/orang lain', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 2, 'Verbalisasi keinginan bunuh diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 3, 'Verbalisasi isyarat bunuh diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 4, 'Verbalisasi ancaman bunuh diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 5, 'Verbalisasi rencana bunuh diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 6, 'Perilaku merencanakan bunuh diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 7, 'Alam perasaan depresi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 8, 'Verbalisasi ancaman kepada orang lain', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 9, 'Verbalisasi umpatan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 10, 'Perilaku menyerang', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 11, 'Perilaku merusak lingkungan sekitar', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 12, 'Perilaku agresif/amuk', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 13, 'Suara keras', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 14, 'Bicara ketus', 'Menurun');

-- L.14136 Tingkat Cedera (D.0136, D.0137, D.0138, D.0144)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 1, 'Toleransi aktivitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 2, 'Toleransi makanan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 3, 'Kejadian cedera', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 4, 'Luka/lecet', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 5, 'Ketegangan otot', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 6, 'Fraktur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 7, 'Perdarahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 8, 'Ekspresi wajah kesakitan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 9, 'Agitasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 10, 'Iritabilitas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 11, 'Gangguan mobilitas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 12, 'Gangguan kognitif', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 13, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 14, 'Frekuensi nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 15, 'Frekuensi napas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 16, 'Pola istirahat/tidur', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), 17, 'Nafsu makan', 'Membaik');

-- L.14125 Integritas Kulit dan Jaringan (D.0139 & D.0144)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 1, 'Elastisitas kulit', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 2, 'Kerusakan jaringan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 3, 'Kerusakan kulit', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 4, 'Frekuensi nyeri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 5, 'Suhu kulit', 'Membaik');

-- L.14134 Termoregulasi (D.0140, D.0141, D.0148)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 1, 'Menggigil', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 2, 'Kulit merah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 3, 'Kejang', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 4, 'Akrosianosis', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 5, 'Konsumsi oksigen', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 6, 'Piloereksi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 7, 'Vasokontriksi perifer', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 8, 'Kutis memorata', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 9, 'Pucat', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 10, 'Takikardi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 11, 'Takipnea', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 12, 'Bradikardi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 13, 'Dasar kuku sianotik', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 14, 'Hipoksia', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 15, 'Suhu tubuh', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 16, 'Suhu kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 17, 'Kadar glukosa darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 18, 'Pengisian kapiler', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 19, 'Ventilasi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 20, 'Tekanan darah', 'Membaik');

-- L.14137 Tingkat Infeksi (D.0142)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 1, 'Kebersihan badan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 2, 'Demam', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 3, 'Kemerahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 4, 'Nyeri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 5, 'Bengkak', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), 6, 'Kadar sel darah putih', 'Membaik');

-- L.14138 Tingkat Jatuh (D.0143)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 1, 'Jatuh dari tempat tidur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 2, 'Jatuh saat berdiri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 3, 'Jatuh saat duduk', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 4, 'Jatuh saat berjalan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 5, 'Jatuh saat dipindahkan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 6, 'Jatuh saat naik tangga', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 7, 'Jatuh saat di kamar mandi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), 8, 'Jatuh saat membungkuk', 'Menurun');

-- L.14129 Pemulihan Pascabedah (D.0147)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 1, 'Kenyamanan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 2, 'Waktu penyembuhan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 3, 'Kemampuan perawatan diri', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 4, 'Area luka operasi', 'Membaik');

-- ============================================================
-- 6. INTERVENSI_SIKI
-- ============================================================
INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.12445', 'Edukasi Reaksi Alergi', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengajarkan cara mengidentifikasi, mengelola dan mencegah reaksi alergi.'),
('I.14535', 'Pencegahan Alergi', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan menurunkan risiko pasien mengalami reaksi alergi.'),
('I.14538', 'Pencegahan Bunuh Diri', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan menurunkan risiko merugikan diri sendiri dengan maksud mengakhiri hidup.'),
('I.14513', 'Manajemen Keselamatan Lingkungan', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan mengelola lingkungan fisik untuk meningkatkan keselamatan.'),
('I.07228', 'Perawatan Persalinan Risiko Tinggi', 'Fisiologis', 'Reproduksi', 'Memberikan asuhan persalinan pada janin multipel atau malposisi.'),
('I.11353', 'Perawatan Integritas Kulit', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan merawat kulit untuk menjaga keutuhan, kelembaban dan mencegah perkembangan mikroorganisme.'),
('I.14507', 'Manajemen Hipotermia', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan mengelola suhu tubuh di bawah rentang normal.'),
('I.14501', 'Pencegahan Infeksi', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan menurunkan risiko terserang organisme patogenik.'),
('I.14540', 'Pencegahan Jatuh', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengidentifikasi dan menurunkan risiko terjatuh akibat perubahan kondisi fisik atau psikologis.'),
('I.06195', 'Manajemen Sensasi Perifer', 'Fisiologis', 'Aktivitas dan Istirahat', 'Mengidentifikasi dan mengelola ketidaknyamanan pada perubahan sensasi perifer.'),
('I.14544', 'Pencegahan Perilaku Kekerasan', 'Lingkungan', 'Keamanan dan Proteksi', 'Meminimalkan kemarahan yang diekspresikan secara berlebihan dan tidak terkendali secara verbal sampai dengan mencederai orang lain dan/atau merusak lingkungan.'),
('I.05173', 'Dukungan Mobilisasi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi pasien untuk meningkatkan aktivitas pergerakan fisik.'),
('I.12414', 'Edukasi Pengukuran Suhu Tubuh', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan cara pengukuran suhu tubuh.'),
('I.12457', 'Edukasi Termoregulasi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan pasien untuk mendukung keseimbangan antara produksi panas, mendapatkan panas, dan kehilangan panas.');

-- ============================================================
-- 7. SIKI_TINDAKAN
-- ============================================================

-- I.12445 Edukasi Reaksi Alergi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Observasi', 2, 'Monitor pemahaman pasien dan keluarga tentang alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Terapeutik', 3, 'Fasilitasi mengenali penyebab alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Terapeutik', 4, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Edukasi', 1, 'Jelaskan definisi, penyebab, gejala dan tanda alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Edukasi', 2, 'Jelaskan cara menghindari alergen (mis. tidak menggunakan karpet, menggunakan masker)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'), 'Edukasi', 3, 'Anjurkan pasien dan keluarga menyediakan obat alergi');

-- I.14535 Pencegahan Alergi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Observasi', 1, 'Identifikasi riwayat alergi (obat, makanan, debu, udara)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Observasi', 2, 'Monitor terhadap reaksi obat, makanan, lateks, transfusi darah atau produk darah atau alergen lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Terapeutik', 1, 'Berikan tanda alergi pada rekam medis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Terapeutik', 2, 'Pasang gelang tanda alergi pada lengan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Terapeutik', 3, 'Hentikan paparan alergen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Terapeutik', 4, 'Lakukan tes alergi sebelum pemberian obat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Edukasi', 1, 'Ajarkan menghindari dan mencegah paparan alergen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'), 'Kolaborasi', 1, 'Kolaborasi dengan tenaga kesehatan dalam pencegahan alergi (mis. dokter, ahli gizi)');

-- I.14538 Pencegahan Bunuh Diri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Observasi', 1, 'Identifikasi gejala risiko bunuh diri (mis. gangguan mood, halusinasi, delusi, panik, penyalahgunaan zat, kesedihan, gangguan kepribadian)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Observasi', 2, 'Identifikasi keinginan dan pikiran rencana bunuh diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Observasi', 3, 'Monitor lingkungan bebas bahaya secara rutin (mis. barang pribadi, pisau cukur, jendela)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 1, 'Libatkan dalam perencanaan perawatan mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 2, 'Libatkan keluarga dalam perencanaan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 3, 'Berikan lingkungan dengan pengamanan ketat dan mudah dipantau (mis. tempat tidur dekat ruangan perawat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 4, 'Tingkatkan pengawasan pada kondisi tertentu (mis. rapat staf, pergantian shift)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 5, 'Lakukan intervensi perlindungan (mis. pembatasan area, pengekangan fisik), jika diperlukan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 6, 'Hindari diskusi berulang tentang bunuh diri sebelumnya, diskusi berorientasi pada masa sekarang dan masa depan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 7, 'Diskusikan rencana menghadapi ide bunuh diri di masa depan (mis. orang yang dihubungi, kemana mencari bantuan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Terapeutik', 8, 'Pastikan obat ditelan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Edukasi', 1, 'Anjurkan mendiskusikan perasaan yang dialami kepada orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Edukasi', 2, 'Anjurkan menggunakan sumber pendukung (mis. layanan spiritual, penyedia layanan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Edukasi', 3, 'Jelaskan tindakan pencegahan bunuh diri kepada keluarga atau orang terdekat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Edukasi', 4, 'Informasikan sumber daya masyarakat dan program yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Edukasi', 5, 'Latih pencegahan bunuh diri (mis. latihan asertif, relaksasi otot progresif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antiansietas atau antipsikotik, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Kolaborasi', 2, 'Kolaborasi tindakan keselamatan kepada PPA'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'), 'Kolaborasi', 3, 'Rujuk ke pelayanan kesehatan mental, jika perlu');

-- I.14513 Manajemen Keselamatan Lingkungan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Observasi', 1, 'Identifikasi kebutuhan keselamatan (mis. kondisi fisik, fungsi kognitif dan riwayat perilaku)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Observasi', 2, 'Monitor perubahan status keselamatan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 1, 'Hilangkan bahaya keselamatan lingkungan (mis. fisik, biologi, dan kimia), jika memungkinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 2, 'Modifikasi lingkungan untuk meminimalkan bahaya dan risiko'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 3, 'Sediakan alat bantu keamanan lingkungan (mis. commode chair dan pegangan tangan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 4, 'Gunakan perangkat pelindung (mis. pengekangan fisik, rel samping, pintu terkunci, pagar)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 5, 'Hubungi pihak berwenang sesuai masalah komunitas (mis. puskesmas, polisi, damkar)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 6, 'Fasilitasi relokasi ke lingkungan yang aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Terapeutik', 7, 'Lakukan program skrining bahaya lingkungan (mis. timbal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'), 'Edukasi', 1, 'Ajarkan individu, keluarga dan kelompok risiko tinggi bahaya lingkungan');

-- I.07228 Perawatan Persalinan Risiko Tinggi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 1, 'Identifikasi kondisi umum pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 2, 'Monitor tanda-tanda vital'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 3, 'Monitor kelainan tanda vital pada ibu dan janin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 4, 'Monitor tanda-tanda persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 5, 'Monitor denyut jantung janin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 6, 'Identifikasi posisi janin dengan USG'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Observasi', 7, 'Identifikasi perdarahan pasca persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Terapeutik', 1, 'Siapkan peralatan yang sesuai, termasuk monitor janin, ultrasound, mesin anestesi, persediaan resusitasi neonatal, forceps, dan penghangat bayi ekstra'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Terapeutik', 2, 'Lakukan perineal scrub'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Terapeutik', 3, 'Lakukan amniotomi selaput ketuban'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Terapeutik', 4, 'Dukung orang terdekat mendampingi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Edukasi', 1, 'Jelaskan prosedur tindakan yang akan dilakukan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Edukasi', 2, 'Jelaskan karakteristik bayi baru lahir yang berisiko tinggi (mis. memar dan tanda forceps)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'), 'Kolaborasi', 1, 'Koordinasi dengan tim untuk standby (mis. neonatologis, perawatan intensif neonatal, anestesiologis)');

-- I.11353 Perawatan Integritas Kulit
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Observasi', 1, 'Identifikasi penyebab gangguan integritas kulit (mis. perubahan sirkulasi, perubahan status nutrisi, penurunan kelembaban, suhu lingkungan ekstrem, penurunan mobilitas)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 1, 'Ubah posisi tiap 2 jam jika tirah baring'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 2, 'Lakukan pemijatan pada area penonjolan tulang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 3, 'Bersihkan perineal dengan air hangat, terutama selama periode diare'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 4, 'Gunakan produk berbahan petrolium atau minyak pada kulit kering'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 5, 'Gunakan produk berbahan ringan/alami dan hipoalergik pada kulit sensitif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 6, 'Hindari produk berbahan dasar alkohol pada kulit kering'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 1, 'Anjurkan menggunakan pelembab (mis. losion, serum)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 2, 'Anjurkan minum air yang cukup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 3, 'Anjurkan meningkatkan asupan nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 4, 'Anjurkan meningkatkan asupan buah dan sayur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 5, 'Anjurkan menghindari terpapar suhu ekstrem'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 6, 'Anjurkan menggunakan tabir surya SPF minimal 30 saat berada di luar rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'), 'Edukasi', 7, 'Anjurkan mandi dan menggunakan sabun secukupnya');

-- I.14507 Manajemen Hipotermia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi', 1, 'Monitor suhu tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi', 2, 'Identifikasi penyebab hipotermia (mis. terpapar suhu lingkungan rendah, pakaian tipis, kerusakan hipotalamus, penurunan laju metabolisme, kekurangan lemak subkutan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi', 3, 'Monitor tanda dan gejala akibat hipotermia (hipotermia ringan: takipnea, disartria, menggigil, hipertensi, diuresis; hipotermia sedang: aritmia, hipotensi, apatis, koagulopati, refleks menurun; hipotermia berat: oliguria, refleks menghilang, edema paru, asam-basa abnormal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 1, 'Sediakan lingkungan yang hangat (mis. atur suhu ruangan, inkubator)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 2, 'Lakukan penghangatan pasif (mis. selimut, menutup kepala, pakaian tebal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 3, 'Lakukan penghangatan aktif eksternal (mis. kompres hangat, botol hangat, selimut hangat, perawatan metode kanguru)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 4, 'Lakukan penghangatan aktif internal (mis. infus hangat, lavase peritoneal cairan hangat, oksigen dengan cairan hangat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 5, 'Ganti pakaian dan/atau linen yang basah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Edukasi', 1, 'Anjurkan makan/minum hangat');

-- I.14501 Pencegahan Infeksi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Observasi', 1, 'Monitor tanda dan gejala infeksi lokal dan sistemik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 1, 'Cuci tangan sebelum dan sesudah kontak dengan pasien dan lingkungan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 2, 'Pertahankan teknik aseptik pada pasien berisiko tinggi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Edukasi', 1, 'Jelaskan tanda dan gejala infeksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Edukasi', 2, 'Ajarkan cara mencuci tangan dengan benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501'), 'Kolaborasi', 1, 'Kolaborasi pemberian imunisasi, jika perlu');

-- I.14540 Pencegahan Jatuh
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Observasi', 1, 'Identifikasi faktor risiko jatuh (mis. usia >65 tahun, penurunan tingkat kesadaran, defisit kognitif, hipotensi ortostatik, gangguan keseimbangan, gangguan penglihatan, neuropati)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Observasi', 2, 'Identifikasi faktor lingkungan yang meningkatkan risiko jatuh (mis. lantai licin, penerangan kurang)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Observasi', 3, 'Monitor kemampuan berpindah dari tempat tidur ke kursi roda dan sebaliknya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Terapeutik', 1, 'Orientasikan ruangan pada pasien dan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Terapeutik', 2, 'Pastikan roda tempat tidur dan kursi roda selalu dalam kondisi terkunci'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Terapeutik', 3, 'Pasang handrail tempat tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Terapeutik', 4, 'Tempatkan pasien berisiko tinggi jatuh dekat dengan pantauan perawat dari nurse station'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Terapeutik', 5, 'Gunakan alat bantu berjalan (mis. kursi roda, walker)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Edukasi', 1, 'Anjurkan memanggil perawat jika membutuhkan bantuan untuk berpindah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Edukasi', 2, 'Anjurkan menggunakan alas kaki yang tidak licin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'), 'Edukasi', 3, 'Ajarkan cara menggunakan bel pemanggil untuk memanggil perawat');

-- I.06195 Manajemen Sensasi Perifer
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 1, 'Identifikasi penyebab perubahan sensasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 2, 'Identifikasi penggunaan alat pengikat, prostesis, sepatu dan pakaian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 3, 'Periksa perbedaan sensasi tajam atau tumpul'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 4, 'Periksa perbedaan sensasi panas atau dingin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 5, 'Periksa kemampuan mengidentifikasi lokasi dan tekstur benda'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 6, 'Monitor terjadinya parestesia, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 7, 'Monitor perubahan kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 8, 'Monitor adanya tromboflebitis dan tromboemboli vena'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Terapeutik', 1, 'Hindari pemakaian benda-benda yang berlebihan suhunya (terlalu panas atau dingin)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 1, 'Anjurkan penggunaan termometer untuk menguji suhu air'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 2, 'Anjurkan penggunaan sarung tangan termal saat memasak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 3, 'Anjurkan memakai sepatu lembut dan bertumit rendah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgesik, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 2, 'Kolaborasi pemberian kortikosteroid, jika perlu');

-- I.14544 Pencegahan Perilaku Kekerasan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Observasi', 1, 'Monitor adanya benda yang berpotensi membahayakan (mis. benda tajam, tali)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Observasi', 2, 'Monitor keamanan barang yang dibawa oleh pengunjung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Observasi', 3, 'Monitor selama penggunaan barang yang dapat membahayakan (mis. pisau cukur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Terapeutik', 1, 'Pertahankan lingkungan bebas dari bahaya secara rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Terapeutik', 2, 'Libatkan keluarga dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Edukasi', 1, 'Anjurkan pengunjung dan keluarga untuk mendukung keselamatan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Edukasi', 2, 'Latih cara mengungkapkan perasaan secara asertif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544'), 'Edukasi', 3, 'Latih mengurangi kemarahan secara verbal dan nonverbal (mis. relaksasi, bercerita)');

-- I.05173 Dukungan Mobilisasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 1, 'Identifikasi adanya nyeri atau keluhan fisik lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 2, 'Identifikasi toleransi fisik melakukan pergerakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 3, 'Monitor frekuensi jantung dan tekanan darah sebelum memulai mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 4, 'Monitor kondisi umum selama melakukan mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 1, 'Fasilitasi aktivitas mobilisasi dengan alat bantu (mis. pagar tempat tidur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 2, 'Fasilitasi melakukan pergerakan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 3, 'Libatkan keluarga untuk membantu pasien dalam meningkatkan pergerakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 2, 'Anjurkan melakukan mobilisasi dini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 3, 'Ajarkan mobilisasi sederhana yang harus dilakukan (mis. duduk di tempat tidur, duduk di sisi tempat tidur, pindah dari tempat tidur ke kursi)');

-- I.12414 Edukasi Pengukuran Suhu Tubuh
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Terapeutik', 4, 'Dokumentasikan hasil pengukuran suhu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Edukasi', 1, 'Jelaskan prosedur pengukuran suhu tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Edukasi', 2, 'Anjurkan terus memegang bahu dan menahan dada saat pengukuran aksila'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Edukasi', 3, 'Ajarkan memilih lokasi pengukuran suhu oral dan aksila'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Edukasi', 4, 'Ajarkan cara meletakkan ujung termometer di bawah lidah atau di bagian tengah aksila'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'), 'Edukasi', 5, 'Ajarkan cara membaca hasil termometer raksa dan/atau elektronik');

-- I.12457 Edukasi Termoregulasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 1, 'Ajarkan kompres hangat jika demam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 2, 'Ajarkan cara pengukuran suhu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 3, 'Anjurkan tetap memandikan pasien, jika memungkinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 4, 'Anjurkan pemberian antipiretik, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 5, 'Anjurkan menciptakan lingkungan yang nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 6, 'Anjurkan memperbanyak minum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 7, 'Anjurkan penggunaan pakaian yang longgar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 8, 'Anjurkan minum analgesik jika merasa pusing, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'), 'Edukasi', 9, 'Anjurkan pemeriksaan darah jika demam >3 hari');

-- ============================================================
-- 8. SDKI_SLKI_RELATIONS
-- ============================================================
INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14131')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14136')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14136')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14136')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14137')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14138')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125')),
-- D.0145 tidak ada SLKI/SIKI di PDF
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0146'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14129')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));

-- ============================================================
-- 9. SLKI_SIKI_RELATIONS
-- ============================================================
INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
-- L.14131 (D.0134) → I.12445, I.14535
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14131'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535')),
-- L.09076 (D.0135) → I.14538
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538')),
-- L.14136 (D.0136) → I.14513
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513')),
-- L.14136 (D.0137 & D.0138) → I.07228 (sudah tercakup di atas, UNIQUE constraint)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228')),
-- L.14125 (D.0139) → I.11353
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353')),
-- L.14125 (D.0144) → I.06195
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195')),
-- L.14134 (D.0140 & D.0141) → I.14507
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507')),
-- L.14134 (D.0148) → I.12414, I.12457
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457')),
-- L.14137 (D.0142) → I.14501
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14501')),
-- L.14138 (D.0143) → I.14540
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540')),
-- L.09076 (D.0146) → I.14544 (L.09076 sudah ada di atas, relasi intervensi berbeda)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14544')),
-- L.14129 (D.0147) → I.05173
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'));

SET FOREIGN_KEY_CHECKS = 1;
