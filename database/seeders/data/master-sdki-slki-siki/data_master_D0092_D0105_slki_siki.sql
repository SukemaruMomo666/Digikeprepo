SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- FILE: data_master_D0092_D0105_slki_siki.sql
-- RANGE: D.0092 – D.0105 (14 diagnosa, Psikologis / Integritas Ego)
-- ISI: luaran_slki, slki_kriteria_hasil,
--      intervensi_siki, siki_tindakan,
--      sdki_slki_relations, slki_siki_relations
-- ============================================================


-- ============================================================
-- 1. LUARAN SLKI
--    Catatan: beberapa luaran dipakai oleh >1 diagnosa,
--    INSERT sekali saja, reuse di relasi.
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
-- D.0092 / D.0103
('L.09071', 'Keberdayaan', 'Psikologis', 'Integritas Ego',
 'Persepsi bahwa tindakan seseorang mampu mempengaruhi hasil secara signifikan.'),
-- D.0093 / D.0097
('L.09088', 'Status Koping Keluarga', 'Psikologis', 'Integritas Ego',
 'Kemampuan keluarga dalam mengelola stressor yang membebani sumber daya keluarga.'),
-- D.0094 / D.0096
('L.09086', 'Status Koping', 'Psikologis', 'Integritas Ego',
 'Kemampuan menilai dan merespons stressor dan/atau kemampuan menggunakan sumber-sumber yang ada untuk mengatasi masalah.'),
-- D.0095
('L.09089', 'Status Koping Komunitas', 'Psikologis', 'Integritas Ego',
 'Pola adaptasi aktivitas komunitas dan penyelesaian masalah yang memuaskan untuk memenuhi tuntutan kebutuhan masyarakat.'),
-- D.0098
('L.09082', 'Penerimaan', 'Psikologis', 'Integritas Ego',
 'Kemampuan individu untuk menerima kondisi yang tidak dapat diubah.'),
-- D.0099
('L.03025', 'Perilaku Kesehatan', 'Psikologis', 'Penyuluhan dan Pembelajaran',
 'Kemampuan individu untuk mengubah gaya hidup atau perilaku untuk memperbaiki status kesehatan.'),
-- D.0100
('L.09091', 'Status Spiritual', 'Psikologis', 'Integritas Ego',
 'Hubungan dengan diri sendiri, orang lain, seni, musik, sastra, alam, atau kekuatan yang lebih besar dari diri sendiri.'),
-- D.0101 / D.0102
('L.09069', 'Harga Diri', 'Psikologis', 'Integritas Ego',
 'Perasaan positif terhadap diri sendiri atau kemampuan sebagai respons terhadap situasi saat ini.'),
-- D.0102 (tambahan)
('L.09067', 'Citra Tubuh', 'Psikologis', 'Integritas Ego',
 'Persepsi tentang penampilan, struktur, dan fungsi fisik individu.'),
-- D.0104
('L.09073', 'Ketahanan Personal', 'Psikologis', 'Integritas Ego',
 'Kapasitas untuk beradaptasi dan berfungsi secara positif setelah mengalami kesulitan atau krisis.'),
-- D.0105
('L.09090', 'Status Orientasi', 'Psikologis', 'Integritas Ego',
 'Keyakinan yang sesuai kenyataan.');


-- ============================================================
-- 2. SLKI KRITERIA HASIL
-- ============================================================

-- L.09071 Keberdayaan (D.0092, D.0103)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), 1, 'Verbalisasi mampu melaksanakan aktivitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), 2, 'Verbalisasi frustasi ketergantungan pada orang lain', 'Menurun');

-- L.09088 Status Koping Keluarga (D.0093, D.0097)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 1, 'Kepuasan terhadap perilaku bantuan anggota keluarga lain', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 2, 'Keterpaparan informasi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 3, 'Perasaan diabaikan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 4, 'Kekhawatiran tentang anggota keluarga', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 5, 'Perilaku mengabaikan anggota keluarga', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 6, 'Komitmen pada perawatan/pengobatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 7, 'Komunikasi antara anggota keluarga', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 8, 'Perasaan tertekan (depresi)', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 9, 'Perilaku menyerang (agresi)', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 10, 'Toleransi', 'Membaik');

