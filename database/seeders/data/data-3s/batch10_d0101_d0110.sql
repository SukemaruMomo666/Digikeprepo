-- ============================================
-- DATA MASTER BATCH 10: D.0101 – D.0110
-- DigiKep - SDKI / SLKI / SIKI
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.09073', 'Ketahanan Personal', 'Psikologis', 'Integritas Ego', 'Kapasitas untuk beradaptasi dan berfungsi positif setelah kesulitan.'),
('L.09090', 'Status Orientasi', 'Psikologis', 'Integritas Ego', 'Kesadaran terhadap diri, waktu, tempat dan lingkungan yang sesuai kenyataan.'),
('L.10101', 'Status Perkembangan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Kemampuan berkembang sesuai kelompok usia.'),
('L.10102', 'Status Pertumbuhan', 'Fisiologis', 'Pertumbuhan dan Perkembangan', 'Peningkatan ukuran tubuh sesuai kelompok usia.'),
('L.11103', 'Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Kemampuan melakukan/menyelesaikan aktivitas perawatan diri.'),
('L.12109', 'Status Kesehatan Komunitas', 'Psikologis', 'Penyuluhan dan Pembelajaran', 'Kesejahteraan fisik, mental dan sosial komunitas.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.09073 Ketahanan Personal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09073', 1, 'Verbalisasi kemampuan beradaptasi', 'Meningkat'),
('L.09073', 2, 'Kemampuan berfungsi', 'Meningkat'),
('L.09073', 3, 'Penggunaan strategi koping', 'Meningkat');

-- L.09090 Status Orientasi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09090', 1, 'Perilaku sesuai realitas', 'Meningkat'),
('L.09090', 2, 'Isi pikir sesuai realita', 'Meningkat'),
('L.09090', 3, 'Waham menurun', 'Menurun');

-- L.10101 Status Perkembangan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.10101', 1, 'Keterampilan/perilaku sesuai usia', 'Meningkat'),
('L.10101', 2, 'Pencapaian milestone perkembangan', 'Meningkat');

-- L.10102 Status Pertumbuhan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.10102', 1, 'Berat badan sesuai usia', 'Meningkat'),
('L.10102', 2, 'Panjang/tinggi badan sesuai usia', 'Meningkat'),
('L.10102', 3, 'Status gizi', 'Membaik');

-- L.11103 Perawatan Diri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.11103', 1, 'Minat melakukan perawatan diri', 'Meningkat'),
('L.11103', 2, 'Kemampuan mandi', 'Meningkat'),
('L.11103', 3, 'Kemampuan berpakaian', 'Meningkat'),
('L.11103', 4, 'Kemampuan toileting', 'Meningkat');

