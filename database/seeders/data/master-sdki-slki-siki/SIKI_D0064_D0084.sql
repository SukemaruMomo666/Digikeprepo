SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- DATA MASTER SIKI
-- Source: PDF PPNI — range diagnosa D.0064–D.0084
-- Generated: 2026-06-14
-- ============================================================
-- Intervensi yang di-generate (21 intervensi):
--   I.06189  Manajemen Delirium
--   I.06194  Manajemen Peningkatan Tekanan Intrakranial
--   I.06198  Pemantauan Tekanan Intrakranial
--   I.06195  Manajemen Sensasi Perifer
--   I.01019  Pengaturan Posisi
--   I.08238  Manajemen Nyeri
--   I.03119  Manajemen Mual
--   I.03120  Manajemen Muntah
--   I.07214  Konseling Seksualitas
--   I.12437  Edukasi Persalinan
--   I.12447  Edukasi Seksualitas
--   I.12381  Edukasi Keluarga Berencana
--   I.12411  Edukasi Penggunaan Alat Kontrasepsi
--   I.07216  Manajemen Kehamilan Tidak Dikehendaki
--   I.09326  Terapi Relaksasi
--   I.08242  Pemantauan Nyeri
--   I.08245  Perawatan Kenyamanan
--   I.08247  Teknik Imajinasi Terbimbing
--   I.08249  Terapi Murattal
--   I.09314  Reduksi Ansietas
--   I.09274  Dukungan Proses Berduka
--   I.09276  Dukungan Spiritual
--   I.09305  Promosi Citra Tubuh
--   I.09297  Orientasi Realita
-- ============================================================