-- L.09086 Status Koping (D.0094, D.0096)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 1, 'Kemampuan memenuhi peran sesuai usia', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 2, 'Perilaku koping adaptif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 3, 'Verbalisasi kemampuan mengatasi masalah', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 4, 'Verbalisasi pengakuan masalah', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 5, 'Perilaku asertif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 6, 'Verbalisasi menyalahkan orang lain', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 7, 'Hipersensitif terhadap kritik', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 8, 'Komunikasi jelas sesuai usia', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), 9, 'Kemampuan membuat keputusan', 'Meningkat');

-- L.09089 Status Koping Komunitas (D.0095)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 1, 'Keberdayaan komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 2, 'Perencanaan komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 3, 'Pemecahan masalah komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 4, 'Sumber daya komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 5, 'Partisipasi masyarakat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), 6, 'Insiden masalah kesehatan dalam komunitas', 'Menurun');

-- L.09082 Penerimaan (D.0098)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09082'), 1, 'Verbalisasi penerimaan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09082'), 2, 'Verbalisasi perasaan yang dialami', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09082'), 3, 'Perilaku mencari perawatan/pengobatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09082'), 4, 'Menyusun perencanaan masa depan', 'Meningkat');

-- L.03025 Perilaku Kesehatan (D.0099)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03025'), 1, 'Penerimaan terhadap perubahan status kesehatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03025'), 2, 'Kemampuan melakukan tindakan pencegahan masalah kesehatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03025'), 3, 'Kemampuan peningkatan kesehatan', 'Meningkat');

-- L.09091 Status Spiritual (D.0100)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 1, 'Verbalisasi makna dan tujuan hidup', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 2, 'Verbalisasi kepuasan terhadap makna hidup', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 3, 'Perilaku marah pada Tuhan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 4, 'Kemampuan beribadah', 'Meningkat');

-- L.09069 Harga Diri (D.0101, D.0102)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 1, 'Penilaian diri positif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 2, 'Perasaan memiliki kelebihan atau kemampuan positif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 3, 'Penerimaan penilaian positif terhadap diri sendiri', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 4, 'Minat mencoba hal baru', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 5, 'Kontak mata', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 6, 'Perilaku asertif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 7, 'Percaya diri berbicara', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 8, 'Kemampuan membuat keputusan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 9, 'Perasaan malu', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 10, 'Perasaan bersalah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 11, 'Perasaan tidak mampu melakukan apapun', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), 12, 'Meremehkan kemampuan mengatasi masalah', 'Menurun');

-- L.09067 Citra Tubuh (D.0102)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 1, 'Verbalisasi perasaan negatif tentang perubahan tubuh', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 2, 'Verbalisasi kekhawatiran pada reaksi orang lain', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 3, 'Melihat bagian tubuh', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 4, 'Hubungan sosial', 'Membaik');

-- L.09073 Ketahanan Personal (D.0104)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 1, 'Verbalisasi harapan yang positif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 2, 'Penggunaan strategi koping yang efektif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 3, 'Verbalisasi perasaan yang menunjukkan harga diri positif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 4, 'Pengambilan tanggung jawab mencari dukungan emosional', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 5, 'Menganggap kesulitan sebagai tantangan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 6, 'Penggunaan strategi untuk meningkatkan keamanan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 7, 'Menghindari penyalahgunaan zat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), 8, 'Pemanfaatan sumber daya komunitas', 'Meningkat');

-- L.09090 Status Orientasi (D.0105)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), 1, 'Perilaku sesuai realitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), 2, 'Isi pikir sesuai realita', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), 3, 'Verbalisasi waham', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), 4, 'Perilaku waham', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), 5, 'Pembicaraan', 'Membaik');


-- ============================================================
-- 3. INTERVENSI SIKI
--    Catatan: beberapa intervensi reuse lintas diagnosa,
--    INSERT sekali, reuse di relasi.
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
-- D.0092, D.0103
('I.09307', 'Promosi Harapan', 'Psikologis', 'Integritas Ego',
 'Meningkatkan kepercayaan pada kemampuan untuk memulai dan mempertahankan tindakan.'),
-- D.0092, D.0096, D.0101, D.0102
('I.09312', 'Promosi Koping', 'Psikologis', 'Integritas Ego',
 'Meningkatkan upaya kognitif dan perilaku untuk menilai dan merespon stressor dan/atau kemampuan menggunakan sumber-sumber yang ada.'),
