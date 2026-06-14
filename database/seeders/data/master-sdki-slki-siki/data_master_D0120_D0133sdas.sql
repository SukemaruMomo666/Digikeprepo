SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- DATA MASTER: SDKI + SLKI + SIKI
-- Range: D.0120 – D.0133
-- Sumber: PDF sdki-slki-siki__2___1_-101-150.pdf
-- Generated: 2026-06-14
-- ============================================================

-- ============================================================
-- 1. LUARAN SLKI (baru)
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.13119', 'Penampilan Peran',    'Relasional', 'Interaksi Sosial', 'Pola perilaku yang sesuai dengan harapan, norma, dan lingkungan.'),
('L.13120', 'Peran Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Kemampuan orang tua memberi lingkungan bagi anak atau anggota keluarga yang cukup untuk memfasilitasi pertumbuhan dan perkembangan.'),
('L.13121', 'Peran Pemberi Asuhan', 'Relasional', 'Interaksi Sosial', 'Kemampuan berperan memberikan asuhan dalam keluarga.'),
('L.13122', 'Perlekatan',          'Relasional', 'Interaksi Sosial', 'Ikatan emosional antara orang tua/orang terdekat dengan bayi/anak yang mendukung proses asah, asih, dan asuh.'),
('L.13123', 'Proses Keluarga',     'Relasional', 'Interaksi Sosial', 'Kemampuan untuk berubah dalam hubungan atau fungsi keluarga.'),
('L.13124', 'Proses Pengasuhan',   'Relasional', 'Interaksi Sosial', 'Kemampuan menerima proses kehamilan, persalinan dan setelah melahirkan termasuk perawatan bayi baru lahir yang sesuai dengan konteks norma dan harapan.'),
('L.14129', 'Pemulihan Pascabedah','Lingkungan',  'Keamanan dan Proteksi', 'Tingkat peningkatan kemampuan untuk memulihkan diri dan melanjutkan aktivitas sehari-hari setelah prosedur pembedahan.');

-- ============================================================
-- 2. KRITERIA HASIL SLKI
-- ============================================================

-- L.13116 Keterlibatan Sosial → D.0121 (sudah ada di DB, tidak di-insert ulang)
-- L.13123 Proses Keluarga → D.0120, D.0123
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'), 1, 'Adaptasi keluarga terhadap situasi',                          'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'), 2, 'Kemampuan keluarga berkomunikasi secara terbuka antar anggota', 'Meningkat');

-- L.13120 Peran Menjadi Orang Tua → D.0122, D.0126
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 1, 'Bounding attachment',              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 2, 'Perilaku positif menjadi orang tua','Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 3, 'Interaksi perawatan bayi',         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 4, 'Verbalisasi kepuasan memiliki bayi','Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 5, 'Kebutuhan fisik anak/anggota keluarga terpenuhi',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 6, 'Kebutuhan emosi anak/anggota keluarga terpenuhi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), 7, 'Keinginan meningkatkan peran menjadi orang tua',  'Meningkat');

-- L.13121 Peran Pemberi Asuhan → D.0124
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'), 1, 'Kemampuan memberi asuhan',         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'), 2, 'Kemampuan merawat pasien',         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'), 3, 'Kekhawatiran dirawat kembali',     'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'), 4, 'Kekhawatiran kelanjutan perawatan','Menurun');

-- L.13119 Penampilan Peran → D.0125
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'), 1, 'Verbalisasi harapan terpenuhi',                 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'), 2, 'Verbalisasi kepuasan peran',                    'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'), 3, 'Verbalisasi perasaan bingung menjalankan peran','Menurun');

-- L.13122 Perlekatan → D.0127
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 1,  'Mempraktikan perilaku sehat selama hamil',        'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 2,  'Menyiapkan perlengkapan bayi sebelum kelahiran',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 3,  'Verbalisasi perasaan positif terhadap bayi',      'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 4,  'Mencium bayi',                                    'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 5,  'Melakukan kontak mata dengan bayi',               'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 6,  'Berbicara dengan bayi',                           'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 7,  'Bermain dengan bayi',                             'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 8,  'Berespons dengan isyarat bayi',                   'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 9,  'Kekhawatiran menjalankan peran orang tua',        'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), 10, 'Konflik hubungan orang tua dan bayi/anak',        'Menurun');

-- L.13124 Proses Pengasuhan → D.0128
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13124'), 1, 'Terpapar informasi tentang proses persalinan/pengasuhan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13124'), 2, 'Kekerasan dalam rumah tangga',                            'Menurun');

-- L.14125 Integritas Kulit dan Jaringan → D.0129 (SUDAH ADA di DB, kriteria hasil sudah ada)
-- L.14134 Termoregulasi → D.0130, D.0131 (SUDAH ADA di DB, kriteria hasil sudah ada)
-- L.09076 Kontrol Diri → D.0132 (SUDAH ADA di DB)
-- L.14129 Pemulihan Pascabedah → D.0133
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 1, 'Kenyamanan',                       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 2, 'Kemampuan melanjutkan pekerjaan',  'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), 3, 'Kondisi area luka operasi',        'Membaik');

