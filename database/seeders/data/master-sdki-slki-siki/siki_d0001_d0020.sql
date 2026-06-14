-- ============================================
-- DATA MASTER SIKI — D.0001 s.d. D.0020
-- DigiKep - Standar Intervensi Keperawatan Indonesia
-- Sumber: PDF PPNI (batch halaman 7-117)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. INTERVENSI SIKI (tabel master)
-- Kolom: kode_intervensi, label_intervensi, kategori, subkategori, tipe_intervensi, definisi
-- ============================================

INSERT IGNORE INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.01001', 'Latihan Batuk Efektif', 'Fisiologis', 'Respirasi', 'Utama', 'Melatih pasien yang tidak memiliki kemampuan batuk secara efektif untuk membersihkan laring, trakea dan bronkiolus dari sekret atau benda asing di jalan napas.'),
('I.01011', 'Manajemen Jalan Napas', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengelola kepatenan jalan napas.'),
('I.01014', 'Pemantauan Respirasi', 'Fisiologis', 'Respirasi', 'Utama', 'Mengumpulkan dan menganalisis data untuk memastikan kepatenan jalan napas dan keefektifan pertukaran gas.'),
('I.01021', 'Penyapihan Ventilasi Mekanik', 'Fisiologis', 'Respirasi', 'Utama', 'Memfasilitasi pasien bernapas tanpa bantuan ventilasi mekanis.'),
('I.01026', 'Terapi Oksigen', 'Fisiologis', 'Respirasi', 'Utama', 'Memberikan tambahan oksigen untuk mencegah dan mengatasi kondisi kekurangan oksigen jaringan.'),
('I.01018', 'Pencegahan Aspirasi', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengurangi risiko masuknya partikel makanan/cairan ke dalam paru-paru.'),
('I.02038', 'Manajemen Defibrilasi', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan mengelola aliran listrik kuat dengan metode asinkron ke jantung melalui elektroda yang ditempatkan pada permukaan dada.'),
('I.03139', 'Resusitasi Cairan', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan mengelola pemberian cairan secara cepat untuk mengatasi kehilangan cairan.'),
('I.02083', 'Resusitasi Jantung Paru', 'Fisiologis', 'Sirkulasi', 'Utama', 'Memberikan pertolongan pertama pada kondisi henti napas dan henti jantung dengan teknik kombinasi kompresi pada dada dan bantuan napas.'),
('I.02075', 'Perawatan Jantung', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi, merawat dan membatasi komplikasi akibat ketidakseimbangan antara suplai dan konsumsi oksigen miokard.'),
('I.02076', 'Perawatan Sirkulasi', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan merawat area lokal dengan keterbatasan sirkulasi perifer.'),
('I.06195', 'Manajemen Sensasi Perifer', 'Fisiologis', 'Neurosensori', 'Pendukung', 'Mengidentifikasi dan mengelola ketidaknyamanan atau perubahan sensasi pada area perifer.'),
('I.02080', 'Pertolongan Pertama', 'Fisiologis', 'Sirkulasi', 'Pendukung', 'Memberikan penanganan dasar dan segera pada kondisi kegawatdaruratan baik dengan alat maupun tanpa alat.'),
('I.02067', 'Pencegahan Perdarahan', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan menurunkan risiko atau komplikasi stimulus yang menyebabkan perdarahan atau risiko perdarahan.'),
('I.02028', 'Balut Tekan', 'Fisiologis', 'Sirkulasi', 'Pendukung', 'Membalut luka dengan tekanan untuk mencegah atau menghentikan perdarahan.'),
('I.12378', 'Edukasi Keamanan Anak', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memberikan informasi mengenai keamanan dan pencegahan cidera pada anak.'),
('I.12379', 'Edukasi Keamanan Bayi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Menyediakan informasi dan dukungan terhadap pencegahan cedera pada bayi.'),
('I.01004', 'Manajemen Perdarahan', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengelola kehilangan darah saat terjadi perdarahan.'),
('I.03094', 'Konseling Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Pendukung', 'Memberikan bimbingan dalam melakukan modifikasi asupan nutrisi.'),
('I.06194', 'Manajemen Peningkatan Tekanan Intrakranial', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi dan mengelola peningkatan tekanan dalam rongga kranial.'),
('I.02068', 'Pencegahan Syok', 'Fisiologis', 'Sirkulasi', 'Utama', 'Mengidentifikasi dan menurunkan risiko terjadinya ketidakmampuan tubuh menyediakan oksigen dan nutrien untuk mencukupi kebutuhan jaringan.'),
('I.03119', 'Manajemen Berat Badan', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengelola perubahan berat badan untuk mencapai berat badan yang optimal.'),
('I.05178', 'Manajemen Perilaku', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Mengidentifikasi dan mengelola perilaku negatif yang dapat mengganggu kesehatan.'),
('I.05183', 'Promosi Latihan Fisik', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memfasilitasi aktivitas fisik secara rutin untuk mempertahankan atau meningkatkan derajat kebugaran dan kesehatan.'),
('I.03119b', 'Manajemen Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola asupan nutrisi yang seimbang.'),
('I.03101', 'Manajemen Diare', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan mengelola diare dan dampaknya.');

-- Perbaiki kode standar Manajemen Nutrisi
UPDATE intervensi_siki SET kode_intervensi = 'I.03119a' WHERE kode_intervensi = 'I.03119b';


-- ============================================
-- 2. TINDAKAN SIKI
-- Kolom: intervensi_id (FK), jenis, urutan, deskripsi
-- ============================================

-- D.0001 - I.01001 Latihan Batuk Efektif
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Observasi', 1, 'Identifikasi kemampuan batuk'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Observasi', 2, 'Monitor adanya retensi sputum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Observasi', 3, 'Monitor adanya gejala infeksi saluran napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Observasi', 4, 'Monitor input dan output cairan (mis. jumlah dan karakteristik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 1, 'Atur posisi semi-Fowler atau Fowler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 2, 'Pasang perlak dan bengkok di pangkuan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Terapeutik', 3, 'Buang sekret pada tempat sputum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur batuk efektif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Edukasi', 2, 'Anjurkan tarik napas dalam melalui hidung selama 4 detik, ditahan sampai 2 detik, kemudian keluarkan dari mulut dengan bibir mencucu (dibulatkan) selama 8 detik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Edukasi', 3, 'Anjurkan mengulangi tarik napas dalam hingga 3 kali'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Edukasi', 4, 'Anjurkan batuk dengan kuat langsung setelah tarik napas dalam yang ke-3'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'), 'Kolaborasi', 1, 'Kolaborasi pemberian mukolitik atau ekspektoran, jika perlu');

-- D.0001 - I.01011 Manajemen Jalan Napas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Observasi', 1, 'Monitor pola napas (frekuensi, kedalaman, usaha napas)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Observasi', 2, 'Monitor bunyi napas tambahan (mis. gurgling, mengi, wheezing, ronkhi kering)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Observasi', 3, 'Monitor sputum (jumlah, warna, aroma)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 1, 'Pertahankan kepatenan jalan napas dengan head-tilt dan chin-lift (jaw-thrust jika curiga trauma servikal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 2, 'Posisikan semi-fowler atau fowler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 3, 'Berikan minuman hangat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 4, 'Lakukan fisioterapi dada, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 5, 'Berikan oksigen, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Edukasi', 1, 'Anjurkan asupan cairan 2000 ml/hari, jika tidak kontraindikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Edukasi', 2, 'Ajarkan teknik batuk efektif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Kolaborasi', 1, 'Kolaborasi pemberian bronkodilator, ekspektoran, mukolitik, jika perlu');

-- D.0001 & D.0002 & D.0003 - I.01014 Pemantauan Respirasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 1, 'Monitor frekuensi, irama, kedalaman dan upaya napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 2, 'Monitor pola napas (seperti bradipnea, takipnea, hiperventilasi, Kussmaul, Cheyne-Stokes, Biot, ataksik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 3, 'Monitor kemampuan batuk efektif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 4, 'Monitor adanya produksi sputum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 5, 'Monitor adanya sumbatan jalan napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 6, 'Palpasi kesimetrisan ekspansi paru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 7, 'Auskultasi bunyi napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 8, 'Monitor saturasi oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 9, 'Monitor nilai AGD'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Observasi', 10, 'Monitor hasil x-ray toraks'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Terapeutik', 1, 'Atur interval pemantauan respirasi sesuai kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Terapeutik', 2, 'Dokumentasikan hasil pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pemantauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'), 'Edukasi', 2, 'Informasikan hasil pemantauan, jika perlu');

-- D.0002 - I.01021 Penyapihan Ventilasi Mekanik
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Observasi', 1, 'Periksa kemampuan untuk disapih (meliputi hemodinamik stabil, kondisi optimal, bebas infeksi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Observasi', 2, 'Monitor prediktor kemampuan untuk mentolerir penyapihan (mis. tingkat kemampuan bernapas, kapasitas vital, Vd/Vt, MVV, kekuatan inspirasi, FEV1, tekanan inspirasi negatif)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Observasi', 3, 'Monitor tanda-tanda kelelahan otot pernapasan (mis. kenaikan PaCO2 mendadak, napas cepat dan dangkal, gerakan dinding abdomen paradoks), hipoksemia, dan hipoksia jaringan saat penyapihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Observasi', 4, 'Monitor status cairan dan elektrolit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 1, 'Posisikan pasien semi fowler (30-45 derajat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 2, 'Lakukan pengisapan jalan napas, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 3, 'Berikan fisioterapi dada, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 4, 'Lakukan uji coba penyapihan (30-120 menit dengan napas spontan yang dibantu ventilator)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 5, 'Gunakan teknik relaksasi, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 6, 'Hindari pemberian sedasi farmakologis selama percobaan penyapihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Terapeutik', 7, 'Berikan dukungan psikologis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Edukasi', 1, 'Ajarkan cara pengontrolan napas saat penyapihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat yang meningkatkan kepatenan jalan napas dan pertukaran gas');

-- D.0003 - I.01026 Terapi Oksigen
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 1, 'Monitor kecepatan aliran oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 2, 'Monitor posisi alat terapi oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 3, 'Monitor aliran oksigen secara periodik dan pastikan fraksi yang diberikan cukup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 4, 'Monitor efektivitas terapi oksigen (mis. oksimetri, analisa gas darah), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 5, 'Monitor kemampuan melepaskan oksigen saat makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 6, 'Monitor tanda-tanda hipoventilasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 7, 'Monitor tanda dan gejala toksikasi oksigen dan atelektasis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 8, 'Monitor tingkat kecemasan akibat terapi oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Observasi', 9, 'Monitor integritas mukosa hidung akibat pemasangan oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 1, 'Bersihkan sekret pada mulut, hidung dan trakea, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 2, 'Pertahankan kepatenan jalan napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 3, 'Siapkan dan atur peralatan pemberian oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 4, 'Berikan oksigen tambahan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 5, 'Tetap berikan oksigen saat pasien ditransportasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Terapeutik', 6, 'Gunakan perangkat oksigen yang sesuai dengan tingkat mobilitas pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Edukasi', 1, 'Ajarkan pasien dan keluarga cara menggunakan oksigen di rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Kolaborasi', 1, 'Kolaborasi penentuan dosis oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'), 'Kolaborasi', 2, 'Kolaborasi penggunaan oksigen saat aktivitas dan/atau tidur');

-- D.0004 & D.0007 & D.0010 - I.02038 Manajemen Defibrilasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Observasi', 1, 'Periksa irama pada monitor setelah RJP 2 menit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 1, 'Lakukan resusitasi jantung paru (RJP) hingga mesin defibrilator siap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 2, 'Siapkan dan hidupkan mesin defibrilator'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 3, 'Pasang monitor EKG'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 4, 'Pastikan irama EKG henti jantung (VF atau VT tanpa nadi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 5, 'Atur jumlah energi dengan mode asynchronized (360 joule untuk monofasik dan 120-200 joule untuk bifasik)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 6, 'Angkat paddle dari mesin dan oleskan jeli pada paddle'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 7, 'Tempelkan paddle sternum (kanan) pada sisi kanan sternum di bawah klavikula dan paddle apeks (kiri) pada garis midaksilaris setinggi elektroda V6'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 8, 'Isi energi dengan menekan tombol charger pada paddle atau tombol charger pada mesin defibrilator dan tunggu hingga energi yang diinginkan tercapai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 9, 'Hentikan RJP saat defibrilator siap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 10, 'Teriakkan bahwa defibrilator telah siap (mis. "I am clear, you are clear, everybody is clear")'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 11, 'Berikan syok dengan menekan tombol pada kedua paddle bersamaan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 12, 'Angkat paddle dan langsung lanjutkan RJP tanpa menunggu hasil irama yang muncul pada monitor setelah pemberian defibrilasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'), 'Terapeutik', 13, 'Lanjutkan RJP sampai 2 menit');

-- D.0004 - I.03139 Resusitasi Cairan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 1, 'Identifikasi kelas syok untuk estimasi kehilangan darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 2, 'Monitor status hemodinamik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 3, 'Monitor status oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 4, 'Monitor kelebihan cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 5, 'Monitor output cairan tubuh (mis. urine, cairan nasogastrik, cairan selang dada)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 6, 'Monitor nilai BUN, kreatinin, protein total, dan albumin, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Observasi', 7, 'Monitor tanda dan gejala edema paru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Terapeutik', 1, 'Pasang jalur IV berukuran besar (mis. nomor 14-16)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Terapeutik', 2, 'Berikan infus cairan kristaloid 1-2 liter pada dewasa'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Terapeutik', 3, 'Berikan infus cairan kristaloid 20 mL/kgBB pada anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Terapeutik', 4, 'Lakukan kros matching produk darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Kolaborasi', 1, 'Kolaborasi dalam menentukan jenis dan jumlah cairan (mis. kristaloid, koloid)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'), 'Kolaborasi', 2, 'Kolaborasi dalam memberikan produk darah');

-- D.0004 & D.0007 - I.02083 Resusitasi Jantung Paru
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Observasi', 1, 'Identifikasi keamanan penolong, lingkungan dan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Observasi', 2, 'Identifikasi respons pasien (mis. memanggil pasien, menepuk bahu pasien)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Observasi', 3, 'Monitor nadi karotis dan napas setiap 2 menit atau 5 siklus RJP'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 1, 'Pakai alat pelindung diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 2, 'Aktifkan emergency medical system atau berteriak meminta tolong'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 3, 'Posisikan pasien terlentang di tempat datar dan keras'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 4, 'Atur posisi penolong berlutut di samping korban'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 5, 'Raba nadi karotis dalam waktu <10 detik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 6, 'Berikan rescue breathing jika ditemukan ada nadi tetapi tidak ada napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 7, 'Kompresi dada 30 kali dikombinasikan dengan bantuan napas (ventilasi) 2 kali jika ditemukan tidak ada nadi dan tidak ada napas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 8, 'Kompresi dengan tumit telapak tangan menumpuk di atas telapak tangan yang lain tegak lurus pada pertengahan dada (seperdua bawah sternum)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 9, 'Kompresi dengan kedalaman 5-6 cm dengan kecepatan 100-120 kali/menit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 10, 'Bersihkan dan buka jalan napas dengan head tilt-chin lift atau jaw thrust (jika curiga cedera servikal)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 11, 'Berikan bantuan napas dengan menggunakan bag valve mask dengan teknik EC-Clamp'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 12, 'Kombinasikan kompresi dan ventilasi selama 2 menit atau sebanyak 5 siklus'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Terapeutik', 13, 'Hentikan RJP jika ditemukan adanya tanda-tanda kehidupan, penolong yang lebih mahir datang, ditemukan adanya tanda-tanda kematian biologis, do not resuscitation (DNR)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur tindakan kepada keluarga atau pengantar pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'), 'Kolaborasi', 1, 'Kolaborasi tim medis untuk bantuan hidup lanjut');

-- D.0005 - I.01011 Manajemen Jalan Napas (tindakan tambahan untuk pola napas tidak efektif)
-- Tindakan I.01011 sudah lengkap di atas (digunakan bersama D.0001 dan D.0006)

-- D.0006 - I.01011 Manajemen Jalan Napas (tindakan tambahan khusus risiko aspirasi)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 6, 'Lakukan penghisapan lendir kurang dari 15 detik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 7, 'Lakukan hiperoksigenasi sebelum penghisapan endotrakeal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 8, 'Keluarkan sumbatan benda padat dengan forsep McGill');

-- D.0006 - I.01018 Pencegahan Aspirasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Observasi', 1, 'Monitor tingkat kesadaran, batuk, muntah dan kemampuan menelan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Observasi', 2, 'Monitor status pernapasan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Observasi', 3, 'Monitor bunyi napas terutama setelah makan/minum'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Observasi', 4, 'Periksa residu gaster sebelum memberi asupan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Observasi', 5, 'Periksa kepatenan selang nasogastrik sebelum memberi asupan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 1, 'Posisikan semi fowler (30-45 derajat) 30 menit sebelum memberi asupan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 2, 'Pertahankan posisi semi fowler pada pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 3, 'Pertahankan kepatenan jalan napas (mis. teknik head tilt chin lift, jaw thrust, in line)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 4, 'Perhatikan pengembangan balon endotracheal tube (ETT)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 5, 'Lakukan penghisapan jalan napas, jika produksi sekret meningkat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 6, 'Sediakan suction di ruangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 7, 'Hindari memberi makan melalui selang gastrointestinal, jika residu banyak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 8, 'Berikan makanan dengan ukuran kecil atau lunak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Terapeutik', 9, 'Berikan obat oral dalam bentuk cair'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Edukasi', 1, 'Anjurkan makan secara perlahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Edukasi', 2, 'Ajarkan strategi mencegah aspirasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'), 'Edukasi', 3, 'Ajarkan teknik mengunyah atau menelan, jika perlu');

-- D.0008 & D.0011 & D.0014 - I.02075 Perawatan Jantung
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 1, 'Identifikasi tanda/gejala primer penurunan curah jantung (meliputi dispnea, kelelahan, edema, ortopnea, paroxysmal nocturnal dyspnea, peningkatan CVP)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 2, 'Identifikasi tanda/gejala sekunder penurunan curah jantung (meliputi peningkatan berat badan, hepatomegali, distensi vena jugularis, palpitasi, ronkhi basah, oliguria, batuk, kulit pucat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 3, 'Monitor tekanan darah (termasuk tekanan darah ortostatik), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 4, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 5, 'Monitor berat badan setiap hari pada waktu yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 6, 'Monitor saturasi oksigen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 7, 'Monitor keluhan nyeri dada (mis. intensitas, lokasi, radiasi, durasi, presivitasi yang mengurangi nyeri)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 8, 'Monitor EKG 12 sadapan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 9, 'Monitor aritmia (kelainan irama dan frekuensi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 10, 'Monitor nilai laboratorium jantung (mis. elektrolit, enzim jantung, BNP, NTpro-BNP)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 11, 'Monitor fungsi alat pacu jantung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 12, 'Periksa tekanan darah dan frekuensi nadi sebelum dan sesudah aktivitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Observasi', 13, 'Periksa tekanan darah dan frekuensi nadi sebelum pemberian obat (mis. beta blocker, ACE inhibitor, calcium channel blocker, digoksin)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 1, 'Posisikan pasien semi fowler atau fowler dengan kaki ke bawah atau posisi nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 2, 'Berikan diet jantung yang sesuai (mis. batasi asupan kafein, natrium, kolesterol, dan makanan tinggi lemak)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 3, 'Gunakan stocking elastis atau pneumatic intermiten, sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 4, 'Fasilitasi pasien dan keluarga untuk modifikasi gaya hidup sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 5, 'Berikan terapi relaksasi untuk mengurangi stres, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 6, 'Berikan dukungan emosional dan spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Terapeutik', 7, 'Berikan oksigen untuk mempertahankan saturasi oksigen >94%'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Edukasi', 1, 'Anjurkan beraktivitas fisik sesuai toleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Edukasi', 2, 'Anjurkan beraktivitas fisik secara bertahap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Edukasi', 3, 'Anjurkan berhenti merokok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Edukasi', 4, 'Ajarkan pasien dan keluarga mengukur berat badan harian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Edukasi', 5, 'Ajarkan pasien dan keluarga mengukur intake dan output cairan harian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Kolaborasi', 1, 'Kolaborasi pemberian antiaritmia, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'), 'Kolaborasi', 2, 'Rujuk ke program rehabilitasi jantung');

-- D.0009 & D.0015 - I.02076 Perawatan Sirkulasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Observasi', 1, 'Periksa sirkulasi perifer (mis. nadi perifer, edema, pengisian kapiler, warna, suhu, ankle-brachial index)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Observasi', 2, 'Identifikasi faktor risiko gangguan sirkulasi (mis. diabetes, perokok, orang tua, hipertensi dan kadar kolesterol tinggi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Observasi', 3, 'Monitor panas, kemerahan, nyeri atau bengkak pada ekstremitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 1, 'Hindari pemasangan infus atau pengambilan darah di area keterbatasan perfusi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 2, 'Hindari pengukuran tekanan darah pada ekstremitas dengan keterbatasan perfusi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 3, 'Hindari penekanan dan pemasangan tourniquet pada area yang cedera'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 4, 'Lakukan pencegahan infeksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 5, 'Lakukan perawatan kaki dan kuku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Terapeutik', 6, 'Lakukan hidrasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 1, 'Anjurkan berhenti merokok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 2, 'Anjurkan berolahraga rutin'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 3, 'Anjurkan mengecek air mandi untuk menghindari kulit terbakar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 4, 'Anjurkan menggunakan obat penurun tekanan darah, antikoagulan, dan penurun kolesterol jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 5, 'Anjurkan minum obat pengontrol tekanan darah secara teratur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 6, 'Anjurkan menghindari penggunaan obat penyekat beta'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 7, 'Anjurkan melakukan perawatan kulit yang tepat (mis. melembabkan kulit kering pada kaki)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 8, 'Anjurkan program rehabilitasi vaskular'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 9, 'Ajarkan program diet untuk memperbaiki sirkulasi (mis. rendah lemak jenuh, minyak ikan omega 3)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02076'), 'Edukasi', 10, 'Informasikan tanda dan gejala darurat yang harus dilaporkan (mis. rasa sakit yang tidak hilang saat istirahat, luka tidak sembuh, hilangnya rasa)');

-- D.0009 - I.06195 Manajemen Sensasi Perifer
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
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 1, 'Kolaborasi pemberian analgesik jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'), 'Kolaborasi', 2, 'Kolaborasi pemberian kortikosteroid, jika perlu');

-- D.0010 - I.02080 Pertolongan Pertama
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Observasi', 1, 'Identifikasi keamanan penolong, pasien, dan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Observasi', 2, 'Identifikasi respons pasien dengan AVPU (alert, verbal, pain, unresponsive)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Observasi', 3, 'Monitor tanda-tanda vital'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Observasi', 4, 'Monitor karakteristik luka (mis. drainase, warna, ukuran, bau)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 1, 'Minta pertolongan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 2, 'Lakukan RICE (rest, ice, compression, elevation) pada cedera otot ekstremitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 3, 'Lakukan penghentian perdarahan (mis. penekanan, balut tekan, pengaturan posisi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 4, 'Bersihkan kulit dari racun atau bahan kimia yang menempel dengan sabun dan air yang mengalir'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 5, 'Lepaskan sengatan dari kulit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Terapeutik', 6, 'Lepaskan gigitan serangga dari kulit menggunakan pinset atau alat yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Edukasi', 1, 'Ajarkan teknik perawatan luka'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat-obatan (mis. antibiotik, profilaksis, vaksin, antihistamin, anti inflamasi, dan analgetik, jika perlu)');

-- D.0012 - I.02067 Pencegahan Perdarahan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Observasi', 1, 'Monitor tanda dan gejala perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Observasi', 2, 'Monitor hematokrit/hemoglobin sebelum dan setelah kehilangan darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 1, 'Pertahankan bed rest selama perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 2, 'Batasi tindakan invasif, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Terapeutik', 3, 'Hindari pengukuran suhu rektal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Edukasi', 1, 'Jelaskan tanda dan gejala perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Edukasi', 2, 'Anjurkan meningkatkan asupan cairan untuk menghindari konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Edukasi', 3, 'Anjurkan menghindari aspirin atau antikoagulan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Edukasi', 4, 'Anjurkan meningkatkan asupan makanan dan vitamin K'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Edukasi', 5, 'Anjurkan segera melapor jika terjadi perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat pengontrol perdarahan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'), 'Kolaborasi', 2, 'Kolaborasi pemberian produk darah, jika perlu');

-- D.0012 - I.02028 Balut Tekan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Observasi', 1, 'Monitor perban untuk memantau drainase luka'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Observasi', 2, 'Monitor jumlah dan warna cairan drainase dari luka'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Observasi', 3, 'Periksa kecepatan dan denyut nadi distal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Observasi', 4, 'Periksa akral, kondisi kulit dan pengisian kapiler distal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 1, 'Pasang sarung tangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 2, 'Tinggikan bagian tubuh yang cedera di atas level jantung, jika tidak ada fraktur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 3, 'Tutup luka dengan kasa tebal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 4, 'Tekan kasa dengan kuat di atas luka selama setelah perdarahan berhenti'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 5, 'Fiksasi kasa dengan plaster'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 6, 'Tekan arteri (pressure point) yang mengarah ke area perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur balut tekan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'), 'Edukasi', 2, 'Anjurkan membatasi gerak pada area cedera');

-- D.0012 - I.12378 Edukasi Keamanan Anak
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 1, 'Anjurkan memantau anak saat berada di tempat yang berisiko (mis. luar rumah, balkon, kolam renang)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 2, 'Anjurkan menutup sumber listrik yang dapat dijangkau'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 3, 'Anjurkan mengatur perabotan rumah tangga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 4, 'Anjurkan memilih mainan yang sesuai dengan usia anak dan tidak berbahaya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 5, 'Anjurkan menyimpan benda berbahaya (mis. pisau, benda tajam lainnya) dan cairan berbahaya (mis. pembersih lantai, deterjen) di tempat yang jauh dari jangkauan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 6, 'Anjurkan memberikan pembatas pada area dapur, kamar mandi, kolam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 7, 'Jelaskan kepada orang tua dan anak tentang bahaya lalu lintas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 8, 'Anjurkan penggunaan sabuk pengaman saat berkendara'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 9, 'Jelaskan keamanan bersepeda pada anak (mis. menggunakan helm, menggunakan sepeda sesuai usia)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 10, 'Anjurkan penggunaan stroller (kursi dorong anak), kursi khusus anak dengan aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 11, 'Anjurkan tidak meletakkan anak pada tempat tidur yang tinggi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12378'), 'Edukasi', 12, 'Ajarkan anak tindakan yang dilakukan saat merasa dirinya dalam bahaya (mis. meminta bantuan orang dewasa, berteriak, segera berlari)');

-- D.0012 - I.12379 Edukasi Keamanan Bayi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 1, 'Anjurkan selalu mengawasi bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 2, 'Anjurkan tidak meninggalkan bayi sendirian'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 3, 'Anjurkan menjauhkan benda yang berisiko membahayakan bayi (mis. kantung plastik, karet, tali, kain, benda-benda kecil, benda tajam, pembersih lantai)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 4, 'Anjurkan memasang penghalang pada sisi tempat tidur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 5, 'Anjurkan menutup sumber listrik yang terjangkau oleh bayi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 6, 'Anjurkan mengatur perabotan rumah tangga di rumah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 7, 'Anjurkan memberikan pembatas pada area berisiko (mis. dapur, kamar mandi, kolam)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 8, 'Anjurkan menggunakan kursi dan sabuk pengaman khusus bayi saat berkendara'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 9, 'Anjurkan penggunaan sabuk pengaman pada stroller (kursi dorong bayi), kursi khusus bayi dengan aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'), 'Edukasi', 10, 'Anjurkan tidak meletakkan bayi pada tempat tidur yang tinggi');

-- D.0013 - I.01004 Manajemen Perdarahan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 1, 'Identifikasi penyebab perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 2, 'Periksa adanya darah pada muntah, sputum, feses, urine, pengeluaran NGT dan drainase luka, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 3, 'Periksa ukuran dan karakteristik hematoma, jika ada'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 4, 'Monitor terjadinya perdarahan (sifat dan jumlah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 5, 'Monitor nilai hemoglobin dan hematokrit sebelum dan setelah kehilangan darah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 6, 'Monitor tekanan darah dan parameter hemodinamik (tekanan vena sentral dan tekanan baji kapiler atau arteri pulmonal), jika ada'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 7, 'Monitor intake dan output cairan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 8, 'Monitor koagulasi darah (PT, PTT, fibrinogen, degradasi fibrin, dan jumlah trombosit), jika ada'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 9, 'Monitor deliveri oksigen jaringan (mis. PaO2, SaO2, hemoglobin, dan curah jantung)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Observasi', 10, 'Monitor tanda dan gejala perdarahan masif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Terapeutik', 1, 'Istirahatkan area yang mengalami perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Terapeutik', 2, 'Berikan kompres dingin, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Terapeutik', 3, 'Lakukan penekanan atau balut tekan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Terapeutik', 4, 'Tinggikan ekstremitas yang mengalami perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Terapeutik', 5, 'Pertahankan akses IV'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Edukasi', 1, 'Jelaskan tanda-tanda perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Edukasi', 2, 'Anjurkan melapor jika menemukan tanda-tanda perdarahan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Edukasi', 3, 'Anjurkan membatasi aktivitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Kolaborasi', 1, 'Kolaborasi pemberian cairan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'), 'Kolaborasi', 2, 'Kolaborasi pemberian transfusi darah, jika perlu');