-- D.0093, D.0097
('I.09260', 'Dukungan Koping Keluarga', 'Psikologis', 'Integritas Ego',
 'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga.'),
-- D.0094, D.0101
('I.09308', 'Promosi Harga Diri', 'Psikologis', 'Integritas Ego',
 'Meningkatkan penilaian perasaan/persepsi terhadap diri sendiri atau kemampuan diri.'),
-- D.0095
('I.14515', 'Manajemen Lingkungan Komunitas', 'Lingkungan', 'Keamanan dan Proteksi',
 'Mengidentifikasi dan mengelola kondisi lingkungan fisik, sosial, budaya, ekonomi, dan politik yang mempengaruhi kesehatan masyarakat.'),
-- D.0096
('I.09265', 'Dukungan Pengambilan Keputusan', 'Psikologis', 'Integritas Ego',
 'Memberikan informasi dan dukungan saat pembuatan keputusan kesehatan.'),
('I.13478', 'Dukungan Penampilan Peran', 'Psikologis', 'Integritas Ego',
 'Memfasilitasi pasien dan keluarga untuk memperbaiki hubungan dengan mengklarifikasi dan memenuhi perilaku peran tertentu.'),
-- D.0098
('I.09311', 'Promosi Kesadaran Diri', 'Psikologis', 'Integritas Ego',
 'Meningkatkan pemahaman dan mengeksplorasi pikiran, perasaan, motivasi, dan perilaku.'),
-- D.0099
('I.12472', 'Promosi Perilaku Upaya Kesehatan', 'Psikologis', 'Penyuluhan dan Pembelajaran',
 'Meningkatkan perubahan perilaku penderita/klien agar memiliki kemauan dan kemampuan yang kondusif bagi kesehatan secara menyeluruh baik bagi lingkungan maupun masyarakat sekitarnya.'),
-- D.0100
('I.09269', 'Dukungan Perkembangan Spiritual', 'Psikologis', 'Integritas Ego',
 'Memfasilitasi pengembangan kemampuan mengidentifikasi, berhubungan, dan mencari sumber makna, tujuan, kekuatan dan harapan dalam hidup.'),
-- D.0102
('I.09305', 'Promosi Citra Tubuh', 'Psikologis', 'Integritas Ego',
 'Meningkatkan perbaikan perubahan persepsi terhadap fisik pasien.'),
('I.09289', 'Manajemen Mood', 'Psikologis', 'Integritas Ego',
 'Mengidentifikasi dan mengelola keselamatan, stabilisasi, pemulihan, dan perawatan gangguan mood.'),
(NULL, 'Terapi Kelompok', 'Psikologis', 'Integritas Ego',
 'Penerapan teknik psikoterapi dengan sekelompok orang untuk meningkatkan kesadaran diri, pertumbuhan pribadi, dan hubungan interpersonal.'),
-- D.0104
('I.09274', 'Dukungan Proses Berduka', 'Psikologis', 'Integritas Ego',
 'Memfasilitasi menyelesaikan proses berduka terhadap kehilangan yang bermakna.'),
-- D.0105
('I.09295', 'Manajemen Waham', 'Psikologis', 'Integritas Ego',
 'Mengidentifikasi dan mengelola kenyamanan, keamanan, dan orientasi realitas pasien yang mengalami keyakinan yang keliru dan menetap yang sedikit atau sama sekali tidak berdasar pada kenyataan.');


-- ============================================================
-- 4. SIKI TINDAKAN
-- ============================================================

-- I.09307 Promosi Harapan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Observasi', 1, 'Identifikasi harapan pasien dan keluarga dalam pencapaian hidup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 1, 'Sadarkan bahwa kondisi yang dialami memiliki nilai penting'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 2, 'Pandu mengingat kembali kenangan yang menyenangkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 3, 'Libatkan pasien secara aktif dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 4, 'Kembangkan rencana perawatan yang melibatkan tingkat pencapaian tujuan sederhana sampai dengan kompleks'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 5, 'Berikan kesempatan kepada pasien dan keluarga terlibat dengan dukungan kelompok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik', 6, 'Ciptakan lingkungan yang memudahkan mempraktikkan kebutuhan spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 1, 'Anjurkan mengungkapkan perasaan terhadap kondisi dengan realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 2, 'Anjurkan mempertahankan hubungan (mis. menyebutkan nama orang yang dicintai)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 3, 'Anjurkan mempertahankan hubungan terapeutik dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 4, 'Latih menyusun tujuan yang sesuai dengan harapan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 5, 'Latih cara mengembangkan spiritual diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi', 6, 'Latih cara mengenang dan menikmati masa lalu (mis. prestasi, pengalaman)');