-- ============================================================
-- 3. INTERVENSI SIKI (baru)
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.09260', 'Dukungan Koping Keluarga',        'Psikologis',  'Integritas Ego',    'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga.'),
('I.13496', 'Promosi Proses Efektif Keluarga', 'Relasional',  'Interaksi Sosial',  'Melakukan tindakan untuk mempertahankan dan meningkatkan proses dalam keluarga.'),
('I.09322', 'Terapi Keluarga',                 'Psikologis',  'Integritas Ego',    'Menggunakan anggota keluarga untuk menggerakkan keluarga menggunakan cara hidup yang lebih produktif.'),
('I.13498', 'Promosi Sosialisasi',             'Relasional',  'Interaksi Sosial',  'Meningkatkan kemampuan untuk berinteraksi dengan orang lain.'),
('I.12466', 'Promosi Antisipasi Keluarga',     'Perilaku',    'Penyuluhan dan Pembelajaran', 'Meningkatkan kesiapan keluarga untuk mencegah perkembangan atau krisis situasi akibat masalah kesehatan.'),
('I.13490', 'Promosi Keutuhan Keluarga',       'Relasional',  'Interaksi Sosial',  'Meningkatkan pengetahuan dan kemampuan pasien untuk menjaga dan meningkatkan kerekatan dan keutuhan keluarga.'),
('I.13478', 'Dukungan Penampilan Peran',       'Relasional',  'Interaksi Sosial',  'Memfasilitasi pasien dan keluarga untuk memperbaiki hubungan dengan mengklarifikasi dan memenuhi perilaku peran tertentu.'),
('I.12402', 'Edukasi Pada Pengasuh',           'Perilaku',    'Penyuluhan dan Pembelajaran', 'Memberikan informasi dan dukungan untuk memfasilitasi pemberian perawatan oleh pengasuh.'),
('I.10342', 'Promosi Perlekatan',              'Fisiologis',  'Reproduksi',        'Meningkatkan dan mempertahankan perlekatan atau latch on secara tepat.'),
('I.15506', 'Manajemen Hipertermia',           'Lingkungan',  'Keamanan dan Proteksi', 'Mengidentifikasi dan mengelola peningkatan suhu tubuh akibat disfungsi termoregulasi.'),
('I.14507', 'Manajemen Hipotermia',            'Lingkungan',  'Keamanan dan Proteksi', 'Mengidentifikasi dan mengelola suhu tubuh di bawah rentang normal.'),
('I.12403', 'Manajemen Perilaku',              'Psikologis',  'Integritas Ego',    'Mengidentifikasi dan mengelola perilaku negatif.'),
('I.08238', 'Manajemen Nyeri',                 'Fisiologis',  'Nyeri dan Kenyamanan', 'Mengidentifikasi dan mengelola pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional.');

-- ============================================================
-- 4. TINDAKAN SIKI
-- ============================================================

-- I.09260 Dukungan Koping Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   1, 'Identifikasi respons emosional terhadap kondisi saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   3, 'Identifikasi pemahaman tentang keputusan perawatan setelah pulang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   4, 'Identifikasi kesesuaian antara harapan pasien, keluarga, dan tenaga kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  1, 'Dengarkan masalah, perasaan, dan pernyataan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  2, 'Terima nilai-nilai keluarga dengan cara yang tidak menghakimi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  3, 'Diskusikan rencana medis dan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  4, 'Fasilitasi pengungkapan perasaan antara pasien dan keluarga atau antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  5, 'Fasilitasi pengambilan keputusan dalam merencanakan perawatan jangka panjang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  6, 'Fasilitasi anggota keluarga dalam mengidentifikasi dan menyelesaikan konflik nilai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  7, 'Fasilitasi pemenuhan kebutuhan dasar keluarga (mis. tempat tinggal, makanan, pakaian)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  8, 'Fasilitasi anggota keluarga melalui proses kematian dan berduka, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  9, 'Fasilitasi memperoleh pengetahuan, keterampilan, dan peralatan yang diperlukan untuk mempertahankan keputusan perawatan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 10, 'Hargai dan dukung mekanisme koping adaptif yang digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 11, 'Berikan kesempatan berkunjung bagi anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi',     1, 'Informasikan kemajuan pasien secara berkala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi',     2, 'Informasikan fasilitas perawatan kesehatan yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Kolaborasi',  1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.13496 Promosi Proses Efektif Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Observasi',  1, 'Identifikasi tipe proses keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Observasi',  2, 'Identifikasi masalah atau gangguan dalam proses keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Observasi',  3, 'Identifikasi kebutuhan perawatan mandiri di rumah untuk klien dan tetap beradaptasi dengan pola hidup keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Terapeutik', 1, 'Pertahankan interaksi yang berkelanjutan dengan anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Terapeutik', 2, 'Motivasi anggota keluarga untuk melakukan aktivitas bersama seperti makan bersama, diskusi bersama keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Terapeutik', 3, 'Fasilitasi anggota keluarga melakukan kunjungan rumah sakit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Terapeutik', 4, 'Susun jadwal aktivitas perawatan mandiri di rumah untuk mengurangi gangguan rutinitas keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Edukasi',    1, 'Jelaskan strategi mengembalikan kehidupan yang normal kepada anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Edukasi',    2, 'Diskusikan dukungan sosial dari sekitar keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'), 'Edukasi',    3, 'Latih keluarga manajemen waktu jika perawatan di rumah dibutuhkan');

-- I.09322 Terapi Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  1, 'Identifikasi riwayat kesehatan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  2, 'Identifikasi pola komunikasi keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  3, 'Identifikasi cara keluarga memecahkan masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  4, 'Identifikasi pembuatan keputusan dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  5, 'Identifikasi terjadinya pelecehan dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  6, 'Identifikasi kekuatan/sumber daya keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  7, 'Identifikasi peran setiap anggota keluarga dalam sistem keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  8, 'Identifikasi gangguan spesifik terkait harapan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi',  9, 'Identifikasi penyalahgunaan zat pada anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 10, 'Identifikasi penengah dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 11, 'Identifikasi ketidakpuasan dan/atau konflik yang terjadi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 12, 'Identifikasi kejadian saat ini atau akan terjadi yang mengancam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 13, 'Identifikasi kebutuhan dan harapan dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 14, 'Identifikasi hubungan hierarkis anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Observasi', 15, 'Monitor respons merugikan terhadap terapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 1, 'Fasilitasi diskusi keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 2, 'Fasilitasi strategi menurunkan stres'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 3, 'Fasilitasi restrukturisasi sistem keluarga, jika sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 4, 'Diskusikan cara terbaik dalam menangani disfungsi perilaku dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 5, 'Diskusikan batasan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 6, 'Diskusikan strategi penyelesaian masalah yang konstruktif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 7, 'Diskusikan rencana terapi dengan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 8, 'Diskusikan cara membudayakan perilaku baru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Terapeutik', 9, 'Rencanakan strategi menghentikan terapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Edukasi',    1, 'Anjurkan berkomunikasi lebih efektif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Edukasi',    2, 'Anjurkan anggota memprioritaskan dan memilih masalah keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Edukasi',    3, 'Anjurkan semua anggota keluarga berpartisipasi dalam pekerjaan rumah tangga bersama-sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'), 'Edukasi',    4, 'Anjurkan mengubah cara berhubungan dengan anggota keluarga lain');

