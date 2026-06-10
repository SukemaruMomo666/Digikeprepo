-- ============================================
-- DATA MASTER BATCH 4: D.0031 – D.0040
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.03023', 'Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Efektivitas aktivitas peristaltik pada sistem gastrointestinal.'),
('L.03028', 'Status Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Keseimbangan volume cairan dan elektrolit dalam tubuh.'),
('L.03021', 'Keseimbangan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Keseimbangan konsentrasi elektrolit dalam plasma dan sel tubuh.'),
('L.03122', 'Pemantauan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Kemampuan mengidentifikasi dan mengelola perubahan kadar elektrolit dalam darah.'),
('L.04034', 'Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Kemampuan mengeluarkan urin sesuai pola normal.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.03023 Motilitas Gastrointestinal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03023', 1, 'Nyeri abdomen', 'Menurun'),
('L.03023', 2, 'Penggunaan otot bantu napas', 'Menurun'),
('L.03023', 3, 'Distensi abdomen', 'Menurun'),
('L.03023', 4, 'Mual', 'Menurun'),
('L.03023', 5, 'Muntah', 'Menurun');

-- L.03028 Status Cairan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03028', 1, 'Kekuatan nadi', 'Meningkat'),
('L.03028', 2, 'Output urin', 'Meningkat'),
('L.03028', 3, 'Tekanan darah', 'Membaik'),
('L.03028', 4, 'Turgor kulit', 'Membaik');

-- L.03021 Keseimbangan Elektrolit
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03021', 1, 'Serum natrium', 'Membaik'),
('L.03021', 2, 'Serum kalium', 'Membaik'),
('L.03021', 3, 'Serum kalsium', 'Membaik'),
('L.03021', 4, 'Tekanan darah', 'Membaik');

-- L.03122 Pemantauan Elektrolit (minimal KH)
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03122', 1, 'Kadar elektrolit darah', 'Membaik');

-- L.04034 Eliminasi Urin
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.04034', 1, 'Desakan berkemih', 'Membaik'),
('L.04034', 2, 'Urin menetes (dribbling)', 'Menurun'),
('L.04034', 3, 'Nokturia', 'Menurun'),
('L.04034', 4, 'Mengompol (bedwetting)', 'Menurun'),
('L.04034', 5, 'Enuresis', 'Menurun'),
('L.04034', 6, 'Frekuensi berkemih', 'Membaik'),
('L.04034', 7, 'Volume urin', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.12369', 'Edukasi Diet', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Mengajarkan jumlah, jenis dan jadwal asupan makanan yang diprogramkan.'),
('I.03132', 'Perawatan Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan merawat bayi setelah lahir sampai usia 28 hari.'),
('I.03122', 'Pemantauan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengumpulkan dan menganalisis data terkait regulasi keseimbangan elektrolit.'),
('I.04152', 'Manajemen Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola gangguan pola eliminasi urin.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.12369 Edukasi Diet
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 2, 'Identifikasi tingkat pengetahuan saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 3, 'Identifikasi kebiasaan pola makan pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 1, 'Sediakan materi edukasi tentang diet yang diprogramkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 1, 'Ajarkan jumlah, jenis dan jadwal asupan makanan sesuai program'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 2, 'Jelaskan manfaat dan dampak asupan makanan terhadap kondisi kesehatan');

-- I.03132 Perawatan Neonatus
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 1, 'Identifikasi kondisi awal bayi setelah lahir (mis. kecukupan bulan, air ketuban, menangis spontan, tonus otot)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 2, 'Monitor suhu tubuh bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 3, 'Monitor tanda-tanda vital bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 4, 'Monitor intake dan output bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 1, 'Pertahankan suhu tubuh bayi tetap normal'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 2, 'Fasilitasi kontak kulit-ke-kulit antara ibu dan bayi (skin-to-skin contact)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Terapeutik', 3, 'Lakukan perawatan tali pusat sesuai protokol');

