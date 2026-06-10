-- ============================================
-- DATA MASTER BATCH 12: D.0121 – D.0130
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Markdown (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.13116', 'Keterlibatan Sosial', 'Relasional', 'Interaksi Sosial', 'Kemampuan untuk membina hubungan yang erat, hangat, terbuka dan independen.'),
('L.13119', 'Penampilan Peran', 'Relasional', 'Interaksi Sosial', 'Pola perilaku yang sesuai dengan harapan, norma dan lingkungan.'),
('L.13120', 'Peran Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Kemampuan orang tua memberi lingkungan untuk memfasilitasi pertumbuhan anak.'),
('L.13121', 'Peran Pemberi Asuhan', 'Relasional', 'Interaksi Sosial', 'Kemampuan berperan memberikan asuhan dalam keluarga.'),
('L.13122', 'Perlekatan Meningkat', 'Relasional', 'Interaksi Sosial', 'Kemampuan bonding orang tua dengan bayi/anak.'),
('L.13124', 'Proses Pengasuhan', 'Relasional', 'Interaksi Sosial', 'Kemampuan menerima proses kehamilan, persalinan dan perawatan bayi baru lahir.'),
('L.14125', 'Integritas Kulit/Jaringan', 'Fisiologis', 'Keamanan dan Proteksi', 'Keutuhan dan integritas kulit dan jaringan tubuh.'),
('L.14134', 'Termoregulasi', 'Fisiologis', 'Keamanan dan Proteksi', 'Pengaturan suhu tubuh dalam rentang normal.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.13116 Keterlibatan Sosial
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.13116', 1, 'Minat interaksi', 'Meningkat'),
('L.13116', 2, 'Kemampuan berkomunikasi', 'Meningkat'),
('L.13116', 3, 'Partisipasi dalam aktivitas sosial', 'Meningkat');

-- L.13119 Penampilan Peran
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.13119', 1, 'Verbalisasi harapan terpenuhi', 'Meningkat'),
('L.13119', 2, 'Perilaku sesuai peran', 'Meningkat');

-- L.13120 Peran Menjadi Orang Tua
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.13120', 1, 'Perilaku positif menjadi orang tua', 'Meningkat'),
('L.13120', 2, 'Interaksi positif dengan anak', 'Meningkat');

-- L.13121 Peran Pemberi Asuhan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.13121', 1, 'Kemampuan memberi asuhan', 'Meningkat'),
('L.13121', 2, 'Kemampuan merawat', 'Meningkat');

-- L.13122 Perlekatan Meningkat
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.13122', 1, 'Mempraktikan perilaku sehat', 'Meningkat'),
('L.13122', 2, 'Perlekatan pada bayi', 'Meningkat');

-- L.13124 Proses Pengasuhan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.13124', 1, 'Adaptasi terhadap proses kehamilan', 'Membaik'),
('L.13124', 2, 'Persiapan pengasuhan bayi', 'Meningkat');

-- L.14125 Integritas Kulit/Jaringan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.14125', 1, 'Elastisitas kulit', 'Meningkat'),
('L.14125', 2, 'Hidrasi kulit', 'Meningkat'),
('L.14125', 3, 'Perfusi jaringan', 'Meningkat');

-- L.14134 Termoregulasi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.14134', 1, 'Menggigil', 'Menurun'),
('L.14134', 2, 'Kulit merah', 'Menurun'),
('L.14134', 3, 'Suhu tubuh', 'Membaik'),
('L.14134', 4, 'Suhu kulit', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.13498', 'Promosi Sosialisasi', 'Relasional', 'Peran dan Hubungan', 'Utama', 'Meningkatkan kemampuan untuk berinteraksi dengan orang lain.'),
('I.13478', 'Dukungan Penampilan Peran', 'Relasional', 'Peran dan Hubungan', 'Utama', 'Memfasilitasi memperbaiki hubungan dengan klarifikasi peran tertentu.'),
('I.12466', 'Promosi Antisipasi Keluarga', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Meningkatkan kesiapan keluarga mencegah krisis.'),
('I.12402', 'Edukasi Pada Pengasuh', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Memberikan informasi untuk memfasilitasi pemberian perawatan.'),
('I.10342', 'Promosi Perlekatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Meningkatkan perlekatan atau latch on yang tepat.'),
('I.13490', 'Promosi Keutuhan Keluarga', 'Relasional', 'Peran dan Hubungan', 'Pendukung', 'Meningkatkan pengetahuan menjaga kerekatan keluarga.'),
('I.11353', 'Perawatan Integritas Kulit', 'Fisiologis', 'Kebersihan dan Kenyamanan', 'Utama', 'Mengidentifikasi dan merawat kulit untuk menjaga keutuhan.'),
('I.15506', 'Manajemen Hipertermia', 'Fisiologis', 'Regulasi Fisiologis', 'Utama', 'Mengelola suhu tubuh yang meningkat.');


-- ============================================
-- 4. SIKI TINDAKAN (minimal)
-- ============================================

-- I.13498 Promosi Sosialisasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13498'), 'Observasi', 1, 'Identifikasi kemampuan interaksi dengan orang lain'),
((SELECT id FROM siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 1, 'Fasilitasi interaksi dengan orang lain'),
((SELECT id FROM siki WHERE kode_intervensi='I.13498'), 'Edukasi', 1, 'Ajarkan cara berinteraksi yang efektif');

-- I.13478 Dukungan Penampilan Peran
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Observasi', 1, 'Identifikasi berbagai peran dan periode transisi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 1, 'Klarifikasi peran yang diharapkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Edukasi', 1, 'Ajarkan adaptasi terhadap perubahan peran');

-- I.12466 Promosi Antisipasi Keluarga
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12466'), 'Observasi', 1, 'Identifikasi kemungkinan krisis situasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12466'), 'Terapeutik', 1, 'Diskusikan cara menghadapi krisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12466'), 'Edukasi', 1, 'Ajarkan strategi adaptasi krisis');

-- I.12402 Edukasi Pada Pengasuh
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12402'), 'Observasi', 1, 'Identifikasi pemahaman dan kesiapan pengasuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.12402'), 'Terapeutik', 1, 'Sediakan demonstrasi teknik perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12402'), 'Edukasi', 1, 'Ajarkan teknik perawatan yang aman');

-- I.10342 Promosi Perlekatan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.10342'), 'Observasi', 1, 'Monitor kegiatan menyusui'),
((SELECT id FROM siki WHERE kode_intervensi='I.10342'), 'Observasi', 2, 'Identifikasi kemampuan latch on'),
((SELECT id FROM siki WHERE kode_intervensi='I.10342'), 'Terapeutik', 1, 'Fasilitasi latch on yang tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.10342'), 'Edukasi', 1, 'Ajarkan teknik menyusui yang benar');

-- I.13490 Promosi Keutuhan Keluarga
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Observasi', 1, 'Identifikasi pemahaman keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 1, 'Fasilitasi komunikasi keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Edukasi', 1, 'Ajarkan pentingnya keutuhan keluarga');

-- I.11353 Perawatan Integritas Kulit
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11353'), 'Observasi', 1, 'Identifikasi penyebab gangguan integritas'),
((SELECT id FROM siki WHERE kode_intervensi='I.11353'), 'Observasi', 2, 'Monitor lesi dan perubahan kulit'),
((SELECT id FROM siki WHERE kode_intervensi='I.11353'), 'Terapeutik', 1, 'Lakukan perawatan kulit yang tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.11353'), 'Edukasi', 1, 'Ajarkan perawatan kulit yang higienis');

-- I.15506 Manajemen Hipertermia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Observasi', 1, 'Identifikasi penyebab hipertermia'),
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Observasi', 2, 'Monitor suhu tubuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Observasi', 3, 'Monitor kadar elektrolit'),
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 1, 'Berikan kompres dingin'),
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 2, 'Tingkatkan asupan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Edukasi', 1, 'Ajarkan cara mencegah hipertermia');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0121', 'Isolasi Sosial', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Ketidakmampuan untuk membina hubungan yang erat, hangat dan independen.'),
('D.0122', 'Kesiapan Peningkatan Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan', 'Pola pemberian lingkungan untuk memfasilitasi pertumbuhan anak yang dapat ditingkatkan.'),
('D.0123', 'Kesiapan Peningkatan Proses Keluarga', 'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan', 'Pola fungsi keluarga yang cukup dan dapat ditingkatkan.'),
('D.0124', 'Ketegangan Peran Pemberian Asuhan', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Kesulitan dalam melakukan peran pemberi asuhan dalam keluarga.'),
('D.0125', 'Penampilan Peran Tidak Efektif', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Pola perilaku yang berubah atau tidak sesuai dengan harapan dan norma.'),
('D.0126', 'Pencapaian Peran Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Proses interaktif keluarga dengan perkembangan bayi yang optimal.'),
('D.0127', 'Risiko Gangguan Perlekatan', 'Relasional', 'Interaksi Sosial', 'Risiko', 'Berisiko mengalami gangguan interaksi orang tua dengan bayi/anak.'),
('D.0128', 'Risiko Proses Pengasuhan Tidak Efektif', 'Relasional', 'Interaksi Sosial', 'Risiko', 'Berisiko mengalami proses kehamilan-persalinan-perawatan bayi tidak sesuai norma.'),
('D.0129', 'Gangguan Integritas Kulit/Jaringan', 'Lingkungan', 'Keamanan dan Proteksi', 'Aktual', 'Kerusakan kulit (dermis/epidermis) atau jaringan tubuh.'),
('D.0130', 'Hipertermia', 'Fisiologis', 'Regulasi Fisiologis', 'Aktual', 'Suhu tubuh meningkat di atas rentang normal.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal)
-- ============================================

-- D.0121 Isolasi Sosial
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0121'), 'Psikologis', 1, 'Keterlambatan perkembangan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0121'), 'Psikologis', 2, 'Ketidakmampuan menjalin hubungan');

-- D.0124 Ketegangan Peran Pemberian Asuhan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 1, 'Beratnya penyakit penerima asuhan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 2, 'Kronisnya penyakit penerima asuhan');

-- D.0125 Penampilan Peran Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0125'), 'Psikologis', 1, 'Harapan peran tidak realistis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0125'), 'Fisiologis', 1, 'Hambatan fisik'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0125'), 'Psikologis', 2, 'Harga diri rendah');

-- D.0130 Hipertermia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis', 1, 'Dehidrasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0130'), 'Situasional', 1, 'Terpapar lingkungan panas'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis', 2, 'Proses penyakit (infeksi, kanker)');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0121'), (SELECT id FROM slki WHERE kode_luaran='L.13116')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0122'), (SELECT id FROM slki WHERE kode_luaran='L.13120')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0123'), (SELECT id FROM slki WHERE kode_luaran='L.13123')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0124'), (SELECT id FROM slki WHERE kode_luaran='L.13121')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0125'), (SELECT id FROM slki WHERE kode_luaran='L.13119')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0126'), (SELECT id FROM slki WHERE kode_luaran='L.13120')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0127'), (SELECT id FROM slki WHERE kode_luaran='L.13122')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0128'), (SELECT id FROM slki WHERE kode_luaran='L.13124')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0129'), (SELECT id FROM slki WHERE kode_luaran='L.14125')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0130'), (SELECT id FROM slki WHERE kode_luaran='L.14134'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0121'), (SELECT id FROM siki WHERE kode_intervensi='I.13498'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0122'), (SELECT id FROM siki WHERE kode_intervensi='I.12466'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0123'), (SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0124'), (SELECT id FROM siki WHERE kode_intervensi='I.12402'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0125'), (SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0126'), (SELECT id FROM siki WHERE kode_intervensi='I.12466'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0127'), (SELECT id FROM siki WHERE kode_intervensi='I.10342'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0128'), (SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0129'), (SELECT id FROM siki WHERE kode_intervensi='I.11353'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0130'), (SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Utama');

SET FOREIGN_KEY_CHECKS = 1;
