-- ============================================
-- DATA MASTER BATCH 8: D.0081 – D.0090
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.09067', 'Citra Tubuh', 'Psikologis', 'Integritas Ego', 'Persepsi positif terhadap penampilan, struktur dan fungsi fisik.'),
('L.09068', 'Harapan', 'Psikologis', 'Integritas Ego', 'Ekspektasi positif terhadap masa depan.'),
('L.09069', 'Harga Diri', 'Psikologis', 'Integritas Ego', 'Perasaan positif terhadap diri sendiri atau kemampuan.'),
('L.09070', 'Identitas Diri', 'Psikologis', 'Integritas Ego', 'Kesadaran konsisten terhadap identitas diri yang unik.'),
('L.09076', 'Konsep Diri', 'Psikologis', 'Integritas Ego', 'Persepsi komprehensif tentang diri termasuk citra tubuh, harga diri dan identitas diri.'),
('L.09088', 'Status Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Perilaku anggota keluarga dalam mendukung dan membantu.'),
('L.09091', 'Status Spiritual', 'Psikologis', 'Integritas Ego', 'Koneksi dengan diri, orang lain, lingkungan atau kekuatan spiritual.'),
('L.09094', 'Tingkat Berduka', 'Psikologis', 'Integritas Ego', 'Proses adaptasi psikososial terhadap kehilangan.'),
('L.06048', 'Fungsi Sensori', 'Fisiologis', 'Neurosensori', 'Kemampuan menerima dan memproses stimulasi sensori.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.09067 Citra Tubuh
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09067', 1, 'Melihat bagian tubuh', 'Membaik'),
('L.09067', 2, 'Menyentuh bagian tubuh', 'Membaik'),
('L.09067', 3, 'Verbalisasi kecacatan bagian tubuh', 'Menurun'),
('L.09067', 4, 'Verbalisasi kehilangan', 'Menurun');

-- L.09068 Harapan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09068', 1, 'Keterlibatan dalam aktivitas perawatan', 'Meningkat'),
('L.09068', 2, 'Verbalisasi harapan', 'Meningkat'),
('L.09068', 3, 'Perencanaan masa depan', 'Meningkat');

-- L.09069 Harga Diri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09069', 1, 'Penilaian diri positif', 'Meningkat'),
('L.09069', 2, 'Perasaan memiliki kelebihan', 'Meningkat'),
('L.09069', 3, 'Penerimaan penilaian positif terhadap diri', 'Meningkat');

-- L.09070 Identitas Diri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09070', 1, 'Perilaku konsisten', 'Meningkat'),
('L.09070', 2, 'Perasaan fluktuatif terhadap diri', 'Menurun'),
('L.09070', 3, 'Persepsi terhadap diri', 'Membaik');

-- L.09076 Konsep Diri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09076', 1, 'Verbalisasi kepuasan terhadap diri', 'Meningkat'),
('L.09076', 2, 'Verbalisasi kepuasan terhadap harga diri', 'Meningkat'),
('L.09076', 3, 'Verbalisasi kepuasan terhadap penampilan peran', 'Meningkat');

-- L.09088 Status Koping Keluarga
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09088', 1, 'Kepuasan terhadap perilaku bantuan keluarga', 'Meningkat'),
('L.09088', 2, 'Dukungan emosional dari keluarga', 'Meningkat'),
('L.09088', 3, 'Partisipasi keluarga dalam perawatan', 'Meningkat');

-- L.09091 Status Spiritual
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09091', 1, 'Verbalisasi makna dan tujuan hidup', 'Meningkat'),
('L.09091', 2, 'Verbalisasi kepercayaan agama/spiritual', 'Meningkat'),
('L.09091', 3, 'Melakukan praktik spiritual', 'Meningkat');

-- L.09094 Tingkat Berduka
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.09094', 1, 'Verbalisasi menerima kehilangan', 'Membaik'),
('L.09094', 2, 'Verbalisasi perasaan sedih', 'Membaik'),
('L.09094', 3, 'Verbalisasi perasaan bersalah', 'Menurun'),
('L.09094', 4, 'Kemampuan melanjutkan aktivitas', 'Meningkat');

-- L.06048 Fungsi Sensori
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.06048', 1, 'Ketajaman pendengaran', 'Meningkat'),
('L.06048', 2, 'Ketajaman penglihatan', 'Meningkat'),
('L.06048', 3, 'Respons terhadap stimuli sensori', 'Membaik');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.09256', 'Dukungan Emosional', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Memfasilitasi penerimaan kondisi emosional selama masa stres.'),
('I.09260', 'Dukungan Koping Keluarga', 'Relasional', 'Peran dan Hubungan', 'Utama', 'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga.'),
('I.09274', 'Dukungan Proses Berduka', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Memfasilitasi proses adaptasi psikososial terhadap kehilangan.'),
('I.09276', 'Dukungan Spiritual', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Memfasilitasi peningkatan perasaan seimbang dan terhubung dengan kekuatan spiritual.'),
('I.09288', 'Manajemen Halusinasi', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Mengidentifikasi dan mengelola halusinasi untuk meningkatkan keamanan dan orientasi realita.'),
('I.09297', 'Orientasi Realita', 'Psikologis', 'Koping dan Toleransi Stress', 'Utama', 'Meningkatkan kesadaran terhadap identitas diri, waktu dan lingkungan.'),
('I.09305', 'Promosi Citra Tubuh', 'Psikologis', 'Koping dan Toleransi Stress', 'Pendukung', 'Meningkatkan perbaikan perubahan persepsi terhadap fisik.'),
('I.09308', 'Promosi Harga Diri', 'Psikologis', 'Koping dan Toleransi Stress', 'Pendukung', 'Meningkatkan penilaian perasaan/persepsi terhadap diri sendiri atau kemampuan.'),
('I.12463', 'Manajemen Perilaku', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Utama', 'Mengidentifikasi dan mengelola perilaku negatif.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.09256 Dukungan Emosional
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Observasi', 1, 'Identifikasi fungsi marah, frustasi dan amuk bagi pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Observasi', 2, 'Monitor perubahan emosi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 1, 'Dengarkan dengan aktif dan penuh perhatian'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 2, 'Validasi perasaan dan pengalaman emosional');

-- I.09260 Dukungan Koping Keluarga
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Observasi', 1, 'Identifikasi respons emosional terhadap kondisi saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Observasi', 2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 1, 'Fasilitasi komunikasi terbuka antar keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Edukasi', 1, 'Ajarkan cara mendukung anggota keluarga yang sakit');

-- I.09274 Dukungan Proses Berduka
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Observasi', 1, 'Identifikasi proses berduka yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Observasi', 2, 'Identifikasi keterikatan pada benda yang hilang atau orang yang meninggal'),
((SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 1, 'Dengarkan dan akui perasaan berduka'),
((SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 2, 'Fasilitasi ekspresi perasaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Edukasi', 1, 'Jelaskan tahap-tahap proses berduka');

-- I.09276 Dukungan Spiritual
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Observasi', 1, 'Identifikasi perasaan khawatir, kesepian dan ketidakberdayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Observasi', 2, 'Identifikasi pandangan tentang hubungan spiritual dan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 1, 'Fasilitasi praktik spiritual sesuai keyakinan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Edukasi', 1, 'Diskusikan makna dan tujuan hidup');

-- I.09288 Manajemen Halusinasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Observasi', 1, 'Monitor perilaku yang mengindikasikan halusinasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Observasi', 2, 'Monitor isi halusinasi (kekerasan atau membahayakan diri)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Terapeutik', 1, 'Pertahankan lingkungan yang aman'),
((SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Terapeutik', 2, 'Diskusikan perasaan dan respons terhadap halusinasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Edukasi', 1, 'Ajarkan monitoring tanda halusinasi');

-- I.09297 Orientasi Realita
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Observasi', 1, 'Monitor perubahan orientasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Observasi', 2, 'Monitor perubahan kognitif dan perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 1, 'Perkenalkan nama saat memulai interaksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 2, 'Orientasi orang, tempat dan waktu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Edukasi', 1, 'Ajarkan cara berorientasi dengan lingkungan');

-- I.09305 Promosi Citra Tubuh
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Observasi', 1, 'Identifikasi harapan citra tubuh berdasarkan tahap perkembangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Observasi', 2, 'Identifikasi budaya dan jenis kelamin terkait citra tubuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 1, 'Fasilitasi verbalisasi perasaan tentang perubahan tubuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Edukasi', 1, 'Ajarkan penerimaan dan adaptasi terhadap perubahan tubuh');

-- I.09308 Promosi Harga Diri
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Observasi', 1, 'Identifikasi budaya, agama, ras, jenis kelamin dan usia terkait harga diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Observasi', 2, 'Monitor verbalisasi yang merendahkan diri sendiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 1, 'Ajarkan identifikasi kekuatan dan kemampuan positif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Edukasi', 1, 'Bangun kepercayaan diri melalui pengakuan pencapaian');

-- I.12463 Manajemen Perilaku
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Observasi', 1, 'Identifikasi harapan untuk mengendalikan perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 1, 'Diskusikan tanggung jawab terhadap perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 2, 'Jadwalkan kegiatan terstruktur'),
((SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 3, 'Tingkatkan aktivitas fisik sesuai kemampuan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Edukasi', 1, 'Ajarkan strategi memodifikasi perilaku');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0081', 'Berduka', 'Psikologis', 'Integritas Ego', 'Aktual', 'Respon psikososial yang ditunjukkan oleh klien akibat kehilangan (orang, objek, fungsi, status, bagian tubuh atau hubungan).'),
('D.0082', 'Distres Spiritual', 'Psikologis', 'Integritas Ego', 'Aktual', 'Gangguan pada keyakinan atau sistem nilai berupa kesulitan merasakan makna dan tujuan hidup.'),
('D.0083', 'Gangguan Citra Tubuh', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perubahan persepsi tentang penampilan, struktur dan fungsi fisik individual.'),
('D.0084', 'Gangguan Identitas Diri', 'Psikologis', 'Integritas Ego', 'Aktual', 'Tidak mampu mempertahankan keutuhan persepsi terhadap identitas diri.'),
('D.0085', 'Gangguan Persepsi Sensori', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perubahan persepsi terhadap stimulasi baik internal maupun eksternal dengan respon berkurang atau berlebihan.'),
('D.0086', 'Harga Diri Rendah Kronis', 'Psikologis', 'Integritas Ego', 'Aktual', 'Evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan secara persisten.'),
('D.0087', 'Harga Diri Rendah Situasional', 'Psikologis', 'Integritas Ego', 'Aktual', 'Evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan sebagai respons terhadap situasi saat ini.'),
('D.0088', 'Keputusasaan', 'Psikologis', 'Integritas Ego', 'Aktual', 'Kondisi individu yang memandang adanya keterbatasan atau tidak tersedianya alternatif.'),
('D.0089', 'Kesiapan Peningkatan Konsep Diri', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola persepsi diri yang cukup untuk merasa sejahtera dan dapat ditingkatkan.'),
('D.0090', 'Kesiapan Peningkatan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola adaptasi anggota keluarga dalam mengatasi situasi yang dialami klien.');


-- ============================================
-- 6. SDKI PENYEBAB
-- ============================================

-- D.0082 Distres Spiritual (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0082'), 'Situasional', 1, 'Menjelang ajal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0082'), 'Situasional', 2, 'Kondisi penyakit kronis');

-- D.0083 Gangguan Citra Tubuh (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), 'Fisiologis', 1, 'Perubahan struktur/bentuk tubuh (amputasi, trauma, luka bakar, jerawat)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), 'Fisiologis', 2, 'Perubahan fungsi tubuh (penyakit, kehamilan, kelumpuhan)'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), 'Situasional', 1, 'Efek tindakan/pengobatan (pembedahan, kemoterapi)');

-- D.0084 Gangguan Identitas Diri (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0084'), 'Psikologis', 1, 'Gangguan peran sosial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0084'), 'Psikologis', 2, 'Tidak terpenuhinya tugas perkembangan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0084'), 'Fisiologis', 1, 'Gangguan neurologis');

-- D.0085 Gangguan Persepsi Sensori (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), 'Fisiologis', 1, 'Gangguan penglihatan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), 'Fisiologis', 2, 'Gangguan pendengaran'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), 'Fisiologis', 3, 'Hipoksia serebral'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), 'Situasional', 1, 'Penyalahgunaan zat');

-- D.0086 Harga Diri Rendah Kronis (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0086'), 'Psikologis', 1, 'Riwayat penolakan atau pengabaian'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0086'), 'Psikologis', 2, 'Kegagalan hidup berulang');

-- D.0087 Harga Diri Rendah Situasional (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), 'Situasional', 1, 'Perubahan pada citra tubuh'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), 'Situasional', 2, 'Perubahan peran sosial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), 'Situasional', 3, 'Kegagalan hidup'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), 'Situasional', 4, 'Riwayat kehilangan');

-- D.0088 Keputusasaan (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), 'Psikologis', 1, 'Persepsi ketidakberdayaan terhadap situasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), 'Psikologis', 2, 'Kehilangan harapan');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0081'), (SELECT id FROM slki WHERE kode_luaran='L.09094')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0082'), (SELECT id FROM slki WHERE kode_luaran='L.09091')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), (SELECT id FROM slki WHERE kode_luaran='L.09067')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0084'), (SELECT id FROM slki WHERE kode_luaran='L.09070')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), (SELECT id FROM slki WHERE kode_luaran='L.06048')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0086'), (SELECT id FROM slki WHERE kode_luaran='L.09069')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), (SELECT id FROM slki WHERE kode_luaran='L.09069')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), (SELECT id FROM slki WHERE kode_luaran='L.09068')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0089'), (SELECT id FROM slki WHERE kode_luaran='L.09076')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0090'), (SELECT id FROM slki WHERE kode_luaran='L.09088'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0081'), (SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0082'), (SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), (SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0084'), (SELECT id FROM siki WHERE kode_intervensi='I.09297'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), (SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0086'), (SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0087'), (SELECT id FROM siki WHERE kode_intervensi='I.12463'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), (SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0089'), (SELECT id FROM siki WHERE kode_intervensi='I.09308'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0090'), (SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Utama');


-- ============================================
-- 9. RASIONAL (Minimal)
-- ============================================

-- D.0081 ↔ I.09274
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0081'), (SELECT id FROM siki WHERE kode_intervensi='I.09274'), 'Observasi', 1, 'Untuk mengidentifikasi tahap proses berduka yang dialami');

-- D.0082 ↔ I.09276
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0082'), (SELECT id FROM siki WHERE kode_intervensi='I.09276'), 'Observasi', 1, 'Untuk mengidentifikasi kebutuhan spiritual pasien');

-- D.0083 ↔ I.09305
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0083'), (SELECT id FROM siki WHERE kode_intervensi='I.09305'), 'Observasi', 1, 'Untuk memahami persepsi pasien tentang perubahan tubuh');

-- D.0085 ↔ I.09288
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0085'), (SELECT id FROM siki WHERE kode_intervensi='I.09288'), 'Observasi', 1, 'Untuk mengidentifikasi jenis halusinasi dan pengaruhnya');

-- D.0088 ↔ I.09256
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), (SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Observasi', 1, 'Untuk memberikan dukungan emosional dan validasi perasaan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0088'), (SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 1, 'Untuk meningkatkan rasa aman dan dukungan');

SET FOREIGN_KEY_CHECKS = 1;