-- D.0013 - I.03094 Konseling Nutrisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 1, 'Identifikasi kebiasaan makan dan perilaku makan yang akan diubah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 2, 'Identifikasi kemajuan modifikasi diet secara reguler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 3, 'Monitor intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan, dan kebiasaan membeli makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 1, 'Bina hubungan terapeutik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 2, 'Sepakati lama waktu pemberian konseling'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 3, 'Tetapkan tujuan jangka pendek dan jangka panjang yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 4, 'Gunakan standar nutrisi sesuai program diet dalam mengevaluasi kecukupan asupan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Terapeutik', 5, 'Pertimbangkan faktor-faktor yang mempengaruhi pemenuhan kebutuhan gizi (mis. usia, tahap pertumbuhan dan perkembangan, penyakit)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Edukasi', 1, 'Informasikan perlunya modifikasi diet (mis. penurunan atau penambahan berat badan, pembatasan natrium atau cairan, pengurangan kolesterol)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Edukasi', 2, 'Jelaskan program gizi dan persepsi pasien terhadap diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Kolaborasi', 1, 'Rujuk pada ahli gizi, jika perlu');

-- D.0014 - tindakan I.02075 sudah dimasukkan di atas (gunakan tindakan yang sama dengan D.0008/D.0011)

-- D.0015 & D.0016 - I.02068 Pencegahan Syok
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 1, 'Monitor status kardiopulmonal (frekuensi dan kekuatan nadi, frekuensi napas, TD, MAP)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 2, 'Monitor status oksigenasi (oksimetri nadi, AGD)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 3, 'Monitor status cairan (masukan dan haluaran, turgor kulit, CRT)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 4, 'Monitor tingkat kesadaran dan respons pupil'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Observasi', 5, 'Periksa riwayat alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 1, 'Berikan oksigen untuk mempertahankan saturasi oksigen >94%'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 2, 'Persiapkan intubasi dan ventilasi mekanis, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 3, 'Pasang jalur IV, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 4, 'Pasang kateter urine untuk menilai produksi urine, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Terapeutik', 5, 'Lakukan skin test untuk mencegah reaksi alergi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 1, 'Jelaskan penyebab/faktor risiko syok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 2, 'Jelaskan tanda dan gejala awal syok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 3, 'Anjurkan melapor jika menemukan/merasakan tanda dan gejala awal syok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 4, 'Anjurkan memperbanyak asupan cairan oral'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Edukasi', 5, 'Anjurkan menghindari alergen'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Kolaborasi', 1, 'Kolaborasi pemberian IV, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Kolaborasi', 2, 'Kolaborasi pemberian transfusi darah, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'), 'Kolaborasi', 3, 'Kolaborasi pemberian antiinflamasi, jika perlu');

