-- ============================================
-- DATA MASTER BATCH 13: D.0131 – D.0140
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Markdown (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran) - Environment/Physiological
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.14126', 'Status Fisik Lingkungan', 'Fisiologis', 'Keamanan dan Proteksi', 'Kondisi lingkungan fisik yang aman dan mendukung kesehatan.'),
('L.14127', 'Potensi Injuri', 'Fisiologis', 'Keamanan dan Proteksi', 'Perilaku aman dalam aktivitas dan interaksi dengan lingkungan.'),
('L.14128', 'Keamanan Lingkungan', 'Fisiologis', 'Keamanan dan Proteksi', 'Kontrol lingkungan yang mencegah injuri dan risiko kesehatan.'),
('L.14129', 'Pengendalian Risiko Infeksi', 'Fisiologis', 'Keamanan dan Proteksi', 'Perilaku pencegahan transmisi agen infeksi.'),
('L.14130', 'Status Nutrisi', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Asupan nutrisi yang cukup untuk memenuhi kebutuhan metabolik.'),
('L.14131', 'Status Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Kemampuan mengendalikan dan mengekspresikan urin.'),
('L.14132', 'Status Eliminasi Alvi', 'Fisiologis', 'Eliminasi', 'Kemampuan mengendalikan dan mengekspresikan feses.'),
('L.14133', 'Pola Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Pola istirahat dan tidur yang cukup dan berkualitas.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.14126 Status Fisik Lingkungan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14126', 1, 'Kebersihan lingkungan', 'Meningkat'),
('L.14126', 2, 'Ketersediaan fasilitas kesehatan', 'Meningkat');

-- L.14127 Potensi Injuri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14127', 1, 'Kemampuan mengidentifikasi risiko', 'Meningkat'),
('L.14127', 2, 'Perilaku aman', 'Meningkat');

-- L.14128 Keamanan Lingkungan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14128', 1, 'Kontrol hazard lingkungan', 'Meningkat'),
('L.14128', 2, 'Pencegahan cedera', 'Meningkat');

-- L.14129 Pengendalian Risiko Infeksi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14129', 1, 'Perilaku cuci tangan', 'Meningkat'),
('L.14129', 2, 'Penggunaan APD', 'Meningkat');

-- L.14130 Status Nutrisi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14130', 1, 'Asupan nutrisi', 'Meningkat'),
('L.14130', 2, 'Berat badan ideal', 'Meningkat');

-- L.14131 Status Eliminasi Urin
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14131', 1, 'Kemampuan berkemih', 'Meningkat'),
('L.14131', 2, 'Kontrol kandung kemih', 'Meningkat');

-- L.14132 Status Eliminasi Alvi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.14132', 1, 'Kemampuan defekasi', 'Meningkat'),
('L.14132', 2, 'Kontrol defekasi', 'Meningkat');

-- L.14133 Pola Tidur
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.14133', 1, 'Durasi tidur', 'Membaik'),
('L.14133', 2, 'Kualitas tidur', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.14489', 'Manajemen Lingkungan Keamanan', 'Lingkungan', 'Manajemen Lingkungan', 'Utama', 'Mengidentifikasi dan mengelola lingkungan untuk pencegahan injuri.'),
('I.14516', 'Pencegahan Infeksi', 'Fisiologis', 'Keamanan dan Proteksi', 'Utama', 'Mengurangi transmisi agen infeksi.'),
('I.03119', 'Manajemen Nutrisi', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Utama', 'Mengidentifikasi dan mengelola asupan nutrisi yang seimbang.'),
('I.05169', 'Manajemen Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola eliminasi urin.'),
('I.05166', 'Manajemen Eliminasi Alvi', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola eliminasi feses.'),
('I.04148', 'Promosi Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Utama', 'Meningkatkan pola tidur yang berkualitas.');


-- ============================================
-- 4. SIKI TINDAKAN (minimal)
-- ============================================

-- I.14489 Manajemen Lingkungan Keamanan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Observasi', 1, 'Identifikasi risiko lingkungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Terapeutik', 1, 'Eliminasi hazard lingkungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Edukasi', 1, 'Ajarkan pencegahan cedera');

-- I.14516 Pencegahan Infeksi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.14516'), 'Observasi', 1, 'Monitor tanda dan gejala infeksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.14516'), 'Terapeutik', 1, 'Lakukan cuci tangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.14516'), 'Edukasi', 1, 'Ajarkan pencegahan infeksi');

-- I.03119 Manajemen Nutrisi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi status nutrisi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Identifikasi alergi makanan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Sediakan makanan sesuai diet'),
((SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Edukasi', 1, 'Ajarkan pentingnya nutrisi seimbang');

-- I.05169 Manajemen Eliminasi Urin
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05169'), 'Observasi', 1, 'Monitor pola eliminasi urin'),
((SELECT id FROM siki WHERE kode_intervensi='I.05169'), 'Terapeutik', 1, 'Fasilitasi kemudahan berkemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.05169'), 'Edukasi', 1, 'Ajarkan perawatan perineum');

-- I.05166 Manajemen Eliminasi Alvi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05166'), 'Observasi', 1, 'Monitor pola eliminasi alvi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05166'), 'Terapeutik', 1, 'Fasilitasi kemudahan defekasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05166'), 'Edukasi', 1, 'Ajarkan pencegahan konstipasi');

-- I.04148 Promosi Tidur
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Observasi', 1, 'Monitor pola tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 1, 'Ciptakan lingkungan tidur yang nyaman'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Edukasi', 1, 'Ajarkan cara meningkatkan kualitas tidur');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0131', 'Risiko Paparan Patogen', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko terpapar agen biologis yang dapat menyebabkan infeksi.'),
('D.0132', 'Risiko Aspirasi', 'Fisiologis', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko masuknya benda asing ke jalan napas.'),
('D.0133', 'Risiko Cedera', 'Fisiologis', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami cedera fisik.'),
('D.0134', 'Risiko Jatuh', 'Fisiologis', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami jatuh dari ketinggian.'),
('D.0135', 'Risiko Keracunan', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko terpapar zat beracun.'),
('D.0136', 'Risiko Luka Bakar', 'Lingkungan', 'Keamanan dan Proteksi', 'Risiko', 'Berisiko mengalami luka bakar.'),
('D.0137', 'Imobilitas Fisik', 'Fisiologis', 'Aktivitas dan Istirahat', 'Aktual', 'Keterbatasan dalam pergerakan fisik secara sukarela.'),
('D.0138', 'Pola Tidur Terganggu', 'Fisiologis', 'Aktivitas dan Istirahat', 'Aktual', 'Gangguan kualitas atau durasi tidur.'),
('D.0139', 'Gangguan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Aktual', 'Gangguan dalam proses eliminasi urin.'),
('D.0140', 'Gangguan Eliminasi Alvi', 'Fisiologis', 'Eliminasi', 'Aktual', 'Gangguan dalam proses eliminasi feses.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal per diagnosa)
-- ============================================

-- D.0132 Risiko Aspirasi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0132'), 'Fisiologis', 1, 'Penurunan kesadaran'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0132'), 'Fisiologis', 2, 'Gangguan reflek menelan');

-- D.0137 Imobilitas Fisik
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0137'), 'Fisiologis', 1, 'Kelemahan muskuloskeletal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0137'), 'Fisiologis', 2, 'Gangguan neurologis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0137'), 'Fisiologis', 3, 'Proses penyakit');

-- D.0138 Pola Tidur Terganggu
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0138'), 'Psikologis', 1, 'Kecemasan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0138'), 'Fisiologis', 1, 'Nyeri'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0138'), 'Situasional', 1, 'Perubahan lingkungan');

-- D.0139 Gangguan Eliminasi Urin
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0139'), 'Fisiologis', 1, 'Gangguan sistem urinaria'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0139'), 'Fisiologis', 2, 'Gangguan neurologis');

-- D.0140 Gangguan Eliminasi Alvi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0140'), 'Fisiologis', 1, 'Gangguan sistem pencernaan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0140'), 'Fisiologis', 2, 'Gangguan neurologis');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0131'), (SELECT id FROM slki WHERE kode_luaran='L.14128')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0132'), (SELECT id FROM slki WHERE kode_luaran='L.14127')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0133'), (SELECT id FROM slki WHERE kode_luaran='L.14127')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0134'), (SELECT id FROM slki WHERE kode_luaran='L.14127')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0135'), (SELECT id FROM slki WHERE kode_luaran='L.14128')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0136'), (SELECT id FROM slki WHERE kode_luaran='L.14128')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0137'), (SELECT id FROM slki WHERE kode_luaran='L.14127')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0138'), (SELECT id FROM slki WHERE kode_luaran='L.14133')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0139'), (SELECT id FROM slki WHERE kode_luaran='L.14131')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0140'), (SELECT id FROM slki WHERE kode_luaran='L.14132'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0131'), (SELECT id FROM siki WHERE kode_intervensi='I.14516'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0132'), (SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0133'), (SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0134'), (SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0135'), (SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0136'), (SELECT id FROM siki WHERE kode_intervensi='I.14489'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0137'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0138'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0139'), (SELECT id FROM siki WHERE kode_intervensi='I.05169'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0140'), (SELECT id FROM siki WHERE kode_intervensi='I.05166'), 'Utama');

SET FOREIGN_KEY_CHECKS = 1;