-- ------------------------------------------------------------
-- 1. MASTER INTERVENSI (intervensi_siki)
-- ------------------------------------------------------------

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.06189', 'Manajemen Delirium', 'Fisiologis', 'Neurosensori', 'Mengidentifikasi dan mengelola lingkungan terapeutik dan aman pada status konfusi akut.'),
('I.06194', 'Manajemen Peningkatan Tekanan Intrakranial', 'Fisiologis', 'Neurosensori', 'Mengidentifikasi dan mengelola peningkatan tekanan dalam rongga kranial.'),
('I.06198', 'Pemantauan Tekanan Intrakranial', 'Fisiologis', 'Neurosensori', 'Mengumpulkan dan menganalisis data tekanan dalam rongga kranial.'),
('I.06195', 'Manajemen Sensasi Perifer', 'Fisiologis', 'Neurosensori', 'Mengidentifikasi dan mengelola ketidaknyamanan pada perubahan sensasi perifer.'),
('I.01019', 'Pengaturan Posisi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Menempatkan bagian tubuh untuk meningkatkan kesehatan fisiologis dan/atau psikologis.'),
('I.08238', 'Manajemen Nyeri', 'Psikologis', 'Nyeri dan Kenyamanan', 'Mengidentifikasi dan mengelola pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan atau fungsional dengan onset mendadak atau lambat dan berintensitas ringan hingga berat dan konstan.'),
('I.03119', 'Manajemen Mual', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola perasaan tidak nyaman pada bagian belakang tenggorokan atau lambung yang mengakibatkan muntah.'),
('I.03120', 'Manajemen Muntah', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi, mencegah dan mengelola refleks pengeluaran isi lambung.'),
('I.07214', 'Konseling Seksualitas', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Memberikan bimbingan seksual pada pasangan sehingga mampu menjalankan fungsinya secara optimal.'),
('I.12437', 'Edukasi Persalinan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi tentang proses persalinan.'),
('I.12447', 'Edukasi Seksualitas', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi dalam memahami dimensi fisik dan psikososial seksualitas.'),
('I.12381', 'Edukasi Keluarga Berencana', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi dan memfasilitasi ibu dan pasangan dalam penggunaan alat kontrasepsi untuk mengatur jarak kelahiran.'),
('I.12411', 'Edukasi Penggunaan Alat Kontrasepsi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan ibu dan pasangan tentang metode atau alat yang digunakan untuk mencegah kehamilan.'),
('I.07216', 'Manajemen Kehamilan Tidak Dikehendaki', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Mengidentifikasi dan mengelola kondisi pengambilan keputusan terhadap kehamilan yang tidak direncanakan.'),
('I.09326', 'Terapi Relaksasi', 'Psikologis', 'Nyeri dan Kenyamanan', 'Menggunakan teknik peregangan untuk mengurangi tanda dan gejala ketidaknyamanan seperti nyeri, ketegangan otot, atau kecemasan.'),
('I.08242', 'Pemantauan Nyeri', 'Psikologis', 'Nyeri dan Kenyamanan', 'Mengumpulkan dan menganalisis data nyeri.'),
('I.08245', 'Perawatan Kenyamanan', 'Psikologis', 'Nyeri dan Kenyamanan', 'Mengidentifikasi dan merawat pasien untuk meningkatkan rasa nyaman.'),
('I.08247', 'Teknik Imajinasi Terbimbing', 'Psikologis', 'Nyeri dan Kenyamanan', 'Menggunakan imajinasi yang diarahkan secara sadar untuk menurunkan stres, ansietas dan nyeri.'),
('I.08249', 'Terapi Murattal', 'Psikologis', 'Nyeri dan Kenyamanan', 'Menggunakan media Al-Qur\'an (baik dengan mendengar atau membaca) untuk membantu meningkatkan perubahan yang spesifik dalam tubuh baik secara fisiologis maupun psikologis.'),
('I.09314', 'Reduksi Ansietas', 'Psikologis', 'Integritas Ego', 'Meminimalkan kondisi individu dan pengalaman subjektif terhadap objek yang tidak jelas dan spesifik akibat antisipasi bahaya yang memungkinkan individu melakukan tindakan untuk menghadapi ancaman.'),
('I.09274', 'Dukungan Proses Berduka', 'Psikologis', 'Integritas Ego', 'Memfasilitasi penyelesaian kehilangan yang signifikan.'),
('I.09276', 'Dukungan Spiritual', 'Psikologis', 'Integritas Ego', 'Memfasilitasi peningkatan perasaan seimbang dan terhubung dengan kekuatan yang lebih besar.'),
('I.09305', 'Promosi Citra Tubuh', 'Psikologis', 'Integritas Ego', 'Meningkatkan perbaikan perubahan persepsi terhadap fisik pasien.'),
('I.09297', 'Orientasi Realita', 'Psikologis', 'Integritas Ego', 'Meningkatkan kesadaran terhadap identitas diri, waktu, dan lingkungan.');

-- ------------------------------------------------------------
-- 2. TINDAKAN PER INTERVENSI (siki_tindakan)
-- ------------------------------------------------------------

-- I.06189 Manajemen Delirium
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 1, 'Identifikasi faktor risiko delirium (mis. usia >75 tahun, disfungsi kognitif, gangguan penglihatan/pendengaran, penurunan kemampuan fungsional, infeksi, hipo/hipertermia, hipoksia, malnutrisi, efek obat, toksin, gangguan tidur, stres)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 2, 'Identifikasi tipe delirium (mis. hipoaktif, hiperaktif, campuran)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 3, 'Monitor status neurologis dan tingkat delirium'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 1, 'Berikan pencahayaan yang baik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 2, 'Sediakan jam dan kalender yang mudah terbaca'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 3, 'Hindari stimulus sensorik berlebihan (mis. televisi, pengumuman interkom)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 4, 'Lakukan pengekangan fisik, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 5, 'Sediakan informasi tentang apa yang terjadi dan apa yang dapat terjadi selanjutnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 6, 'Batasi pembuatan keputusan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 7, 'Hindari memvalidasi mispersepsi atau interpretasi realita yang tidak akurat (mis. halusinasi, waham)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 8, 'Nyatakan persepsi dengan cara yang tenang, meyakinkan, dan tidak argumentatif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 9, 'Fokus pada apa yang dikenali dan bermakna saat interaksi interpersonal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 10, 'Lakukan reorientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 11, 'Sediakan lingkungan fisik dan rutinitas harian yang konsisten'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 12, 'Gunakan isyarat lingkungan untuk stimulasi memori, reorientasi, dan meningkatkan perilaku yang sesuai (mis. tanda, gambar, jam, kalender, dan kode warna pada lingkungan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 13, 'Berikan informasi baru secara perlahan, sedikit demi sedikit, diulang-ulang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Edukasi', 1, 'Anjurkan kunjungan keluarga, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Edukasi', 2, 'Anjurkan penggunaan alat bantu sensorik (mis. kacamata, alat bantu dengar, dan gigi palsu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat ansietas atau agitasi, jika perlu');

-- I.06194 Manajemen Peningkatan Tekanan Intrakranial
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 1, 'Identifikasi penyebab peningkatan TIK (mis. lesi, gangguan metabolisme, edema serebral)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 2, 'Monitor tanda dan gejala peningkatan TIK (mis. tekanan darah meningkat, tekanan nadi melebar, bradikardi, pola napas ireguler, kesadaran menurun)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 3, 'Monitor MAP (Mean Arterial Pressure)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 4, 'Monitor CVP (Central Venous Pressure), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 5, 'Monitor PAWP, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 6, 'Monitor PAP, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 7, 'Monitor ICP (Intra Cranial Pressure), jika tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 8, 'Monitor CPP (Cerebral Perfusion Pressure)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 9, 'Monitor gelombang ICP'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 10, 'Monitor status pernapasan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 11, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 12, 'Monitor cairan serebrospinalis (mis. warna, konsistensi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 1, 'Minimalkan stimulus dengan menyediakan lingkungan yang tenang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 2, 'Berikan posisi semi fowler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 3, 'Hindari manuver valsava'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 4, 'Cegah terjadinya kejang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 5, 'Hindari penggunaan PEEP'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 6, 'Hindari pemberian cairan IV hipotonik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 7, 'Atur ventilator agar PaCO2 optimal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 8, 'Pertahankan suhu tubuh normal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 1, 'Kolaborasi pemberian sedasi dan antikonvulsan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 2, 'Kolaborasi pemberian diuretik osmosis, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 3, 'Kolaborasi pemberian pelunak tinja, jika perlu');

-- I.06198 Pemantauan Tekanan Intrakranial
-- (disebutkan sebagai intervensi pendukung D.0066, tindakan tidak dirinci di PDF — isi minimal)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'), 'Observasi', 1, 'Monitor tekanan intrakranial dan respons pasien terhadap aktivitas perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'), 'Observasi', 2, 'Monitor gelombang ICP'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'), 'Observasi', 3, 'Monitor tekanan perfusi serebral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'), 'Terapeutik', 1, 'Dokumentasikan hasil pemantauan tekanan intrakranial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan kepada keluarga');

-- I.06195 Manajemen Sensasi Perifer
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 1, 'Identifikasi penyebab perubahan sensasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 2, 'Identifikasi penggunaan alat pengikat, prostesis, sepatu, dan pakaian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 3, 'Periksa perbedaan sensasi tajam atau tumpul'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 4, 'Periksa perbedaan sensasi panas atau dingin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 5, 'Periksa kemampuan mengidentifikasi lokasi dan tekstur benda'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 6, 'Monitor terjadinya parestesia, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 7, 'Monitor perubahan kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Observasi', 8, 'Monitor adanya tromboflebitis dan tromboemboli vena'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Terapeutik', 1, 'Hindari pemakaian benda-benda yang berlebihan suhunya (terlalu panas atau dingin)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 1, 'Anjurkan penggunaan termometer untuk menguji suhu air'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 2, 'Anjurkan penggunaan sarung tangan termal saat memasak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Edukasi', 3, 'Anjurkan memakai sepatu lembut dan bertumit rendah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgesik, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 2, 'Kolaborasi pemberian kortikosteroid, jika perlu');

-- I.01019 Pengaturan Posisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Observasi', 1, 'Monitor status oksigenasi sebelum dan sesudah mengubah posisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Observasi', 2, 'Monitor alat traksi agar selalu tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 1, 'Tempatkan pada matras/tempat tidur terapeutik yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 2, 'Tempatkan pada posisi terapeutik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 3, 'Tempatkan objek yang sering digunakan dalam jangkauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 4, 'Tempatkan bel atau lampu panggil dalam jangkauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 5, 'Sediakan matras yang kokoh/padat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 6, 'Atur posisi tidur yang disukai, jika tidak kontraindikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 7, 'Atur posisi untuk mengurangi sesak (mis. semi-fowler)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 8, 'Atur posisi yang meningkatkan drainage'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 9, 'Posisikan pada kesejajaran tubuh yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 10, 'Imobilisasi dan topang bagian tubuh yang cedera dengan tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 11, 'Tinggikan bagian tubuh yang sakit dengan tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 12, 'Tinggikan anggota gerak 20 derajat atau lebih di atas level jantung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 13, 'Tinggikan tempat tidur bagian kepala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 14, 'Berikan bantal yang tepat pada leher'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 15, 'Berikan topangan pada area edema (mis. bantal di bawah lengan dan skrotum)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 16, 'Motivasi melakukan ROM aktif atau pasif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 17, 'Motivasi terlibat dalam perubahan posisi, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 18, 'Hindari menempatkan pada posisi yang dapat meningkatkan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 19, 'Hindari menempatkan stump amputasi pada posisi fleksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 20, 'Hindari posisi yang menimbulkan ketegangan pada luka'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 21, 'Minimalkan gesekan dan tarikan saat mengubah posisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 22, 'Ubah posisi setiap 2 jam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 23, 'Ubah posisi dengan teknik log roll'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 24, 'Pertahankan posisi dan integritas traksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Terapeutik', 25, 'Jadwalkan secara tertulis untuk perubahan posisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Edukasi', 1, 'Informasikan saat akan dilakukan perubahan posisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Edukasi', 2, 'Ajarkan cara menggunakan postur yang baik dan mekanika tubuh yang baik selama melakukan perubahan posisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'), 'Kolaborasi', 1, 'Kolaborasi pemberian premedikasi sebelum mengubah posisi, jika perlu');

-- I.08238 Manajemen Nyeri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 1, 'Identifikasi lokasi, karakteristik, durasi, frekuensi, kualitas, intensitas nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 2, 'Identifikasi skala nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 3, 'Identifikasi respons nyeri non verbal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 4, 'Identifikasi faktor yang memperberat dan memperingan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 5, 'Identifikasi pengetahuan dan keyakinan tentang nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 6, 'Identifikasi pengaruh budaya terhadap respons nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 7, 'Identifikasi pengaruh nyeri pada kualitas hidup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 8, 'Monitor keberhasilan terapi komplementer yang sudah diberikan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Observasi', 9, 'Monitor efek samping penggunaan analgetik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 1, 'Berikan teknik nonfarmakologis untuk mengurangi rasa nyeri (mis. TENS, hipnosis, akupresur, terapi musik, biofeedback, terapi pijat, aromaterapi, teknik imajinasi terbimbing, kompres hangat/dingin, terapi bermain)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 2, 'Kontrol lingkungan yang memperberat rasa nyeri (mis. suhu ruangan, pencahayaan, kebisingan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 3, 'Fasilitasi istirahat dan tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 4, 'Pertimbangkan jenis dan sumber nyeri dalam pemilihan strategi meredakan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi', 1, 'Jelaskan penyebab, periode, dan pemicu nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi', 2, 'Jelaskan strategi meredakan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi', 3, 'Anjurkan memonitor nyeri secara mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi', 4, 'Anjurkan menggunakan analgetik secara tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Edukasi', 5, 'Ajarkan teknik nonfarmakologis untuk mengurangi rasa nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgetik, jika perlu');

-- I.03119 Manajemen Mual
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi pengalaman mual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Identifikasi isyarat nonverbal ketidaknyamanan (mis. bayi, anak-anak, dan mereka yang tidak dapat berkomunikasi secara efektif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 3, 'Identifikasi dampak mual terhadap kualitas hidup (mis. nafsu makan, aktivitas, kinerja, tanggung jawab peran, dan tidur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 4, 'Identifikasi faktor penyebab mual (mis. pengobatan dan prosedur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 5, 'Monitor mual (mis. frekuensi, durasi, dan tingkat keparahan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Kendalikan faktor lingkungan penyebab mual (mis. bau tidak sedap, suara, dan rangsangan visual yang tidak menyenangkan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 2, 'Kurangi atau hilangkan keadaan penyebab mual (mis. kecemasan, ketakutan, kelelahan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 3, 'Berikan makanan dalam jumlah kecil dan menarik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 1, 'Anjurkan istirahat dan tidur yang cukup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 2, 'Anjurkan sering membersihkan mulut, kecuali jika merangsang mual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Kolaborasi', 1, 'Kolaborasi pemberian antiemetik, jika perlu');

-- I.03120 Manajemen Muntah
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Observasi', 1, 'Identifikasi karakteristik muntah (mis. warna, konsistensi, adanya darah, waktu, frekuensi, dan durasi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Observasi', 2, 'Periksa volume muntah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Observasi', 3, 'Identifikasi faktor penyebab muntah (mis. pengobatan dan prosedur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Terapeutik', 1, 'Kurangi atau hilangkan keadaan penyebab muntah (mis. kecemasan dan ketakutan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Terapeutik', 2, 'Berikan dukungan fisik saat muntah (mis. membantu membungkuk atau menundukkan kepala)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Terapeutik', 3, 'Bersihkan mulut dan hidung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Edukasi', 1, 'Anjurkan memperbanyak istirahat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03120'), 'Kolaborasi', 1, 'Kolaborasi pemberian antiemetik, jika perlu');

-- I.07214 Konseling Seksualitas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Observasi', 1, 'Identifikasi tingkat pengetahuan, masalah sistem reproduksi, masalah seksualitas dan penyakit menular seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Observasi', 2, 'Identifikasi waktu disfungsi seksual dan kemungkinan penyebab'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Observasi', 3, 'Monitor stres, kecemasan, depresi dan penyebab disfungsi seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Terapeutik', 1, 'Fasilitasi komunikasi antara pasien dan pasangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Terapeutik', 2, 'Berikan kesempatan kepada pasangan untuk menceritakan permasalahan seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Terapeutik', 3, 'Berikan pujian terhadap perilaku yang benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Terapeutik', 4, 'Berikan saran yang sesuai kebutuhan pasangan dengan menggunakan bahasa yang mudah diterima, dipahami dan tidak menghakimi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Edukasi', 1, 'Jelaskan efek pengobatan, kesehatan dan penyakit terhadap disfungsi seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Edukasi', 2, 'Informasikan pentingnya modifikasi pada aktivitas seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'), 'Kolaborasi', 1, 'Kolaborasi dengan spesialis seksologi, jika perlu');

-- I.12437 Edukasi Persalinan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Observasi', 1, 'Identifikasi tingkat pengetahuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Observasi', 2, 'Identifikasi pemahaman ibu tentang persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 4, 'Berikan reinforcement positif terhadap perubahan perilaku ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 1, 'Jelaskan metode persalinan yang ibu inginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 2, 'Jelaskan persiapan dan tempat persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 3, 'Anjurkan ibu mengikuti kelas ibu hamil pada usia kehamilan lebih dari 36 minggu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 4, 'Anjurkan ibu menggunakan teknik manajemen nyeri persalinan tiap kala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 5, 'Anjurkan ibu cukup nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 6, 'Ajarkan teknik relaksasi untuk meredakan kecemasan dan ketidaknyamanan persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 7, 'Ajarkan ibu cara mengenali tanda-tanda persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'), 'Edukasi', 8, 'Ajarkan ibu mengenali tanda bahaya persalinan');

-- I.12447 Edukasi Seksualitas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Observasi', 1, 'Identifikasi kesiapan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Terapeutik', 4, 'Fasilitasi kesadaran keluarga terhadap anak dan remaja serta pengaruh media'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 1, 'Jelaskan anatomi dan fisiologi sistem reproduksi laki-laki dan perempuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 2, 'Jelaskan perkembangan seksualitas sepanjang siklus kehidupan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 3, 'Jelaskan perkembangan emosi masa anak dan remaja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 4, 'Jelaskan pengaruh tekanan kelompok dan sosial terhadap aktivitas seksual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 5, 'Jelaskan konsekuensi negatif mengasuh anak pada usia dini (mis. kemiskinan, kehilangan karir dan pendidikan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 6, 'Jelaskan risiko tertular penyakit menular seksual dan AIDS akibat seks bebas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 7, 'Anjurkan orang tua menjadi edukator seksualitas bagi anak-anaknya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 8, 'Anjurkan anak/remaja tidak melakukan aktivitas seksual di luar nikah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'), 'Edukasi', 9, 'Ajarkan keterampilan komunikasi asertif untuk menolak tekanan teman sebaya dan sosial dalam aktivitas seksual');

-- I.12381 Edukasi Keluarga Berencana
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Observasi', 2, 'Identifikasi pengetahuan tentang alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 4, 'Lakukan penapisan pada ibu dan pasangan untuk penggunaan alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 5, 'Lakukan pemeriksaan fisik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 6, 'Fasilitasi ibu dan pasangan dalam mengambil keputusan menggunakan alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Terapeutik', 7, 'Diskusikan pertimbangan agama, budaya, perkembangan, sosial ekonomi terhadap pemilihan alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Edukasi', 1, 'Jelaskan tentang sistem reproduksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Edukasi', 2, 'Jelaskan metode-metode alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'), 'Edukasi', 3, 'Jelaskan aktivitas seksualitas setelah mengikuti program KB');

-- I.12411 Edukasi Penggunaan Alat Kontrasepsi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Observasi', 1, 'Identifikasi pengetahuan, keadaan umum, penggunaan alat kontrasepsi sebelumnya, riwayat obstetri dan ginekologi ibu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Terapeutik', 3, 'Fasilitasi ibu memilih kontrasepsi yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Terapeutik', 4, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 1, 'Jelaskan kepada ibu dan pasangan tentang tujuan, manfaat, dan efek samping penggunaan alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 2, 'Jelaskan kepada ibu dan pasangan tentang jenis-jenis alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 3, 'Jelaskan ibu dan pasangan tentang faktor risiko jika terlalu sering atau terlalu dekat jarak persalinan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 4, 'Jelaskan ibu dan pasangan tentang usia produktif dan aman untuk melahirkan dan jarak ideal melahirkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 5, 'Anjurkan ibu dan pasangan memantau keluhan yang timbul selama menggunakan alat kontrasepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 6, 'Anjurkan ibu mengidentifikasi tanda-tanda masalah ginekologi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 7, 'Anjurkan ibu dan pasangan untuk merencanakan jumlah anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 8, 'Anjurkan ibu berkonsultasi dengan dokter atau tenaga medis lainnya sebagai pertimbangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'), 'Edukasi', 9, 'Ajarkan ibu dan pasangan menghitung masa subur dan siklus menstruasi');

-- I.07216 Manajemen Kehamilan Tidak Dikehendaki
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Observasi', 1, 'Identifikasi nilai-nilai dan keyakinan terhadap kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Observasi', 2, 'Identifikasi pilihan terhadap kehamilannya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 1, 'Fasilitasi mengungkapkan perasaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 2, 'Diskusikan nilai-nilai dan keyakinan yang keliru terhadap kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 3, 'Diskusikan konflik yang terjadi dengan adanya kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 4, 'Fasilitasi mengembangkan teknik penyelesaian masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 5, 'Berikan konseling kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Terapeutik', 6, 'Fasilitasi mengidentifikasi sistem pendukung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Edukasi', 1, 'Informasikan pentingnya meningkatkan status nutrisi selama kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Edukasi', 2, 'Informasikan perubahan yang terjadi selama kehamilan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'), 'Kolaborasi', 1, 'Rujuk jika mengalami komplikasi kehamilan');