-- D.0017 - I.06194 Manajemen Peningkatan Tekanan Intrakranial
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 1, 'Identifikasi penyebab peningkatan TIK (mis. lesi, gangguan metabolisme, edema serebral)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Observasi', 2, 'Monitor tanda/gejala peningkatan TIK (mis. tekanan darah meningkat, tekanan nadi melebar, bradikardia, pola napas iregular, kesadaran menurun)'),
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
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 6, 'Hindari penggunaan cairan IV hipotonik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 7, 'Atur ventilator agar PaCO2 optimal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Terapeutik', 8, 'Pertahankan suhu tubuh normal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 1, 'Kolaborasi pemberian sedasi dan anti konvulsan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 2, 'Kolaborasi pemberian diuretik osmosis, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'), 'Kolaborasi', 3, 'Kolaborasi pemberian pelunak tinja, jika perlu');

-- D.0018 - I.03119 Manajemen Berat Badan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi kondisi kesehatan pasien yang dapat mempengaruhi berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Hitung berat badan ideal pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 2, 'Hitung persentase lemak dan otot pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 3, 'Fasilitasi menentukan target berat badan yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 1, 'Jelaskan hubungan antara asupan makanan, aktivitas fisik, penambahan berat badan dan penurunan berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 2, 'Jelaskan faktor risiko berat badan lebih dan berat badan kurang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 3, 'Anjurkan mencatat berat badan setiap minggu, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 4, 'Anjurkan melakukan pencatatan asupan makan, aktivitas fisik dan perubahan berat badan');

