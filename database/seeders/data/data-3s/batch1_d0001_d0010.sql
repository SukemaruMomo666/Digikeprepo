-- ============================================
-- DATA MASTER BATCH 1: D.0001 – D.0010
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.01001', 'Bersihan Jalan Napas', 'Fisiologis', 'Respirasi', 'Kemampuan membersihkan sekret atau obstruksi jalan napas untuk mempertahankan jalan napas tetap paten.'),
('L.01002', 'Penyapihan Ventilator', 'Fisiologis', 'Respirasi', 'Kemampuan beradaptasi dengan pengurangan bantuan ventilator mekanik selama proses penyapihan.'),
('L.01003', 'Pertukaran Gas', 'Fisiologis', 'Respirasi', 'Keadekuatan oksigenasi dan/atau eliminasi karbon dioksida pada membran alveolus-kapiler.'),
('L.01004', 'Pola Napas', 'Fisiologis', 'Respirasi', 'Inspirasi dan/atau ekspirasi yang memberikan ventilasi adekuat.'),
('L.01006', 'Tingkat Aspirasi', 'Fisiologis', 'Respirasi', 'Kondisi masuknya partikel cair atau padat ke dalam paru-paru.'),
('L.02008', 'Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Keadekuatan jantung memompa darah untuk memenuhi kebutuhan metabolisme tubuh.'),
('L.02011', 'Perfusi Perifer', 'Fisiologis', 'Sirkulasi', 'Keadekuatan aliran darah pembuluh darah distal untuk menunjang fungsi jaringan.'),
('L.02015', 'Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Kemampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.01001 Bersihan Jalan Napas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.01001', 1, 'Batuk efektif', 'Meningkat'),
('L.01001', 2, 'Produksi sputum', 'Menurun'),
('L.01001', 3, 'Mengi', 'Menurun'),
('L.01001', 4, 'Wheezing', 'Menurun'),
('L.01001', 5, 'Mekonium (pada neonatus)', 'Menurun');

-- L.01002 Penyapihan Ventilator
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.01002', 1, 'Kesinkronan bantuan ventilator', 'Meningkat'),
('L.01002', 2, 'Penggunaan otot bantu napas', 'Menurun');

-- L.01003 Pertukaran Gas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.01003', 1, 'Dispnea', 'Menurun'),
('L.01003', 2, 'Bunyi napas tambahan', 'Menurun'),
('L.01003', 3, 'Takikardi', 'Menurun'),
('L.01003', 4, 'PCO₂', 'Membaik');

-- L.01004 Pola Napas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.01004', 1, 'Dispnea', 'Menurun'),
('L.01004', 2, 'Penggunaan otot bantu napas', 'Menurun'),
('L.01004', 3, 'Frekuensi napas', 'Membaik');

-- L.01006 Tingkat Aspirasi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.01006', 1, 'Tingkat kesadaran', 'Meningkat'),
('L.01006', 2, 'Kemampuan menelan', 'Meningkat'),
('L.01006', 3, 'Kelemahan otot', 'Menurun');

-- L.02008 Curah Jantung
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02008', 1, 'Kekuatan nadi perifer', 'Meningkat'),
('L.02008', 2, 'Palpitasi', 'Menurun'),
('L.02008', 3, 'Tekanan darah', 'Membaik');

-- L.02011 Perfusi Perifer
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02011', 1, 'Penyembuhan luka', 'Meningkat'),
('L.02011', 2, 'Edema perifer', 'Menurun'),
('L.02011', 3, 'Nyeri ekstremitas', 'Menurun');