-- I.09312 Promosi Koping
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 1, 'Identifikasi kegiatan jangka pendek dan panjang sesuai tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 2, 'Identifikasi kemampuan yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 3, 'Identifikasi sumber daya yang tersedia untuk memenuhi tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 4, 'Identifikasi pemahaman proses penyakit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 5, 'Identifikasi dampak situasi terhadap peran dan hubungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 6, 'Identifikasi metode penyelesaian masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi', 7, 'Identifikasi kebutuhan dan keinginan terhadap dukungan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 1, 'Diskusikan perubahan peran yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 2, 'Gunakan pendekatan yang tenang dan meyakinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 3, 'Diskusikan alasan mengkritik diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 4, 'Diskusikan untuk mengklarifikasi kesalahpahaman dan mengevaluasi perilaku sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 5, 'Diskusikan konsekuensi tidak menggunakan rasa bersalah dan rasa malu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 6, 'Diskusikan risiko yang menimbulkan bahaya pada diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 7, 'Fasilitasi dalam memperoleh informasi yang dibutuhkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 8, 'Berikan pilihan realistis mengenai aspek-aspek tertentu dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 9, 'Motivasi untuk menentukan harapan yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 10, 'Tinjau kembali kemampuan dalam pengambilan keputusan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 11, 'Hindari mengambil keputusan saat pasien berada di bawah tekanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 12, 'Motivasi terlibat dalam kegiatan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 13, 'Motivasi mengidentifikasi sistem pendukung yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 14, 'Dampingi saat berduka (mis. penyakit kronis, kecacatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 15, 'Perkenalkan dengan orang atau kelompok yang berhasil mengalami pengalaman sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 16, 'Dukung penggunaan mekanisme pertahanan yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 17, 'Kurangi rangsangan lingkungan yang mengancam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 1, 'Anjurkan menjalin hubungan yang memiliki kepentingan dan tujuan yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 2, 'Anjurkan penggunaan sumber spiritual, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 3, 'Anjurkan mengungkapkan perasaan dan persepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 4, 'Anjurkan keluarga terlibat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 5, 'Anjurkan membuat tujuan yang lebih spesifik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 6, 'Ajarkan cara memecahkan masalah secara konstruktif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 7, 'Latih penggunaan teknik relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 8, 'Latih keterampilan sosial, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi', 9, 'Latih mengembangkan penilaian obyektif');