-- D.0018 - I.03094 Konseling Nutrisi (tambahan tindakan khusus berat badan lebih)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'), 'Observasi', 4, 'Monitor intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan, dan kebiasaan membeli makanan (untuk berat badan lebih)');

-- D.0018 - I.05178 Manajemen Perilaku
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Observasi', 1, 'Identifikasi harapan untuk mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 1, 'Diskusikan tanggung jawab terhadap perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 2, 'Jadwalkan kegiatan terstruktur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 3, 'Ciptakan dan pertahankan lingkungan dan kegiatan perawatan konsisten setiap dinas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 4, 'Tingkatkan aktivitas fisik sesuai kemampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 5, 'Batasi jumlah pengunjung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 6, 'Bicara dengan nada rendah dan tenang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 7, 'Lakukan kegiatan pengalihan terhadap sumber agitasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 8, 'Cegah perilaku pasif dan agresif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 9, 'Beri penguatan positif terhadap keberhasilan mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 10, 'Lakukan pengekangan fisik sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 11, 'Hindari sikap menyudutkan dan menghentikan pembicaraan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 12, 'Hindari sikap mengancam dan berdebat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 13, 'Hindari berdebat atau menawar batas perilaku yang telah ditetapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'), 'Edukasi', 1, 'Informasikan keluarga bahwa keluarga sebagai dasar pembentukan kognitif');

