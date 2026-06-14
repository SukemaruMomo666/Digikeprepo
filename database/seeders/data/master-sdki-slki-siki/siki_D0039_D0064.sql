-- =====================================================================
-- DATA MASTER SIKI — Batch D.0039–D.0064 (PDF hal. 214–311)
-- DigiKep - Standar Intervensi Keperawatan Indonesia (SIKI)
-- Berisi: intervensi_siki (master) + siki_tindakan (per intervensi)
--
-- CATATAN PENTING SEBELUM RUN:
-- 1. Beberapa kode di bawah ini KEMUNGKINAN sudah ada di tabel
--    intervensi_siki (DB lokal sudah punya 46 baris untuk D.0001-D.0052).
--    Jika kode sudah ada, INSERT ke intervensi_siki akan gagal (UNIQUE).
--    -> Cek dulu kode mana yang sudah ada, hapus baris yang duplikat
--       dari INSERT batch di bawah sebelum menjalankan file ini.
-- 2. Kolom kategori/subkategori untuk intervensi_siki tidak tercantum
--    di PDF (PDF hanya berisi kategori untuk SDKI). Nilai di bawah
--    diisi berdasarkan klasifikasi standar SIKI PPNI - perlu verifikasi.
-- 3. I.06189 Manajemen Delirium (D.0064): tindakan Edukasi & Kolaborasi
--    BELUM tercakup di batch PDF ini (terpotong di hal. 311). Akan
--    dilengkapi saat batch PDF berikutnya (D.0065 dst) diproses.
-- 4. I.04148 "Perawatan Inkontinensia Urine" yang tertulis dengan kode
--    I.04148 di D.0042 (hal. 224) adalah TYPO di buku - kode yang benar
--    adalah I.04163 (konsisten dengan D.0043/44/46/51). Sudah dikoreksi.
-- =====================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- 1. MASTER intervensi_siki (28 intervensi unik)
-- ---------------------------------------------------------------------
INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.02068', 'Pencegahan Syok', 'Fisiologis', 'Sirkulasi', 'Mengidentifikasi dan menurunkan risiko terjadinya ketidakmampuan tubuh menyediakan oksigen dan nutrien untuk mencukupi kebutuhan jaringan.'),
('I.03121', 'Pemantauan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengumpulkan dan menganalisis data terkait pengaturan keseimbangan cairan.'),
('I.04152', 'Manajemen Eliminasi Urine', 'Fisiologis', 'Eliminasi', 'Mengidentifikasi dan mengelola gangguan pola eliminasi urine.'),
('I.04150', 'Latihan Eliminasi Fekal', 'Fisiologis', 'Eliminasi', 'Mengajarkan suatu kemampuan melatih usus untuk dievakuasi pada interval tertentu.'),
('I.04148', 'Kateterisasi Urine', 'Fisiologis', 'Eliminasi', 'Memasukkan selang kateter urine ke dalam kandung kemih.'),
('I.04163', 'Perawatan Inkontinensia Urine', 'Fisiologis', 'Eliminasi', 'Mengidentifikasi dan merawat pasien yang mengalami pengeluaran urine secara involunter (tidak disadari).'),
('I.04149', 'Latihan Berkemih', 'Fisiologis', 'Eliminasi', 'Mengajarkan suatu kemampuan melakukan eliminasi urine.'),
('I.07215', 'Latihan Otot Panggul', 'Fisiologis', 'Eliminasi', 'Mengajarkan kemampuan meningkatkan otot-otot elevator ani dan urogenitas melalui kontraksi berulang untuk menurunkan inkontinensia urin dan ejakulasi dini.'),
('I.04151', 'Manajemen Eliminasi Fekal', 'Fisiologis', 'Eliminasi', 'Mengidentifikasi dan mengelola gangguan pola eliminasi fekal.'),
('I.04160', 'Pencegahan Konstipasi', 'Fisiologis', 'Eliminasi', 'Mengidentifikasi dan menurunkan risiko terjadinya penurunan frekuensi normal defekasi yang disertai kesulitan pengeluaran feses yang tidak lengkap.'),
('I.10338', 'Perawatan Bayi', 'Fisiologis', 'Pertumbuhan dan Perkembangan', 'Mengidentifikasi dan merawat kesehatan bayi.'),
('I.05173', 'Dukungan Mobilisasi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi pasien untuk meningkatkan aktivitas pergerakan fisik.'),
('I.12389', 'Edukasi Latihan Fisik', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan aktivitas fisik reguler untuk mempertahankan atau meningkatkan kebugaran dan kesehatan.'),
('I.11354', 'Perawatan Kaki', 'Fisiologis', 'Aktivitas dan Istirahat', 'Mengidentifikasi dan merawat kaki untuk keperluan relaksasi, kebersihan, dan kesehatan kaki.'),
('I.02079', 'Perawatan Sirkulasi', 'Fisiologis', 'Sirkulasi', 'Mengidentifikasi dan merawat area lokal dengan keterbatasan sirkulasi perifer.'),
('I.05174', 'Dukungan Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi siklus tidur dan terjaga yang teratur.'),
('I.05178', 'Manajemen Energi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Mengidentifikasi dan mengelola penggunaan energi untuk mengatasi atau mencegah kelelahan dan mengoptimalkan proses pemulihan.'),
('I.05186', 'Terapi Aktivitas', 'Fisiologis', 'Aktivitas dan Istirahat', 'Menggunakan aktivitas fisik, kognitif, sosial, dan spiritual tertentu untuk memulihkan keterlibatan, frekuensi dan durasi aktivitas individu atau kelompok.'),
('I.09289', 'Manajemen Mood', 'Psikologis', 'Integritas Ego', 'Mengidentifikasi dan mengelola keselamatan, stabilisasi, pemulihan dan perawatan gangguan mood (keadaan emosional yang bersifat sementara).'),
('I.12362', 'Edukasi Aktivitas/Istirahat', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan pengaturan aktivitas dan istirahat.'),
('I.13490', 'Promosi Keutuhan Keluarga', 'Relasional', 'Interaksi Sosial', 'Meningkatkan pengetahuan dan kemampuan untuk menjaga dan meningkatkan kerekatan dan keutuhan keluarga.'),
('I.12379', 'Edukasi Keamanan Bayi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Menyediakan informasi dan dukungan terhadap pencegahan cedera pada bayi.'),
('I.05183', 'Promosi Latihan Fisik', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memfasilitasi aktivitas fisik reguler untuk mempertahankan atau meningkatkan ke tingkat kebugaran dan kesehatan yang lebih tinggi.'),
('I.06190', 'Manajemen Disrefleksia', 'Fisiologis', 'Neurosensori', 'Mengidentifikasi dan mengelola refleks hiperaktif dan respon otonom yang tidak tepat pada lesi servikal atau toraks.'),
('I.06188', 'Latihan Memori', 'Fisiologis', 'Neurosensori', 'Mengajarkan kemampuan untuk meningkatkan daya ingat.'),
('I.09297', 'Orientasi Realita', 'Psikologis', 'Integritas Ego', 'Meningkatkan kesadaran terhadap identitas diri, waktu, dan lingkungan.'),
('I.11351', 'Dukungan Perawatan Diri: Makan/Minum', 'Fisiologis', 'Nutrisi dan Cairan', 'Memfasilitasi pemenuhan kebutuhan makan/minum.'),
('I.06189', 'Manajemen Delirium', 'Fisiologis', 'Neurosensori', 'Mengidentifikasi dan mengelola lingkungan terapeutik dan aman pada status konfusi akut.');

-- ---------------------------------------------------------------------
-- 2. siki_tindakan per intervensi
-- ---------------------------------------------------------------------

-- I.02068 Pencegahan Syok
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 1, 'Monitor status kardiopulmonal (frekuensi dan kekuatan nadi, frekuensi napas, TD, MAP)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 2, 'Monitor status oksigenasi (oksimetri nadi, AGD)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 3, 'Monitor status cairan (masukan dan haluaran, turgor kulit, CRT)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 4, 'Monitor tingkat kesadaran dan respon pupil'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 5, 'Periksa riwayat alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 1, 'Berikan oksigen untuk mempertahankan saturasi oksigen > 94%'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 2, 'Lakukan skin test untuk mencegah reaksi alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 1, 'Jelaskan penyebab atau faktor risiko syok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 2, 'Jelaskan tanda dan gejala awal syok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 3, 'Anjurkan memperbanyak asupan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Kolaborasi', 1, 'Kolaborasi pemberian IV, jika perlu');

-- I.03121 Pemantauan Cairan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 1, 'Monitor frekuensi dan kekuatan nadi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 2, 'Monitor frekuensi napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Observasi', 3, 'Monitor tekanan darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Terapeutik', 1, 'Atur interval waktu pemantauan sesuai dengan kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Terapeutik', 2, 'Dokumentasikan hasil pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan');

-- I.04152 Manajemen Eliminasi Urine
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Observasi', 1, 'Identifikasi tanda dan gejala retensi atau inkontinensia urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Observasi', 2, 'Identifikasi faktor yang menyebabkan retensi atau inkontinensia urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Observasi', 3, 'Monitor eliminasi urine (mis. frekuensi, konsistensi, aroma, volume, dan warna)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 1, 'Catat waktu-waktu dan haluaran berkemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 2, 'Batasi asupan cairan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Terapeutik', 3, 'Ambil sampel urine tengah (midstream) atau kultur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 1, 'Ajarkan tanda dan gejala infeksi saluran kemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 2, 'Ajarkan mengukur asupan cairan dan haluaran urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 3, 'Ajarkan mengambil spesimen urine midstream'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 4, 'Ajarkan mengenali tanda berkemih dan waktu yang tepat untuk berkemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 5, 'Ajarkan terapi modalitas penguatan otot-otot panggul/berkemihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 6, 'Anjurkan minum yang cukup, jika tidak ada kontraindikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Edukasi', 7, 'Anjurkan mengurangi minum menjelang tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat supositoria uretra, jika perlu');

-- I.04150 Latihan Eliminasi Fekal
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Observasi', 1, 'Monitor peristaltik usus secara teratur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Terapeutik', 1, 'Anjurkan waktu yang konsisten untuk buang air besar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Edukasi', 1, 'Anjurkan mengkonsumsi makanan tertentu, sesuai program atau hasil konsultasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Edukasi', 2, 'Anjurkan asupan cairan yang adekuat sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Edukasi', 3, 'Anjurkan olahraga sesuai toleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04150'), 'Kolaborasi', 1, 'Kolaborasi penggunaan supositoria, jika perlu');

-- I.04148 Kateterisasi Urine
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Observasi', 1, 'Periksa kondisi pasien (mis. kesadaran, tanda-tanda vital, daerah perineal, distensi kandung kemih, inkontinensia urine, refleks berkemih)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 1, 'Siapkan peralatan, bahan-bahan dan ruangan tindakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 2, 'Siapkan pasien: bebaskan pakaian bawah dan posisikan dorsal rekumben (untuk wanita) dan supine (untuk laki-laki)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 3, 'Pasang sarung tangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 4, 'Bersihkan daerah perineal atau preposium dengan cairan NaCl atau aquades'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 5, 'Lakukan insersi kateter urine dengan menerapkan prinsip aseptik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 6, 'Sambungkan kateter urine dengan urine bag'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 7, 'Isi balon dengan NaCl 0,9% sesuai anjuran pabrik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 8, 'Fiksasi selang kateter di atas simpisis atau di paha'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 9, 'Pastikan kantung urine ditempatkan lebih rendah dari kandung kemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 10, 'Berikan label waktu pemasangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemasangan kateter urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'), 'Edukasi', 2, 'Anjurkan menarik napas saat insersi selang kateter');