-- I.09260 Dukungan Koping Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 1, 'Identifikasi respons emosional terhadap kondisi saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 3, 'Identifikasi pemahaman tentang keputusan perawatan setelah pulang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 4, 'Identifikasi kesesuaian antara harapan pasien, keluarga, dan tenaga kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 1, 'Dengarkan masalah, perasaan, dan pertanyaan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 2, 'Terima nilai-nilai keluarga dengan cara yang tidak menghakimi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 3, 'Diskusikan rencana medis dan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 4, 'Fasilitasi pengungkapan perasaan antara pasien dan keluarga atau antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 5, 'Fasilitasi pengambilan keputusan dalam merencanakan perawatan jangka panjang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 6, 'Fasilitasi anggota keluarga dalam mengidentifikasi dan menyelesaikan konflik nilai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 7, 'Fasilitasi pemenuhan kebutuhan dasar keluarga (mis. tempat tinggal, makanan, pakaian)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 8, 'Fasilitasi anggota keluarga melalui proses kematian dan berduka, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 9, 'Fasilitasi memperoleh pengetahuan, keterampilan, dan peralatan yang diperlukan untuk mempertahankan keputusan perawatan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 10, 'Bersikap sebagai pengganti keluarga untuk menenangkan pasien jika keluarga tidak dapat memberikan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 11, 'Hargai dan dukung mekanisme koping adaptif yang digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 12, 'Berikan kesempatan berkunjung bagi anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi', 1, 'Informasikan kemajuan pasien secara berkala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi', 2, 'Informasikan fasilitas perawatan kesehatan yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Kolaborasi', 1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.09308 Promosi Harga Diri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi', 1, 'Identifikasi budaya, agama, ras, jenis kelamin, dan usia terhadap harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi', 2, 'Monitor verbalisasi yang merendahkan diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi', 3, 'Monitor tingkat harga diri setiap waktu, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 1, 'Motivasi terlibat dalam verbalisasi positif untuk diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 2, 'Motivasi menerima tantangan atau hal baru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 3, 'Diskusikan pernyataan tentang harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 4, 'Diskusikan kepercayaan terhadap penilaian diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 5, 'Diskusikan pengalaman yang meningkatkan harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 6, 'Diskusikan persepsi negatif diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 7, 'Diskusikan alasan mengkritik diri atau rasa bersalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 8, 'Diskusikan penetapan tujuan realistis untuk mencapai harga diri yang lebih tinggi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 9, 'Diskusikan bersama keluarga untuk menetapkan harapan dan batasan yang jelas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 10, 'Berikan umpan balik positif atas peningkatan mencapai tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 11, 'Fasilitasi lingkungan dan aktivitas yang meningkatkan harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 1, 'Jelaskan kepada keluarga pentingnya dukungan dalam perkembangan konsep positif diri pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 2, 'Anjurkan mengidentifikasi kekuatan yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 3, 'Anjurkan mempertahankan kontak mata saat berkomunikasi dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 4, 'Anjurkan membuka diri terhadap kritik negatif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 5, 'Anjurkan mengevaluasi perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 6, 'Ajarkan cara mengatasi bullying'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 7, 'Latih peningkatan tanggung jawab untuk diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 8, 'Latih pernyataan/kemampuan positif diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 9, 'Latih cara berpikir dan berperilaku positif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi', 10, 'Latih meningkatkan kepercayaan pada kemampuan dalam menangani situasi');

-- I.14515 Manajemen Lingkungan Komunitas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Observasi', 1, 'Lakukan skrining risiko gangguan kesehatan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Observasi', 2, 'Identifikasi faktor risiko kesehatan yang diketahui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Terapeutik', 1, 'Libatkan partisipasi masyarakat dalam memelihara keamanan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Edukasi', 1, 'Promosikan kebijakan pemerintah untuk mengurangi risiko penyakit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Edukasi', 2, 'Berikan pendidikan kesehatan untuk kelompok risiko'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Edukasi', 3, 'Informasikan layanan kesehatan ke individu, keluarga, kelompok berisiko dan masyarakat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Kolaborasi', 1, 'Kolaborasi dalam tim multidisiplin untuk mengidentifikasi ancaman keamanan di masyarakat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Kolaborasi', 2, 'Kolaborasi dengan tim kesehatan lain dalam program kesehatan komunitas untuk menghadapi risiko yang diketahui'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Kolaborasi', 3, 'Kolaborasi dalam pengembangan program aksi masyarakat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515'), 'Kolaborasi', 4, 'Kolaborasi dengan kelompok masyarakat dalam menjalankan peraturan pemerintah');

-- I.09265 Dukungan Pengambilan Keputusan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Observasi', 1, 'Identifikasi persepsi mengenai masalah dan informasi yang memicu konflik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 1, 'Fasilitasi mengklarifikasi nilai dan harapan yang membantu membuat pilihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 2, 'Diskusikan kelebihan dan kekurangan dari setiap solusi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 3, 'Fasilitasi melihat situasi secara realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 4, 'Motivasi mengungkapkan tujuan perawatan yang diharapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 5, 'Fasilitasi pengambilan keputusan secara kolaboratif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 6, 'Hormati hak pasien untuk menerima atau menolak informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 7, 'Fasilitasi menjelaskan keputusan kepada orang lain, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 8, 'Fasilitasi hubungan antara pasien, keluarga, dan tenaga kesehatan lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Edukasi', 1, 'Informasikan alternatif solusi secara jelas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Edukasi', 2, 'Berikan informasi yang diminta pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Kolaborasi', 1, 'Kolaborasi dengan tenaga kesehatan lain dalam memfasilitasi pengambilan keputusan');