-- I.09326 Terapi Relaksasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Observasi', 1, 'Identifikasi penurunan tingkat energi, ketidakmampuan berkonsentrasi, atau gejala lain yang mengganggu kemampuan kognitif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Observasi', 2, 'Identifikasi teknik relaksasi yang pernah efektif digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Observasi', 3, 'Identifikasi kesediaan, kemampuan, dan penggunaan teknik sebelumnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Observasi', 4, 'Periksa ketegangan otot, frekuensi nadi, tekanan darah, dan suhu sebelum dan sesudah latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Observasi', 5, 'Monitor respons terhadap terapi relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Terapeutik', 1, 'Ciptakan lingkungan tenang dan tanpa gangguan dengan pencahayaan dan suhu ruang nyaman, jika memungkinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Terapeutik', 2, 'Berikan informasi tertulis tentang persiapan dan prosedur teknik relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Terapeutik', 3, 'Gunakan pakaian longgar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Terapeutik', 4, 'Gunakan nada suara lembut dengan irama lambat dan berirama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Terapeutik', 5, 'Gunakan relaksasi sebagai strategi penunjang dengan analgetik atau tindakan medis lain, jika sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 1, 'Jelaskan tujuan, manfaat, batasan, dan jenis relaksasi yang tersedia (mis. musik, meditasi, napas dalam, relaksasi otot progresif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 2, 'Jelaskan secara rinci intervensi relaksasi yang dipilih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 3, 'Anjurkan mengambil posisi nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 4, 'Anjurkan rileks dan merasakan sensasi relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 5, 'Anjurkan sering mengulangi atau melatih teknik yang dipilih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'), 'Edukasi', 6, 'Demonstrasikan dan latih teknik relaksasi (mis. napas dalam, peregangan, atau imajinasi terbimbing)');