-- D.0018 - I.05183 Promosi Latihan Fisik
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 1, 'Identifikasi keyakinan kesehatan tentang latihan fisik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 2, 'Identifikasi pengalaman olahraga sebelumnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 3, 'Identifikasi motivasi individu untuk memulai atau melanjutkan program olahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 4, 'Identifikasi hambatan untuk berolahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 5, 'Monitor kepatuhan menjalankan program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Observasi', 6, 'Monitor respons terhadap program latihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Terapeutik', 1, 'Motivasi mengungkapkan perasaan tentang olahraga/kebutuhan berolahraga'),
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
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 3, 'Jelaskan frekuensi, durasi, dan intensitas program latihan yang diinginkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 4, 'Ajarkan latihan pemanasan dan pendinginan yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 5, 'Ajarkan teknik menghindari cedera saat berolahraga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Edukasi', 6, 'Ajarkan teknik pernapasan yang tepat untuk memaksimalkan penyerapan oksigen selama latihan fisik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05183'), 'Kolaborasi', 1, 'Kolaborasi dengan rehabilitasi medis atau ahli fisiologi olahraga, jika perlu');

-- D.0019 - I.03119a Manajemen Nutrisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 1, 'Identifikasi status nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 2, 'Identifikasi alergi dan intoleransi makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 3, 'Identifikasi makanan yang disukai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 4, 'Identifikasi kebutuhan kalori dan jenis nutrien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 5, 'Identifikasi perlunya penggunaan selang nasogastrik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 6, 'Monitor asupan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 7, 'Monitor berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Observasi', 8, 'Monitor hasil pemeriksaan laboratorium'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 1, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 2, 'Fasilitasi menentukan pedoman diet (mis. piramida makanan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 3, 'Sajikan makanan secara menarik dan suhu yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 4, 'Berikan makanan tinggi serat untuk mencegah konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 5, 'Berikan makanan tinggi kalori dan tinggi protein'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 6, 'Berikan suplemen makanan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Terapeutik', 7, 'Hentikan pemberian makan melalui selang nasogastrik, jika asupan oral dapat ditoleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Edukasi', 1, 'Anjurkan posisi duduk, jika mampu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Edukasi', 2, 'Ajarkan diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Kolaborasi', 1, 'Kolaborasi pemberian medikasi sebelum makan (mis. pereda nyeri, antiemetik), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119a'), 'Kolaborasi', 2, 'Kolaborasi dengan ahli gizi untuk menentukan jumlah kalori dan jenis nutrien yang dibutuhkan, jika perlu');

