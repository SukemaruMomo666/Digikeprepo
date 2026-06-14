SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- SIKI DATA MASTER — D.0021 s/d D.0038
-- Generated: 2026-06-14
-- Mencakup: intervensi_siki + siki_tindakan + slki_siki_relations + sdki_slki_relations
-- ============================================================

-- ============================================================
-- 1. INTERVENSI SIKI (master)
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.03119', 'Manajemen Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola asupan nutrisi yang seimbang.'),
('I.14551', 'Pengontrolan Infeksi', 'Lingkungan', 'Keamanan dan Proteksi', 'Mengendalikan penyebaran infeksi dan perburukan komplikasi akibat infeksi.'),
('I.03114', 'Manajemen Hipervolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola kelebihan volume cairan intravaskuler dan ekstraseluler serta mencegah terjadinya komplikasi.'),
('I.03121', 'Pemantauan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengumpulkan dan menganalisis data terkait pengaturan keseimbangan cairan.'),
('I.03116', 'Manajemen Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola penurunan volume cairan intravaskuler.'),
('I.03091', 'Fototerapi Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Memberikan terapi sinar fluorescent yang ditujukan kepada kulit neonatus untuk menurunkan kadar bilirubin.'),
('I.10338', 'Perawatan Bayi', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan merawat kesehatan bayi.'),
('I.03098', 'Manajemen Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola keseimbangan cairan dan mencegah komplikasi akibat ketidakseimbangan cairan.'),
('I.03094', 'Konseling Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Memberikan bimbingan dalam melakukan modifikasi asupan nutrisi.'),
('I.03115', 'Manajemen Hiperglikemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola kadar glukosa darah di atas normal.'),
('I.03093', 'Konseling Laktasi', 'Fisiologis', 'Nutrisi dan Cairan', 'Memberikan bimbingan teknik menyusui yang tepat dalam pemberian makanan bayi.'),
('I.03135', 'Promosi ASI Eksklusif', 'Fisiologis', 'Nutrisi dan Cairan', 'Meningkatkan kemampuan ibu dalam memberikan ASI secara eksklusif (0-6 bulan).'),
('I.03138', 'Promosi Laktasi', 'Fisiologis', 'Nutrisi dan Cairan', 'Meningkatkan cakupan ASI eksklusif dan lanjutan sampai 2 tahun.'),
('I.12393', 'Edukasi Menyusui', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi dan bimbingan tentang teknik menyusui yang tepat.'),
('I.03130', 'Pendampingan Proses Menyusui', 'Fisiologis', 'Nutrisi dan Cairan', 'Mendampingi dan memfasilitasi ibu selama proses menyusui berlangsung.'),
('I.12397', 'Edukasi Nutrisi Bayi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi dan bimbingan tentang pemenuhan nutrisi bayi.'),
('I.03097', 'Manajemen Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola berat badan agar dalam rentang optimal.'),
('I.12365', 'Edukasi Berat Badan Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi tentang berat dan persentase lemak tubuh yang optimal.'),
('I.12369', 'Edukasi Diet', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan jumlah, jenis dan jadwal asupan makanan yang diprogramkan.'),
('I.03132', 'Perawatan Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan merawat bayi setelah lahir sampai usia 28 hari.'),
('I.03122', 'Pemantauan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengumpulkan dan menganalisis data terkait regulasi keseimbangan elektrolit.');

-- ============================================================
-- 2. TINDAKAN SIKI (child)
-- ============================================================

-- I.03119 Manajemen Nutrisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi status nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Identifikasi alergi dan intoleransi makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 3, 'Identifikasi makanan yang disukai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 4, 'Identifikasi kebutuhan kalori dan jenis nutrien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 5, 'Identifikasi perlunya penggunaan selang nasogastrik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 6, 'Monitor asupan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 7, 'Monitor berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 8, 'Monitor hasil pemeriksaan laboratorium'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 2, 'Fasilitasi menentukan pedoman diet (mis. piramida makanan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 3, 'Sajikan makanan secara menarik dan suhu yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 4, 'Berikan makanan tinggi serat untuk mencegah konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 5, 'Berikan makanan tinggi kalori dan tinggi protein'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 6, 'Berikan suplemen makanan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 7, 'Hentikan pemberian makan melalui selang nasogastrik jika asupan oral dapat ditoleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 1, 'Anjurkan posisi duduk, jika mampu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 2, 'Anjurkan diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Kolaborasi', 1, 'Kolaborasi pemberian medikasi sebelum makan (mis. pereda nyeri, antiemetik), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Kolaborasi', 2, 'Kolaborasi dengan ahli gizi untuk menentukan jumlah kalori dan jenis nutrien yang dibutuhkan, jika perlu');

-- I.14551 Pengontrolan Infeksi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Observasi', 1, 'Identifikasi pasien-pasien yang mengalami penyakit infeksi menular'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 1, 'Terapkan kewaspadaan universal (mis. cuci tangan aseptik, gunakan alat pelindung diri seperti masker, sarung tangan, pelindung wajah, pelindung mata, apron, sepatu bot sesuai model transmisi mikroorganisme)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 2, 'Tempatkan pada ruang isolasi bertekanan positif untuk pasien yang mengalami penurunan imunitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 3, 'Tempatkan pada ruang isolasi bertekanan negatif untuk pasien dengan risiko penyebaran infeksi via droplet atau udara'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 4, 'Sterilisasi dan desinfeksi alat-alat, furnitur, lantai, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 5, 'Gunakan hepafilter pada area khusus (mis. kamar operasi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Terapeutik', 6, 'Berikan tanda khusus untuk pasien dengan penyakit menular'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Edukasi', 1, 'Ajarkan cara mencuci tangan dengan benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'), 'Edukasi', 2, 'Ajarkan etika batuk dan/atau bersin');

-- I.03114 Manajemen Hipervolemia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 1, 'Periksa tanda dan gejala hipervolemia (mis. ortopnea, dispnea, edema, JVP/CVP meningkat, refleks hepatojugular positif, suara napas tambahan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 2, 'Identifikasi penyebab hipervolemia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 3, 'Monitor status hemodinamik (mis. frekuensi jantung, tekanan darah, MAP, CVP, PAP, PCWP, CO, CI), jika tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 4, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 5, 'Monitor tanda hemokonsentrasi (mis. kadar natrium, BUN, hematokrit, berat jenis urine)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 6, 'Monitor tanda peningkatan tekanan onkotik plasma (mis. kadar protein dan albumin meningkat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 7, 'Monitor kecepatan infus secara ketat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Observasi', 8, 'Monitor efek samping diuretik (mis. hipotensi ortostatik, hipovolemia, hipokalemia, hiponatremia)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Terapeutik', 1, 'Timbang berat badan setiap hari pada waktu yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Terapeutik', 2, 'Batasi asupan cairan dan garam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Terapeutik', 3, 'Tinggikan kepala tempat tidur 30-40 derajat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Edukasi', 1, 'Anjurkan melapor jika haluaran urine <0,5 ml/kg/jam dalam 6 jam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Edukasi', 2, 'Anjurkan melaporkan BB bertambah >1 kg dalam sehari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Edukasi', 3, 'Ajarkan cara mengukur dan mencatat asupan dan haluaran cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Edukasi', 4, 'Ajarkan cara mengatasi kelebihan cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Kolaborasi', 1, 'Kolaborasi pemberian diuretik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Kolaborasi', 2, 'Kolaborasi penggantian kehilangan kalium akibat diuretik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114'), 'Kolaborasi', 3, 'Kolaborasi pemberian continuous renal replacement therapy (CRRT), jika perlu');

-- I.03121 Pemantauan Cairan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 1, 'Monitor frekuensi dan kekuatan nadi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 2, 'Monitor frekuensi napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 3, 'Monitor tekanan darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 4, 'Monitor berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 5, 'Monitor waktu pengisian kapiler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 6, 'Monitor elastisitas atau turgor kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 7, 'Monitor jumlah, warna, dan berat jenis urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 8, 'Monitor kadar albumin dan protein total'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 9, 'Monitor hasil pemeriksaan serum (mis. osmolaritas serum, hematokrit, natrium, kalium, BUN)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 10, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 11, 'Identifikasi tanda-tanda hipovolemia (mis. frekuensi nadi meningkat, nadi teraba lemah, tekanan darah menurun, tekanan nadi menyempit, turgor kulit menurun, membran mukosa kering, volume urine menurun, hematokrit meningkat, haus, lemah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 12, 'Identifikasi tanda-tanda hipervolemia (mis. dispnea, edema perifer, edema anasarka, JVP/CVP meningkat, refleks hepatojugular positif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 13, 'Identifikasi faktor risiko ketidakseimbangan cairan (mis. prosedur pembedahan mayor, trauma/perdarahan, luka bakar, aferesis, obstruksi intestinal, peradangan pankreas, penyakit ginjal dan kelenjar, disfungsi intestinal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Terapeutik', 1, 'Atur interval waktu pemantauan sesuai dengan kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Terapeutik', 2, 'Dokumentasikan hasil pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Edukasi', 2, 'Informasikan hasil pemantauan, jika perlu');

-- I.03116 Manajemen Hipovolemia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Observasi', 1, 'Periksa tanda dan gejala hipovolemia (mis. frekuensi nadi meningkat, nadi teraba lemah, tekanan darah menurun, tekanan nadi menyempit, turgor kulit menurun, membran mukosa kering, volume urine menurun, hematokrit meningkat, haus, lemah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Observasi', 2, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 1, 'Hitung kebutuhan cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 2, 'Berikan posisi modified Trendelenburg'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 3, 'Berikan asupan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Edukasi', 1, 'Anjurkan memperbanyak asupan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Edukasi', 2, 'Anjurkan menghindari perubahan posisi mendadak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Kolaborasi', 1, 'Kolaborasi pemberian cairan IV isotonis (mis. NaCl, RL)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Kolaborasi', 2, 'Kolaborasi pemberian cairan IV hipotonis (mis. glukosa 2,5%, NaCl 0,4%)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Kolaborasi', 3, 'Kolaborasi pemberian cairan koloid (mis. albumin, plasmanate)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'), 'Kolaborasi', 4, 'Kolaborasi pemberian produk darah');

-- I.03091 Fototerapi Neonatus
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Observasi', 1, 'Monitor ikteri pada sklera dan kulit bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Observasi', 2, 'Identifikasi kebutuhan cairan sesuai dengan usia gestasi dan berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Observasi', 3, 'Monitor suhu dan tanda vital setiap 4 jam sekali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Observasi', 4, 'Monitor efek samping fototerapi (mis. hipertermi, diare, rush pada kulit, penurunan BB 8-10%)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 1, 'Siapkan lampu fototerapi dan inkubator atau kotak bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 2, 'Lepaskan pakaian bayi kecuali popok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 3, 'Berikan penutup mata pada bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 4, 'Ukur jarak antara lampu dan permukaan kulit bayi 30 cm atau tergantung spesifikasi lampu fototerapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 5, 'Biarkan tubuh bayi terpapar sinar fototerapi secara berkelanjutan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 6, 'Ganti segera alas dan popok bayi setelah BAK/BAB'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 7, 'Gunakan linen berwarna putih agar memantulkan cahaya sebanyak mungkin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Edukasi', 1, 'Ajarkan ibu menyusui sekitar 20-30 menit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Edukasi', 2, 'Ajarkan ibu menyusui sesering mungkin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'), 'Kolaborasi', 1, 'Kolaborasi pemeriksaan darah vena bilirubin direk dan indirek');

-- I.10338 Perawatan Bayi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Observasi', 1, 'Monitor tanda-tanda vital bayi (terutama suhu 36,5–37,5 derajat Celsius)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 1, 'Mandikan bayi dengan suhu ruangan 21-24 derajat Celsius'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 2, 'Mandikan bayi dalam waktu 5-10 menit dan 2 kali dalam sehari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 3, 'Rawat tali pusat secara terbuka (tali pusat tidak dibungkus apapun)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 4, 'Bersihkan pangkal tali pusat dengan lidi kapas yang telah diberi air matang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 5, 'Kenakan popok bayi di bawah umbilikus jika tali pusat belum terlepas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 6, 'Lakukan pemijatan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 7, 'Ganti popok bayi jika basah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 8, 'Kenakan pakaian bayi dari bahan katun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 1, 'Anjurkan ibu menyusui sesuai kebutuhan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 2, 'Ajarkan ibu cara merawat bayi di rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 3, 'Ajarkan cara pemberian makanan pendamping ASI pada bayi >6 bulan');

-- I.03098 Manajemen Cairan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Observasi', 1, 'Monitor status hidrasi (mis. frekuensi nadi, kekuatan nadi, akral, pengisian kapiler, kelembapan mukosa, turgor kulit, tekanan darah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Observasi', 2, 'Monitor berat badan harian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Observasi', 3, 'Monitor berat badan sebelum dan sesudah dialisis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Observasi', 4, 'Monitor hasil pemeriksaan laboratorium (mis. hematokrit, Na, K, Cl, berat jenis urine, BUN)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Observasi', 5, 'Monitor status hemodinamik (mis. MAP, CVP, PAP, PCWP), jika tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Terapeutik', 1, 'Catat intake-output dan hitung balans cairan 24 jam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Terapeutik', 2, 'Berikan asupan cairan sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Terapeutik', 3, 'Berikan cairan intravena, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'), 'Kolaborasi', 1, 'Kolaborasi pemberian diuretik, jika perlu');

-- I.03094 Konseling Nutrisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 1, 'Identifikasi kebiasaan makan dan perilaku makan yang akan diubah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 2, 'Identifikasi kemajuan modifikasi diet secara reguler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 3, 'Monitor intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan dan kebiasaan membeli makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 1, 'Bina hubungan terapeutik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 2, 'Sepakati lama waktu pemberian konseling'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 3, 'Tetapkan tujuan jangka pendek dan jangka panjang yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 4, 'Gunakan standar nutrisi sesuai program diet dalam mengevaluasi kecukupan asupan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 5, 'Pertimbangkan faktor-faktor yang mempengaruhi pemenuhan kebutuhan gizi (mis. usia, tahap pertumbuhan dan perkembangan, penyakit)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Edukasi', 1, 'Informasikan perlunya modifikasi diet (mis. penurunan atau penambahan berat badan, pembatasan natrium atau cairan, pengurangan kolesterol)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Edukasi', 2, 'Jelaskan program gizi dan persepsi pasien terhadap diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Kolaborasi', 1, 'Rujuk pada ahli gizi, jika perlu');

-- I.03115 Manajemen Hiperglikemia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 1, 'Identifikasi kemungkinan penyebab hiperglikemia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 2, 'Identifikasi situasi yang menyebabkan kebutuhan insulin meningkat (mis. penyakit kambuhan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 3, 'Monitor kadar glukosa darah, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 4, 'Monitor tanda dan gejala hiperglikemia (mis. poliuria, polidipsia, polifagia, kelemahan, malaise, pandangan kabur, sakit kepala)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 5, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Observasi', 6, 'Monitor keton urine, kadar analisa gas darah, elektrolit, tekanan darah ortostatik dan frekuensi nadi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Terapeutik', 1, 'Berikan asupan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Terapeutik', 2, 'Konsultasikan dengan medis jika tanda dan gejala hiperglikemia tetap ada atau memburuk'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Terapeutik', 3, 'Fasilitasi ambulasi jika ada hipotensi ortostatik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Edukasi', 1, 'Anjurkan menghindari olahraga saat kadar glukosa darah lebih dari 250 mg/dL'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Edukasi', 2, 'Anjurkan monitor kadar glukosa darah secara mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Edukasi', 3, 'Anjurkan kepatuhan terhadap diet dan olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Edukasi', 4, 'Ajarkan indikasi dan pentingnya pengujian keton urine, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Edukasi', 5, 'Ajarkan pengelolaan diabetes (mis. penggunaan insulin, obat oral, monitor asupan cairan, pengganti karbohidrat, dan bantuan profesional kesehatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Kolaborasi', 1, 'Kolaborasi pemberian insulin, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Kolaborasi', 2, 'Kolaborasi pemberian cairan IV, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'), 'Kolaborasi', 3, 'Kolaborasi pemberian kalium, jika perlu');

-- I.03093 Konseling Laktasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Observasi', 1, 'Identifikasi keadaan emosional ibu saat akan dilakukan konseling menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Observasi', 2, 'Identifikasi keinginan dan tujuan menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Observasi', 3, 'Identifikasi permasalahan yang ibu alami selama proses menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Terapeutik', 1, 'Gunakan teknik mendengar aktif (mis. duduk sama tinggi, dengarkan permasalahan ibu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Terapeutik', 2, 'Berikan pujian terhadap perilaku ibu yang benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'), 'Edukasi', 1, 'Ajarkan teknik menyusui yang tepat sesuai kebutuhan ibu');

-- I.03135 Promosi ASI Eksklusif
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Observasi', 1, 'Identifikasi kebutuhan laktasi bagi ibu pada antenatal, intranatal, dan postnatal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 1, 'Fasilitasi ibu melakukan inisiasi menyusu dini (IMD)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 2, 'Fasilitasi ibu untuk rawat gabung atau rooming in'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 3, 'Gunakan sendok dan cangkir jika bayi belum bisa menyusu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 4, 'Dukung ibu menyusui dengan mendampingi ibu selama kegiatan menyusui berlangsung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 5, 'Diskusikan dengan keluarga tentang ASI eksklusif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Terapeutik', 6, 'Siapkan kelas menyusui pada masa prenatal minimal 2 kali dan periode pascapartum minimal 4 kali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 1, 'Jelaskan manfaat menyusui bagi ibu dan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 2, 'Jelaskan pentingnya menyusui di malam hari untuk mempertahankan dan meningkatkan produksi ASI'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 3, 'Jelaskan tanda-tanda bayi cukup ASI (mis. berat badan meningkat, BAK lebih dari 10 kali/hari, warna urine tidak pekat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 4, 'Jelaskan manfaat rawat gabung (rooming in)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 5, 'Anjurkan ibu menyusui sesegera mungkin setelah melahirkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 6, 'Anjurkan ibu memberikan nutrisi kepada bayi hanya dengan ASI'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 7, 'Anjurkan ibu menyusui sesering mungkin setelah lahir sesuai kebutuhan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'), 'Edukasi', 8, 'Anjurkan ibu menjaga produksi ASI dengan memerah, walaupun kondisi ibu atau bayi terpisah');

-- I.03138 Promosi Laktasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Observasi', 1, 'Identifikasi kebutuhan laktasi bagi ibu dan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Terapeutik', 1, 'Fasilitasi ibu saat melakukan IMD'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Terapeutik', 2, 'Fasilitasi ibu untuk rawat gabung atau rooming in'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Terapeutik', 3, 'Gunakan sendok dan cangkir saat bayi belum bisa menyusu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Terapeutik', 4, 'Dampingi ibu selama kegiatan menyusui berlangsung, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 1, 'Jelaskan pentingnya menyusui sampai 2 tahun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 2, 'Jelaskan manfaat rawat gabung (rooming in)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 3, 'Anjurkan menyusui minimal 2 kali selama hamil dan setelah melahirkan 3-4 kali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 4, 'Adakan kelas edukasi tentang manfaat dan posisi menyusui pada masa prenatal dan periode postpartum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 5, 'Anjurkan ibu menjaga produksi ASI dengan memerah ASI'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 6, 'Anjurkan ibu memberikan nutrisi kepada bayi hanya dengan ASI eksklusif selama 6 bulan dan dianjurkan sampai 2 tahun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 7, 'Anjurkan ibu memberi makanan pendamping ASI setelah 6 bulan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'), 'Edukasi', 8, 'Anjurkan ibu menyusui sesering mungkin segera setelah lahir sesuai kebutuhan bayi');

-- I.12393 Edukasi Menyusui
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Observasi', 2, 'Identifikasi tujuan atau keinginan menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 4, 'Dukung ibu meningkatkan kepercayaan diri dalam menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 5, 'Libatkan sistem pendukung: suami, keluarga, tenaga kesehatan dan masyarakat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Edukasi', 1, 'Berikan konseling menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Edukasi', 2, 'Jelaskan manfaat menyusui bagi ibu dan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Edukasi', 3, 'Ajarkan 4 posisi menyusui dan perlekatan dengan benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'), 'Edukasi', 4, 'Ajarkan perawatan payudara postpartum (mis. memerah ASI, pijat payudara, pijat oksitosin)');

-- I.03130 Pendampingan Proses Menyusui
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Observasi', 1, 'Monitor kemampuan ibu menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Observasi', 2, 'Monitor kemampuan bayi menyusu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Terapeutik', 1, 'Dampingi ibu selama kegiatan menyusui berlangsung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Terapeutik', 2, 'Dukung ibu meningkatkan kepercayaan diri untuk menyusui dengan menggunakan boneka saat membantu ibu memposisikan bayinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Terapeutik', 3, 'Berikan ibu pujian, informasi dan saran terhadap perilaku positif dalam menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Terapeutik', 4, 'Diskusikan masalah selama menyusui (mis. nyeri, bengkak payudara, lecet pada puting) dan mencari solusinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 1, 'Ajarkan ibu mengenali tanda-tanda bayi siap menyusu (mis. bayi mencari puting, keluar saliva, memasukkan jari ke dalam mulutnya, bayi menangis)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 2, 'Ajarkan ibu mengeluarkan ASI untuk diolesi pada puting sebelum dan sesudah menyusui agar kelenturan puting tetap terjaga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 3, 'Ajarkan ibu mengarahkan mulut bayi dari arah bawah ke arah puting ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 4, 'Ajarkan posisi menyusui (mis. cross cradle, cradle, football dan posisi berbaring) yang diikuti dengan perlekatan yang benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 5, 'Ajarkan perlekatan yang benar: perut ibu dan bayi berhadapan, tangan-kaki bayi satu garis lurus, mulut bayi terbuka lebar dan dagu bayi menempel pada payudara ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 6, 'Ajarkan memerah ASI dengan posisi jari jam 12-6 dan jam 9-3'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 7, 'Informasikan ibu untuk menyusui sampai bayi melepas sendiri puting ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'), 'Edukasi', 8, 'Informasikan ibu untuk selalu mengosongkan payudara yang belum disusui dengan memerah ASI');

-- I.12397 Edukasi Nutrisi Bayi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan ibu atau pengasuh menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Observasi', 2, 'Identifikasi kemampuan ibu atau pengasuh menyediakan nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Terapeutik', 3, 'Berikan kesempatan kepada ibu atau pengasuh untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 1, 'Jelaskan tanda-tanda awal rasa lapar (mis. bayi gelisah, membuka mulut dan menggeleng-gelengkan kepala, menjulur-julurkan lidah, mengisap jari atau tangan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 2, 'Anjurkan menghindari pemberian pemanis buatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 3, 'Ajarkan perilaku hidup bersih dan sehat (PHBS) (mis. cuci tangan sebelum dan sesudah makan, cuci tangan dengan sabun setelah ke toilet)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 4, 'Ajarkan cara memilih makanan sesuai dengan usia bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 5, 'Ajarkan cara mengatur frekuensi makan sesuai usia bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'), 'Edukasi', 6, 'Anjurkan tetap memberikan ASI saat bayi sakit');

-- I.03097 Manajemen Berat Badan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Observasi', 1, 'Identifikasi kondisi kesehatan pasien yang dapat mempengaruhi berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 1, 'Hitung berat badan ideal pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 2, 'Hitung persentase lemak dan otot pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 3, 'Fasilitasi menentukan target berat badan yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Edukasi', 1, 'Jelaskan hubungan antara asupan makanan, aktivitas fisik, penambahan berat badan dan penurunan berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Edukasi', 2, 'Jelaskan faktor risiko berat badan lebih dan berat badan kurang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Edukasi', 3, 'Anjurkan mencatat berat badan setiap minggu, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'), 'Edukasi', 4, 'Anjurkan melakukan pencatatan asupan makan, aktivitas fisik dan perubahan berat badan');

-- I.12365 Edukasi Berat Badan Efektif
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 1, 'Sediakan materi dan media edukasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 3, 'Beri kesempatan pada keluarga untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Edukasi', 1, 'Jelaskan hubungan asupan makanan, latihan, peningkatan dan penurunan berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Edukasi', 2, 'Jelaskan kondisi medis yang dapat mempengaruhi berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Edukasi', 3, 'Jelaskan risiko kondisi kegemukan (overweight) dan kurus (underweight)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Edukasi', 4, 'Jelaskan kebiasaan, tradisi, dan budaya, serta faktor genetik yang mempengaruhi berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'), 'Edukasi', 5, 'Ajarkan cara mengelola berat badan secara efektif');

-- I.12369 Edukasi Diet
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Observasi', 2, 'Identifikasi tingkat pengetahuan saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Observasi', 3, 'Identifikasi kebiasaan pola makan saat ini dan masa lalu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Observasi', 4, 'Identifikasi persepsi pasien dan keluarga tentang diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Observasi', 5, 'Identifikasi keterbatasan finansial untuk menyediakan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat peraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 4, 'Sediakan rencana makan tertulis, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 1, 'Jelaskan tujuan kepatuhan diet terhadap kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 2, 'Informasikan makanan yang diperbolehkan dan dilarang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 3, 'Informasikan kemungkinan interaksi obat dan makanan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 4, 'Anjurkan mempertahankan posisi semi Fowler (30-45 derajat) 20-30 menit setelah makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 5, 'Anjurkan mengganti bahan makanan sesuai dengan diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 6, 'Anjurkan melakukan olahraga sesuai toleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 7, 'Ajarkan cara membaca label dan memilih makanan yang sesuai program'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 8, 'Ajarkan cara merencanakan makanan yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Edukasi', 9, 'Rekomendasikan resep makanan yang sesuai dengan diet, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'), 'Kolaborasi', 1, 'Rujuk ke ahli gizi dan sertakan keluarga, jika perlu');

-- I.03132 Perawatan Neonatus
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Observasi', 1, 'Identifikasi kondisi awal bayi setelah lahir (mis. kecukupan bulan, air ketuban jernih atau bercampur mekonium, menangis spontan, tonus otot)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Observasi', 2, 'Monitor tanda vital bayi (terutama suhu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 1, 'Lakukan inisiasi menyusui dini (IMD) segera setelah bayi lahir'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 2, 'Berikan vitamin K 1 mg intramuskuler untuk mencegah perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 3, 'Mandikan selama 5-10 menit, minimal sehari sekali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 4, 'Mandikan dengan air hangat (36-37°C)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 5, 'Gunakan sabun yang mengandung provitamin B5'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 6, 'Oleskan baby oil untuk mempertahankan kelembaban kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 7, 'Rawat tali pusat secara terbuka (tidak dibungkus)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 8, 'Bersihkan tali pusat dengan air steril atau air matang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 9, 'Kenakan pakaian dari bahan katun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 10, 'Selimuti untuk mempertahankan kehangatan dan mencegah hipotermia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 11, 'Ganti popok segera jika basah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Edukasi', 1, 'Anjurkan tidak membubuhi apapun pada tali pusat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Edukasi', 2, 'Ajarkan ibu menyusui bayi setiap 2 jam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Edukasi', 3, 'Anjurkan menyendawakan bayi setelah disusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'), 'Edukasi', 4, 'Anjurkan ibu mencuci tangan sebelum menyentuh bayi');

