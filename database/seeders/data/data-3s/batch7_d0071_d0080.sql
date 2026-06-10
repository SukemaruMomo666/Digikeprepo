-- ============================================
-- DATA MASTER BATCH 7: D.0071 – D.0080
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.07056', 'Identitas Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Integrasi identitas jenis kelamin dan orientasi seksual dalam kehidupan sehari-hari.'),
('L.07057', 'Penerimaan Kehamilan', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Penerimaan positif atas status kehamilan.'),
('L.07061', 'Status Kenyamanan Pasca Partum', 'Fisiologis', 'Nyeri dan Kenyamanan', 'Perasaan nyaman pada periode setelah melahirkan.'),
('L.08064', 'Status Kenyamanan', 'Psikologis', 'Nyeri dan Kenyamanan', 'Perasaan kurang senang, lega dan sempurna dalam dimensi fisik, psikospiritual, lingkungan dan sosial.'),
('L.08065', 'Tingkat Mual', 'Psikologis', 'Nyeri dan Kenyamanan', 'Perasaan tidak nyaman pada bagian belakang tenggorokan atau lambung.'),
('L.08066', 'Tingkat Nyeri', 'Psikologis', 'Nyeri dan Kenyamanan', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan.'),
('L.09093', 'Tingkat Ansietas', 'Psikologis', 'Psikologis', 'Kondisi emosi dan pengalaman subjektif individu terhadap objek yang tidak jelas dan spesifik.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.07056 Identitas Seksual
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.07056', 1, 'Pendirian seksual yang jelas', 'Meningkat'),
('L.07056', 2, 'Integrasi orientasi seksual ke dalam kehidupan sehari-hari', 'Meningkat'),
('L.07056', 3, 'Menyusun batasan-batasan sesuai jenis kelamin', 'Meningkat');

-- L.07057 Penerimaan Kehamilan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.07057', 1, 'Penerimaan kehamilan', 'Meningkat'),
('L.07057', 2, 'Ekspresi perasaan positif', 'Meningkat'),
('L.07057', 3, 'Kesiapan menghadapi persalinan', 'Meningkat');

-- L.07061 Status Kenyamanan Pasca Partum
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.07061', 1, 'Keluhan tidak nyaman', 'Menurun'),
('L.07061', 2, 'Frekuensi denyut nadi', 'Membaik'),
('L.07061', 3, 'Kemampuan istirahat', 'Meningkat');

-- L.08064 Status Kenyamanan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.08064', 1, 'Keluhan tidak nyaman', 'Menurun'),
('L.08064', 2, 'Kemampuan relaksasi', 'Meningkat'),
('L.08064', 3, 'Kepuasan dengan lingkungan', 'Meningkat');

-- L.08065 Tingkat Mual
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.08065', 1, 'Perasaan ingin muntah', 'Menurun'),
('L.08065', 2, 'Frekuensi muntah', 'Menurun'),
('L.08065', 3, 'Kemampuan makan', 'Meningkat');

-- L.08066 Tingkat Nyeri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.08066', 1, 'Keluhan nyeri', 'Menurun'),
('L.08066', 2, 'Meringis', 'Menurun'),
('L.08066', 3, 'Sikap protektif', 'Menurun'),
('L.08066', 4, 'Kemampuan melakukan aktivitas', 'Meningkat');

-- L.09093 Tingkat Ansietas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09093', 1, 'Kekhawatiran', 'Menurun'),
('L.09093', 2, 'Ketegangan otot', 'Menurun'),
('L.09093', 3, 'Kemampuan tidur', 'Meningkat'),
('L.09093', 4, 'Kemampuan konsentrasi', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.01019', 'Pengaturan Posisi', 'Fisiologis', 'Perawatan Diri', 'Utama', 'Menempatkan bagian tubuh untuk meningkatkan kesehatan fisiologis dan/atau psikologis.'),
('I.08239', 'Manajemen Mual', 'Fisiologis', 'Rasa Nyaman', 'Utama', 'Mengidentifikasi dan mengelola perasaan tidak nyaman pada bagian belakang tenggorokan atau lambung.'),
('I.12381', 'Edukasi Keluarga Berencana', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memberikan informasi tentang perencanaan keluarga dan kontrasepsi.'),
('I.12447', 'Edukasi Seksualitas', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memberikan informasi dalam memahami dimensi fisik dan psikososial seksualitas.'),
('I.09314', 'Reduksi Ansietas', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Meminimalkan kondisi emosi dan pengalaman subjektif terhadap objek yang tidak jelas dan spesifik.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.01019 Pengaturan Posisi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Observasi', 1, 'Monitor status oksigenasi sebelum dan sesudah mengubah posisi'),
((SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Observasi', 2, 'Monitor alat traksi agar selalu tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 1, 'Ubah posisi dengan interval yang sesuai'),
((SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 2, 'Sediakan dukungan dengan bantal atau roller'),
((SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Edukasi', 1, 'Ajarkan teknik pengaturan posisi yang aman');

-- I.08239 Manajemen Mual
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Observasi', 1, 'Identifikasi pengalaman mual (lokasi, kualitas, durasi, frekuensi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Observasi', 2, 'Monitor intake dan output'),
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Terapeutik', 1, 'Berikan makanan dalam jumlah kecil dan menarik'),
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Terapeutik', 2, 'Posisikan kepala lebih tinggi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Edukasi', 1, 'Anjurkan istirahat dan tidur yang cukup'),
((SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antiemetik, jika perlu');

-- I.12381 Edukasi Keluarga Berencana
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 1, 'Sediakan materi edukasi keluarga berencana'),
((SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Edukasi', 1, 'Jelaskan berbagai metode kontrasepsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Edukasi', 2, 'Ajarkan penggunaan kontrasepsi yang aman');

-- I.12447 Edukasi Seksualitas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Observasi', 1, 'Identifikasi kesiapan menerima informasi dalam memahami seksualitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Edukasi', 1, 'Jelaskan anatomi dan fisiologi sistem reproduksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Edukasi', 2, 'Ajarkan tentang adaptasi seksual');

-- I.09314 Reduksi Ansietas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Observasi', 1, 'Identifikasi sumber ansietas'),
((SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Observasi', 2, 'Monitor perubahan tingkat ansietas'),
((SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 1, 'Dengarkan dengan aktif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 2, 'Ciptakan lingkungan yang tenang dan mendukung'),
((SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Edukasi', 1, 'Ajarkan teknik relaksasi dan pernapasan');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0071', 'Pola Seksual Tidak Efektif', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Aktual', 'Kekhawatiran individu melakukan hubungan seksual yang berisiko menyebabkan perubahan kesehatan.'),
('D.0072', 'Risiko Disfungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Risiko', 'Berisiko mengalami perubahan fungsi seksual selama fase respon seksual.'),
('D.0073', 'Risiko Kehamilan Tidak Dikehendaki', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Risiko', 'Berisiko mengalami kehamilan yang tidak direncanakan.'),
('D.0074', 'Gangguan Rasa Nyaman', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan kurang senang, lega dan sempurna dalam dimensi fisik, psikospiritual, lingkungan dan sosial.'),
('D.0075', 'Ketidaknyamanan Pasca Partum', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan tidak nyaman berhubungan dengan kondisi setelah melahirkan.'),
('D.0076', 'Mual', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan tidak nyaman pada bagian belakang tenggorokan atau lambung yang dapat mengakibatkan muntah.'),
('D.0077', 'Nyeri Akut', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional dengan onset mendadak.'),
('D.0078', 'Nyeri Kronis', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan yang berlangsung lebih dari 3 bulan.'),
('D.0079', 'Nyeri Melahirkan', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik dan emosional yang bervariasi yang berhubungan dengan persalinan.'),
('D.0080', 'Ansietas', 'Psikologis', 'Psikologis', 'Aktual', 'Kondisi emosi dan pengalaman subjektif individu terhadap objek yang tidak jelas dan spesifik.');


-- ============================================
-- 6. SDKI PENYEBAB / FAKTOR RISIKO
-- ============================================

-- D.0071 Pola Seksual Tidak Efektif (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 1, 'Kurang privasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 2, 'Ketiadaan pasangan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 3, 'Konflik orientasi seksual'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 4, 'Ketakutan hamil'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 5, 'Ketakutan terinfeksi penyakit menular seksual'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), 'Situasional', 6, 'Kurang terpapar informasi tentang seksualitas');

-- D.0074 Gangguan Rasa Nyaman (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0074'), 'Fisiologis', 1, 'Gejala penyakit'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0074'), 'Situasional', 1, 'Kurang pengendalian');

-- D.0075 Ketidaknyamanan Pasca Partum (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), 'Fisiologis', 1, 'Trauma perineum selama persalinan dan kelahiran'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), 'Fisiologis', 2, 'Involusi uterus (proses pengembalian ukuran rahim ke ukuran semula)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), 'Fisiologis', 3, 'Pembengkakan payudara (alveoli mulai terisi ASI)');

-- D.0076 Mual (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), 'Fisiologis', 1, 'Gangguan biokimia (uremia, ketoasidosis diabetik)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), 'Fisiologis', 2, 'Gangguan pada esofagus'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), 'Fisiologis', 3, 'Distensi lambung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), 'Fisiologis', 4, 'Iritasi lambung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), 'Fisiologis', 5, 'Gangguan pankreas');

-- D.0077 Nyeri Akut (penyebab minimal - akan dikembangkan dari intervensi)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0077'), 'Fisiologis', 1, 'Kerusakan jaringan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0077'), 'Fisiologis', 2, 'Proses patologis');

-- D.0080 Ansietas (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), 'Psikologis', 1, 'Antisipasi bahaya'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), 'Psikologis', 2, 'Ketidakjelasan objek penyebab ansietas');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), (SELECT id FROM slki WHERE kode_luaran='L.07056')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0072'), (SELECT id FROM slki WHERE kode_luaran='L.07055')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0073'), (SELECT id FROM slki WHERE kode_luaran='L.07057')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0074'), (SELECT id FROM slki WHERE kode_luaran='L.08064')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), (SELECT id FROM slki WHERE kode_luaran='L.07061')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), (SELECT id FROM slki WHERE kode_luaran='L.08065')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0077'), (SELECT id FROM slki WHERE kode_luaran='L.08066')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0078'), (SELECT id FROM slki WHERE kode_luaran='L.08066')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0079'), (SELECT id FROM slki WHERE kode_luaran='L.08066')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), (SELECT id FROM slki WHERE kode_luaran='L.09093'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), (SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0072'), (SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0073'), (SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0074'), (SELECT id FROM siki WHERE kode_intervensi='I.01019'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), (SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), (SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0077'), (SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0078'), (SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0079'), (SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), (SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Utama');


-- ============================================
-- 9. RASIONAL (Minimal per mapping)
-- ============================================

-- D.0071 ↔ I.12447
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0071'), (SELECT id FROM siki WHERE kode_intervensi='I.12447'), 'Observasi', 1, 'Untuk mengetahui tingkat pemahaman tentang seksualitas');

-- D.0073 ↔ I.12381
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0073'), (SELECT id FROM siki WHERE kode_intervensi='I.12381'), 'Observasi', 1, 'Untuk memberikan informasi tentang kontrasepsi dan perencanaan keluarga');

-- D.0075 ↔ I.08238
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0075'), (SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Observasi', 1, 'Untuk mengidentifikasi lokasi dan intensitas nyeri pasca partum');

-- D.0076 ↔ I.08239
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), (SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Observasi', 1, 'Untuk mengetahui karakteristik dan penyebab mual'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0076'), (SELECT id FROM siki WHERE kode_intervensi='I.08239'), 'Terapeutik', 1, 'Untuk mengurangi perasaan mual dan kemampuan makan');

-- D.0080 ↔ I.09314
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), (SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Observasi', 1, 'Untuk mengidentifikasi sumber ansietas dan tingkat keparahannya'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0080'), (SELECT id FROM siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 1, 'Untuk mengurangi tingkat ansietas dan meningkatkan rasa aman');

SET FOREIGN_KEY_CHECKS = 1;