-- I.08242 Pemantauan Nyeri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Observasi', 1, 'Identifikasi faktor pencetus dan pereda nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Observasi', 2, 'Monitor kualitas nyeri (mis. terasa tajam, tumpul, diremas-remas, ditimpa beban berat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Observasi', 3, 'Monitor lokasi dan penyebaran nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Observasi', 4, 'Monitor intensitas nyeri dengan menggunakan skala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Observasi', 5, 'Monitor durasi dan frekuensi nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Terapeutik', 1, 'Atur interval pemantauan sesuai dengan kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Terapeutik', 2, 'Dokumentasikan hasil pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'), 'Edukasi', 2, 'Informasikan hasil pemantauan, jika perlu');

-- I.08245 Perawatan Kenyamanan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Observasi', 1, 'Identifikasi gejala yang tidak menyenangkan (mis. mual, nyeri, gatal, sesak)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Observasi', 2, 'Identifikasi pemahaman tentang kondisi, situasi dan perasaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Observasi', 3, 'Identifikasi masalah emosional dan spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 1, 'Berikan posisi yang nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 2, 'Berikan kompres dingin atau hangat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 3, 'Ciptakan lingkungan yang nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 4, 'Berikan pemijatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 5, 'Berikan terapi akupresur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 6, 'Berikan terapi hipnosis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 7, 'Dukung keluarga dan pengasuh terlibat dalam terapi/pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Terapeutik', 8, 'Diskusikan mengenai situasi dan pilihan terapi/pengobatan yang diinginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Edukasi', 1, 'Jelaskan mengenai kondisi dan pilihan terapi/pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Edukasi', 2, 'Ajarkan terapi relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Edukasi', 3, 'Ajarkan latihan pernapasan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Edukasi', 4, 'Ajarkan teknik distraksi dan imajinasi terbimbing'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgesik, antipruritus, antihistamin, jika perlu');

-- I.08247 Teknik Imajinasi Terbimbing
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'), 'Observasi', 1, 'Identifikasi masalah yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'), 'Observasi', 2, 'Monitor respons perubahan emosional'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'), 'Terapeutik', 1, 'Sediakan ruangan yang tenang dan nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'), 'Edukasi', 1, 'Anjurkan membayangkan suatu tempat yang sangat menyenangkan yang pernah atau yang ingin dikunjungi (mis. gunung, pantai)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'), 'Edukasi', 2, 'Anjurkan membayangkan mengunjungi tempat yang dikunjungi berada dalam kondisi yang sehat, bersama dengan orang yang dikasihi atau dicintai dalam suasana yang nyaman');