-- I.04163 Perawatan Inkontinensia Urine
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Observasi', 1, 'Identifikasi penyebab inkontinensia urine (mis. disfungsi neurologis, gangguan medula spinalis, gangguan refleks destrusor, obat-obatan, usia, riwayat operasi, gangguan fungsi kognitif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Observasi', 2, 'Identifikasi perasaan dan persepsi pasien terhadap inkontinensia urine yang dialaminya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Observasi', 3, 'Monitor keefektifan obat, pembedahan dan terapi modalitas berkemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Observasi', 4, 'Monitor kebiasaan BAK'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Terapeutik', 1, 'Bersihkan genital dan kulit sekitar secara rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Terapeutik', 2, 'Berikan pujian atas keberhasilan mencegah inkontinensia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Terapeutik', 3, 'Buat jadwal konsumsi obat-obat diuretik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Terapeutik', 4, 'Ambil sampel urine untuk pemeriksaan urine lengkap atau kultur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 1, 'Jelaskan definisi, jenis inkontinensia, penyebab inkontinensia urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 2, 'Jelaskan program penanganan inkontinensia urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 3, 'Jelaskan jenis pakaian dan lingkungan yang mendukung proses berkemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 4, 'Anjurkan membatasi konsumsi cairan 2-3 jam menjelang tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 5, 'Ajarkan memantau cairan keluar dan masuk serta pola eliminasi urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 6, 'Anjurkan minum minimal 1500 cc/hari, jika tidak kontraindikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 7, 'Anjurkan menghindari kopi, minuman bersoda, teh dan cokelat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Edukasi', 8, 'Anjurkan konsumsi buah dan sayur untuk menghindari konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'), 'Kolaborasi', 1, 'Rujuk ke ahli inkontinensia, jika perlu');

-- I.04149 Latihan Berkemih
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Observasi', 1, 'Periksa kembali penyebab gangguan berkemih (mis. kognitif, kehilangan ekstremitas/fungsi ekstremitas, kehilangan penglihatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Observasi', 2, 'Monitor pola dan kemampuan berkemih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Terapeutik', 1, 'Hindari penggunaan kateter indwelling'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Terapeutik', 2, 'Siapkan area toilet yang aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Terapeutik', 3, 'Sediakan peralatan yang dibutuhkan dekat dan mudah dijangkau (mis. kursi komode, pispot, urinal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Edukasi', 1, 'Jelaskan arah-arah menuju kamar mandi/toilet pada pasien dengan gangguan penglihatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Edukasi', 2, 'Anjurkan intake cairan adekuat untuk mendukung output urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'), 'Edukasi', 3, 'Anjurkan eliminasi normal dengan beraktivitas dan olahraga sesuai kemampuan');