-- I.13498 Promosi Sosialisasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Observasi',  1, 'Identifikasi kemampuan melakukan interaksi dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Observasi',  2, 'Identifikasi hambatan melakukan interaksi dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 1, 'Motivasi meningkatkan keterlibatan dalam suatu hubungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 2, 'Motivasi kesabaran dalam mengembangkan suatu hubungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 3, 'Motivasi berpartisipasi dalam aktivitas baru dan kegiatan kelompok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 4, 'Motivasi berinteraksi di luar lingkungan (mis. jalan-jalan, ke toko buku)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 5, 'Diskusikan kekuatan dan keterbatasan dalam berkomunikasi dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 6, 'Diskusikan perencanaan kegiatan di masa depan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 7, 'Berikan umpan balik positif dalam perawatan diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Terapeutik', 8, 'Berikan umpan balik positif pada setiap peningkatan kemampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    1, 'Anjurkan berinteraksi dengan orang lain secara bertahap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    2, 'Anjurkan ikut serta kegiatan sosial dan kemasyarakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    3, 'Anjurkan berbagi pengalaman dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    4, 'Anjurkan meningkatkan kejujuran diri dan menghormati hak orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    5, 'Anjurkan penggunaan alat bantu (mis. kacamata dan alat bantu dengar)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    6, 'Anjurkan membuat perencanaan kelompok kecil untuk kegiatan khusus'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    7, 'Latih bermain peran untuk meningkatkan keterampilan komunikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Edukasi',    8, 'Latih mengekspresikan marah dengan tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Kolaborasi', 1, 'Kolaborasi dengan terapis okupasi dalam merencanakan dan memonitor program aktivitas, jika sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'), 'Kolaborasi', 2, 'Rujuk pada pusat atau program aktivitas komunitas, jika perlu');

-- I.12466 Promosi Antisipasi Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Observasi',  1, 'Identifikasi kemungkinan krisis situasi atau masalah perkembangan serta dampaknya pada kehidupan pasien dan keluarganya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Observasi',  2, 'Identifikasi metode pemecahan masalah yang sering digunakan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Terapeutik', 1, 'Fasilitasi dalam memutuskan strategi pemecahan masalah yang dihadapi keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Terapeutik', 2, 'Libatkan seluruh anggota keluarga dalam upaya antisipasi masalah kesehatan, jika memungkinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Terapeutik', 3, 'Lakukan kunjungan kepada keluarga secara berkala, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Terapeutik', 4, 'Buat jadwal aktivitas bersama keluarga terkait masalah kesehatan yang dihadapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Edukasi',    1, 'Jelaskan perkembangan perilaku yang normal kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'), 'Kolaborasi', 1, 'Kerjasama dengan tenaga kesehatan terkait lainnya, jika perlu');

-- I.13490 Promosi Keutuhan Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi',  1, 'Identifikasi pemahaman keluarga terhadap masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi',  2, 'Identifikasi adanya konflik prioritas antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi',  3, 'Identifikasi mekanisme koping keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi',  4, 'Monitor hubungan antara anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 1, 'Hargai privasi keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 2, 'Fasilitasi kunjungan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 3, 'Fasilitasi keluarga melakukan pengambilan keputusan dan pemecahan masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 4, 'Fasilitasi komunikasi terbuka antar setiap anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Edukasi',    1, 'Informasikan kondisi pasien secara berkala kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Edukasi',    2, 'Anjurkan anggota keluarga mempertahankan keharmonisan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Kolaborasi', 1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.13478 Dukungan Penampilan Peran
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi',  1, 'Identifikasi berbagai peran dan periode transisi sesuai tingkat perkembangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi',  2, 'Identifikasi peran yang ada dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi',  3, 'Identifikasi adanya peran yang tidak terpenuhi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 1, 'Fasilitasi adaptasi peran keluarga terhadap perubahan peran yang tidak diinginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 2, 'Fasilitasi bermain peran dalam mengantisipasi reaksi orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 3, 'Fasilitasi diskusi perubahan peran anak terhadap bayi baru lahir, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 4, 'Fasilitasi diskusi tentang peran orang tua, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 5, 'Fasilitasi diskusi tentang adaptasi peran saat anak meninggalkan rumah, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 6, 'Fasilitasi diskusi harapan dengan keluarga dalam peran timbal balik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi',    1, 'Diskusikan perilaku yang dibutuhkan untuk pengembangan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi',    2, 'Diskusikan perubahan peran yang diperlukan akibat penyakit atau ketidakmampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi',    3, 'Diskusikan perubahan peran dalam menerima ketergantungan orang tua'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi',    4, 'Diskusikan strategi positif untuk mengelola perubahan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi',    5, 'Ajarkan perilaku baru yang dibutuhkan oleh pasien/orang tua untuk memenuhi peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Kolaborasi', 1, 'Rujuk dalam kelompok untuk mempelajari peran baru');