-- I.13478 Dukungan Penampilan Peran
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi', 1, 'Identifikasi berbagai peran dan periode transisi sesuai tingkat perkembangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi', 2, 'Identifikasi peran yang ada dalam keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Observasi', 3, 'Identifikasi adanya peran yang tidak terpenuhi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 1, 'Fasilitasi adaptasi peran keluarga terhadap perubahan peran yang tidak diinginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 2, 'Fasilitasi bermain peran dalam mengantisipasi reaksi orang lain terhadap perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 3, 'Fasilitasi diskusi tentang peran orang tua, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 4, 'Fasilitasi diskusi harapan dengan keluarga dalam peran timbal balik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi', 1, 'Diskusikan perilaku yang dibutuhkan untuk pengembangan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi', 2, 'Diskusikan perubahan peran yang diperlukan akibat penyakit atau ketidakmampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi', 3, 'Diskusikan strategi positif untuk mengelola perubahan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Edukasi', 4, 'Ajarkan perilaku baru yang dibutuhkan oleh pasien/orang tua untuk memenuhi peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'), 'Kolaborasi', 1, 'Rujuk dalam kelompok untuk mempelajari peran baru');

-- I.09311 Promosi Kesadaran Diri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Observasi', 1, 'Identifikasi keadaan emosional saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Observasi', 2, 'Identifikasi respons yang ditunjukkan berbagai situasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 1, 'Diskusikan nilai-nilai yang berkontribusi terhadap konsep diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 2, 'Diskusikan tentang pikiran, perilaku atau respons terhadap kondisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 3, 'Diskusikan dampak penyakit pada konsep diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 4, 'Ungkapkan penyangkalan tentang kenyataan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Terapeutik', 5, 'Motivasi dalam meningkatkan kemampuan belajar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 1, 'Anjurkan mengenali pikiran dan perasaan tentang diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 2, 'Anjurkan menyadari bahwa setiap orang unik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 3, 'Anjurkan mengungkapkan perasaan (mis. marah atau depresi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 4, 'Anjurkan meminta bantuan orang lain, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 5, 'Anjurkan mengubah pandangan diri sebagai korban'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 6, 'Anjurkan mengidentifikasi perasaan bersalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 7, 'Anjurkan mengidentifikasi situasi yang memicu kecemasan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 8, 'Anjurkan mengevaluasi kembali persepsi negatif tentang diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 9, 'Anjurkan dalam mengekspresikan diri dengan kelompok sebaya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 10, 'Ajarkan cara membuat prioritas hidup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311'), 'Edukasi', 11, 'Latih kemampuan positif diri yang dimiliki');

-- I.12472 Promosi Perilaku Upaya Kesehatan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Observasi', 1, 'Identifikasi perilaku upaya kesehatan yang dapat ditingkatkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Terapeutik', 1, 'Berikan lingkungan yang mendukung kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Terapeutik', 2, 'Orientasi pelayanan kesehatan yang dapat dimanfaatkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 1, 'Anjurkan persalinan ditolong oleh tenaga kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 2, 'Anjurkan memberi bayi ASI eksklusif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 3, 'Anjurkan menimbang balita setiap bulan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 4, 'Anjurkan menggunakan air bersih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 5, 'Anjurkan mencuci tangan dengan air bersih dan sabun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 6, 'Anjurkan menggunakan jamban sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 7, 'Anjurkan memberantas jentik di rumah seminggu sekali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 8, 'Anjurkan makan sayur dan buah setiap hari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 9, 'Anjurkan melakukan aktivitas fisik setiap hari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472'), 'Edukasi', 10, 'Anjurkan tidak merokok di dalam rumah');

-- I.09269 Dukungan Perkembangan Spiritual
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 1, 'Sediakan lingkungan yang tenang untuk refleksi diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 2, 'Fasilitasi mengidentifikasi masalah spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 3, 'Fasilitasi mengidentifikasi hambatan dalam pengenalan diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 4, 'Fasilitasi mengeksplorasi keyakinan terkait pemulihan tubuh, pikiran, dan jiwa'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 5, 'Fasilitasi hubungan persahabatan dengan orang lain dan pelayanan keagamaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Edukasi', 1, 'Anjurkan membuat komitmen spiritual berdasarkan keyakinan dan nilai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Edukasi', 2, 'Anjurkan berpartisipasi dalam kegiatan ibadah (hari raya, ritual) dan meditasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Kolaborasi', 1, 'Rujuk pada pemuka agama/kelompok agama, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269'), 'Kolaborasi', 2, 'Rujuk kepada kelompok pendukung, swabantu, atau program spiritual, jika perlu');