-- I.08249 Terapi Murattal
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08249'), 'Observasi', 1, 'Identifikasi lama dan durasi pemberian sesuai dengan kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08249'), 'Terapeutik', 1, 'Posisikan dalam posisi lingkungan yang nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08249'), 'Edukasi', 1, 'Jelaskan tujuan dan manfaat terapi');

-- I.09314 Reduksi Ansietas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Observasi', 1, 'Identifikasi saat tingkat ansietas berubah (mis. kondisi, waktu, stresor)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Observasi', 2, 'Monitor tanda-tanda ansietas (verbal dan nonverbal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 1, 'Ciptakan suasana terapeutik untuk menumbuhkan kepercayaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 2, 'Pahami situasi yang membuat ansietas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 3, 'Dengarkan dengan penuh perhatian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Terapeutik', 4, 'Gunakan pendekatan yang tenang dan meyakinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Edukasi', 1, 'Jelaskan prosedur, termasuk sensasi yang mungkin dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Edukasi', 2, 'Anjurkan mengungkapkan perasaan dan persepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Edukasi', 3, 'Latih teknik relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antiansietas, jika perlu');

-- I.09274 Dukungan Proses Berduka
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 1, 'Identifikasi proses berduka yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Observasi', 2, 'Identifikasi keterikatan pada benda yang hilang atau orang yang meninggal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 1, 'Motivasi agar mau mengungkapkan perasaan kehilangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 2, 'Motivasi untuk menguatkan dukungan keluarga atau orang terdekat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Terapeutik', 3, 'Diskusikan strategi koping yang dapat digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'), 'Edukasi', 1, 'Ajarkan melewati proses berduka secara bertahap');

