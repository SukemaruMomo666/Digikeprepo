-- ============================================
-- DATA MASTER BATCH 3: D.0021 – D.0030
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.03033', 'Fungsi Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Kemampuan saluran gastrointestinal untuk mencerna dan menyerap makanan serta membuang sisa pencernaan.'),
('L.03020', 'Keseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Ekuilibrium antara volume cairan di ruang intraseluler dan ekstraseluler tubuh.'),
('L.14125', 'Integritas Kulit dan Jaringan', 'Lingkungan', 'Keamanan dan Proteksi', 'Keutuhan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan/atau ligamen).'),
('L.03022', 'Kestabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Kadar glukosa darah dalam rentang normal.'),
('L.03029', 'Status Menyusui', 'Fisiologis', 'Nutrisi dan Cairan', 'Kemampuan memberikan ASI secara langsung dari payudara kepada bayi untuk memenuhi kebutuhan nutrisi.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.03033 Fungsi Gastrointestinal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03033', 1, 'Nyeri abdomen', 'Menurun'),
('L.03033', 2, 'Mual', 'Menurun'),
('L.03033', 3, 'Muntah', 'Menurun'),
('L.03033', 4, 'Distensi abdomen', 'Menurun'),
('L.03033', 5, 'Peristaltik usus', 'Membaik');

-- L.03020 Keseimbangan Cairan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03020', 1, 'Asupan cairan', 'Meningkat'),
('L.03020', 2, 'Haluaran urine', 'Meningkat'),
('L.03020', 3, 'Edema', 'Menurun'),
('L.03020', 4, 'Asites', 'Menurun'),
('L.03020', 5, 'Tekanan darah', 'Membaik'),
('L.03020', 6, 'Turgor kulit', 'Membaik');

-- L.14125 Integritas Kulit dan Jaringan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14125', 1, 'Elastisitas', 'Meningkat'),
('L.14125', 2, 'Hidrasi', 'Meningkat'),
('L.14125', 3, 'Kerusakan jaringan', 'Menurun'),
('L.14125', 4, 'Kerusakan lapisan kulit', 'Menurun'),
('L.14125', 5, 'Warna kulit', 'Membaik');

-- L.03022 Kestabilan Kadar Glukosa Darah
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03022', 1, 'Kadar glukosa dalam darah', 'Membaik'),
('L.03022', 2, 'Kesadaran', 'Meningkat'),
('L.03022', 3, 'Lelah/lesu', 'Menurun'),
('L.03022', 4, 'Rasa lapar', 'Menurun');

-- L.03018 Berat Badan (tambahan KH untuk D.0030)
INSERT IGNORE INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03018', 2, 'Berat badan', 'Membaik'),
('L.03018', 3, 'Tebal lipatan kulit trisep', 'Membaik');