-- I.12402 Edukasi Pada Pengasuh
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Observasi',  1, 'Identifikasi pemahaman dan kesiapan peran pengasuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Observasi',  2, 'Identifikasi sumber dukungan dan kebutuhan istirahat pengasuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Terapeutik', 1, 'Berikan dukungan pada pengasuh selama pasien mengalami kemunduran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Terapeutik', 2, 'Dukung keterbatasan pengasuh dan diskusikan dengan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Terapeutik', 3, 'Fasilitasi pengasuh untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Edukasi',    1, 'Jelaskan dampak ketergantungan anak pada pengasuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Edukasi',    2, 'Ajarkan pengasuh mengeksplorasi kekuatan dan kelemahannya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'), 'Edukasi',    3, 'Ajarkan pengasuh cara memberikan dukungan perawatan diri (mis. mandi, BAB/BAK, berpakaian, makan/minum)');

-- I.10342 Promosi Perlekatan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Observasi',  1, 'Monitor kegiatan menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Observasi',  2, 'Identifikasi kemampuan bayi mengisap dan menelan ASI'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Observasi',  3, 'Identifikasi payudara ibu (mis. bengkak, putting lecet, mastitis, nyeri pada payudara)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Observasi',  4, 'Monitor perlekatan saat menyusui (mis. aerola bagian bawah lebih kecil daripada aerola bagian atas, mulut bayi terbuka lebar, bibir bayi terputar keluar, dagu bayi menempel pada payudara ibu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Terapeutik', 1, 'Hindari memegang kepala bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Terapeutik', 2, 'Diskusikan dengan ibu masalah selama proses menyusui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    1, 'Ajarkan ibu menopang seluruh tubuh bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    2, 'Anjurkan ibu melepas pakaian bagian atas agar bayi dapat menyentuh payudara ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    3, 'Anjurkan bayi mendekati ke arah payudara ibu dari bagian bawah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    4, 'Anjurkan ibu memegang payudara menggunakan jarinya seperti huruf "C" pada posisi jam 12-6 atau 3-9 saat mengarahkan ke mulut bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    5, 'Anjurkan ibu menyusui menunggu mulut bayi terbuka lebar sehingga aerola bagian bawah dapat masuk sempurna'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    6, 'Anjurkan ibu mengenali tanda bayi siap menyusu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    7, 'Ajarkan 4 posisi menyusui dan perlekatan (latch on) dengan benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'), 'Edukasi',    8, 'Ajarkan perawatan payudara antepartum dengan mengkompres dengan kapas yang telah diberi minyak kelapa');

-- I.15506 Manajemen Hipertermia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Observasi',  1, 'Identifikasi penyebab hipertermia (mis. dehidrasi, terpapar lingkungan panas, penggunaan inkubator)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Observasi',  2, 'Monitor suhu tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Observasi',  3, 'Monitor kadar elektrolit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Observasi',  4, 'Monitor haluaran urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Observasi',  5, 'Monitor komplikasi akibat hipertermia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 1, 'Sediakan lingkungan yang dingin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 2, 'Longgarkan atau lepaskan pakaian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 3, 'Basahi dan kipasi permukaan tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 4, 'Berikan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 5, 'Ganti linen setiap hari atau lebih sering jika mengalami hiperhidrosis (keringat berlebih)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 6, 'Lakukan pendinginan eksternal (mis. selimut hipotermia atau kompres dingin pada dahi, leher, dada, abdomen, aksila)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 7, 'Hindari pemberian antipiretik atau aspirin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Terapeutik', 8, 'Berikan oksigen, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Edukasi',    1, 'Anjurkan tirah baring'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'), 'Kolaborasi', 1, 'Kolaborasi pemberian cairan dan elektrolit intravena, jika perlu');

-- I.14507 Manajemen Hipotermia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi',  1, 'Monitor suhu tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi',  2, 'Identifikasi penyebab hipotermia (mis. terpapar suhu lingkungan rendah, pakaian tipis, kerusakan hipotalamus, penurunan laju metabolisme, kekurangan lemak subkutan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Observasi',  3, 'Monitor tanda dan gejala akibat hipotermia (hipotermia ringan: takipnea, disatria, menggigil, hipertensi, diuresis; hipotermia sedang: aritmia, hipotensi, apatis, koagulopati, refleks menurun; hipotermia berat: oliguria, refleks menghilang, edema paru, asam-basa abnormal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 1, 'Sediakan lingkungan yang hangat (mis. atur suhu ruangan, inkubator)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Terapeutik', 2, 'Lakukan penghangatan aktif eksternal (mis. kompres hangat, botol hangat, selimut hangat, perawatan metode kanguru)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'), 'Edukasi',    1, 'Anjurkan makan/minum hangat');

-- I.12403 Manajemen Perilaku
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Observasi',  1, 'Identifikasi harapan untuk mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 1, 'Diskusikan tanggung jawab terhadap perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 2, 'Jadwalkan kegiatan terstruktur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 3, 'Ciptakan dan pertahankan lingkungan dan kegiatan perawatan konsisten setiap dinas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 4, 'Tingkatkan aktivitas fisik sesuai kemampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 5, 'Batasi jumlah pengunjung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 6, 'Bicara dengan nada rendah dan tenang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 7, 'Lakukan kegiatan pengalihan terhadap sumber agitasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 8, 'Cegah perilaku pasif dan agresif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik', 9, 'Beri penguatan positif terhadap keberhasilan mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik',10, 'Lakukan pengekangan fisik sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik',11, 'Hindari bersikap menyudutkan dan menghentikan pembicaraan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik',12, 'Hindari sikap mengancam dan berdebat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Terapeutik',13, 'Hindari berdebat atau menawar batas perilaku yang telah ditetapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'), 'Edukasi',    1, 'Informasikan keluarga bahwa keluarga sebagai dasar pembentukan kognitif');