-- I.07215 Latihan Otot Panggul
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Observasi', 1, 'Monitor pengeluaran urine'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Terapeutik', 1, 'Berikan reinforcement positif selama melakukan latihan dengan benar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 1, 'Anjurkan berbaring'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 2, 'Anjurkan tidak mengkontraksikan perut, kaki dan bokong saat melakukan latihan otot panggul'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 3, 'Anjurkan menambah durasi kontraksi-relaksasi 10 detik dengan siklus 10-12 kali, dilakukan 3-4 kali sehari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 4, 'Ajarkan mengkontraksikan sekitar otot uretra dan anus seperti menahan BAB/BAK selama 5 detik kemudian dikendurkan dan direlaksasikan dengan siklus 10 kali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 5, 'Ajarkan mengevaluasi latihan yang dilakukan dengan cara menghentikan urin sesaat saat BAK, seminggu sekali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Edukasi', 6, 'Anjurkan latihan selama 6-12 minggu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'), 'Kolaborasi', 1, 'Kolaborasi rehabilitasi medik untuk mengukur kekuatan kontraksi otot dasar panggul, jika perlu');

-- I.04151 Manajemen Eliminasi Fekal
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Observasi', 1, 'Identifikasi masalah usus dan penggunaan obat pencahar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Observasi', 2, 'Identifikasi pengobatan yang berefek pada kondisi gastrointestinal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Observasi', 3, 'Monitor buang air besar (mis. warna, frekuensi, konsistensi, volume)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Observasi', 4, 'Monitor tanda dan gejala diare, konstipasi, atau impaksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Terapeutik', 1, 'Berikan air hangat setelah makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Terapeutik', 2, 'Jadwalkan waktu defekasi bersama pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Terapeutik', 3, 'Sediakan makanan tinggi serat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 1, 'Jelaskan jenis makanan yang membantu meningkatkan keteraturan peristaltik usus'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 2, 'Anjurkan mencatat warna, frekuensi, konsistensi, volume feses'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 3, 'Anjurkan meningkatkan aktivitas fisik, sesuai toleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 4, 'Anjurkan pengurangan asupan makanan yang meningkatkan pembentukan gas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 5, 'Anjurkan mengkonsumsi makanan yang mengandung tinggi serat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Edukasi', 6, 'Anjurkan meningkatkan asupan cairan, jika tidak ada kontraindikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat suppositoria anal, jika perlu');

