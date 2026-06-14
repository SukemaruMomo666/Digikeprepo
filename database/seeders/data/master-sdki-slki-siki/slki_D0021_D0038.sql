SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- SLKI DATA MASTER — D.0021 s/d D.0038
-- Generated: 2026-06-13
-- Mencakup: luaran_slki + slki_kriteria_hasil
-- ============================================================

-- ============================================================
-- 1. LUARAN SLKI (master)
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.03033', 'Tingkat Nyeri', 'Fisiologis', 'Nutrisi dan Cairan', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional, dengan onset mendadak atau lambat dan berintensitas ringan hingga berat dan konstan.'),
('L.03020', 'Keseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Ekuilibrium antara volume cairan di ruang intraseluler dan ekstraseluler tubuh.'),
('L.03028', 'Status Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Kondisi volume cairan intravaskuler, interstisiel, dan intraseluler yang adekuat.'),
('L.14125', 'Integritas Kulit dan Jaringan', 'Fisiologis', 'Nutrisi dan Cairan', 'Keutuhan kulit (dermis dan atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan atau ligamen).'),
('L.03030', 'Status Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Keadekuatan asupan nutrisi untuk memenuhi kebutuhan metabolisme.'),
('L.03022', 'Kestabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Kadar glukosa darah berada pada rentang normal.'),
('L.03029', 'Status Menyusui', 'Fisiologis', 'Nutrisi dan Cairan', 'Kemampuan ibu untuk memberikan ASI secara langsung kepada bayi.'),
('L.03018', 'Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Berat tubuh sesuai dengan usia dan jenis kelamin.'),
('L.03023', 'Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktivitas peristaltik saluran gastrointestinal yang efektif.'),
('L.03021', 'Keseimbangan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Kadar serum elektrolit berada dalam rentang normal.');

-- ============================================================
-- 2. KRITERIA HASIL (child)
-- ============================================================

-- D.0021 → L.03033 Tingkat Nyeri
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 1, 'Nyeri abdomen', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 2, 'Kram abdomen', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 3, 'Mual', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 4, 'Muntah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 5, 'Regurgitasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 6, 'Distensi abdomen', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 7, 'Diare', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 8, 'Suara peristaltik', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 9, 'Pengosongan lambung', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'), 10, 'Flatus', 'Membaik');

-- D.0022 → L.03020 Keseimbangan Cairan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 1, 'Asupan cairan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 2, 'Output urine', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 3, 'Membran mukosa lembab', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 4, 'Asupan makanan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 5, 'Edema', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 6, 'Dehidrasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 7, 'Asites', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 8, 'Konfusi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 9, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 10, 'Denyut nadi radial', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 11, 'Mata cekung', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 12, 'Turgor kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'), 13, 'Berat badan', 'Membaik');

-- D.0023 → L.03028 Status Cairan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 1, 'Kekuatan nadi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 2, 'Turgor kulit', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 3, 'Output urine', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 4, 'Pengisian vena', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 5, 'Ortopnea', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 6, 'Dispnea', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 7, 'Edema perifer', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 8, 'Perasaan lemah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 9, 'Frekuensi nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 10, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 11, 'Membran mukosa', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'), 12, 'Kadar hematokrit', 'Membaik');

-- D.0024 → L.14125 Integritas Kulit dan Jaringan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 1, 'Elastisitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 2, 'Hidrasi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 3, 'Perfusi jaringan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 4, 'Kerusakan jaringan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 5, 'Kerusakan lapisan kulit', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 6, 'Nyeri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 7, 'Perdarahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 8, 'Kemerahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 9, 'Hematoma', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 10, 'Pigmentasi abnormal', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 11, 'Jaringan parut', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 12, 'Nekrosis', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 13, 'Abrasi kornea', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 14, 'Suhu kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 15, 'Sensasi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 16, 'Tekstur', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), 17, 'Pertumbuhan rambut', 'Membaik');

-- D.0026 → L.03030 Status Nutrisi
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 1, 'Porsi makan yang dihabiskan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 2, 'Sikap terhadap makanan/minuman sesuai dengan tujuan kesehatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 3, 'Perasaan cepat kenyang', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 4, 'Berat badan', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 5, 'Indeks Massa Tubuh (IMT)', 'Membaik');

-- D.0027 → L.03022 Kestabilan Kadar Glukosa Darah
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 1, 'Mengantuk', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 2, 'Pusing', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 3, 'Lelah/lesu', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 4, 'Rasa lapar', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 5, 'Gemetar', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 6, 'Berkeringat', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 7, 'Rasa haus', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 8, 'Perilaku aneh', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 9, 'Kesulitan bicara', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 10, 'Kadar glukosa dalam darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 11, 'Kadar glukosa dalam urine', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'), 12, 'Palpitasi', 'Menurun');

-- D.0028 & D.0029 → L.03029 Status Menyusui
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 1, 'Perlekatan bayi pada payudara ibu', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 2, 'Kemampuan ibu memposisikan bayi dengan benar', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 3, 'Tetesan/pancaran ASI', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 4, 'Suplai ASI adekuat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 5, 'Kepercayaan diri ibu', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 6, 'Intake bayi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 7, 'Hisapan bayi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 8, 'Lecet pada puting', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 9, 'Bayi rewel', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'), 10, 'Frekuensi miksi bayi', 'Membaik');

-- D.0030 & D.0031 → L.03018 Berat Badan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), 1, 'Berat badan', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), 2, 'Tebal lipatan kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), 3, 'Indeks massa tubuh (IMT)', 'Membaik');

-- D.0033 → L.03023 Motilitas Gastrointestinal
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'), 1, 'Nyeri abdomen', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'), 2, 'Penggunaan otot bantu napas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'), 3, 'Suara peristaltik', 'Membaik');

-- D.0037 → L.03021 Keseimbangan Elektrolit
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'), 1, 'Serum natrium', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'), 2, 'Serum kalium', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'), 3, 'Serum klorida', 'Membaik');

SET FOREIGN_KEY_CHECKS = 1;