-- I.08238 Manajemen Nyeri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  1, 'Identifikasi lokasi, karakteristik, durasi, frekuensi, kualitas, intensitas nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  2, 'Identifikasi skala nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  3, 'Identifikasi respons nyeri non verbal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  4, 'Identifikasi faktor yang memperberat dan memperingan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  5, 'Identifikasi pengetahuan dan keyakinan tentang nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  6, 'Identifikasi pengaruh budaya terhadap respon nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  7, 'Identifikasi pengaruh nyeri pada kualitas hidup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  8, 'Monitor keberhasilan terapi komplementer yang sudah diberikan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi',  9, 'Monitor efek samping penggunaan analgetik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 1, 'Berikan teknik nonfarmakologis untuk mengurangi rasa nyeri (mis. TENS, hipnosis, akupresur, terapi musik, biofeedback, terapi pijat, aromaterapi, teknik imajinasi terbimbing, kompres hangat/dingin, terapi bermain)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 2, 'Kontrol lingkungan yang memperberat rasa nyeri (mis. suhu ruangan, pencahayaan, kebisingan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 3, 'Fasilitasi istirahat dan tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 4, 'Pertimbangkan jenis dan sumber nyeri dalam pemilihan strategi meredakan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi',    1, 'Jelaskan penyebab, periode, dan pemicu nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi',    2, 'Jelaskan strategi meredakan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi',    3, 'Anjurkan memonitor nyeri secara mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi',    4, 'Anjurkan menggunakan analgetik secara tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi',    5, 'Ajarkan teknik nonfarmakologis untuk mengurangi rasa nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgetik, jika perlu');

-- ============================================================
-- 5. DIAGNOSA SDKI
-- ============================================================

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0120', 'Gangguan Proses Keluarga',                   'Relasional', 'Interaksi Sosial', 'Aktual',            'Perubahan dalam hubungan atau fungsi keluarga.'),
('D.0121', 'Isolasi Sosial',                             'Relasional', 'Interaksi Sosial', 'Aktual',            'Ketidakmampuan untuk membina hubungan yang erat, hangat, terbuka, dan interdependen dengan orang lain.'),
('D.0122', 'Kesiapan Peningkatan Menjadi Orang Tua',     'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan', 'Pola pemberian lingkungan bagi anak atau anggota keluarga yang cukup untuk memfasilitasi pertumbuhan dan perkembangan serta dapat ditingkatkan.'),
('D.0123', 'Kesiapan Peningkatan Proses Keluarga',       'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan', 'Pola fungsi keluarga yang cukup untuk mendukung kesejahteraan anggota keluarga dan dapat ditingkatkan.'),
('D.0124', 'Ketegangan Peran Pemberian Asuhan',          'Relasional', 'Interaksi Sosial', 'Aktual',            'Kesulitan dalam melakukan peran pemberi asuhan dalam keluarga.'),
('D.0125', 'Penampilan Peran Tidak Efektif',             'Relasional', 'Interaksi Sosial', 'Aktual',            'Pola perilaku yang berubah atau tidak sesuai dengan harapan, norma, dan lingkungan.'),
('D.0126', 'Pencapaian Peran Menjadi Orang Tua',         'Relasional', 'Interaksi Sosial', 'Aktual',            'Terjadinya proses interaktif antar anggota keluarga (suami-istri, anggota keluarga dan bayi) yang ditunjukkan dengan perkembangan bayi yang optimal.'),
('D.0127', 'Risiko Gangguan Perlekatan',                 'Relasional', 'Interaksi Sosial', 'Risiko',            'Berisiko mengalami gangguan interaksi antara orang tua atau orang terdekat dengan bayi/anak yang dapat mempengaruhi proses asah, asih, dan asuh.'),
('D.0128', 'Risiko Proses Pengasuhan Tidak Efektif',     'Relasional', 'Interaksi Sosial', 'Risiko',            'Berisiko mengalami proses kehamilan, persalinan dan setelah melahirkan termasuk perawatan bayi baru lahir yang tidak sesuai dengan konteks norma dan harapan.'),
('D.0129', 'Gangguan Integritas Kulit/Jaringan',         'Lingkungan', 'Keamanan dan Proteksi', 'Aktual',       'Kerusakan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan/atau ligamen).'),
('D.0130', 'Hipertermia',                                'Lingkungan', 'Keamanan dan Proteksi', 'Aktual',       'Suhu tubuh meningkat di atas rentang normal tubuh.'),
('D.0131', 'Hipotermia',                                 'Lingkungan', 'Keamanan dan Proteksi', 'Aktual',       'Suhu tubuh berada di bawah rentang normal tubuh.'),
('D.0132', 'Perilaku Kekerasan',                         'Lingkungan', 'Keamanan dan Proteksi', 'Aktual',       'Kemarahan yang diekspresikan secara berlebihan dan tidak terkendali secara verbal sampai dengan mencederai orang lain dan merusak lingkungan.'),
('D.0133', 'Perlambatan Pemulihan Pascabedah',           'Lingkungan', 'Keamanan dan Proteksi', 'Aktual',       'Pemanjangan jumlah hari pascabedah untuk memulai dan melakukan aktivitas sehari-hari.');

-- ============================================================
-- 6. SDKI PENYEBAB
-- ============================================================

-- D.0120 Gangguan Proses Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 1,  'Perubahan status kesehatan anggota keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 2,  'Perubahan finansial keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 3,  'Perubahan status sosial keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 4,  'Perubahan interaksi dengan masyarakat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 5,  'Krisis perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 6,  'Transisi perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 7,  'Peralihan pengambilan keputusan dalam keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 8,  'Perubahan peran keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 9,  'Krisis situasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Situasional', 10, 'Transisi situasional');