-- I.04160 Pencegahan Konstipasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Observasi', 1, 'Identifikasi faktor risiko konstipasi (mis. asupan serat tidak adekuat, asupan cairan tidak adekuat, aganglionik, kelemahan otot abdomen, aktivitas fisik kurang)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Observasi', 2, 'Monitor tanda dan gejala konstipasi (mis. defekasi kurang 2 kali seminggu, defekasi lama/sulit, feses keras, peristaltik menurun)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Observasi', 3, 'Identifikasi status kognitif untuk mengkomunikasikan kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Terapeutik', 1, 'Batasi minuman yang mengandung kafein dan alkohol'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Terapeutik', 2, 'Jadwalkan rutinitas BAB'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Edukasi', 1, 'Jelaskan penyebab dan faktor risiko konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Edukasi', 2, 'Anjurkan minum air putih sesuai dengan kebutuhan (1500-2000 mL/hari)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Edukasi', 3, 'Anjurkan mengkonsumsi makanan berserat (25-30 gram/hari)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04160'), 'Kolaborasi', 1, 'Kolaborasi dengan ahli gizi, jika perlu');

-- I.10338 Perawatan Bayi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Observasi', 1, 'Monitor tanda-tanda vital bayi (terutama suhu 36,5°C-37,5°C)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 1, 'Mandikan bayi dengan suhu ruangan 21-24°C'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 2, 'Mandikan bayi dalam waktu 5-10 menit dan 2 kali dalam sehari'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 3, 'Rawat tali pusat secara terbuka (tali pusat tidak dibungkus apapun)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 4, 'Bersihkan pangkal tali pusat dengan lidi kapas yang telah diberi air matang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 5, 'Kenakan popok bayi di bawah umbilikus jika tali pusat belum terlepas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 6, 'Lakukan pemijatan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 7, 'Ganti popok bayi jika basah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Terapeutik', 8, 'Kenakan pakaian bayi dari bahan katun'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 1, 'Ajarkan ibu menyusui sesuai kebutuhan bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 2, 'Ajarkan ibu cara merawat bayi di rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'), 'Edukasi', 3, 'Ajarkan cara pemberian makanan pendamping ASI pada bayi > 6 bulan');

