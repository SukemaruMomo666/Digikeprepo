-- ============================================
-- DATA MASTER BATCH 9: D.0091 – D.0100
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran) - NEW + REUSE from previous
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.03025', 'Perilaku Kesehatan', 'Fisiologis', 'Promosi Kesehatan', 'Tindakan yang dilakukan untuk mempertahankan atau meningkatkan kesehatan.'),
('L.09071', 'Keberdayaan', 'Psikologis', 'Integritas Ego', 'Kemampuan untuk membuat keputusan dan mengambil tindakan untuk mempengaruhi hasil kesehatan.'),
('L.09082', 'Penerimaan', 'Psikologis', 'Integritas Ego', 'Penerimaan positif terhadap kondisi kesehatan atau perubahan yang dialami.'),
('L.09086', 'Status Koping', 'Psikologis', 'Integritas Ego', 'Kemampuan menilai dan merespons stressor secara efektif.'),
('L.09089', 'Status Koping Komunitas', 'Psikologis', 'Integritas Ego', 'Pola adaptasi dan penyelesaian masalah komunitas yang memuaskan.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.03025 Perilaku Kesehatan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.03025', 1, 'Penerimaan terhadap perubahan status kesehatan', 'Meningkat'),
('L.03025', 2, 'Kemampuan melakukan tindakan pencegahan', 'Meningkat'),
('L.03025', 3, 'Kemampuan peningkatan kesehatan', 'Meningkat');

-- L.09071 Keberdayaan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09071', 1, 'Verbalisasi mampu melaksanakan aktivitas', 'Meningkat'),
('L.09071', 2, 'Verbalisasi frustasi kebergantungan pada orang lain', 'Menurun'),
('L.09071', 3, 'Kemampuan membuat keputusan', 'Meningkat');

-- L.09082 Penerimaan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09082', 1, 'Verbalisasi penerimaan', 'Meningkat'),
('L.09082', 2, 'Verbalisasi perasaan yang dialami', 'Meningkat'),
('L.09082', 3, 'Perilaku mencari perawatan/pengobatan', 'Meningkat'),
('L.09082', 4, 'Menyusun perencanaan masa depan', 'Meningkat');

-- L.09086 Status Koping
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09086', 1, 'Kemampuan menilai stressor', 'Meningkat'),
('L.09086', 2, 'Kemampuan beradaptasi', 'Meningkat'),
('L.09086', 3, 'Kemampuan menggunakan strategi koping', 'Meningkat');

-- L.09089 Status Koping Komunitas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09089', 1, 'Keberdayaan komunitas', 'Meningkat'),
('L.09089', 2, 'Kemampuan penyelesaian masalah', 'Meningkat'),
('L.09089', 3, 'Partisipasi dalam kegiatan komunitas', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi) - NEW + REUSE
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.09265', 'Dukungan Pengambilan Keputusan', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Memberikan informasi dan dukungan dalam membuat keputusan.'),
('I.09307', 'Promosi Harapan', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Meningkatkan kepercayaan pada kemampuan untuk memulai dan mempertahankan tindakan.'),
('I.09311', 'Promosi Kesadaran Diri', 'Psikologis', 'Koping dan Toleransi Stress', 'Pendukung', 'Meningkatkan pemahaman dan mengeksplorasi pikiran, perasaan, motivasi dan perilaku.'),
('I.12383', 'Edukasi Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Mengajarkan pengelolaan faktor risiko penyakit dan perilaku hidup bersih serta sehat.'),
('I.12472', 'Promosi Perilaku Upaya Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Meningkatkan perubahan perilaku untuk kesehatan secara menyeluruh.'),
('I.14515', 'Manajemen Lingkungan Komunitas', 'Lingkungan', 'Manajemen Lingkungan', 'Utama', 'Mengidentifikasi dan mengelola kondisi lingkungan fisik, sosial, budaya, ekonomi dan politik.'),
('I.09269', 'Dukungan Perkembangan Spiritual', 'Psikologis', 'Koping dan Toleransi Stress', 'Pendukung', 'Memfasilitasi pengembangan kemampuan mengidentifikasi makna, tujuan dan harapan dalam hidup.');


-- ============================================
-- 4. SIKI TINDAKAN (minimal per intervensi)
-- ============================================

-- I.09265 Dukungan Pengambilan Keputusan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Observasi', 1, 'Identifikasi pilihan keputusan yang tersedia'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 1, 'Berikan informasi yang akurat dan lengkap'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Edukasi', 1, 'Ajarkan proses pengambilan keputusan yang efektif');

-- I.09307 Promosi Harapan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Observasi', 1, 'Identifikasi harapan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 1, 'Sadarkan bahwa kondisi memiliki nilai penting'),
((SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 2, 'Libatkan pasien secara aktif dalam perawatan');

-- I.09311 Promosi Kesadaran Diri
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09311'), 'Observasi', 1, 'Identifikasi keadaan emosional saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.09311'), 'Observasi', 2, 'Identifikasi respons terhadap berbagai situasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 1, 'Diskusikan nilai-nilai yang berkontribusi pada konsep diri');

-- I.12383 Edukasi Kesehatan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Observasi', 1, 'Identifikasi kesiapan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Terapeutik', 1, 'Sediakan materi edukasi kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Edukasi', 1, 'Ajarkan pengelolaan faktor risiko penyakit');

-- I.12472 Promosi Perilaku Upaya Kesehatan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12472'), 'Observasi', 1, 'Identifikasi perilaku upaya kesehatan yang dapat ditingkatkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12472'), 'Terapeutik', 1, 'Berikan lingkungan yang mendukung kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12472'), 'Edukasi', 1, 'Jelaskan manfaat perilaku kesehatan yang positif');

