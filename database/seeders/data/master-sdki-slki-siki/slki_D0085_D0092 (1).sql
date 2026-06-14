SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- SLKI: luaran_slki + slki_kriteria_hasil
-- Range: D.0085 – D.0092
-- Sumber: PDF batch 2, halaman 416–451
-- ============================================================

-- ============================================================
-- 1. luaran_slki (master)
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.06048', 'Fungsi Sensori',        'Psikologis', 'Integritas Ego', 'Kemampuan untuk menerima dan menginterpretasikan stimulus internal maupun eksternal melalui indera.'),
('L.09069', 'Harga Diri',            'Psikologis', 'Integritas Ego', 'Perasaan positif terhadap diri sendiri atau kemampuan sebagai respon terhadap situasi saat ini.'),
('L.09068', 'Harapan',               'Psikologis', 'Integritas Ego', 'Ekspektasi positif terhadap diri sendiri dan masa depan yang dapat ditingkatkan.'),
('L.09076', 'Konsep Diri',           'Psikologis', 'Integritas Ego', 'Persepsi individu tentang diri sendiri yang mencakup harga diri, penampilan peran, citra tubuh, dan identitas pribadi.'),
('L.09088', 'Status Koping Keluarga','Psikologis', 'Integritas Ego', 'Perilaku anggota keluarga dalam mendukung, memberi rasa nyaman, membantu, dan memotivasi anggota keluarga lain yang sakit terhadap kemampuan beradaptasi, mengelola, dan mengatasi masalah kesehatan.'),
('L.09089', 'Status Koping Komunitas','Psikologis','Integritas Ego', 'Pola adaptasi aktivitas komunitas dan penyelesaian masalah yang memuaskan untuk memenuhi tuntutan kebutuhan masyarakat.'),
('L.09071', 'Keberdayaan',           'Psikologis', 'Integritas Ego', 'Kapasitas individu untuk berpartisipasi aktif dalam pengambilan keputusan dan pelaksanaan aktivitas perawatan diri.');

-- ============================================================
-- 2. slki_kriteria_hasil
-- ============================================================

-- L.06048 Fungsi Sensori → D.0085 Gangguan Persepsi Sensori (Pendengaran)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06048'), 1, 'Ketajaman pendengaran', 'Meningkat');

-- L.09069 Harga Diri → D.0086 Harga Diri Rendah Kronis & D.0087 Harga Diri Rendah Situasional
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 1,  'Penilaian diri positif',                             'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 2,  'Perasaan memiliki kelebihan atau kemampuan positif',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 3,  'Penerimaan penilaian positif terhadap diri sendiri',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 4,  'Minat mencoba hal baru',                              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 5,  'Berjalan menampakkan wajah',                          'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 6,  'Postur tubuh menampakkan wajah',                      'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 7,  'Konsentrasi',                                         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 8,  'Tidur',                                               'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 9,  'Kontak mata',                                         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 10, 'Gairah aktivitas',                                    'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 11, 'Perilaku asertif',                                    'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 12, 'Kemampuan membuat keputusan',                         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 13, 'Perasaan malu',                                       'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 14, 'Perasaan bersalah',                                   'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 15, 'Perasaan tidak mampu melakukan apapun',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 16, 'Meremehkan kemampuan mengatasi masalah',              'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 17, 'Ketergantungan pada penguatan secara berlebihan',     'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 18, 'Pencarian penguatan secara berlebihan',               'Menurun');

-- L.09068 Harapan → D.0088 Keputusasaan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09068'), 1, 'Keterlibatan dalam aktivitas perawatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09068'), 2, 'Verbalisasi keputusasaan',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09068'), 3, 'Perilaku pasif',                         'Menurun');

-- L.09076 Konsep Diri → D.0089 Kesiapan Peningkatan Konsep Diri
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 1, 'Verbalisasi kepuasan terhadap diri',              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 2, 'Verbalisasi kepuasan terhadap harga diri',        'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 3, 'Verbalisasi kepuasan terhadap penampilan peran',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 4, 'Verbalisasi kepuasan terhadap citra tubuh',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), 5, 'Verbalisasi kepuasan terhadap identitas diri',    'Meningkat');

-- L.09088 Status Koping Keluarga → D.0090 Kesiapan Peningkatan Koping Keluarga
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 1,  'Kepuasan terhadap perilaku bantuan anggota keluarga', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 2,  'Keterpaparan informasi',                              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 3,  'Komitmen pada perawatan/pengobatan',                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 4,  'Komunikasi antara anggota keluarga',                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 5,  'Kemampuan memenuhi kebutuhan anggota keluarga',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 6,  'Toleransi',                                           'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 7,  'Perilaku bertujuan',                                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 8,  'Perilaku sehat',                                      'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 9,  'Perasaan diabaikan',                                  'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 10, 'Kekhawatiran tentang anggota keluarga',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 11, 'Perilaku mengabaikan anggota keluarga',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 12, 'Perasaan tertekan (depresi)',                         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 13, 'Perilaku agresif',                                    'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 14, 'Perilaku bermusuhan',                                 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 15, 'Perilaku individualistik',                            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 16, 'Ketergantungan pada anggota keluarga lain',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 17, 'Perilaku overprotektif',                              'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 18, 'Perilaku menolak perawatan',                          'Menurun');

-- L.09089 Status Koping Komunitas → D.0091 Kesiapan Peningkatan Koping Komunitas
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 1, 'Keberdayaan komunitas',                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 2, 'Perencanaan komunitas',                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 3, 'Insiden masalah kesehatan dalam komunitas', 'Menurun');

-- L.09071 Keberdayaan → D.0092 Ketidakberdayaan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), 1, 'Verbalisasi mampu melaksanakan aktivitas',                  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), 2, 'Verbalisasi frustasi kebergantungan pada orang lain',       'Menurun');

-- ============================================================
-- 3. sdki_slki_relations
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.06048')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09068')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09088')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09089')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'));

SET FOREIGN_KEY_CHECKS = 1;