-- I.05173 Dukungan Mobilisasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 1, 'Identifikasi adanya nyeri atau keluhan fisik lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 2, 'Identifikasi toleransi fisik melakukan pergerakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 3, 'Monitor frekuensi jantung dan tekanan darah sebelum memulai mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Observasi', 4, 'Monitor kondisi umum selama melakukan mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 1, 'Fasilitasi aktivitas mobilisasi dengan alat bantu (mis. pagar tempat tidur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 2, 'Fasilitasi melakukan pergerakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 3, 'Libatkan keluarga untuk membantu pasien dalam meningkatkan pergerakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur mobilisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 2, 'Anjurkan melakukan mobilisasi dini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'), 'Edukasi', 3, 'Ajarkan mobilisasi sederhana yang harus dilakukan (mis. duduk di tempat tidur, di sisi tempat tidur, pindah dari tempat tidur)');

-- I.12389 Edukasi Latihan Fisik
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Edukasi', 1, 'Jelaskan jenis latihan yang sesuai dengan kondisi kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'), 'Edukasi', 2, 'Ajarkan teknik pernapasan yang tepat untuk memaksimalkan penyerapan oksigen selama latihan fisik');

-- I.11354 Perawatan Kaki
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Observasi', 1, 'Periksa adanya iritasi, retak, lesi, kapalan, kelainan bentuk, atau edema'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Terapeutik', 1, 'Berikan pelembab kaki, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Terapeutik', 2, 'Bersihkan dan/atau potong kuku, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Terapeutik', 3, 'Lakukan perawatan luka sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Edukasi', 1, 'Anjurkan pentingnya pemeriksaan kaki, terutama saat sensasi berkurang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Edukasi', 2, 'Anjurkan menghindari penekanan pada kaki yang mengalami ulkus dengan menggunakan tongkat atau sepatu khusus'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'), 'Kolaborasi', 1, 'Rujuk podiatrist untuk memotong kuku yang menebal, jika perlu');