-- I.03122 Pemantauan Elektrolit
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 1, 'Identifikasi kemungkinan penyebab ketidakseimbangan elektrolit'),
((SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 2, 'Monitor kadar elektrolit serum (Na, K, Ca, Cl, Mg)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 3, 'Monitor tanda dan gejala ketidakseimbangan elektrolit'),
((SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 4, 'Monitor intake dan output cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Kolaborasi', 1, 'Kolaborasi pemberian suplementasi elektrolit, jika perlu');

-- I.04152 Manajemen Eliminasi Urin
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 1, 'Identifikasi tanda dan gejala retensi atau inkontinensia urin'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 2, 'Identifikasi faktor yang menyebabkan retensi atau inkontinensia urin'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 3, 'Monitor eliminasi urin (pola, volume, warna, bau)'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 4, 'Monitor intake dan output cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 1, 'Catat waktu dan haluaran berkemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 2, 'Batasi asupan cairan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Edukasi', 1, 'Ajarkan teknik relaksasi untuk memfasilitasi eliminasi urin');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0031', 'Risiko Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin.'),
('D.0032', 'Risiko Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme.'),
('D.0033', 'Risiko Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami peningkatan, penurunan, atau tidak efektifnya aktivitas peristaltik pada sistem gastrointestinal.'),
('D.0034', 'Risiko Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami penurunan volume cairan intravaskuler, interstisial, dan/atau intraselular.'),
('D.0035', 'Risiko Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami kulit dan membran mukosa neonatus menguning setelah 24 jam kelahiran akibat bilirubin tidak terkonjugasi masuk ke dalam sirkulasi.'),
('D.0036', 'Risiko Ketidakseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami perubahan volume cairan intravaskuler, interstisial, dan/atau intraseluler.'),
('D.0037', 'Risiko Ketidakseimbangan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami perubahan konsentrasi elektrolit serum yang dapat mengakibatkan disfungsi neuromuskular dan kardiak.'),
('D.0038', 'Risiko Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami variasi kadar glukosa darah dari rentang normal.'),
('D.0039', 'Risiko Syok', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami ketidakcukupan aliran darah ke jaringan tubuh yang dapat mengakibatkan disfungsi seluler yang mengancam jiwa.'),
('D.0040', 'Gangguan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Aktual', 'Disfungsi dalam mengeluarkan urin sesuai dengan pola normal.');


-- ============================================
-- 6. SDKI FAKTOR RISIKO
-- ============================================

-- D.0031 Risiko Berat Badan Lebih
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), 2, 'Kelebihan konsumsi gula'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), 4, 'Faktor keturunan');

-- D.0032 Risiko Defisit Nutrisi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), 1, 'Ketidakmampuan menelan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), 2, 'Kurangnya asupan makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), 3, 'Gangguan pencernaan');

-- D.0033 Risiko Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), 1, 'Intoleransi makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), 2, 'Malnutrisi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), 3, 'Tirah baring lama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), 4, 'Efek agen farmakologis');

-- D.0034 Risiko Hipovolemia
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), 1, 'Kehilangan cairan aktif (diare, muntah, perdarahan)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), 2, 'Gangguan absorpsi cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), 3, 'Kurang asupan cairan');

-- D.0035 Risiko Ikterik Neonatus
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), 1, 'Penurunan berat badan abnormal (>7-8% pada bayi menyusu ASI)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), 2, 'Pola makan tidak ditetapkan dengan baik'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), 3, 'Usia kurang dari 7 hari'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), 4, 'Keterlambatan pengeluaran feses');

-- D.0036 Risiko Ketidakseimbangan Cairan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), 1, 'Penyakit ginjal kronis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), 3, 'Edema');

-- D.0037 Risiko Ketidakseimbangan Elektrolit
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), 1, 'Gangguan ginjal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), 2, 'Diare atau muntah berkelanjutan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), 3, 'Penggunaan diuretik');

-- D.0038 Risiko Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), 1, 'Kurang terpapar informasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), 2, 'Ketidaktepatan pemantauan glukosa darah'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), 3, 'Riwayat keluarga diabetes');

-- D.0039 Risiko Syok
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 1, 'Hipoksemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 2, 'Hipoksia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 3, 'Hipotensi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 4, 'Kekurangan volume cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 5, 'Sepsis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), 6, 'Sindrom Respons Inflamasi Sistemik (SIRS)');

