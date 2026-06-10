-- ============================================
-- DATA MASTER BATCH 11: D.0111 – D.0120
-- DigiKep - SDKI / SLKI / SIKI
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.12104', 'Manajemen Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kemampuan mengatur dan mengintegrasikan penanganan masalah kesehatan dalam kehidupan sehari-hari.'),
('L.12106', 'Pemeliharaan Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kemampuan mengidentifikasi, mengelola dan menemukan bantuan untuk mempertahankan kesehatan.'),
('L.12110', 'Tingkat Kepatuhan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Perilaku mengikuti rencana perawatan/pengobatan yang disepakati.'),
('L.12111', 'Tingkat Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kecukupan informasi kognitif yang berkaitan dengan topik tertentu.'),
('L.13115', 'Interaksi Sosial', 'Relasional', 'Interaksi Sosial', 'Kuantitas dan kualitas hubungan sosial yang cukup.'),
('L.13118', 'Komunikasi Verbal', 'Relasional', 'Interaksi Sosial', 'Kemampuan untuk menerima, memproses, mengirim dan menggunakan sistem simbol.'),
('L.13123', 'Proses Keluarga', 'Relasional', 'Interaksi Sosial', 'Kemampuan untuk berubah dalam hubungan atau fungsi keluarga.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.12104 Manajemen Kesehatan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.12104', 1, 'Melakukan tindakan mengurangi faktor risiko', 'Meningkat'),
('L.12104', 2, 'Menerapkan program perawatan', 'Meningkat'),
('L.12104', 3, 'Mengatur jadwal pengobatan', 'Meningkat');

-- L.12106 Pemeliharaan Kesehatan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.12106', 1, 'Menunjukkan perilaku adaptif', 'Meningkat'),
('L.12106', 2, 'Menunjukkan pemahaman perilaku sehat', 'Meningkat'),
('L.12106', 3, 'Melakukan perawatan kesehatan preventif', 'Meningkat');

-- L.12110 Tingkat Kepatuhan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.12110', 1, 'Kepatuhan terhadap program pengobatan', 'Meningkat'),
('L.12110', 2, 'Kepatuhan terhadap diet', 'Meningkat'),
('L.12110', 3, 'Kepatuhan terhadap aktivitas/istirahat', 'Meningkat');

-- L.12111 Tingkat Pengetahuan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.12111', 1, 'Perilaku sesuai anjuran', 'Meningkat'),
('L.12111', 2, 'Verbalisasi minat dalam belajar', 'Meningkat'),
('L.12111', 3, 'Kemampuan menjelaskan pengetahuan', 'Meningkat');

-- L.13115 Interaksi Sosial
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.13115', 1, 'Perasaan nyaman dengan situasi sosial', 'Meningkat'),
('L.13115', 2, 'Kemampuan berkomunikasi', 'Meningkat'),
('L.13115', 3, 'Partisipasi dalam aktivitas sosial', 'Meningkat');

-- L.13118 Komunikasi Verbal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.13118', 1, 'Kemampuan berbicara', 'Meningkat'),
('L.13118', 2, 'Kemampuan mendengar', 'Meningkat'),
('L.13118', 3, 'Kesesuaian ekspresi wajah/tubuh', 'Meningkat');

-- L.13123 Proses Keluarga
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.13123', 1, 'Adaptasi terhadap perubahan keluarga', 'Membaik'),
('L.13123', 2, 'Komunikasi antar anggota keluarga', 'Membaik'),
('L.13123', 3, 'Dukungan dalam keluarga', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.12359', 'Bimbingan Antisipatif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Mempersiapkan pasien dan keluarga mengantisipasi perkembangan atau krisis situasional.'),
('I.12361', 'Dukungan Kepatuhan Program Pengobatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Memfasilitasi ketepatan dan keteraturan menjalani program pengobatan.'),
('I.13484', 'Modifikasi Perilaku Keterampilan Sosial', 'Relasional', 'Peran dan Hubungan', 'Utama', 'Mengubah pengembangan atau peningkatan keterampilan sosial interpersonal.'),
('I.06206', 'Perawatan Telinga', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi, merawat dan mencegah gangguan telinga dan pendengaran.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.12359 Bimbingan Antisipatif
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Observasi', 1, 'Identifikasi metode penyelesaian masalah yang biasa digunakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Observasi', 2, 'Identifikasi kemungkinan perkembangan situasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 1, 'Diskusikan cara menghadapi situasi yang mungkin terjadi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Edukasi', 1, 'Ajarkan strategi adaptif');

-- I.12361 Dukungan Kepatuhan Program Pengobatan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Observasi', 1, 'Identifikasi kepatuhan menjalani program pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 1, 'Buat komitmen bersama untuk kepatuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Edukasi', 1, 'Jelaskan pentingnya kepatuhan program pengobatan');