-- I.02079 Perawatan Sirkulasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Observasi', 1, 'Identifikasi faktor risiko gangguan sirkulasi (mis. diabetes, perokok, orang tua, hipertensi, dan kadar kolesterol tinggi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Terapeutik', 1, 'Lakukan pencegahan infeksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Terapeutik', 2, 'Lakukan hidrasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Edukasi', 1, 'Anjurkan berolahraga rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Edukasi', 2, 'Anjurkan menggunakan obat penurun tekanan darah, antikoagulan, dan penurun kolesterol, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Edukasi', 3, 'Anjurkan minum obat pengontrol tekanan darah secara teratur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Edukasi', 4, 'Ajarkan program diet untuk memperbaiki sirkulasi (mis. rendah lemak jenuh, minyak ikan omega 3)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'), 'Edukasi', 5, 'Informasikan tanda dan gejala darurat yang harus dilaporkan (mis. rasa sakit yang tidak hilang saat istirahat, luka tidak sembuh, hilangnya rasa)');

-- I.05174 Dukungan Tidur
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Observasi', 1, 'Identifikasi pola aktivitas dan tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Observasi', 2, 'Identifikasi faktor pengganggu tidur (fisik dan/atau psikologis)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 1, 'Modifikasi lingkungan (mis. pencahayaan, kebisingan, suhu, matras dan tempat tidur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 2, 'Batasi waktu tidur siang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 3, 'Fasilitasi menghilangkan stres sebelum tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 4, 'Tetapkan jadwal tidur rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 5, 'Lakukan prosedur untuk meningkatkan kenyamanan (mis. pijat, mengatur posisi, terapi akupresur)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 6, 'Sesuaikan jadwal pemberian obat dan/atau tindakan untuk menunjang siklus tidur-terjaga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 1, 'Jelaskan pentingnya tidur cukup selama sakit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 2, 'Anjurkan menepati kebiasaan waktu tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 3, 'Anjurkan mengurangi makanan/minuman yang mengganggu tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 4, 'Anjurkan penggunaan obat tidur yang tidak mengandung supresor terhadap tidur REM'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 5, 'Ajarkan faktor-faktor yang berkontribusi terhadap gangguan pola tidur (mis. psikologis, gaya hidup, sering berubah shift bekerja)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'), 'Edukasi', 6, 'Ajarkan relaksasi otot autogenic atau cara nonfarmakologi lainnya');

-- I.05178 Manajemen Energi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Observasi', 1, 'Identifikasi gangguan fungsi tubuh yang mengakibatkan kelelahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Observasi', 2, 'Monitor kelelahan fisik dan emosional'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Observasi', 3, 'Monitor pola dan jam tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Observasi', 4, 'Monitor lokasi dan ketidaknyamanan selama melakukan aktivitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 1, 'Sediakan lingkungan nyaman dan rendah stimulus (mis. cahaya, suara, kunjungan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 2, 'Lakukan latihan rentang gerak pasif dan/atau aktif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 3, 'Berikan aktivitas distraksi yang menenangkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 4, 'Fasilitasi duduk di sisi tempat tidur, jika tidak dapat berpindah atau berjalan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Edukasi', 1, 'Anjurkan tirah baring'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Edukasi', 2, 'Anjurkan melakukan aktivitas secara bertahap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Edukasi', 3, 'Anjurkan menghubungi perawat jika tanda dan gejala kelelahan tidak berkurang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Edukasi', 4, 'Ajarkan strategi koping untuk mengurangi kelelahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Kolaborasi', 1, 'Kolaborasi dengan ahli gizi tentang cara meningkatkan asupan makanan');

-- I.05186 Terapi Aktivitas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'), 'Observasi', 1, 'Monitor respons emosional, fisik, sosial dan spiritual terhadap aktivitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'), 'Terapeutik', 1, 'Fasilitasi memilih aktivitas dan tetapkan tujuan aktivitas yang konsisten sesuai kemampuan fisik, psikologis dan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'), 'Edukasi', 1, 'Jelaskan metode aktivitas fisik sehari-hari, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'), 'Edukasi', 2, 'Ajarkan cara melakukan aktivitas yang dipilih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'), 'Kolaborasi', 1, 'Kolaborasi dengan terapi okupasi dalam merencanakan dan memonitor program aktivitas, jika sesuai');

-- I.09289 Manajemen Mood
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Observasi', 1, 'Identifikasi mood'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Terapeutik', 1, 'Berikan kesempatan untuk menyampaikan perasaan dengan cara yang tepat (mis. sandsack, terapi seni, dan aktivitas fisik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Edukasi', 1, 'Jelaskan tentang gangguan mood dan penanganannya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09289'), 'Kolaborasi', 1, 'Rujuk untuk psikoterapi (mis. perilaku, hubungan interpersonal, keluarga dan kelompok), jika perlu');

-- I.12362 Edukasi Aktivitas/Istirahat
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Terapeutik', 1, 'Sediakan materi dan media pengaturan aktivitas dan istirahat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Terapeutik', 2, 'Jadwalkan pemberian pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Terapeutik', 3, 'Berikan kesempatan pada pasien dan keluarga untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Edukasi', 1, 'Jelaskan pentingnya melakukan aktivitas fisik/olahraga secara rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'), 'Edukasi', 2, 'Ajarkan cara mengidentifikasi kebutuhan istirahat (mis. kelelahan, sesak napas saat aktivitas)');

-- I.13490 Promosi Keutuhan Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi', 1, 'Identifikasi pemahaman keluarga terhadap masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi', 2, 'Identifikasi adanya konflik prioritas antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi', 3, 'Identifikasi mekanisme koping keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Observasi', 4, 'Monitor hubungan antara anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 1, 'Hargai privasi keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 2, 'Fasilitasi kunjungan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 3, 'Fasilitasi keluarga melakukan pengambilan keputusan dan pemecahan masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 4, 'Fasilitasi komunikasi terbuka antar setiap anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Edukasi', 1, 'Informasikan kondisi pasien secara berkala kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Edukasi', 2, 'Anjurkan anggota keluarga mempertahankan keharmonisan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'), 'Kolaborasi', 1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.12379 Edukasi Keamanan Bayi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 1, 'Anjurkan selalu mengawasi bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 2, 'Anjurkan tidak meninggalkan bayi sendirian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 3, 'Anjurkan menjauhkan benda yang berisiko membahayakan bayi (mis. kantong plastik, karet, tali, kain, benda-benda kecil, benda tajam, pembersih lantai)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 4, 'Anjurkan memasang penghalang pada sisi tempat tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 5, 'Anjurkan menutup sumber listrik yang terjangkau oleh bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 6, 'Anjurkan mengatur perabotan rumah tangga di rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 7, 'Anjurkan memberikan pembatas pada area berisiko (mis. dapur, kamar mandi, kolam)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 8, 'Anjurkan menggunakan kursi dan sabuk pengaman khusus bayi saat berkendara'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 9, 'Anjurkan penggunaan sabuk pengaman pada stroller (kursi dorong bayi) dan kursi khusus bayi dengan aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 10, 'Anjurkan tidak meletakkan bayi pada tempat tidur yang tinggi');