-- D.0040 Gangguan Eliminasi Urin (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), 'Fisiologis', 1, 'Penurunan kapasitas kandung kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), 'Fisiologis', 2, 'Iritasi kandung kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), 'Fisiologis', 3, 'Penurunan kemampuan menyadari tanda-tanda gangguan kandung kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), 'Fisiologis', 4, 'Kelemahan otot pelvis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), 'Situasional', 1, 'Efek tindakan medis dan diagnostik (operasi ginjal, operasi saluran kemih, anestesi, obat-obatan)');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM slki WHERE kode_luaran='L.03018')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), (SELECT id FROM slki WHERE kode_luaran='L.03030')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM slki WHERE kode_luaran='L.03023')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), (SELECT id FROM slki WHERE kode_luaran='L.03028')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM slki WHERE kode_luaran='L.14125')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), (SELECT id FROM slki WHERE kode_luaran='L.03020')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), (SELECT id FROM slki WHERE kode_luaran='L.03021')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), (SELECT id FROM slki WHERE kode_luaran='L.03022')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM slki WHERE kode_luaran='L.03028')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM slki WHERE kode_luaran='L.04034'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Pendukung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM siki WHERE kode_intervensi='I.03097'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), (SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), (SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), (SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Utama');


-- ============================================
-- 9. RASIONAL
-- ============================================

-- D.0031 ↔ I.12369 & I.03097
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 1, 'Untuk mengetahui kemampuan klien dan keluarga dalam menerima informasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 2, 'Untuk mempermudah perawat dalam memberikan penjelasan materi sesuai dengan pemahaman klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0031'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 3, 'Untuk mengetahui pola makan yang dijalani pasien dan mempermudah pemrograman diet');

-- D.0032 ↔ I.03119
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Untuk mengetahui kondisi status nutrisi klien sehingga dapat melakukan intervensi yang tepat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0032'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Untuk mengidentifikasi alergi dan intoleransi makanan pada pasien');

-- D.0033 ↔ I.12369
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 1, 'Untuk mengetahui apakah keluarga dapat menerima informasi yang sudah diberikan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 2, 'Untuk mengetahui tingkat pemahaman pengetahuan informasi pasien dan keluarga'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0033'), (SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 3, 'Untuk mengetahui kebiasaan pola makan dan faktor yang mempengaruhi motilitas GI');

-- D.0034 ↔ I.03116
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 1, 'Untuk mengetahui kadar naik turunnya frekuensi tanda dan gejala pada hipovolemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0034'), (SELECT id FROM siki WHERE kode_intervensi='I.03116'), 'Observasi', 2, 'Untuk mengelola penurunan volume cairan intravaskuler');

-- D.0035 ↔ I.03132
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 1, 'Untuk melihat adanya kelainan yang terjadi pada saat bayi lahir, misalnya kecacatan atau bayi lahir prematur'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 2, 'Untuk menilai fungsi fisiologis organ vital tubuh atau mekanisme homeostasis tubuh'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0035'), (SELECT id FROM siki WHERE kode_intervensi='I.03132'), 'Observasi', 3, 'Suhu tubuh dan suhu lingkungan yang rendah menyebabkan bayi lebih mudah kehilangan panas');

-- D.0036 ↔ I.03098
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0036'), (SELECT id FROM siki WHERE kode_intervensi='I.03098'), 'Observasi', 1, 'Untuk mengetahui tanda dan gejala dehidrasi pada pasien');

-- D.0037 ↔ I.03122
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), (SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 1, 'Gangguan elektrolit umumnya disebabkan karena kehilangan cairan tubuh melalui keringat berlebih, diare atau muntah yang berlangsung lama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0037'), (SELECT id FROM siki WHERE kode_intervensi='I.03122'), 'Observasi', 2, 'Ketidakseimbangan elektrolit dapat menyebabkan gangguan neuromuskuler dan kardiak');

-- D.0038 ↔ I.03115
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), (SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Observasi', 1, 'Untuk mengetahui kemungkinan penyebab ketidakstabilan kadar glukosa darah'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0038'), (SELECT id FROM siki WHERE kode_intervensi='I.03115'), 'Observasi', 2, 'Untuk memantau tanda dan gejala hiperglikemia seperti poliuri, polidipsi, polifagi');

-- D.0039 ↔ I.02068
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 1, 'Dapat mengetahui tingkat syok yang dialami oleh pasien melalui tanda-tanda vitalnya'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 2, 'Memastikan pasien untuk mendapatkan oksigen yang cukup'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 3, 'Agar pasien terpenuhi kebutuhan cairannya'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 4, 'Dapat memastikan pasien kembali sadar'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0039'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 1, 'Agar saturasi oksigen pasien tetap berada pada keadaan normal');

-- D.0040 ↔ I.04152
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 1, 'Untuk mengetahui tanda dan gejala retensi atau inkontinensia urin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 2, 'Untuk mengetahui faktor yang menyebabkan retensi atau inkontinensia urin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Observasi', 3, 'Untuk mengontrol eliminasi urin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 1, 'Untuk mengetahui waktu-waktu dan haluaran berkemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0040'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 2, 'Untuk mengefektifkan asupan cairan');

SET FOREIGN_KEY_CHECKS = 1;