-- I.09305 Promosi Citra Tubuh
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 1, 'Identifikasi harapan citra tubuh berdasarkan tahap perkembangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 2, 'Identifikasi budaya, agama, jenis kelamin, dan umur terkait citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 3, 'Identifikasi perubahan citra tubuh yang mengakibatkan isolasi sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 4, 'Monitor frekuensi pernyataan kritik terhadap diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 1, 'Diskusikan perubahan tubuh dan fungsinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 2, 'Diskusikan perbedaan penampilan fisik terhadap harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 3, 'Diskusikan perubahan akibat pubertas, kehamilan dan penuaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 4, 'Diskusikan kondisi stres yang memengaruhi citra tubuh (mis. luka, penyakit, pembedahan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 5, 'Diskusikan cara mengembangkan harapan citra tubuh secara realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 6, 'Diskusikan persepsi pasien dan keluarga tentang perubahan citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 1, 'Jelaskan kepada keluarga tentang perawatan perubahan citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 2, 'Anjurkan mengungkapkan gambaran diri terhadap citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 3, 'Anjurkan menggunakan alat bantu (mis. pakaian, wig, kosmetik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 4, 'Anjurkan mengikuti kelompok pendukung (mis. kelompok sebaya)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 5, 'Latih fungsi tubuh yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 6, 'Latih peningkatan penampilan diri (mis. berdandan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 7, 'Latih pengungkapan kemampuan diri kepada orang lain maupun kelompok');

-- I.09289 Manajemen Mood
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Observasi', 1, 'Identifikasi mood (mis. tanda, gejala, riwayat penyakit)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Observasi', 2, 'Identifikasi risiko keselamatan diri atau orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Observasi', 3, 'Monitor fungsi kognitif (mis. konsentrasi, memori, kemampuan membuat keputusan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Observasi', 4, 'Monitor aktivitas dan tingkat stimulasi lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Terapeutik', 1, 'Fasilitasi pengisian kuesioner self-report (mis. Beck Depression Inventory, skala status fungsional), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Terapeutik', 2, 'Berikan kesempatan untuk menyampaikan perasaan dengan cara yang tepat (mis. sandsack, terapi seni, aktivitas fisik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 1, 'Jelaskan tentang gangguan mood dan penanganannya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 2, 'Anjurkan berperan aktif dalam pengobatan dan rehabilitasi, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 3, 'Ajarkan mengenali pemicu gangguan mood (mis. situasi stres, masalah fisik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 4, 'Ajarkan memonitor mood secara mandiri (mis. skala tingkat 1-10, membuat jurnal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 5, 'Ajarkan keterampilan koping dan penyelesaian masalah baru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Kolaborasi', 2, 'Rujuk untuk psikoterapi (mis. perilaku, hubungan interpersonal, keluarga, kelompok), jika perlu');

-- Terapi Kelompok (kode NULL)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi topik, tujuan dan proses kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Observasi', 2, 'Monitor keterlibatan aktif setiap anggota kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Bentuk 5 kelompok sampai 12 anggota'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Tentukan waktu dan tempat yang sesuai untuk pertemuan kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Ciptakan suasana nyaman'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Ciptakan iklim motivasi untuk proses kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Mulai dan akhiri kegiatan tepat waktu'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Arahkan kelompok melalui tahapan pengembangan kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Terapeutik', 7, 'Arahkan anggota kelompok untuk terlibat aktif'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Anjurkan berbagi perasaan, pengetahuan, dan pengalaman'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan saling membantu dalam kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Latih tanggung jawab dan mengendalikan diri dalam kelompok'),
((SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk ke perawat spesialis lain, jika perlu');

-- I.09274 Dukungan Proses Berduka
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 1, 'Identifikasi kehilangan yang dihadapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 2, 'Identifikasi proses berduka yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 3, 'Identifikasi sifat ketertarikan pada benda yang hilang atau orang yang meninggal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 4, 'Identifikasi reaksi awal terhadap kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 1, 'Tunjukkan sikap menerima dan empati'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 2, 'Motivasi agar mau mengungkapkan perasaan kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 3, 'Motivasi untuk menguatkan dukungan keluarga atau orang terdekat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 4, 'Fasilitasi melakukan kebiasaan sesuai dengan budaya, agama dan norma sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 5, 'Fasilitasi mengekspresikan perasaan dengan cara yang nyaman (mis. membaca buku, menulis, menggambar atau bermain)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 6, 'Diskusikan strategi koping yang dapat digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Edukasi', 1, 'Jelaskan kepada pasien dan keluarga bahwa sikap mengingkari, marah, tawar menawar, depresi, dan menerima adalah wajar dalam menghadapi kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Edukasi', 2, 'Anjurkan mengidentifikasi ketakutan terbesar pada kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Edukasi', 3, 'Anjurkan mengekspresikan perasaan tentang kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Edukasi', 4, 'Ajarkan melewati proses berduka secara bertahap');

-- I.09295 Manajemen Waham
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Observasi', 1, 'Monitor waham yang isinya membahayakan diri sendiri, orang lain dan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Observasi', 2, 'Monitor efek terapeutik dan efek samping obat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 1, 'Bina hubungan interpersonal saling percaya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 2, 'Tunjukkan sikap tidak menghakimi secara konsisten'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 3, 'Diskusikan waham dengan berfokus pada perasaan yang mendasari waham'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 4, 'Hindari perdebatan tentang keyakinan yang keliru, nyatakan keraguan sesuai fakta'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 5, 'Hindari memperkuat gagasan waham'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 6, 'Sediakan lingkungan aman dan nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 7, 'Berikan aktivitas rekreasi dan pengalihan sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Terapeutik', 8, 'Lakukan intervensi pengendalian perilaku waham (mis. limit setting, pembatasan wilayah, pengekangan fisik, atau seklusi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Edukasi', 1, 'Anjurkan mengungkapkan dan memvalidasi waham (uji realitas) dengan orang yang dipercaya (pemberian asuhan atau keluarga)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Edukasi', 2, 'Anjurkan melakukan rutinitas harian secara konsisten'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Edukasi', 3, 'Latih manajemen stres'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Edukasi', 4, 'Jelaskan tentang waham serta penyakit terkait (mis. delirium, skizofrenia, atau depresi), cara mengatasi dan obat yang diberikan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat, sesuai indikasi');


-- ============================================================
-- 5. RELASI SDKI → SLKI
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
-- D.0092 → Keberdayaan
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09071')),
-- D.0093 → Status Koping Keluarga
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09088')),
-- D.0094 → Status Koping
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09086')),
-- D.0095 → Status Koping Komunitas
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09089')),
-- D.0096 → Status Koping
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09086')),
-- D.0097 → Status Koping Keluarga
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09088')),
-- D.0098 → Penerimaan
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09082')),
-- D.0099 → Perilaku Kesehatan
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03025')),
-- D.0100 → Status Spiritual
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09091')),
-- D.0101 → Harga Diri
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069')),
-- D.0102 → Harga Diri + Citra Tubuh
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09067')),
-- D.0103 → Keberdayaan
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09071')),
-- D.0104 → Ketahanan Personal
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09073')),
-- D.0105 → Status Orientasi
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'));


-- ============================================================
-- 6. RELASI SLKI → SIKI
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
-- L.09071 Keberdayaan → Promosi Harapan, Promosi Koping
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312')),
-- L.09088 Status Koping Keluarga → Dukungan Koping Keluarga
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260')),
-- L.09086 Status Koping → Promosi Harga Diri, Dukungan Pengambilan Keputusan, Dukungan Penampilan Peran, Promosi Koping
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09086'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312')),
-- L.09089 Status Koping Komunitas → Manajemen Lingkungan Komunitas
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14515')),
-- L.09082 Penerimaan → Promosi Kesadaran Diri
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09082'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09311')),
-- L.03025 Perilaku Kesehatan → Promosi Perilaku Upaya Kesehatan
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03025'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12472')),
-- L.09091 Status Spiritual → Dukungan Perkembangan Spiritual
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09269')),
-- L.09069 Harga Diri → Promosi Harga Diri, Promosi Koping, Promosi Citra Tubuh, Manajemen Mood, Terapi Kelompok
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL)),
-- L.09067 Citra Tubuh → Promosi Koping, Promosi Citra Tubuh, Manajemen Mood, Terapi Kelompok
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), (SELECT id FROM intervensi_siki WHERE label_intervensi='Terapi Kelompok' AND kode_intervensi IS NULL)),
-- L.09073 Ketahanan Personal → Dukungan Proses Berduka
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274')),
-- L.09090 Status Orientasi → Manajemen Waham
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'));


SET FOREIGN_KEY_CHECKS = 1;