-- I.13484 Modifikasi Perilaku Keterampilan Sosial
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13484'), 'Observasi', 1, 'Identifikasi penyebab kurangnya keterampilan sosial'),
((SELECT id FROM siki WHERE kode_intervensi='I.13484'), 'Observasi', 2, 'Identifikasi fokus pelatihan keterampilan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13484'), 'Terapeutik', 1, 'Fasilitasi praktik keterampilan sosial'),
((SELECT id FROM siki WHERE kode_intervensi='I.13484'), 'Edukasi', 1, 'Ajarkan keterampilan komunikasi dan interpersonal');

-- I.06206 Perawatan Telinga
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06206'), 'Observasi', 1, 'Pemeriksaan fungsi pendengaran'),
((SELECT id FROM siki WHERE kode_intervensi='I.06206'), 'Observasi', 2, 'Monitor tanda dan gejala infeksi telinga'),
((SELECT id FROM siki WHERE kode_intervensi='I.06206'), 'Terapeutik', 1, 'Bersihkan telinga dengan cara yang tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.06206'), 'Edukasi', 1, 'Ajarkan perawatan telinga yang higienis');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0111', 'Defisit Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Ketiadaan atau kurangnya informasi kognitif.'),
('D.0112', 'Kesiapan Peningkatan Manajemen Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Promosi Kesehatan', 'Pola pengaturan kesehatan yang cukup dan dapat ditingkatkan.'),
('D.0113', 'Kesiapan Peningkatan Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Promosi Kesehatan', 'Perkembangan informasi kognitif yang cukup dan dapat ditingkatkan.'),
('D.0114', 'Ketidakpatuhan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Perilaku tidak mengikuti rencana perawatan yang disepakati.'),
('D.0115', 'Manajemen Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Pola pengaturan kesehatan tidak memuaskan untuk mencapai status kesehatan optimal.'),
('D.0116', 'Manajemen Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Pola pengaturan kesehatan tidak memuaskan.'),
('D.0117', 'Pemeliharaan Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Ketidakmampuan mengidentifikasi, mengelola kesehatan.'),
('D.0118', 'Gangguan Interaksi Sosial', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Kuantitas dan/atau kualitas hubungan sosial kurang atau berlebihan.'),
('D.0119', 'Gangguan Komunikasi Verbal', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Penurunan, pelambatan atau ketiadaan kemampuan menggunakan sistem simbol.'),
('D.0120', 'Gangguan Proses Keluarga', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Perubahan dalam hubungan atau fungsi keluarga.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal)
-- ============================================

-- D.0114 Ketidakpatuhan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0114'), 'Fisiologis', 1, 'Disabilitas (penurunan daya ingat, defisit sensorik)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 1, 'Efek samping program perawatan');

-- D.0118 Gangguan Interaksi Sosial
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0118'), 'Fisiologis', 1, 'Defisiensi bicara'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 1, 'Hambatan perkembangan/maturasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 1, 'Ketiadaan orang terdekat');

-- D.0119 Gangguan Komunikasi Verbal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 1, 'Penurunan sirkulasi serebral'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 2, 'Gangguan neuromuskuler'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 3, 'Gangguan pendengaran');

-- D.0120 Gangguan Proses Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 1, 'Perubahan status kesehatan anggota keluarga'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 2, 'Perubahan finansial keluarga'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 3, 'Krisis perkembangan');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0111'), (SELECT id FROM slki WHERE kode_luaran='L.12111')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0112'), (SELECT id FROM slki WHERE kode_luaran='L.12104')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0113'), (SELECT id FROM slki WHERE kode_luaran='L.12111')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0114'), (SELECT id FROM slki WHERE kode_luaran='L.12110')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0115'), (SELECT id FROM slki WHERE kode_luaran='L.12104')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0116'), (SELECT id FROM slki WHERE kode_luaran='L.12104')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0117'), (SELECT id FROM slki WHERE kode_luaran='L.12106')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0118'), (SELECT id FROM slki WHERE kode_luaran='L.13115')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0119'), (SELECT id FROM slki WHERE kode_luaran='L.13118')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0120'), (SELECT id FROM slki WHERE kode_luaran='L.13123'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0111'), (SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0112'), (SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0113'), (SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0114'), (SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0115'), (SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0116'), (SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0117'), (SELECT id FROM siki WHERE kode_intervensi='I.12383'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0118'), (SELECT id FROM siki WHERE kode_intervensi='I.13484'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0119'), (SELECT id FROM siki WHERE kode_intervensi='I.06206'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0120'), (SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Utama');

SET FOREIGN_KEY_CHECKS = 1;