-- L.03029 Status Menyusui
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03029', 1, 'Perlekatan bayi pada payudara ibu', 'Meningkat'),
('L.03029', 2, 'Kemampuan ibu memposisikan bayi dengan benar', 'Meningkat'),
('L.03029', 3, 'Tetesan/pancaran ASI', 'Meningkat'),
('L.03029', 4, 'Suplai ASI adekuat', 'Meningkat'),
('L.03029', 5, 'Kepercayaan diri ibu', 'Meningkat'),
('L.03029', 6, 'Lecet pada puting', 'Menurun'),
('L.03029', 7, 'Intake bayi', 'Meningkat'),
('L.03029', 8, 'Hisapan bayi', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.03114', 'Manajemen Hipervolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola kelebihan volume cairan intravaskuler dan ekstraseluler serta mencegah terjadinya komplikasi.'),
('I.03116', 'Manajemen Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola penurunan volume cairan intravaskuler.'),
('I.03091', 'Fototerapi Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Memberikan terapi sinar fluorescent yang ditujukan kepada kulit neonatus untuk menurunkan kadar bilirubin.'),
('I.03098', 'Manajemen Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola keseimbangan cairan dan mencegah komplikasi akibat ketidakseimbangan cairan.'),
('I.03094', 'Konseling Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Pendukung', 'Memberikan bimbingan dalam melakukan modifikasi asupan nutrisi.'),
('I.03115', 'Manajemen Hiperglikemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola kadar glukosa darah di atas normal.'),
('I.03093', 'Konseling Laktasi', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Memberikan bimbingan teknik menyusui yang tepat dalam pemberian makanan bayi.'),
('I.12393', 'Edukasi Menyusui', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memberikan informasi dan bimbingan tentang proses menyusui yang benar.'),
('I.03097', 'Manajemen Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Memfasilitasi pencapaian dan pemeliharaan berat badan yang sehat.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.03114 Manajemen Hipervolemia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 1, 'Periksa tanda dan gejala hipervolemia (mis. ortopnea, dispnea, edema, JVP meningkat, suara napas tambahan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 2, 'Identifikasi penyebab hipervolemia'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 3, 'Monitor status hemodinamik (tekanan darah, MAP, CVP)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 4, 'Monitor intake dan output cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 5, 'Monitor tanda hemokonsentrasi (kadar natrium, BUN, hematokrit)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Terapeutik', 1, 'Batasi asupan cairan dan garam'),
((SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Kolaborasi', 1, 'Kolaborasi pemberian diuretik, jika perlu');

-- I.03116 Manajemen Hipovolemia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 1, 'Periksa tanda dan gejala hipovolemia (mis. frekuensi nadi meningkat, nadi teraba lemah, tekanan darah menurun, turgor kulit menurun)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 2, 'Monitor intake dan output cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 1, 'Hitung kebutuhan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 2, 'Berikan posisi modified Trendelenburg'),
((SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Kolaborasi', 1, 'Kolaborasi pemberian cairan IV isotonis, jika perlu');

-- I.03091 Fototerapi Neonatus
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 1, 'Monitor ikterik pada sklera dan kulit bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 2, 'Identifikasi kebutuhan cairan sesuai dengan usia gestasi dan berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 3, 'Monitor suhu dan tanda vital setiap 4 jam sekali'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 4, 'Monitor efek samping fototerapi (mis. hipertermia, diare, ruam pada kulit, penurunan BB 8-10%)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 1, 'Siapkan lampu fototerapi dan inkubator atau kotak bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 2, 'Lepaskan pakaian bayi kecuali popok'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 3, 'Berikan penutup mata pada bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Kolaborasi', 1, 'Kolaborasi pemeriksaan darah vena bilirubin direk dan indirek');

-- I.03098 Manajemen Cairan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Observasi', 1, 'Monitor status hidrasi (mis. frekuensi nadi, kekuatan nadi, akral, pengisian kapiler, kelembapan mukosa, turgor kulit, tekanan darah)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Observasi', 2, 'Monitor berat badan harian'),
((SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Observasi', 3, 'Monitor hasil pemeriksaan laboratorium (mis. hematokrit, Na, K, Cl, BUN)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Terapeutik', 1, 'Catat intake dan output cairan 24 jam'),
((SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Kolaborasi', 1, 'Kolaborasi pemberian cairan IV, jika perlu');

-- I.03094 Konseling Nutrisi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 1, 'Identifikasi kebiasaan makan dan perilaku makan yang akan diubah'),
((SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 2, 'Identifikasi kemajuan modifikasi diet secara reguler'),
((SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 3, 'Monitor intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 1, 'Bina hubungan terapeutik');

-- I.03115 Manajemen Hiperglikemia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Observasi', 1, 'Identifikasi kemungkinan penyebab hiperglikemia'),
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Observasi', 2, 'Monitor kadar glukosa darah'),
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Observasi', 3, 'Monitor tanda dan gejala hiperglikemia (mis. poliuri, polidipsi, polifagi, kelemahan, malaise, pandangan kabur)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Terapeutik', 1, 'Berikan asupan cairan oral'),
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Edukasi', 1, 'Anjurkan monitor kadar glukosa darah secara mandiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Kolaborasi', 1, 'Kolaborasi pemberian insulin, jika perlu');

-- I.03093 Konseling Laktasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 1, 'Identifikasi keadaan emosional ibu saat akan dilakukan konseling menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 2, 'Identifikasi keinginan dan tujuan menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 3, 'Identifikasi permasalahan yang ibu alami selama proses menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Terapeutik', 1, 'Gunakan teknik mendengar aktif'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Edukasi', 1, 'Ajarkan teknik menyusui yang tepat sesuai kebutuhan ibu');

-- I.12393 Edukasi Menyusui
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Observasi', 2, 'Identifikasi tujuan atau keinginan menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 4, 'Dukung ibu meningkatkan kepercayaan diri dalam menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 5, 'Libatkan sistem pendukung: suami, keluarga, tenaga kesehatan dan masyarakat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Edukasi', 1, 'Berikan konseling menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Edukasi', 2, 'Jelaskan manfaat menyusui bagi ibu dan bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Edukasi', 3, 'Ajarkan 4 posisi menyusui dan perlekatan dengan benar'),
((SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Edukasi', 4, 'Ajarkan perawatan payudara antepartum');

-- I.03097 Manajemen Berat Badan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Observasi', 1, 'Identifikasi kondisi kesehatan pasien yang dapat mempengaruhi berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 1, 'Hitung berat badan ideal pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 2, 'Hitung persentase lemak dan otot pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Terapeutik', 3, 'Fasilitasi menentukan target berat badan yang realistis'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Edukasi', 1, 'Jelaskan hubungan antara asupan makanan, aktivitas fisik, penambahan berat badan dan penurunan berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Edukasi', 2, 'Jelaskan faktor risiko berat badan lebih dan berat badan kurang'),
((SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Edukasi', 3, 'Anjurkan mencatat berat badan setiap minggu, jika perlu');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0021', 'Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Peningkatan, penurunan, tidak efektif, atau kurangnya aktivitas peristaltik dalam sistem gastrointestinal.'),
('D.0022', 'Hipervolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Peningkatan volume cairan intravaskuler, interstisiel, dan/atau intraseluler.'),
('D.0023', 'Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Penurunan volume cairan intravaskuler, interstisial, dan/atau intraselular.'),
('D.0024', 'Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Kulit dan membran mukosa neonatus menguning setelah 24 jam kelahiran akibat bilirubin tidak terkonjugasi masuk ke dalam sirkulasi.'),
('D.0025', 'Kesiapan Peningkatan Keseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pola ekuilibrium antara volume cairan di ruang intraseluler dan ekstraseluler tubuh yang cukup untuk memenuhi kebutuhan dan dapat ditingkatkan.'),
('D.0026', 'Kesiapan Peningkatan Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pola asupan nutrisi yang cukup untuk memenuhi kebutuhan metabolisme dan dapat ditingkatkan.'),
('D.0027', 'Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Variasi kadar glukosa darah naik/turun dari rentang normal.'),
('D.0028', 'Menyusui Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pemberian ASI secara langsung dari payudara kepada bayi dan anak yang dapat memenuhi kebutuhan nutrisi.'),
('D.0029', 'Menyusui Tidak Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Kondisi dimana ibu dan bayi mengalami ketidakpuasan atau kesukaran pada proses menyusui.'),
('D.0030', 'Obesitas', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin dan melebihi ambang batas obesitas.');


-- ============================================
-- 6. SDKI PENYEBAB / FAKTOR RISIKO
-- ============================================

-- D.0021 Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), 'Fisiologis', 1, 'Intoleransi makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), 'Fisiologis', 2, 'Malnutrisi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), 'Situasional', 1, 'Tirah baring lama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), 'Situasional', 2, 'Efek agen farmakologis');

-- D.0022 Hipervolemia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), 'Umum', 1, 'Gangguan mekanisme regulasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), 'Umum', 2, 'Kelebihan asupan cairan');

-- D.0023 Hipovolemia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), 'Fisiologis', 1, 'Kehilangan cairan aktif'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), 'Fisiologis', 2, 'Gangguan absorpsi cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), 'Situasional', 1, 'Kurang asupan cairan');

-- D.0024 Ikterik Neonatus
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), 'Umum', 1, 'Penurunan berat badan abnormal (>7-8% pada bayi baru lahir yang menyusu ASI, >15% pada bayi cukup bulan)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), 'Umum', 2, 'Pola makan tidak ditetapkan dengan baik'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), 'Umum', 3, 'Usia kurang dari 7 hari'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), 'Umum', 4, 'Keterlambatan pengeluaran feses');

-- D.0026 Kesiapan Peningkatan Nutrisi (tanda mayor)
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan nutrisi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), 'Mayor', 'Objektif', 1, 'Makan teratur dan adekuat');

-- D.0027 Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), 'Fisiologis', 1, 'Disfungsi pankreas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), 'Fisiologis', 2, 'Resistensi insulin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), 'Situasional', 1, 'Kurang patuh pada rencana manajemen diabetes'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), 'Situasional', 2, 'Manajemen medikasi tidak terkontrol');

-- D.0028 Menyusui Efektif (penyebab/kondisi)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 1, 'Hormon oksitosin dan prolaktin adekuat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 2, 'Payudara membesar, alveoli mulai terisi ASI'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 3, 'Tidak ada kelainan pada struktur payudara'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 4, 'Puting menonjol'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 5, 'Bayi aterm');

-- D.0029 Menyusui Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 1, 'Ketidakadekuatan suplai ASI'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 2, 'Hambatan pada neonatus (mis. prematuritas, sumbing)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 3, 'Anomali payudara ibu (mis. puting yang masuk ke dalam)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 4, 'Ketidakadekuatan refleks oksitosin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 5, 'Ketidakadekuatan refleks menghisap bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 6, 'Payudara bengkak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 1, 'Tidak rawat gabung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 2, 'Kurang terpapar informasi');

-- D.0030 Obesitas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), 'Umum', 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), 'Umum', 2, 'Kelebihan konsumsi gula dan lemak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), 'Umum', 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), 'Umum', 4, 'Faktor keturunan (genetik)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), 'Umum', 5, 'Penggunaan energi kurang dari asupan');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), (SELECT id FROM slki WHERE kode_luaran='L.03033')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM slki WHERE kode_luaran='L.03020')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM slki WHERE kode_luaran='L.03020')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM slki WHERE kode_luaran='L.14125')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0025'), (SELECT id FROM slki WHERE kode_luaran='L.03020')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM slki WHERE kode_luaran='L.03030')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), (SELECT id FROM slki WHERE kode_luaran='L.03022')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM slki WHERE kode_luaran='L.03029')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM slki WHERE kode_luaran='L.03029')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), (SELECT id FROM slki WHERE kode_luaran='L.03018'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0021'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0025'), (SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0027'), (SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0030'), (SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Utama');