-- L.02015 Sirkulasi Spontan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02015', 1, 'Tingkat kesadaran', 'Meningkat'),
('L.02015', 2, 'Frekuensi nadi', 'Membaik'),
('L.02015', 3, 'Tekanan darah', 'Membaik'),
('L.02015', 4, 'Frekuensi napas', 'Membaik'),
('L.02015', 5, 'Suhu tubuh', 'Membaik'),
('L.02015', 6, 'Saturasi oksigen', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.01001', 'Latihan Batuk Efektif', 'Fisiologis', 'Respirasi', 'Utama', 'Melatih pasien yang tidak memiliki kemampuan batuk secara efektif untuk membersihkan laring, trakea dan bronkiolus dari sekret atau benda asing di jalan napas.'),
('I.01011', 'Manajemen Jalan Napas', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengelola kepatenan jalan napas.'),
('I.01014', 'Pemantauan Respirasi', 'Fisiologis', 'Respirasi', 'Utama', 'Mengumpulkan dan menganalisis data untuk memastikan kepatenan jalan napas dan keefektifan pertukaran gas.'),
('I.01021', 'Penyapihan Ventilasi Mekanik', 'Fisiologis', 'Respirasi', 'Utama', 'Memfasilitasi pasien bernapas tanpa bantuan ventilasi mekanis.'),
('I.02038', 'Manajemen Defibrilasi', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan mengelola aliran listrik kuat dengan metode asinkron ke jantung melalui elektroda yang ditempatkan pada permukaan dada.'),
('I.02075', 'Perawatan Jantung', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi, merawat dan membatasi komplikasi akibat ketidakseimbangan antara suplai dan konsumsi oksigen miokard.'),
('I.02076', 'Perawatan Sirkulasi', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan merawat area lokal dengan keterbatasan sirkulasi perifer.'),
('I.02080', 'Pertolongan Pertama', 'Fisiologis', 'Sirkulasi', 'Pendukung', 'Memberikan penanganan dasar dan segera pada kondisi kegawatdaruratan baik dengan alat maupun tanpa alat.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.01001 Latihan Batuk Efektif
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 1, 'Identifikasi kemampuan batuk'),
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 2, 'Monitor adanya retensi sputum'),
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 3, 'Monitor adanya gejala infeksi saluran napas'),
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 4, 'Monitor input dan output cairan (jumlah dan karakteristik)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 1, 'Atur posisi semi-Fowler atau Fowler'),
((SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 2, 'Pasang perlak dan bengkok di pangkuan pasien');

-- I.01011 Manajemen Jalan Napas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 1, 'Monitor pola napas (frekuensi, kedalaman, usaha napas)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 2, 'Monitor bunyi napas tambahan (mis. gurgling, mengi, wheezing, ronkhi kering)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 3, 'Monitor sputum (jumlah, warna, aroma)');

-- I.01014 Pemantauan Respirasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Observasi', 1, 'Monitor frekuensi, irama, kedalaman dan upaya napas'),
((SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Observasi', 2, 'Monitor pola napas (seperti bradipnea, takipnea, hiperventilasi, Kussmaul, Cheyne-Stokes, Biot, ataksik)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Observasi', 3, 'Monitor kemampuan batuk efektif');

-- I.01021 Penyapihan Ventilasi Mekanik
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01021'), 'Observasi', 1, 'Periksa kemampuan untuk disapih (meliputi hemodinamik stabil, kondisi optimal, bebas infeksi)');

-- I.02038 Manajemen Defibrilasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02038'), 'Observasi', 1, 'Periksa irama pada monitor setelah RJP 2 menit'),
((SELECT id FROM siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 1, 'Lakukan resusitasi jantung paru (RJP) hingga mesin defibrilator siap');

-- I.02075 Perawatan Jantung
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Observasi', 1, 'Identifikasi tanda/gejala primer penurunan curah jantung (meliputi dispnea, kelelahan, edema, ortopnea, paroxysmal nocturnal dyspnea, peningkatan CVP)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Observasi', 2, 'Identifikasi tanda/gejala sekunder penurunan curah jantung (meliputi peningkatan berat badan, hepatomegali, distensi vena jugularis, palpitasi, ronkhi basah)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Observasi', 3, 'Monitor tekanan darah'),
((SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Observasi', 4, 'Monitor saturasi oksigen'),
((SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Observasi', 5, 'Monitor keluhan nyeri dada');

-- I.02076 Perawatan Sirkulasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02076'), 'Observasi', 1, 'Periksa sirkulasi perifer (mis. nadi perifer, edema, pengisian kapiler, warna, suhu)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02076'), 'Observasi', 2, 'Identifikasi faktor risiko gangguan sirkulasi (mis. diabetes, perokok, hipertensi, kadar kolesterol tinggi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02076'), 'Observasi', 3, 'Monitor panas, kemerahan, nyeri atau bengkak pada ekstremitas');

-- I.02080 Pertolongan Pertama
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02080'), 'Observasi', 1, 'Identifikasi keamanan penolong, pasien, dan lingkungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02080'), 'Observasi', 2, 'Identifikasi respons pasien dengan AVPU (Alert, Voice, Pain, Unresponsive)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02080'), 'Observasi', 3, 'Monitor tanda-tanda vital'),
((SELECT id FROM siki WHERE kode_intervensi='I.02080'), 'Observasi', 4, 'Monitor kondisi umum pasien');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0001', 'Bersihan Jalan Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual', 'Ketidakmampuan membersihkan sekret atau obstruksi jalan napas untuk mempertahankan jalan napas tetap paten.'),
('D.0002', 'Gangguan Penyapihan Ventilator', 'Fisiologis', 'Respirasi', 'Aktual', 'Ketidakmampuan beradaptasi dengan pengurangan bantuan ventilator mekanik yang dapat menghambat dan memperlama proses penyapihan.'),
('D.0003', 'Gangguan Pertukaran Gas', 'Fisiologis', 'Respirasi', 'Aktual', 'Kelebihan atau kekurangan oksigenasi dan/atau eliminasi karbon dioksida pada membran alveolus-kapiler.'),
('D.0004', 'Gangguan Ventilasi Spontan', 'Fisiologis', 'Respirasi', 'Aktual', 'Penurunan cadangan energi yang menyebabkan individu tidak mampu bernapas secara adekuat.'),
('D.0005', 'Pola Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual', 'Inspirasi dan/atau ekspirasi yang tidak memberikan ventilasi adekuat.'),
('D.0006', 'Risiko Aspirasi', 'Fisiologis', 'Respirasi', 'Risiko', 'Berisiko mengalami masuknya sekresi gastrointestinal, sekresi orofaring, benda cair atau padat ke dalam saluran trakeobronkial.'),
('D.0007', 'Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Ketidakmampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.'),
('D.0008', 'Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Ketidakmampuan jantung memompa darah untuk memenuhi kebutuhan metabolisme tubuh.'),
('D.0009', 'Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Penurunan sirkulasi darah pada level kapiler yang dapat mengganggu metabolisme tubuh.'),
('D.0010', 'Risiko Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami ketidakmampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.');


-- ============================================
-- 6. SDKI PENYEBAB
-- ============================================

-- D.0001
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 1, 'Spasme jalan napas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 2, 'Hipersekresi jalan napas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 3, 'Disfungsi neuromuskuler'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 4, 'Benda asing dalam jalan napas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 5, 'Adanya jalan napas buatan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 6, 'Sekresi yang tertahan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 7, 'Hiperplasia dinding jalan napas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 8, 'Proses infeksi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 9, 'Respons alergi');

-- D.0002
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0002'), 'Fisiologis', 1, 'Hipersekresi jalan napas');

-- D.0003
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), 'Umum', 1, 'Ketidakseimbangan ventilasi-perfusi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), 'Umum', 2, 'Perubahan membran alveolus-kapiler');

-- D.0005
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), 'Umum', 1, 'Depresi pusat pernapasan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), 'Umum', 2, 'Hambatan upaya napas (mis. nyeri saat bernapas, kelemahan otot pernapasan)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), 'Umum', 3, 'Deformitas dinding dada'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), 'Umum', 4, 'Deformitas tulang dada');

-- D.0007
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0007'), 'Umum', 1, 'Abnormalitas kelistrikan jantung');

-- D.0008
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), 'Umum', 1, 'Perubahan irama jantung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), 'Umum', 2, 'Perubahan frekuensi jantung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), 'Umum', 3, 'Perubahan kontraktilitas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), 'Umum', 4, 'Perubahan preload'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), 'Umum', 5, 'Perubahan afterload');

-- D.0009
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0009'), 'Umum', 1, 'Hiperglikemia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0009'), 'Umum', 2, 'Penurunan konsentrasi hemoglobin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0009'), 'Umum', 3, 'Peningkatan tekanan darah');

-- D.0006 (Risiko - faktor risiko)
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0006'), 1, 'Penurunan tingkat kesadaran'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0006'), 2, 'Gangguan menelan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0006'), 3, 'Terpasang selang nasogastrik');

-- D.0010 (Risiko - faktor risiko)
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0010'), 1, 'Kekurangan volume cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0010'), 2, 'Hipoksia');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM slki WHERE kode_luaran='L.01001')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0002'), (SELECT id FROM slki WHERE kode_luaran='L.01002')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), (SELECT id FROM slki WHERE kode_luaran='L.01003')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0004'), (SELECT id FROM slki WHERE kode_luaran='L.02015')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM slki WHERE kode_luaran='L.01004')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0006'), (SELECT id FROM slki WHERE kode_luaran='L.01006')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0007'), (SELECT id FROM slki WHERE kode_luaran='L.02015')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), (SELECT id FROM slki WHERE kode_luaran='L.02008')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0009'), (SELECT id FROM slki WHERE kode_luaran='L.02011')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0010'), (SELECT id FROM slki WHERE kode_luaran='L.02015'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0002'), (SELECT id FROM siki WHERE kode_intervensi='I.01021'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), (SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0004'), (SELECT id FROM siki WHERE kode_intervensi='I.02038'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0006'), (SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0007'), (SELECT id FROM siki WHERE kode_intervensi='I.02038'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0008'), (SELECT id FROM siki WHERE kode_intervensi='I.02075'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0009'), (SELECT id FROM siki WHERE kode_intervensi='I.02076'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0010'), (SELECT id FROM siki WHERE kode_intervensi='I.02080'), 'Utama');