-- L.12109 Status Kesehatan Komunitas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.12109', 1, 'Kesadaran masalah kesehatan komunitas', 'Meningkat'),
('L.12109', 2, 'Partisipasi dalam program kesehatan', 'Meningkat'),
('L.12109', 3, 'Status kesejahteraan komunitas', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.09295', 'Manajemen Waham', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Mengidentifikasi dan mengelola keyakinan keliru yang menetap.'),
('I.10339', 'Perawatan Perkembangan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Mengidentifikasi dan merawat untuk memfasilitasi perkembangan optimal.'),
('I.10340', 'Promosi Perkembangan Anak', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Meningkatkan kemampuan orangtua/pengasuh mengoptimalkan perkembangan anak.'),
('I.11348', 'Dukungan Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Utama', 'Memfasilitasi pemenuhan kebutuhan perawatan diri.'),
('I.14547', 'Pengembangan Kesehatan Masyarakat', 'Lingkungan', 'Manajemen Lingkungan', 'Utama', 'Memfasilitasi masyarakat mengidentifikasi masalah kesehatan dan implementasi solusi.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.09295 Manajemen Waham
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09295'), 'Observasi', 1, 'Monitor waham yang isinya membahayakan diri sendiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09295'), 'Observasi', 2, 'Monitor perubahan waham'),
((SELECT id FROM siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 1, 'Jangan membantah atau menantang waham'),
((SELECT id FROM siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 2, 'Arahkan pada realita tanpa menghakimi');

-- I.10339 Perawatan Perkembangan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.10339'), 'Observasi', 1, 'Monitor pencapaian milestone perkembangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.10339'), 'Observasi', 2, 'Identifikasi faktor yang mendukung perkembangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 1, 'Sediakan stimulasi perkembangan sesuai usia'),
((SELECT id FROM siki WHERE kode_intervensi='I.10339'), 'Edukasi', 1, 'Ajarkan aktivitas stimulasi perkembangan');

-- I.10340 Promosi Perkembangan Anak
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.10340'), 'Observasi', 1, 'Identifikasi kemampuan orangtua/pengasuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 1, 'Ajarkan teknik stimulasi perkembangan anak'),
((SELECT id FROM siki WHERE kode_intervensi='I.10340'), 'Edukasi', 1, 'Jelaskan milestone perkembangan normal per usia');

-- I.11348 Dukungan Perawatan Diri
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Observasi', 1, 'Identifikasi kebiasaan perawatan diri sesuai usia'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Observasi', 2, 'Identifikasi kebutuhan alat bantu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 1, 'Sediakan lingkungan yang tepat untuk perawatan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 2, 'Fasilitasi kemandirian dalam perawatan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Edukasi', 1, 'Ajarkan teknik perawatan diri yang aman');

-- I.14547 Pengembangan Kesehatan Masyarakat
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.14547'), 'Observasi', 1, 'Identifikasi masalah kesehatan komunitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 1, 'Fasilitasi diskusi mengidentifikasi solusi'),
((SELECT id FROM siki WHERE kode_intervensi='I.14547'), 'Edukasi', 1, 'Ajarkan cara mengimplementasikan program kesehatan');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0101', 'Risiko Harga Diri Rendah', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami evaluasi negatif terhadap diri sendiri atau kemampuan yang berlangsung lama.'),
('D.0102', 'Risiko Harga Diri Rendah Situasional', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami evaluasi negatif terhadap diri sebagai respons situasi saat ini.'),
('D.0103', 'Risiko Ketidakberdayaan', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami persepsi bahwa tindakan tidak akan memengaruhi hasil.'),
('D.0104', 'Sindrom Pasca Trauma', 'Psikologis', 'Integritas Ego', 'Aktual', 'Respons maladaptif berkelanjutan terhadap kejadian trauma.'),
('D.0105', 'Waham', 'Psikologis', 'Integritas Ego', 'Aktual', 'Keyakinan keliru yang dipertahankan kuat namun tidak sesuai realitas.'),
('D.0106', 'Gangguan Tumbuh Kembang', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Aktual', 'Gangguan kemampuan bertumbuh dan berkembang sesuai kelompok usia.'),
('D.0107', 'Risiko Gangguan Perkembangan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Risiko', 'Berisiko mengalami gangguan perkembangan sesuai kelompok usia.'),
('D.0108', 'Risiko Gangguan Pertumbuhan', 'Fisiologis', 'Pertumbuhan dan Perkembangan', 'Risiko', 'Berisiko mengalami gangguan pertumbuhan sesuai kelompok usia.'),
('D.0109', 'Defisit Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Aktual', 'Tidak mampu melakukan atau menyelesaikan aktivitas perawatan diri.'),
('D.0110', 'Defisit Kesehatan Komunitas', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Masalah kesehatan atau faktor risiko komunitas.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal)
-- ============================================

-- D.0104 Sindrom Pasca Trauma
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), 'Situasional', 1, 'Bencana'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), 'Situasional', 2, 'Peperangan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), 'Situasional', 3, 'Riwayat korban perilaku kekerasan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), 'Situasional', 4, 'Kecelakaan');

-- D.0105 Waham
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0105'), 'Fisiologis', 1, 'Kelainan neurologis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0105'), 'Psikologis', 1, 'Isolasi sosial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0105'), 'Psikologis', 2, 'Stress berlebihan');

-- D.0109 Defisit Perawatan Diri
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 1, 'Gangguan muskuloskeletal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 2, 'Gangguan neuromuskuler'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 3, 'Kelemahan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), 'Psikologis', 1, 'Penurunan motivasi/minat');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0101'), (SELECT id FROM slki WHERE kode_luaran='L.09069')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0102'), (SELECT id FROM slki WHERE kode_luaran='L.09069')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0103'), (SELECT id FROM slki WHERE kode_luaran='L.09071')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), (SELECT id FROM slki WHERE kode_luaran='L.09073')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0105'), (SELECT id FROM slki WHERE kode_luaran='L.09090')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0106'), (SELECT id FROM slki WHERE kode_luaran='L.10101')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0107'), (SELECT id FROM slki WHERE kode_luaran='L.10101')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0108'), (SELECT id FROM slki WHERE kode_luaran='L.10102')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), (SELECT id FROM slki WHERE kode_luaran='L.11103')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0110'), (SELECT id FROM slki WHERE kode_luaran='L.12109'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0101'), (SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0102'), (SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0103'), (SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0104'), (SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0105'), (SELECT id FROM siki WHERE kode_intervensi='I.09295'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0106'), (SELECT id FROM siki WHERE kode_intervensi='I.10339'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0107'), (SELECT id FROM siki WHERE kode_intervensi='I.10340'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0108'), (SELECT id FROM siki WHERE kode_intervensi='I.03119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0109'), (SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0110'), (SELECT id FROM siki WHERE kode_intervensi='I.14547'), 'Utama');

SET FOREIGN_KEY_CHECKS = 1;