-- D.0121 Isolasi Sosial
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Psikologis',  1, 'Keterlambatan perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Psikologis',  2, 'Ketidakmampuan menjalin hubungan yang memuaskan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Situasional', 3, 'Ketidaksesuaian minat dengan tahap perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Situasional', 4, 'Ketidaksesuaian nilai-nilai dengan norma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Situasional', 5, 'Ketidaksesuaian perilaku sosial dengan norma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Fisiologis',  6, 'Perubahan penampilan fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Psikologis',  7, 'Perubahan status mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Psikologis',  8, 'Ketidakadekuatan sumber daya personal (mis. disfungsi berduka, pengendalian diri buruk)');

-- D.0124 Ketegangan Peran Pemberian Asuhan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 1, 'Beratnya penyakit penerima asuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 2, 'Kronisnya penyakit penerima asuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 3, 'Pemberi asuhan kurang mendapatkan waktu istirahat dan rekreasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 4, 'Persaingan komitmen peran pemberi asuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 5, 'Ketidakadekuatan lingkungan fisik dalam pemberian asuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 6, 'Keluarga atau pemberi asuhan jauh dari kerabat lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Situasional', 7, 'Kompleksitas dan jumlah aktivitas pemberian asuhan');

-- D.0125 Penampilan Peran Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Psikologis',  1, 'Harapan peran tidak realistis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Fisiologis',  2, 'Hambatan fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Psikologis',  3, 'Harga diri rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Psikologis',  4, 'Perubahan citra tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Situasional', 5, 'Ketidakadekuatan sistem pendukung (support system)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Psikologis',  6, 'Stres'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Situasional', 7, 'Perubahan peran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Situasional', 8, 'Faktor ekonomi');

-- D.0129 Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  1,  'Perubahan sirkulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  2,  'Perubahan status nutrisi (kelebihan atau kekurangan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  3,  'Kekurangan/kelebihan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  4,  'Penurunan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Situasional', 5,  'Bahan kimia iritatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Situasional', 6,  'Suhu lingkungan yang ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Situasional', 7,  'Faktor mekanis (mis. penekanan pada tonjolan tulang, gesekan) atau faktor elektris (elektrodiatermi, energi listrik bertegangan tinggi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Situasional', 8,  'Efek samping terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Situasional', 9,  'Kelembaban'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  10, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  11, 'Neuropati perifer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  12, 'Perubahan pigmentasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Fisiologis',  13, 'Perubahan hormonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Psikologis',  14, 'Kurang terpapar informasi tentang upaya mempertahankan/melindungi integritas jaringan');

-- D.0130 Hipertermia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis',  1, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Situasional', 2, 'Terpapar lingkungan panas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis',  3, 'Proses penyakit (mis. infeksi, kanker)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Situasional', 4, 'Ketidaksesuaian pakaian dengan suhu lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis',  5, 'Peningkatan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Fisiologis',  6, 'Respon trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Situasional', 7, 'Aktivitas berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Situasional', 8, 'Penggunaan inkubator');

-- D.0131 Hipotermia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  1,  'Kerusakan hipotalamus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Situasional', 2,  'Konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  3,  'Berat badan ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  4,  'Kekurangan lemak subkutan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Situasional', 5,  'Terpapar suhu lingkungan rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  6,  'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Situasional', 7,  'Pemakaian pakaian tipis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  8,  'Penurunan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Situasional', 9,  'Tidak beraktivitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  10, 'Transfer panas (mis. konduksi, konveksi, evaporasi, radiasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Situasional', 11, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  12, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Fisiologis',  13, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Psikologis',  14, 'Kurang terpapar informasi tentang pencegahan hipotermia');

-- D.0132 Perilaku Kekerasan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Psikologis',  1, 'Ketidakmampuan mengendalikan dorongan marah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Situasional', 2, 'Stimulus lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Situasional', 3, 'Konflik interpersonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Psikologis',  4, 'Perubahan status mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Fisiologis',  5, 'Putus obat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Situasional', 6, 'Penyalahgunaan zat/alkohol');

-- D.0133 Perlambatan Pemulihan Pascabedah
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 1,  'Skor klasifikasi status fisik American Society of Anesthesiologists (ASA) lebih dari 3'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  2,  'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  3,  'Edema pada lokasi pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 4,  'Prosedur pembedahan ekstensif (luas)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 5,  'Usia ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  6,  'Riwayat perlambatan penyembuhan luka'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  7,  'Gangguan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  8,  'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  9,  'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  10, 'Infeksi luka perioperatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  11, 'Mual/muntah persisten'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Psikologis',  12, 'Respon emosional pascaoperasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 13, 'Pemanjangan proses operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Psikologis',  14, 'Gangguan psikologis pascaoperasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 15, 'Kontaminasi bedah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Situasional', 16, 'Trauma pada luka operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Fisiologis',  17, 'Efek agen farmakologis');

-- ============================================================
-- 7. SDKI FAKTOR RISIKO (tipe Risiko)
-- ============================================================

-- D.0127 Risiko Gangguan Perlekatan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 1, 'Kekhawatiran menjalankan peran sebagai orang tua'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 2, 'Perpisahan antara ibu dan bayi/anak akibat hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 3, 'Penghalang fisik (mis. inkubator, baby warmer)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 4, 'Ketidakmampuan orang tua memenuhi kebutuhan bayi/anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 5, 'Perawatan dalam ruang isolasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 6, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 7, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 8, 'Konflik hubungan antara orang tua dan anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 9, 'Perilaku bayi tidak terkoordinasi');

-- D.0128 Risiko Proses Pengasuhan Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 1,  'Kekerasan dalam rumah tangga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 2,  'Kehamilan tidak diinginkan/direncanakan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 3,  'Kurang terpapar informasi tentang proses persalinan/pengasuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 4,  'Ketidakberdayaan maternal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 5,  'Distres psikologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 6,  'Penyalahgunaan obat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 7,  'Ketidakadekuatan manajemen ketidaknyamanan selama persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 8,  'Akses pelayanan kesehatan sulit dijangkau'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 9,  'Kurangnya minat/proaktif dalam proses persalinan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 10, 'Ketidaksesuaian kondisi bayi dengan harapan');