-- I.09276 Dukungan Spiritual
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Observasi', 1, 'Identifikasi perasaan khawatir, kesepian dan ketidakberdayaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Observasi', 2, 'Identifikasi pandangan tentang hubungan antara spiritual dan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Observasi', 3, 'Identifikasi harapan dan kekuatan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Observasi', 4, 'Identifikasi ketaatan dalam beragama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 1, 'Berikan kesempatan mengekspresikan perasaan tentang penyakit dan kematian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 2, 'Berikan kesempatan mengekspresikan dan meredakan marah secara tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 3, 'Yakinkan bahwa perawat bersedia mendukung selama masa ketidakberdayaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 4, 'Sediakan privasi dan waktu tenang untuk aktivitas spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 5, 'Diskusikan keyakinan tentang makna dan tujuan hidup, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Terapeutik', 6, 'Fasilitasi melakukan kegiatan ibadah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Edukasi', 1, 'Anjurkan berinteraksi dengan keluarga, teman, dan/atau orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Edukasi', 2, 'Anjurkan berpartisipasi dalam kelompok pendukung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Edukasi', 3, 'Ajarkan metode relaksasi, meditasi, dan imajinasi terbimbing'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09276'), 'Kolaborasi', 1, 'Atur kunjungan dengan rohaniawan (mis. ustadz, pendeta, romo, biksu)');

