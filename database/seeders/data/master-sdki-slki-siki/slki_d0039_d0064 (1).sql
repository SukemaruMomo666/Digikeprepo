-- ============================================
-- DATA MASTER SLKI - DigiKep
-- Sumber: PDF Buku PPNI (sdki-slki-siki__2_-pages-3.pdf)
-- Range diagnosa: D.0039 – D.0064
-- Tanggal generate: 13 Juni 2026
--
-- PENTING:
-- Luaran berikut SUDAH ADA di DB (dari data_master_3s_digikep.sql),
-- TIDAK di-insert ulang di file ini:
--   L.03032 Tingkat Syok
--   L.04033 Eliminasi Fekal
--   L.04034 Eliminasi Urine
--   L.04036 Kontinensia Urine
--
-- Luaran BARU yang di-insert di file ini:
--   L.05042 Mobilitas Fisik
--   L.05043 Organisasi Perilaku Bayi
--   L.05045 Pola Tidur
--   L.05046 Tingkat Keletihan
--   L.05047 Toleransi Aktivitas
--   L.06052 Status Menelan
--   L.06053 Status Neurologis
--   L.06054 Tingkat Konfusi
--   L.09079 Memori
--
-- Catatan arah indikator: diinferensikan dari konteks klinis.
-- Perlu validasi manual dengan buku SLKI cetak.
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- BATCH INSERT TABEL luaran_slki
-- ============================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.05042', 'Mobilitas Fisik', 'Fisiologis', 'Aktivitas dan Istirahat', 'Kemampuan untuk gerakan fisik dari satu atau lebih ekstremitas secara mandiri.'),
('L.05043', 'Organisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Kemampuan integrasi respon fisiologis dan neurobehaviour bayi terhadap lingkungan.'),
('L.05045', 'Pola Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Keadekuatan kualitas dan kuantitas tidur.'),
('L.05046', 'Tingkat Keletihan', 'Fisiologis', 'Aktivitas dan Istirahat', 'Kapasitas kerja fisik dan mental yang dapat dipulihkan dengan istirahat.'),
('L.05047', 'Toleransi Aktivitas', 'Fisiologis', 'Aktivitas dan Istirahat', 'Respon biologis terhadap aktivitas yang membutuhkan tenaga.'),
('L.06052', 'Status Menelan', 'Fisiologis', 'Neurosensori', 'Kemampuan menelan yang aman untuk mengantarkan cairan dan/atau padatan dari mulut ke lambung.'),
('L.06053', 'Status Neurologis', 'Fisiologis', 'Neurosensori', 'Kemampuan sistem saraf perifer dan pusat untuk menerima, mengolah, dan merespon stimulus internal dan eksternal.'),
('L.06054', 'Tingkat Konfusi', 'Fisiologis', 'Neurosensori', 'Tingkat gangguan kesadaran, perhatian, kognitif dan persepsi.'),
('L.09079', 'Memori', 'Fisiologis', 'Neurosensori', 'Kemampuan mengingat beberapa informasi atau perilaku.');

-- ============================================
-- L.05042 Mobilitas Fisik
-- Ekspektasi: Meningkat
-- Sumber: D.0054 Gangguan Mobilitas Fisik
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 1, 'Pergerakan ekstremitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 2, 'Kekuatan otot', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 3, 'Rentang gerak (ROM)', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 4, 'Kaku sendi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 5, 'Gerakan tidak terkoordinasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05042'), 6, 'Kelemahan fisik', 'Menurun');

-- ============================================
-- L.05043 Organisasi Perilaku Bayi
-- Ekspektasi: Meningkat
-- Sumber: D.0053 Disorganisasi Perilaku Bayi, D.0059 Risiko Disorganisasi Perilaku Bayi
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 1, 'Gerakan pada ekstremitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 2, 'Kemampuan jari-jari menggenggam', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 3, 'Gerakan terkoordinasi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 4, 'Respon normal terhadap stimulus sensorik', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 5, 'Kemampuan menyusu', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 6, 'Warna kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 7, 'Menangis', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 8, 'Mampu berespons kejut', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 9, 'Irritabilitas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 10, 'Refleks', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 11, 'Tonus motorik', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 12, 'Gelisah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 13, 'Tremor', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 14, 'Tersentak', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 15, 'Aritmia', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 16, 'Bradikardia', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'), 17, 'Takikardia', 'Menurun');

