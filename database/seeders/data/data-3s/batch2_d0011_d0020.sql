-- ============================================
-- DATA MASTER BATCH 2: D.0011 – D.0020
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.02017', 'Tingkat Perdarahan', 'Fisiologis', 'Sirkulasi', 'Kehilangan darah baik internal maupun eksternal.'),
('L.02010', 'Perfusi Gastrointestinal', 'Fisiologis', 'Sirkulasi', 'Keadekuatan aliran darah ke gastrointestinal untuk menunjang fungsi jaringan.'),
('L.02012', 'Perfusi Miokard', 'Fisiologis', 'Sirkulasi', 'Keadekuatan aliran darah pada arteri koroner untuk menunjang fungsi miokard.'),
('L.02013', 'Perfusi Renal', 'Fisiologis', 'Sirkulasi', 'Keadekuatan aliran darah pada pembuluh darah ginjal untuk menunjang fungsi ginjal.'),
('L.02014', 'Perfusi Serebral', 'Fisiologis', 'Sirkulasi', 'Keadekuatan aliran darah serebral untuk menunjang fungsi otak.'),
('L.03018', 'Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Keadekuatan berat badan sesuai usia dan jenis kelamin.'),
('L.03030', 'Status Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Keadekuatan asupan nutrisi untuk memenuhi kebutuhan metabolisme.'),
('L.04033', 'Eliminasi Fekal', 'Fisiologis', 'Eliminasi');

-- Update definisi L.04033 (tidak bisa inline karena kolom NOT NULL)
UPDATE slki SET definisi = 'Kemampuan saluran gastrointestinal untuk membentuk dan mengeluarkan feses secara teratur.' WHERE kode_luaran = 'L.04033';


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.02008 Curah Jantung (sudah ada di batch 1, tambah KH baru jika belum)
INSERT IGNORE INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02008', 4, 'Ejection fraction (EF)', 'Meningkat'),
('L.02008', 5, 'Cardiac index (CI)', 'Meningkat');

-- L.02017 Tingkat Perdarahan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02017', 1, 'Hemoglobin', 'Membaik'),
('L.02017', 2, 'Tekanan darah', 'Membaik'),
('L.02017', 3, 'Suhu tubuh', 'Membaik');

-- L.02010 Perfusi Gastrointestinal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02010', 1, 'Mual', 'Menurun'),
('L.02010', 2, 'Muntah', 'Menurun'),
('L.02010', 3, 'Nyeri abdomen', 'Menurun'),
('L.02010', 4, 'Asites', 'Menurun'),
('L.02010', 5, 'Konstipasi', 'Menurun');

-- L.02012 Perfusi Miokard
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02012', 1, 'Tekanan darah', 'Membaik');

-- L.02013 Perfusi Renal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02013', 1, 'Jumlah urine', 'Membaik'),
('L.02013', 2, 'Tekanan arteri rata-rata', 'Membaik'),
('L.02013', 3, 'Kadar urea nitrogen darah', 'Membaik');

-- L.02014 Perfusi Serebral
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02014', 1, 'Tingkat kesadaran', 'Meningkat'),
('L.02014', 2, 'Sakit kepala', 'Menurun'),
('L.02014', 3, 'Gelisah', 'Menurun'),
('L.02014', 4, 'Tekanan intrakranial', 'Membaik'),
('L.02014', 5, 'Tekanan arteri rata-rata', 'Membaik');

-- L.03018 Berat Badan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03018', 1, 'Indeks massa tubuh (IMT)', 'Membaik');

-- L.03030 Status Nutrisi (sudah ada di batch 1, tambah KH baru)
INSERT IGNORE INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03030', 14, 'Pengetahuan tentang pilihan minuman yang sehat', 'Meningkat');