-- I.09305 Promosi Citra Tubuh
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 1, 'Identifikasi harapan citra tubuh berdasarkan tahap perkembangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 2, 'Identifikasi budaya, agama, jenis kelamin, dan umur terkait citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 3, 'Identifikasi perubahan citra tubuh yang mengakibatkan isolasi sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 4, 'Monitor frekuensi pernyataan kritik terhadap diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Observasi', 5, 'Monitor apakah pasien bisa melihat bagian tubuh yang berubah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 1, 'Diskusikan perubahan tubuh dan fungsinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 2, 'Diskusikan perbedaan penampilan fisik terhadap harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 3, 'Diskusikan perubahan akibat pubertas, kehamilan dan penuaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 4, 'Diskusikan kondisi stres yang mempengaruhi citra tubuh (mis. luka, penyakit, pembedahan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 5, 'Diskusikan cara mengembangkan harapan citra tubuh secara realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Terapeutik', 6, 'Diskusikan persepsi pasien dan keluarga tentang perubahan citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 1, 'Jelaskan kepada keluarga tentang perawatan perubahan citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 2, 'Anjurkan mengungkapkan gambaran diri terhadap citra tubuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 3, 'Anjurkan menggunakan alat bantu (mis. pakaian, wig, kosmetik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 4, 'Anjurkan mengikuti kelompok pendukung (mis. kelompok sebaya)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 5, 'Latih fungsi tubuh yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 6, 'Latih peningkatan penampilan diri (mis. berdandan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09305'), 'Edukasi', 7, 'Latih pengungkapan kemampuan diri kepada orang lain maupun kelompok');

-- I.09297 Orientasi Realita
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Observasi', 1, 'Monitor perubahan orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Observasi', 2, 'Monitor perubahan kognitif dan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 1, 'Perkenalkan nama saat memulai interaksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 2, 'Orientasi orang, tempat, dan waktu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 3, 'Hadirkan realita (mis. beri penjelasan alternatif, hindari perdebatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 4, 'Sediakan lingkungan dan rutinitas secara konsisten'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 5, 'Atur stimulasi sensorik dan lingkungan (mis. kunjungan, pemandangan, suara, dan pencahayaan, bau, dan sentuhan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 6, 'Gunakan simbol dalam mengorientasikan lingkungan (mis. tanda, gambar, dan warna)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 7, 'Libatkan dalam terapi kelompok orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 8, 'Berikan waktu istirahat dan tidur cukup, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 9, 'Fasilitasi akses informasi (mis. televisi, surat kabar, radio), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 1, 'Anjurkan perawatan diri secara mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 2, 'Anjurkan penggunaan alat bantu (mis. kacamata, alat bantu dengar, gigi palsu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 3, 'Ajarkan keluarga dalam perawatan orientasi realita');

SET FOREIGN_KEY_CHECKS = 1;