-- ============================================
-- 9. RASIONAL
-- ============================================

-- D.0022 ↔ I.03114
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 1, 'Untuk mengetahui tanda dan gejala hipervolemi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 2, 'Untuk mengidentifikasi penyebab hipervolemi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 3, 'Untuk memonitor status hemodinamik pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 4, 'Untuk memonitor intake dan output cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0022'), (SELECT id FROM siki WHERE kode_intervensi='I.03114'), 'Observasi', 5, 'Untuk memonitor tanda hemokonsentrasi');

-- D.0023 ↔ I.03116
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 1, 'Untuk mengetahui perubahan TTV dan tanda gejala dari hipovolemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 2, 'Untuk memastikan pasien tidak mengalami dehidrasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0023'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Terapeutik', 1, 'Untuk mengontrol cairan yang dibutuhkan pasien');

-- D.0024 ↔ I.03091
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 1, 'Untuk memonitor ikterik pada sklera dan kulit bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 2, 'Untuk mengidentifikasi kebutuhan cairan sesuai usia dan berat badan bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 3, 'Untuk memonitor suhu dan tanda-tanda vital bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Observasi', 4, 'Untuk memonitor efek samping fototerapi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 1, 'Untuk menyiapkan lampu fototerapi dan inkubator bagi bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 2, 'Untuk memudahkan proses fototerapi pada bayi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0024'), (SELECT id FROM siki WHERE kode_intervensi='I.03091'), 'Terapeutik', 3, 'Untuk menghindari mata bayi dari paparan sinar fototerapi');