-- D.0020 - I.03101 Manajemen Diare
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 1, 'Identifikasi penyebab diare (mis. inflamasi gastrointestinal, iritasi gastrointestinal, proses infeksi, malabsorpsi, ansietas, stres, efek obat-obatan, pemberian botol susu)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 2, 'Identifikasi riwayat pemberian makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 3, 'Identifikasi gejala invaginasi (mis. tangisan keras, kepucatan pada bayi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 4, 'Monitor warna, volume, frekuensi, dan konsistensi tinja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 5, 'Monitor tanda dan gejala hipovolemia (mis. takikardia, nadi teraba lemah, tekanan darah turun, turgor kulit turun, mukosa mulut kering, CRT melambat, BB menurun)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 6, 'Monitor iritasi dan ulserasi kulit di daerah perianal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 7, 'Monitor jumlah pengeluaran diare'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Observasi', 8, 'Monitor keamanan dan penyiapan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 1, 'Berikan asupan cairan oral (mis. larutan garam gula, oralit, Pedialyte, Renalyte)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 2, 'Pasang jalur intravena'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 3, 'Berikan cairan intravena (mis. ringer asetat, ringer laktat), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 4, 'Ambil sampel darah untuk pemeriksaan darah lengkap dan elektrolit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Terapeutik', 5, 'Ambil sampel feses untuk kultur, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Edukasi', 1, 'Anjurkan makanan porsi kecil dan sering secara bertahap'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Edukasi', 2, 'Anjurkan menghindari makanan pembentuk gas, pedas, dan mengandung laktosa'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Edukasi', 3, 'Anjurkan melanjutkan pemberian ASI'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antimotilitas (mis. loperamide, difenoksilat)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Kolaborasi', 2, 'Kolaborasi pemberian obat antispasmodik/spasmolitik, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'), 'Kolaborasi', 3, 'Kolaborasi pemberian obat pengeras feses (mis. atapulgit, smektit, kaolin-pektin), jika perlu');


SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: SIKI untuk D.0001 - D.0020
-- ============================================