-- I.14515 Manajemen Lingkungan Komunitas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.14515'), 'Observasi', 1, 'Identifikasi kondisi lingkungan komunitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.14515'), 'Terapeutik', 1, 'Fasilitasi perbaikan kondisi lingkungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.14515'), 'Edukasi', 1, 'Ajarkan pentingnya lingkungan yang sehat');

-- I.09269 Dukungan Perkembangan Spiritual
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Observasi', 1, 'Identifikasi sumber makna dan tujuan hidup'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 1, 'Fasilitasi refleksi spiritual'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Edukasi', 1, 'Ajarkan cara mengembangkan kekuatan spiritual');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0091', 'Kesiapan Peningkatan Koping Komunitas', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola adaptasi dan penyelesaian masalah komunitas yang memuaskan dan dapat ditingkatkan.'),
('D.0092', 'Ketidakberdayaan', 'Psikologis', 'Integritas Ego', 'Aktual', 'Persepsi bahwa tindakan seseorang tidak akan memengaruhi hasil secara signifikan.'),
('D.0093', 'Ketidakmampuan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perilaku orang terdekat yang membatasi kemampuan beradaptasi dengan masalah kesehatan.'),
('D.0094', 'Koping Defensif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perlindungan palsu terhadap ancaman dasar, yang terwujud dalam penyangkalan dan proyeksi.'),
('D.0095', 'Koping Komunitas Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Pola adaptasi aktivitas komunitas yang tidak memuaskan.'),
('D.0096', 'Koping Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Ketidakmampuan menilai dan merespons stressor secara efektif.'),
('D.0097', 'Penurunan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Aktual', 'Ketidakadekuatan dukungan dari orang terdekat dalam mengatasi masalah kesehatan.'),
('D.0098', 'Penyangkalan Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Upaya mengingkari pemahaman peristiwa untuk menurunkan kecemasan yang menyebabkan gangguan kesehatan.'),
('D.0099', 'Perilaku Kesehatan Cenderung Berisiko', 'Psikologis', 'Integritas Ego', 'Aktual', 'Hambatan kemampuan dalam mengubah gaya hidup/perilaku untuk memperbaiki status kesehatan.'),
('D.0100', 'Risiko Distres Spiritual', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami gangguan keyakinan atau sistem nilai.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal)
-- ============================================

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), 'Situasional', 1, 'Program perawatan/pengobatan yang kompleks atau jangka panjang'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), 'Situasional', 2, 'Lingkungan tidak mendukung perawatan/pengobatan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), 'Situasional', 3, 'Interaksi interpersonal tidak memuaskan');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0093'), 'Psikologis', 1, 'Hubungan keluarga ambivalen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0093'), 'Psikologis', 2, 'Pola koping yang berbeda diantara klien dan orang terdekat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0093'), 'Situasional', 1, 'Resistensi keluarga terhadap perawatan/pengobatan yang kompleks');

-- D.0098 Penyangkalan Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), 'Psikologis', 1, 'Kecemasan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), 'Psikologis', 2, 'Ketakutan terhadap kematian'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), 'Psikologis', 3, 'Ketakutan mengalami kehilangan kemandirian');

-- D.0099 Perilaku Kesehatan Cenderung Berisiko
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), 'Psikologis', 1, 'Kurang terpapar informasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), 'Psikologis', 2, 'Ketidakadekuatan dukungan sosial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), 'Situasional', 1, 'Pemilihan gaya hidup tidak sehat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), 'Situasional', 2, 'Sikap negatif terhadap pelayanan kesehatan');

-- D.0100 Risiko Distres Spiritual
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0100'), 1, 'Perubahan hidup'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0100'), 2, 'Krisis kesehatan');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0091'), (SELECT id FROM slki WHERE kode_luaran='L.09089')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), (SELECT id FROM slki WHERE kode_luaran='L.09071')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0093'), (SELECT id FROM slki WHERE kode_luaran='L.09088')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0094'), (SELECT id FROM slki WHERE kode_luaran='L.09086')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0095'), (SELECT id FROM slki WHERE kode_luaran='L.09089')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0096'), (SELECT id FROM slki WHERE kode_luaran='L.09086')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0097'), (SELECT id FROM slki WHERE kode_luaran='L.09088')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), (SELECT id FROM slki WHERE kode_luaran='L.09082')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), (SELECT id FROM slki WHERE kode_luaran='L.03025')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0100'), (SELECT id FROM slki WHERE kode_luaran='L.09091'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0091'), (SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), (SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0093'), (SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0094'), (SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0095'), (SELECT id FROM siki WHERE kode_intervensi='I.14515'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0096'), (SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0097'), (SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), (SELECT id FROM siki WHERE kode_intervensi='I.09311'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), (SELECT id FROM siki WHERE kode_intervensi='I.12472'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0100'), (SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Utama');


-- ============================================
-- 9. RASIONAL (minimal per mapping)
-- ============================================

-- D.0092 ↔ I.09307
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0092'), (SELECT id FROM siki WHERE kode_intervensi='I.09307'), 'Observasi', 1, 'Untuk meningkatkan kepercayaan pada kemampuan pasien');

-- D.0098 ↔ I.09311
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0098'), (SELECT id FROM siki WHERE kode_intervensi='I.09311'), 'Observasi', 1, 'Untuk meningkatkan kesadaran diri dan penerimaan kondisi');

-- D.0099 ↔ I.12472
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0099'), (SELECT id FROM siki WHERE kode_intervensi='I.12472'), 'Observasi', 1, 'Untuk meningkatkan perilaku kesehatan yang positif');

SET FOREIGN_KEY_CHECKS = 1;