-- I.03122 Pemantauan Elektrolit
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Observasi', 1, 'Identifikasi kemungkinan penyebab ketidakseimbangan elektrolit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Observasi', 2, 'Monitor kadar elektrolit serum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Observasi', 3, 'Monitor mual, muntah dan diare'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Observasi', 4, 'Monitor kehilangan cairan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Terapeutik', 1, 'Atur interval waktu pemantauan sesuai dengan kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Terapeutik', 2, 'Dokumentasikan hasil pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'), 'Edukasi', 2, 'Informasikan hasil pemantauan, jika perlu');

-- ============================================================
-- 3. RELASI SDKI → SLKI (sdki_slki_relations)
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03033')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03028')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03022')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03029')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03029')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03023')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03028')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03021')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'));

-- ============================================================
-- 4. RELASI SLKI → SIKI (slki_siki_relations)
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
-- L.03033 Tingkat Nyeri (D.0021)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551')),
-- L.03020 Keseimbangan Cairan (D.0022, D.0025, D.0036)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03114')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098')),
-- L.03028 Status Cairan (D.0023, D.0034)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121')),
-- L.14125 Integritas Kulit dan Jaringan (D.0024, D.0035)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132')),
-- L.03030 Status Nutrisi (D.0026, D.0032)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119')),
-- L.03022 Kestabilan Kadar Glukosa Darah (D.0027, D.0038)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115')),
-- L.03029 Status Menyusui (D.0028, D.0029)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397')),
-- L.03018 Berat Badan (D.0030, D.0031)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094')),
-- L.03023 Motilitas Gastrointestinal (D.0033)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551')),
-- L.03021 Keseimbangan Elektrolit (D.0037)
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'));

SET FOREIGN_KEY_CHECKS = 1;