-- L.04033 Eliminasi Fekal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.04033', 1, 'Kontrol pengeluaran feses', 'Meningkat'),
('L.04033', 2, 'Konsistensi feses', 'Membaik'),
('L.04033', 3, 'Frekuensi defekasi', 'Membaik'),
('L.04033', 4, 'Peristaltik usus', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.02067', 'Pencegahan Perdarahan', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan menurunkan risiko atau komplikasi stimulus yang menyebabkan perdarahan atau risiko perdarahan.'),
('I.01004', 'Manajemen Perdarahan', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengelola kehilangan darah saat terjadi perdarahan.'),
('I.02068', 'Pencegahan Syok', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan menurunkan risiko terjadinya ketidakmampuan tubuh menyediakan oksigen dan nutrien untuk mencukupi kebutuhan jaringan.'),
('I.06194', 'Manajemen Peningkatan Tekanan Intrakranial', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi dan mengelola peningkatan tekanan dalam rongga kranial.'),
('I.03119', 'Manajemen Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Memfasilitasi pencapaian dan pemeliharaan berat badan optimal.'),
('I.03119a', 'Konseling Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Pendukung', 'Memberikan panduan diet dan informasi nutrisi kepada individu yang membutuhkan modifikasi diet.'),
('I.03119b', 'Manajemen Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola asupan nutrisi yang seimbang.'),
('I.03101', 'Manajemen Diare', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola diare dan dampaknya.');

-- Perbaiki kode konseling nutrisi dan manajemen nutrisi (pakai kode standar)
UPDATE siki SET kode_intervensi = 'I.03093' WHERE kode_intervensi = 'I.03119a';
UPDATE siki SET kode_intervensi = 'I.03119' WHERE kode_intervensi = 'I.03119b';
-- Hapus duplikat manajemen berat badan jika terjadi
-- I.03119 = Manajemen Nutrisi (standar SIKI)
-- I.03093 = Konseling Nutrisi (standar SIKI)


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.02067 Pencegahan Perdarahan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Observasi', 1, 'Monitor tanda dan gejala perdarahan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Observasi', 2, 'Monitor hematokrit/hemoglobin sebelum dan setelah kehilangan darah'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 1, 'Pertahankan bed rest selama perdarahan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 2, 'Batasi tindakan invasif, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 3, 'Hindari pengukuran suhu rektal'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Edukasi', 1, 'Jelaskan tanda dan gejala perdarahan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Edukasi', 2, 'Anjurkan meningkatkan asupan cairan untuk menghindari konstipasi');

-- I.01004 Manajemen Perdarahan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 1, 'Identifikasi penyebab perdarahan'),
((SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 2, 'Periksa adanya darah pada muntah, sputum, feses, urine, pengeluaran NGT dan drainase luka, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 3, 'Periksa ukuran dan karakteristik hematoma, jika ada'),
((SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 4, 'Monitor terjadinya perdarahan (sifat dan jumlah)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 5, 'Monitor nilai hemoglobin dan hematokrit sebelum dan setelah kehilangan darah');

-- I.02068 Pencegahan Syok
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 1, 'Monitor status kardiopulmonal (frekuensi dan kekuatan nadi, frekuensi napas, TD, MAP)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 2, 'Monitor status oksigenasi (oksimetri nadi, AGD)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 3, 'Monitor status cairan (masukan dan haluaran, turgor kulit, CRT)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 4, 'Monitor tingkat kesadaran dan respons pupil'),
((SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 5, 'Monitor reaksi alergi');

-- I.06194 Manajemen Peningkatan TIK
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 1, 'Identifikasi penyebab peningkatan TIK (mis. lesi, gangguan metabolisme, edema serebral)'),
((SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 2, 'Monitor tanda/gejala peningkatan TIK (mis. tekanan darah meningkat, tekanan nadi melebar, bradikardia, pola napas iregular, kesadaran menurun)'),
((SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 3, 'Monitor MAP (Mean Arterial Pressure)'),
((SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 4, 'Monitor CVP (Central Venous Pressure)');

-- I.02075 Perawatan Jantung (sudah ada batch 1, tambah tindakan untuk D.0011/D.0014)
-- Tindakan sudah cukup, tidak perlu tambah

-- I.03119 Manajemen Nutrisi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi status nutrisi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Identifikasi alergi dan intoleransi makanan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 3, 'Identifikasi makanan yang disukai'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 4, 'Identifikasi kebutuhan kalori dan jenis nutrien'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 2, 'Sajikan makanan secara menarik dan suhu yang sesuai');

-- I.03093 Konseling Nutrisi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 1, 'Identifikasi kebiasaan makan dan perilaku makan yang akan diubah'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Observasi', 2, 'Identifikasi kemajuan modifikasi diet secara reguler'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Terapeutik', 1, 'Hitung berat badan ideal pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Terapeutik', 2, 'Hitung persentase lemak dan otot pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Edukasi', 1, 'Jelaskan hubungan antara asupan makanan, aktivitas fisik, penambahan dan penurunan berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Edukasi', 2, 'Jelaskan faktor risiko berat badan lebih dan berat badan kurang'),
((SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Edukasi', 3, 'Anjurkan mencatat berat badan setiap minggu, jika perlu');

-- I.03101 Manajemen Diare
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Observasi', 1, 'Identifikasi penyebab diare (mis. inflamasi gastrointestinal, iritasi, infeksi, malabsorpsi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Observasi', 2, 'Monitor warna, volume, frekuensi dan konsistensi tinja'),
((SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Observasi', 3, 'Monitor tanda dan gejala hipovolemia'),
((SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 1, 'Berikan asupan cairan oral'),
((SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antimotilitas, jika perlu');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0011', 'Risiko Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami ketidakmampuan jantung memompa darah untuk memenuhi kebutuhan metabolisme tubuh.'),
('D.0012', 'Risiko Perdarahan', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami kehilangan darah baik internal (terjadi dalam tubuh) maupun eksternal (terjadi di luar tubuh).'),
('D.0013', 'Risiko Perfusi Gastrointestinal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi gastrointestinal.'),
('D.0014', 'Risiko Perfusi Miokard Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi arteri koroner yang dapat mengganggu metabolisme miokard.'),
('D.0015', 'Risiko Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah pada level kapiler.'),
('D.0016', 'Risiko Perfusi Renal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah ke ginjal.'),
('D.0017', 'Risiko Perfusi Serebral Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah ke otak.'),
('D.0018', 'Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin.'),
('D.0019', 'Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme.'),
('D.0020', 'Diare', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran feses yang sering, lunak, dan tidak berbentuk.');


-- ============================================
-- 6. SDKI FAKTOR RISIKO & PENYEBAB
-- ============================================

-- D.0011 Risiko Penurunan Curah Jantung
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 1, 'Perubahan irama jantung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 2, 'Perubahan frekuensi jantung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 3, 'Perubahan kontraktilitas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 4, 'Defek septal ventrikel'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 5, 'Aritmia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 6, 'Penyakit Paru Obstruktif Kronis (PPOK)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), 7, 'Gangguan metabolik');

-- D.0012 Risiko Perdarahan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 1, 'Aneurisma'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 2, 'Gangguan gastrointestinal (mis. ulkus lambung, polip, varises)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 3, 'Gangguan fungsi hati (mis. sirosis, hepatitis)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 4, 'Komplikasi kehamilan (mis. ketuban pecah sebelum waktunya, plasenta previa)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 5, 'Komplikasi pasca partum (mis. atoni uterus, retensi plasenta)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 6, 'Gangguan koagulasi (mis. trombositopenia)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 7, 'Efek agen farmakologis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 8, 'Tindakan pembedahan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 9, 'Kanker'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), 10, 'Trauma');

-- D.0013 Risiko Perfusi Gastrointestinal Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 1, 'Perdarahan gastrointestinal akut'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 2, 'Trauma abdomen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 3, 'Sindroma kompartemen abdomen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 4, 'Aneurisma aorta abdomen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 5, 'Varises gastroesofagus'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 6, 'Penurunan kinerja ventrikel kiri'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), 7, 'Koagulopati (mis. anemia sel sabit, koagulopati intravaskuler diseminata)');

-- D.0014 Risiko Perfusi Miokard Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 1, 'Hipertensi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 2, 'Hiperlipidemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 3, 'Hiperglikemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 4, 'Hipoksemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 5, 'Hipoksia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 6, 'Kekurangan volume cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 7, 'Pembedahan jantung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), 8, 'Spasme arteri koroner');

-- D.0015 Risiko Perfusi Perifer Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0015'), 1, 'Hiperglikemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0015'), 2, 'Gaya hidup monoton'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0015'), 3, 'Hipertensi');

-- D.0016 Risiko Perfusi Renal Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 1, 'Kekurangan volume cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 2, 'Embolisme vaskuler'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 3, 'Vaskulitis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 4, 'Hipertensi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 5, 'Disfungsi ginjal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 6, 'Hiperglikemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), 7, 'Keganasan');

-- D.0017 Risiko Perfusi Serebral Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 1, 'Keabnormalan masa protrombin dan/atau masa tromboplastin parsial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 2, 'Penurunan kinerja ventrikel kiri'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 3, 'Aterosklerosis aorta'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 4, 'Fibrilasi atrium'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 5, 'Tumor otak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 6, 'Stenosis karotis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), 7, 'Miksoma atrium');

-- D.0018 Berat Badan Lebih
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 2, 'Kelebihan konsumsi gula'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 4, 'Gangguan persepsi makan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 5, 'Penggunaan energi kurang dari asupan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 6, 'Sering mengemil'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 7, 'Sering memakan makanan berminyak/berlemak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 8, 'Faktor keturunan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 9, 'Asupan kalsium rendah'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), 'Umum', 10, 'Berat badan bertambah cepat');

-- D.0019 Defisit Nutrisi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), 'Umum', 1, 'Kurangnya asupan makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), 'Umum', 2, 'Ketidakmampuan menelan makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), 'Umum', 3, 'Ketidakmampuan mencerna makanan');

-- D.0020 Diare (penyebab tidak tercantum lengkap di Excel, insert minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 1, 'Inflamasi gastrointestinal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 2, 'Iritasi gastrointestinal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 3, 'Proses infeksi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 4, 'Malabsorpsi');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), (SELECT id FROM slki WHERE kode_luaran='L.02008')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), (SELECT id FROM slki WHERE kode_luaran='L.02017')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM slki WHERE kode_luaran='L.02010')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), (SELECT id FROM slki WHERE kode_luaran='L.02012')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0015'), (SELECT id FROM slki WHERE kode_luaran='L.02011')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM slki WHERE kode_luaran='L.02013')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM slki WHERE kode_luaran='L.02014')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM slki WHERE kode_luaran='L.03018')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM slki WHERE kode_luaran='L.03030')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM slki WHERE kode_luaran='L.03030')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), (SELECT id FROM slki WHERE kode_luaran='L.04033'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0011'), (SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), (SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0014'), (SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0015'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM siki WHERE kode_intervensi='I.03093'), 'Pendukung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0020'), (SELECT id FROM siki WHERE kode_intervensi='I.03101'), 'Utama');


-- ============================================
-- 9. RASIONAL
-- ============================================

-- D.0012 ↔ I.02067
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), (SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Observasi', 1, 'Perdarahan merupakan ekstravasasi atau keluarnya darah dari tempatnya semula, penting untuk segera diidentifikasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0012'), (SELECT id FROM siki WHERE kode_intervensi='I.02067'), 'Observasi', 2, 'Hematokrit adalah persentase volume sel darah merah dalam darah, digunakan untuk memantau kehilangan darah');

-- D.0013 ↔ I.01004
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 1, 'Untuk mengetahui sumber atau masalah dari perdarahan yang dialami'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 2, 'Untuk mengetahui perdarahan yang dialami klien dapat berasal dari organ mana'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 3, 'Untuk mengetahui ukuran dan karakteristik di area perdarahan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 4, 'Untuk mengetahui sifat dan jumlah dari perdarahan yang dialami'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM siki WHERE kode_intervensi='I.01004'), 'Observasi', 5, 'Untuk mengetahui perbandingan nilai hemoglobin dan hematokrit sebelum dan setelah kehilangan darah');

-- D.0016 ↔ I.02068
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 1, 'Untuk mengetahui fungsi dan status organ vital pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 2, 'Untuk mengetahui adanya perubahan saturasi oksigen pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 3, 'Untuk mengetahui kebutuhan cairan tubuh pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM siki WHERE kode_intervensi='I.02068'), 'Observasi', 4, 'Untuk mengetahui status dan respons tubuh pasien');

-- D.0017 ↔ I.06194
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 1, 'Untuk mengetahui penyebab peningkatan TIK'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 2, 'Untuk mengetahui potensi peningkatan TIK secara dini'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 3, 'MAP menggambarkan perfusi rata-rata dari peredaran darah sistemik untuk menjamin perfusi otak, arteri koroner, dan ginjal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Observasi', 4, 'CVP adalah pengukuran tekanan di atrium kanan atau vena kava untuk menilai volume sirkulasi');

-- D.0019 ↔ I.03119
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Untuk dapat menghindari alergi yang disebabkan oleh makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Untuk meningkatkan nafsu makan klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 3, 'Untuk mengetahui jumlah kalori dan nutrisi yang dibutuhkan klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Untuk mempertahankan pola makan yang benar untuk klien');

SET FOREIGN_KEY_CHECKS = 1;