-- ============================================================
-- 8. SDKI GEJALA
-- ============================================================

-- D.0120 Gangguan Proses Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Mayor', 'Objektif',  1, 'Keluarga tidak mampu beradaptasi terhadap situasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Mayor', 'Objektif',  2, 'Tidak mampu berkomunikasi secara terbuka diantara anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Minor', 'Subjektif', 1, 'Keluarga tidak mampu mengungkapkan perasaan secara leluasa', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Minor', 'Objektif',  1, 'Keluarga tidak mampu memenuhi kebutuhan fisik/emosional/spiritual anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 'Minor', 'Objektif',  2, 'Keluarga tidak mampu mencari atau menerima bantuan secara tepat', 1);

-- D.0121 Isolasi Sosial
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Mayor', 'Subjektif', 1, 'Merasa ingin sendirian', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Mayor', 'Subjektif', 2, 'Merasa tidak aman di tempat umum', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Mayor', 'Objektif',  1, 'Menarik diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Mayor', 'Objektif',  2, 'Tidak berminat/menolak berinteraksi dengan orang lain atau lingkungan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Subjektif', 1, 'Merasa berbeda dengan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Subjektif', 2, 'Merasa asyik dengan pikiran sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Subjektif', 3, 'Merasa tidak mempunyai tujuan yang jelas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  1, 'Afek datar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  2, 'Afek sedih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  3, 'Riwayat ditolak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  4, 'Menunjukkan permusuhan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  5, 'Tidak mampu memenuhi harapan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  6, 'Kondisi difabel', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  7, 'Tindakan tidak berarti', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  8, 'Tidak ada kontak mata', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif',  9, 'Perkembangan terlambat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 'Minor', 'Objektif', 10, 'Tidak bergairah/lesu', 1);

-- D.0122 Kesiapan Peningkatan Menjadi Orang Tua
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan peran menjadi orang tua', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 'Mayor', 'Objektif',  1, 'Tampak adanya dukungan emosi dan pengertian pada anak atau anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 'Minor', 'Subjektif', 1, 'Anak atau anggota keluarga lainnya mengekspresikan kepuasan dengan lingkungan rumah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 'Minor', 'Subjektif', 2, 'Anak atau anggota keluarga mengungkapkan harapan yang realistis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 'Minor', 'Objektif',  1, 'Kebutuhan fisik dan emosi anak/anggota keluarga terpenuhi', 1);

-- D.0123 Kesiapan Peningkatan Proses Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan dinamika keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Mayor', 'Objektif',  1, 'Menunjukan fungsi keluarga dalam memenuhi kebutuhan fisik, sosial, dan psikologi anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Mayor', 'Objektif',  2, 'Menunjukkan aktivitas untuk mendukung keselamatan dan pertumbuhan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Mayor', 'Objektif',  3, 'Peran keluarga fleksibel dan tepat dengan tahap perkembangan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Mayor', 'Objektif',  4, 'Terlihat adanya respek dengan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  1, 'Keluarga menunjukkan minat melakukan aktivitas hidup sehari-hari yang positif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  2, 'Terlihat adanya kemampuan keluarga untuk pulih dari kondisi sulit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  3, 'Tampak keseimbangan antara otonomi dan kebersamaan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  4, 'Batasan-batasan anggota keluarga dipertahankan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  5, 'Hubungan dengan masyarakat terjalin positif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 'Minor', 'Objektif',  6, 'Keluarga beradaptasi dengan perubahan', 1);

-- D.0124 Ketegangan Peran Pemberian Asuhan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Mayor', 'Subjektif', 1, 'Khawatir klien akan kembali dirawat di rumah sakit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Mayor', 'Subjektif', 2, 'Khawatir tentang kelanjutan perawatan klien', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Mayor', 'Subjektif', 3, 'Khawatir tentang ketidakmampuan pemberi asuhan dalam merawat klien', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Mayor', 'Objektif',  1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 'Minor', 'Objektif',  1, 'Sulit melakukan dan/atau menyelesaikan tugas merawat klien', 1);

-- D.0125 Penampilan Peran Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Subjektif', 1, 'Merasa bingung menjalankan peran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Subjektif', 2, 'Merasa harapan tidak terpenuhi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Subjektif', 3, 'Merasa tidak puas dalam menjalankan peran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Objektif',  1, 'Konflik peran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Objektif',  2, 'Adaptasi tidak adekuat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Mayor', 'Objektif',  3, 'Strategi koping tidak efektif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Minor', 'Subjektif', 1, 'Merasa cemas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Minor', 'Objektif',  1, 'Depresi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Minor', 'Objektif',  2, 'Dukungan sosial kurang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 'Minor', 'Objektif',  3, 'Kurang bertanggung jawab menjalankan peran', 1);

-- D.0126 Pencapaian Peran Menjadi Orang Tua
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Mayor', 'Objektif',  1, 'Bounding attachment optimal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Mayor', 'Objektif',  2, 'Perilaku positif menjadi orang tua', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Mayor', 'Objektif',  3, 'Saling berinteraksi dalam merawat bayi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Minor', 'Subjektif', 1, 'Mengungkapkan kepuasan dengan bayi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 'Minor', 'Objektif',  1, 'Melakukan stimulasi visual, taktil atau pendengaran terhadap bayi', 1);

-- D.0129 Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Mayor', 'Objektif',  1, 'Kerusakan jaringan dan/atau lapisan kulit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif',  1, 'Nyeri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif',  2, 'Perdarahan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif',  3, 'Kemerahan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif',  4, 'Hematoma', 1);

-- D.0130 Hipertermia
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Mayor', 'Objektif',  1, 'Suhu tubuh di atas nilai normal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif',  1, 'Kulit merah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif',  2, 'Kejang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif',  3, 'Takikardi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif',  4, 'Takipnea', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif',  5, 'Kulit terasa hangat', 1);