-- I.05183 Promosi Latihan Fisik
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 1, 'Identifikasi keyakinan kesehatan tentang latihan fisik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 2, 'Identifikasi pengalaman latihan olahraga sebelumnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 3, 'Identifikasi motivasi individu untuk memulai atau melanjutkan program olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 4, 'Identifikasi hambatan untuk olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 5, 'Monitor kepatuhan menjalankan program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 6, 'Monitor respons terhadap program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 1, 'Motivasi mengungkapkan perasaan tentang olahraga/kebutuhan olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 2, 'Motivasi memulai atau melanjutkan olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 3, 'Fasilitasi dalam mengidentifikasi model peran positif untuk mempertahankan program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 4, 'Fasilitasi dalam mengembangkan program latihan yang sesuai untuk memenuhi kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 5, 'Fasilitasi dalam menetapkan tujuan jangka pendek dan panjang program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 6, 'Fasilitasi dalam menjadwalkan periode reguler latihan rutin mingguan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 7, 'Fasilitasi dalam mempertahankan kemajuan program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 8, 'Lakukan aktivitas olahraga bersama pasien, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 9, 'Libatkan keluarga dalam merencanakan dan memelihara program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 10, 'Berikan umpan balik positif terhadap setiap upaya yang dijalankan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 1, 'Jelaskan manfaat kesehatan dan efek fisiologis olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 2, 'Jelaskan jenis latihan yang sesuai dengan kondisi kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 3, 'Jelaskan frekuensi, durasi dan intensitas program latihan yang diinginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 4, 'Ajarkan latihan pemanasan dan pendinginan yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 5, 'Ajarkan teknik menghindari cedera saat berolahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 6, 'Ajarkan teknik pernapasan yang tepat untuk memaksimalkan penyerapan oksigen selama latihan fisik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Kolaborasi', 1, 'Kolaborasi dengan rehabilitasi medis atau ahli fisiologi olahraga, jika perlu');

-- I.06190 Manajemen Disrefleksia
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 1, 'Identifikasi rangsangan yang dapat memicu disrefleksia (mis. distensi kandung kemih, kalkuli ginjal, infeksi, impaksi feses, pemeriksaan rektal, supositoria, kerusakan kulit)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 2, 'Identifikasi penyebab pemicu disrefleksia (mis. distensi kandung kemih, impaksi feses, lesi kulit, stoking suportif, dan pengikat perut)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 3, 'Monitor tanda dan gejala disrefleksia otonom (mis. hipertensi paroksismal, bradikardia, takikardia, diaforesis di atas tingkat cedera, pucat di bawah tingkat cedera, sakit kepala, menggigil tanpa demam, ereksi pilomotor dan nyeri dada)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 4, 'Monitor kepatenan kateter urin, jika terpasang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 5, 'Monitor terjadinya hiperrefleksia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Observasi', 6, 'Monitor tanda-tanda vital'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Terapeutik', 1, 'Minimalkan rangsangan yang dapat memicu disrefleksia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Terapeutik', 2, 'Berikan posisi Fowler, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Terapeutik', 3, 'Pasang kateter urin, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Edukasi', 1, 'Jelaskan penyebab dan gejala disrefleksia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Edukasi', 2, 'Jelaskan penanganan dan pencegahan disrefleksia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Edukasi', 3, 'Anjurkan pasien dan/atau keluarga jika mengalami tanda dan gejala disrefleksia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'), 'Kolaborasi', 1, 'Kolaborasi pemberian agen antihipertensi intravena, sesuai indikasi');