-- ============================================
-- 9. RASIONAL (per pasangan SDKI-SIKI)
-- ============================================
-- Tabel: siki_rasional (perlu dibuat jika belum ada)
-- Struktur: id, sdki_id, siki_id, jenis, urutan, deskripsi

CREATE TABLE IF NOT EXISTS siki_rasional (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sdki_id INT UNSIGNED NOT NULL,
    siki_id INT UNSIGNED NOT NULL,
    jenis ENUM('Observasi', 'Terapeutik', 'Edukasi', 'Kolaborasi') NOT NULL,
    urutan TINYINT UNSIGNED NOT NULL DEFAULT 1,
    deskripsi TEXT NOT NULL,
    FOREIGN KEY (sdki_id) REFERENCES sdki(id) ON DELETE CASCADE,
    FOREIGN KEY (siki_id) REFERENCES siki(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- D.0001 ↔ I.01001
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 1, 'Untuk mengidentifikasi sejauh mana kemampuan batuk klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 2, 'Untuk mengetahui adanya retensi sputum'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 3, 'Untuk mengetahui adanya gejala infeksi pada saluran napas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Observasi', 4, 'Untuk mengetahui jumlah dan karakteristik input dan output cairan klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 1, 'Memposisikan klien dengan posisi semi-Fowler atau Fowler agar klien merasa nyaman dan mempermudah klien untuk batuk');

-- D.0002 ↔ I.01021
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0002'), (SELECT id FROM siki WHERE kode_intervensi='I.01021'), 'Observasi', 1, 'Untuk menilai stabilitas sistem sirkulasi, memastikan kondisi fisik yang optimal, serta melihat apakah ada infeksi pada saluran pernapasan');

-- D.0003 ↔ I.01014
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), (SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Observasi', 1, 'Untuk mengetahui frekuensi pernapasan sudah normal atau tidak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0003'), (SELECT id FROM siki WHERE kode_intervensi='I.01014'), 'Observasi', 2, 'Untuk mengetahui sejauh mana penurunan bunyi napas yang mengindikasikan atelektasis, ronki mengindikasikan akumulasi sekret');

-- D.0004 ↔ I.02038
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0004'), (SELECT id FROM siki WHERE kode_intervensi='I.02038'), 'Observasi', 1, 'Untuk mengetahui irama jantung paru setelah dilakukan RJP selama 2 menit');

-- D.0005 ↔ I.01011
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 1, 'Untuk mengetahui perkembangan status kesehatan pasien dan mencegah komplikasi lanjutan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 2, 'Gurgling adalah suara napas abnormal yang terjadi akibat adanya cairan di jalan napas atas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 3, 'Wheezing adalah suara pernapasan frekuensi tinggi nyaring yang terdengar di akhir ekspirasi akibat penyempitan saluran napas');

SET FOREIGN_KEY_CHECKS = 1;