-- D.0131 Hipotermia
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Mayor', 'Objektif',  1, 'Kulit teraba dingin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Mayor', 'Objektif',  2, 'Menggigil', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Mayor', 'Objektif',  3, 'Suhu tubuh di bawah nilai normal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  1, 'Akrosianosis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  2, 'Bradikardi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  3, 'Dasar kuku sianotik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  4, 'Hipoglikemia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  5, 'Hipoksia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  6, 'Pengisian kapiler >3 detik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  7, 'Konsumsi oksigen meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  8, 'Ventilasi menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif',  9, 'Piloereksi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif', 10, 'Takikardia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif', 11, 'Vasokonstriksi perifer', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 'Minor', 'Objektif', 12, 'Kutis memorata (pada neonatus)', 1);

-- D.0132 Perilaku Kekerasan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Subjektif', 1, 'Mengancam', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Subjektif', 2, 'Mengumpat dengan kata-kata kasar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Subjektif', 3, 'Suara keras', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Subjektif', 4, 'Bicara ketus', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Objektif',  1, 'Menyerang orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Objektif',  2, 'Melukai diri sendiri/orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Objektif',  3, 'Merusak lingkungan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Mayor', 'Objektif',  4, 'Perilaku agresif/amuk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Objektif',  1, 'Mata melotot atau pandangan tajam', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Objektif',  2, 'Tangan mengepal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Objektif',  3, 'Rahang menutup', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Objektif',  4, 'Wajah memerah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 'Minor', 'Objektif',  5, 'Postur tubuh kaku', 1);

-- D.0133 Perlambatan Pemulihan Pascabedah
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Mayor', 'Subjektif', 1, 'Mengeluh tidak nyaman', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Mayor', 'Objektif',  1, 'Area luka operasi terbuka', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Mayor', 'Objektif',  2, 'Waktu penyembuhan yang memanjang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Minor', 'Subjektif', 1, 'Selera makan hilang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Minor', 'Objektif',  1, 'Gangguan mobilitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Minor', 'Objektif',  2, 'Tidak mampu melanjutkan pekerjaan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), 'Minor', 'Objektif',  3, 'Memulai pekerjaan tertunda', 1);

-- ============================================================
-- 9. SDKI KONDISI KLINIS
-- ============================================================

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 1, 'Hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 2, 'Kondisi penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 3, 'Prosedur pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 4, 'Cedera traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 5, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 6, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), 7, 'Kehamilan');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 1, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 2, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 3, 'Tuberkulosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 4, 'Kondisi yang menyebabkan gangguan mobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), 5, 'Gangguan psikiatrik (mis. depresi mayor dan skizofrenia)');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), 1, 'Perilaku upaya peningkatan kesehatan');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 1, 'Kondisi kesehatan kronis (mis. asma, diabetes melitus, lupus sistemik, sklerosis multipel, AIDS)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), 2, 'Gangguan jiwa (mis. gangguan afektif, gangguan perhatian, sindrom down)');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 1, 'Kondisi kronis (mis. cedera kepala berat, cedera medula spinalis, keterlambatan perkembangan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 2, 'Kondisi kelemahan progresif (mis. distrofi muskuler, sklerosis multipel, demensia, penyakit Alzheimer, PPOK tahap terminal, gagal ginjal, dialisis ginjal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 3, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 4, 'Kondisi akhir hayat (menjelang ajal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), 5, 'Kondisi psikiatrik (mis. gangguan kepribadian, skizofrenia)');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 1, 'Penyakit keganasan organ reproduksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 2, 'Kondisi kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 3, 'Pembedahan mayor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 4, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 5, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 6, 'Sindrom keletihan kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), 7, 'Depresi mayor');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 1, 'Status kesehatan ibu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), 2, 'Status kesehatan bayi');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 1, 'Hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 2, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 3, 'Penyakit kronis pada orang tua atau anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 4, 'Retardasi mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 5, 'Komplikasi maternal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 6, 'Sakit selama periode hamil dan melahirkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), 7, 'Post partum blues');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 1, 'Gangguan pertumbuhan janin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), 2, 'Gangguan kesehatan fisik dan psikologis ibu');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 1, 'Imobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 3, 'Gagal ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 4, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 5, 'Imunodefisiensi (mis. AIDS)');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 1, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 2, 'Hipertiroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 4, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 5, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 6, 'Prematuritas');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 1, 'Hipotiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 2, 'Anoreksia nervosa'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 3, 'Cedera batang otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 4, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 5, 'Berat badan lahir rendah (BBLR)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), 6, 'Tenggelam');

INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 1, 'Attention deficit/hyperactivity disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 2, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 3, 'Oppositional defiant disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 4, 'Gangguan tourette'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 5, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 6, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), 7, 'Gangguan amnestik');

-- D.0133 tidak ada kondisi klinis terkait di PDF

-- ============================================================
-- 10. SDKI_SLKI RELATIONS
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13123')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13116')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13120')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13123')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13121')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13119')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13120')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13122')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13124')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'));

-- ============================================================
-- 11. SLKI_SIKI RELATIONS
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13116'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13116'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13124'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12441')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12461')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'));

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- SUMMARY
-- ============================================================
-- Diagnosa SDKI  : D.0120 – D.0133 (14 diagnosa)
-- Luaran SLKI baru : L.13119, L.13120, L.13121, L.13122, L.13123, L.13124, L.14129 (7 luaran)
-- Luaran reuse   : L.13116, L.14125, L.14134, L.09076
-- Intervensi baru: I.09260, I.13496, I.09322, I.13498, I.12466, I.13490, I.13478,
--                  I.12402, I.10342, I.15506, I.14507, I.12403, I.08238 (13 intervensi)
-- ============================================================
