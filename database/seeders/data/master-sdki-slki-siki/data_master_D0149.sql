SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- DATA MASTER: SDKI + SLKI + SIKI
-- Range: D.0149 Termoregulasi Tidak Efektif
-- Sumber: PDF halaman 703–706
-- ============================================================

-- ============================================================
-- 1. diagnosa_sdki
-- ============================================================

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0149', 'Termoregulasi Tidak Efektif', 'Lingkungan', 'Keamanan dan Proteksi', 'Aktual', 'Kegagalan mempertahankan suhu tubuh dalam rentang normal.');

-- ============================================================
-- 2. sdki_penyebab (tipe Aktual → ada penyebab)
-- ============================================================

INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 1, 'Stimulasi pusat termoregulasi hipotalamus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 2, 'Fluktuasi suhu lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 3, 'Proses penyakit (mis. infeksi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 4, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 5, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Situasional', 6, 'Ketidaksesuaian pakaian untuk suhu lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 7, 'Peningkatan kebutuhan oksigen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 8, 'Perubahan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Situasional', 9, 'Suhu lingkungan ekstrem');

-- ============================================================
-- 3. sdki_gejala
-- ============================================================

-- Gejala Mayor Objektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Mayor', 'Objektif', 1,  'Kulit dingin/hangat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Mayor', 'Objektif', 2,  'Menggigil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Mayor', 'Objektif', 3,  'Suhu tubuh fluatuatif');

-- Gejala Minor
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 1,  'Piloereksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 2,  'Pengisian kapiler >3 detik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 3,  'Tekanan darah meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 4,  'Pucat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 5,  'Frekuensi napas meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 6,  'Takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 'Minor', 'Objektif', 7,  'Kejang');

-- ============================================================
-- 4. sdki_kondisi_klinis
-- ============================================================

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 1, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 2, 'Infeksi/sepsis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 3, 'Pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 4, 'Cedera otak akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), 5, 'Trauma');

-- ============================================================
-- 5. luaran_slki
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.14134', 'Termoregulasi', 'Lingkungan', 'Keamanan dan Proteksi', 'Pengaturan suhu tubuh agar tetap berada pada rentang normal.');

-- ============================================================
-- 6. slki_kriteria_hasil
-- ============================================================

INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  1, 'Menggigil',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  2, 'Kulit merah',            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  3, 'Kejang',                 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  4, 'Akrosianosis',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  5, 'Konsumsi oksigen',       'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  6, 'Piloereksi',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  7, 'Vasokontriksi perifer',  'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  8, 'Kutis memorata',         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),  9, 'Pucat',                  'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 10, 'Takikardia',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 11, 'Takipnea',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 12, 'Bradikardi',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 13, 'Dasar kuku sianotik',    'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 14, 'Hipoksia',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 15, 'Suhu tubuh',             'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), 16, 'Suhu kulit',             'Membaik');

-- ============================================================
-- 7. intervensi_siki
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.14578', 'Regulasi Temperatur', 'Lingkungan', 'Keamanan dan Proteksi', 'Mempertahankan suhu tubuh dalam rentang normal.');

-- ============================================================
-- 8. siki_tindakan
-- ============================================================

INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
-- Observasi
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Observasi',  1, 'Monitor suhu bayi sampai stabil (36,5C–37,5C)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Observasi',  2, 'Monitor suhu tubuh anak tiap 2 jam, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Observasi',  3, 'Monitor tekanan darah, frekuensi pernapasan dan nadi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Observasi',  4, 'Monitor warna dan suhu kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Observasi',  5, 'Monitor dan catat tanda dan gejala hipotermia atau hipertermi'),
-- Terapeutik
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 1, 'Pasang alat pemantau suhu kontinu, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 2, 'Tingkatkan asupan cairan dan nutrisi yang adekuat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 3, 'Bedong bayi segera setelah lahir untuk mencegah kehilangan panas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 4, 'Gunakan matras penghangat, selimut hangat, dan penghangat ruangan untuk menaikkan suhu tubuh, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 5, 'Gunakan kasur pendingin, water circulating blankets, ice pack atau gel pad dan intravascular cooling catheterization untuk menurunkan suhu tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Terapeutik', 6, 'Sesuaikan suhu lingkungan dengan kebutuhan pasien'),
-- Edukasi
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Edukasi',    1, 'Jelaskan cara pencegahan heat exhaustion dan heat stroke'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Edukasi',    2, 'Jelaskan cara pencegahan hipotermia karena terpapar udara dingin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Edukasi',    3, 'Demontrasikan teknik perawatan metode kanguru (PMK) untuk bayi BBLR'),
-- Kolaborasi
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'), 'Kolaborasi', 1, 'Kolaborasi pemberian antipiretik, jika perlu');

-- ============================================================
-- 9. sdki_slki_relations
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));

-- ============================================================
-- 10. slki_siki_relations
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'));

SET FOREIGN_KEY_CHECKS = 1;