-- D.0025 ↔ I.03098
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0025'), (SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Observasi', 1, 'Untuk mengetahui apakah terdapat tanda-tanda dehidrasi pada pasien');

-- D.0026 ↔ I.03094
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 1, 'Untuk mengetahui status nutrisi klien sehingga dapat melakukan intervensi yang tepat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 2, 'Untuk mengetahui kemajuan diet secara reguler pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0026'), (SELECT id FROM siki WHERE kode_intervensi='I.03094'), 'Observasi', 3, 'Untuk mengetahui intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan, dan kebiasaan membeli makanan');

-- D.0028 ↔ I.03093
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 1, 'Untuk mengetahui perasaan ibu saat akan melakukan konseling laktasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 2, 'Untuk mengetahui tujuan dan keinginan ibu menyusui agar pemberian konseling lebih terarah dan efektif'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0028'), (SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 3, 'Untuk mengetahui permasalahan yang dialami ibu selama proses menyusui agar dapat memberikan solusi yang tepat');

-- D.0029 ↔ I.12393
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Observasi', 1, 'Untuk mengetahui kesiapan dan kemampuan ibu dalam menerima informasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Observasi', 2, 'Untuk mengetahui tujuan dan keinginan ibu dalam menyusui'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 1, 'Untuk membantu proses penyuluhan yang diberikan kepada ibu'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 2, 'Kontrak waktu sebelum melakukan pendidikan kesehatan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 3, 'Agar ibu bisa lebih mengerti edukasi yang diberikan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 4, 'Agar ibu merasa percaya diri saat menyusui'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0029'), (SELECT id FROM siki WHERE kode_intervensi='I.12393'), 'Terapeutik', 5, 'Dukungan suami dan keluarga sangat mempengaruhi kondisi emosional ibu');

SET FOREIGN_KEY_CHECKS = 1;