-- I.06188 Latihan Memori
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Observasi', 1, 'Identifikasi masalah memori yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Observasi', 2, 'Identifikasi kesalahan terhadap orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Observasi', 3, 'Monitor perilaku dan perubahan memori selama terapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 1, 'Rencanakan metode mengajar sesuai kemampuan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 2, 'Stimulasi memori dengan mengulang pikiran yang terakhir kali diucapkan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 3, 'Koreksi kesalahan orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 4, 'Fasilitasi mengingat kembali pengalaman masa lalu, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 5, 'Fasilitasi tugas pembelajaran (mis. mengingat informasi verbal dan gambar)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 6, 'Fasilitasi kemampuan konsentrasi (mis. bermain kartu pasangan), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 7, 'Stimulasi menggunakan memori pada peristiwa yang baru terjadi (mis. bertanya kemana saja ia pergi akhir-akhir ini), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Edukasi', 2, 'Ajarkan teknik memori yang tepat (mis. imajinasi visual, perangkat mnemonic, permainan memori, isyarat memori, teknik asosiasi, membuat daftar, komputer, papan nama)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'), 'Kolaborasi', 1, 'Rujuk pada terapi okupasi, jika perlu');

-- I.09297 Orientasi Realita
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Observasi', 1, 'Monitor perubahan orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Observasi', 2, 'Monitor perubahan kognitif dan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 1, 'Perkenalkan nama saat memulai interaksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 2, 'Orientasikan orang, tempat, dan waktu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 3, 'Hadirkan realita (mis. beri penjelasan alternatif, hindari perdebatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 4, 'Sediakan lingkungan dan rutinitas secara konsisten'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 5, 'Atur stimulus sensorik dan lingkungan (mis. kunjungan, pemandangan, suara, pencahayaan, bau, dan sentuhan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 6, 'Gunakan simbol dalam mengorientasikan lingkungan (mis. tanda, gambar, warna)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 7, 'Libatkan dalam terapi kelompok orientasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 8, 'Berikan waktu istirahat dan tidur yang cukup, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Terapeutik', 9, 'Fasilitasi akses informasi (mis. televisi, surat kabar, radio), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 1, 'Anjurkan perawatan diri secara mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 2, 'Anjurkan penggunaan alat bantu (mis. kacamata, alat bantu dengar, gigi palsu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'), 'Edukasi', 3, 'Ajarkan keluarga dalam perawatan orientasi realita');

-- I.11351 Dukungan Perawatan Diri: Makan/Minum
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Observasi', 1, 'Identifikasi diet yang dianjurkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Observasi', 2, 'Monitor kemampuan menelan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Observasi', 3, 'Monitor status hidrasi pasien, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 1, 'Ciptakan lingkungan yang menyenangkan selama makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 2, 'Atur posisi yang nyaman untuk makan/minum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 3, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 4, 'Letakkan makanan di sisi mata yang sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 5, 'Sediakan sedotan untuk minum, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 6, 'Siapkan makanan dengan suhu yang meningkatkan nafsu makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 7, 'Sediakan makanan dan minuman yang disukai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 8, 'Berikan bantuan saat makan/minum sesuai tingkat kemandirian, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 9, 'Motivasi untuk makan di ruang makan, jika tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Edukasi', 1, 'Jelaskan posisi makanan pada pasien yang mengalami gangguan penglihatan dengan menggunakan arah jarum jam (mis. sayur di jam 12, rendang di jam 3)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat (mis. analgesik, antiemetik), sesuai indikasi');

-- I.06189 Manajemen Delirium (D.0064)
-- CATATAN: Edukasi & Kolaborasi belum tercakup di batch PDF ini (hal. 311 terpotong)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 1, 'Identifikasi faktor risiko delirium (mis. usia >75 tahun, disfungsi kognitif, gangguan penglihatan/pendengaran, penurunan kemampuan fungsional, infeksi, hipo/hipertermia, hipoksia, malnutrisi, efek obat, toksin, gangguan tidur, stres)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 2, 'Identifikasi tipe delirium (mis. hipoaktif, hiperaktif, campuran)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Observasi', 3, 'Monitor status neurologis dan tingkat delirium'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 1, 'Berikan pencahayaan yang baik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 2, 'Sediakan jam dan kalender yang mudah terbaca'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 3, 'Hindari stimulus sensorik berlebihan (mis. televisi, pengumuman intercom)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 4, 'Lakukan pengekangan fisik, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 5, 'Sediakan informasi tentang apa yang terjadi dan apa yang dapat terjadi selanjutnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 6, 'Batasi pembuatan keputusan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 7, 'Hindari memvalidasi mispersepsi atau interpretasi realita yang tidak akurat (mis. halusinasi, waham)');

SET FOREIGN_KEY_CHECKS = 1;