-- ============================================
-- L.05045 Pola Tidur
-- Ekspektasi: Membaik
-- Sumber: D.0055 Gangguan Pola Tidur, D.0058 Kesiapan Peningkatan Tidur
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 1, 'Kemampuan beraktivitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 2, 'Keluhan sulit tidur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 3, 'Keluhan sering terjaga', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 4, 'Keluhan tidak puas tidur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 5, 'Keluhan pola tidur berubah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'), 6, 'Keluhan istirahat tidak cukup', 'Menurun');

-- ============================================
-- L.05046 Tingkat Keletihan
-- Ekspektasi: Menurun
-- Sumber: D.0057 Keletihan
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05046'), 1, 'Kemampuan melakukan aktivitas rutin', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05046'), 2, 'Verbalisasi lelah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05046'), 3, 'Lesu', 'Menurun');

-- ============================================
-- L.05047 Toleransi Aktivitas
-- Ekspektasi: Meningkat
-- Sumber: D.0056 Intoleransi Aktivitas, D.0060 Risiko Intoleransi Aktivitas
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'), 1, 'Kemudahan melakukan aktivitas sehari-hari', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'), 2, 'Keluhan lelah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'), 3, 'Dispnea saat aktivitas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'), 4, 'Dispnea setelah aktivitas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'), 5, 'Frekuensi nadi', 'Membaik');

-- ============================================
-- L.06052 Status Menelan
-- Ekspektasi: Membaik
-- Sumber: D.0063 Gangguan Menelan
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'), 1, 'Mempertahankan makanan di mulut', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'), 2, 'Reflek menelan', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'), 3, 'Kemampuan mengosongkan mulut', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'), 4, 'Frekuensi tersedak', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'), 5, 'Batuk', 'Menurun');

-- ============================================
-- L.06053 Status Neurologis
-- Ekspektasi: Membaik
-- Sumber: D.0061 Disrefleksia Otonom
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'), 1, 'Tingkat kesadaran', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'), 2, 'Reaksi pupil', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'), 3, 'Sakit kepala', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'), 4, 'Tekanan darah sistolik', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'), 5, 'Frekuensi nadi', 'Membaik');

-- ============================================
-- L.06054 Tingkat Konfusi
-- Ekspektasi: Menurun
-- Sumber: D.0064 Konfusi Akut
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 1, 'Fungsi kognitif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 2, 'Tingkat kesadaran', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 3, 'Aktivitas psikomotorik', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 4, 'Motivasi memulai/menyelesaikan perilaku terarah', 'Meningkat');

-- ============================================
-- L.09079 Memori
-- Ekspektasi: Meningkat
-- Sumber: D.0062 Gangguan Memori
-- ============================================
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'), 1, 'Verbalisasi kemampuan mempelajari hal baru', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'), 2, 'Verbalisasi kemampuan mengingat informasi faktual', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'), 3, 'Verbalisasi kemampuan mengingat perilaku tertentu yang pernah dilakukan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'), 4, 'Verbalisasi kemampuan mengingat peristiwa', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'), 5, 'Verbalisasi pengalaman lupa', 'Menurun');

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: SLKI untuk range D.0039 - D.0064
-- Luaran BARU yang di-insert: 9 luaran
--   L.05042 Mobilitas Fisik              → 6 kriteria
--   L.05043 Organisasi Perilaku Bayi     → 17 kriteria
--   L.05045 Pola Tidur                   → 6 kriteria
--   L.05046 Tingkat Keletihan            → 3 kriteria
--   L.05047 Toleransi Aktivitas          → 5 kriteria
--   L.06052 Status Menelan               → 5 kriteria
--   L.06053 Status Neurologis            → 5 kriteria
--   L.06054 Tingkat Konfusi              → 4 kriteria
--   L.09079 Memori                       → 5 kriteria
-- Total kriteria hasil baru: 56 rows
--
-- Luaran SUDAH ADA di DB (SKIP):
--   L.03032 Tingkat Syok      → D.0039
--   L.04033 Eliminasi Fekal   → D.0041, D.0049, D.0052
--   L.04034 Eliminasi Urine   → D.0040, D.0048, D.0050
--   L.04036 Kontinensia Urine → D.0042, D.0043, D.0044,
--                               D.0045, D.0046, D.0047, D.0051
-- ============================================
