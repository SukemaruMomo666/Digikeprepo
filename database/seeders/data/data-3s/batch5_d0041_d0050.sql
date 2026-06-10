-- ============================================
-- DATA MASTER BATCH 5: D.0041 – D.0050
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.04035', 'Kontinensia Fekal', 'Fisiologis', 'Eliminasi', 'Kemampuan untuk mengontrol pengeluaran feses.'),
('L.04036', 'Kontinensia Urin', 'Fisiologis', 'Eliminasi', 'Kemampuan untuk mengontrol pengeluaran urin.'),
('L.05042', 'Mobilitas Fisik', 'Fisiologis', 'Aktivitas dan Istirahat', 'Kemampuan untuk gerak fisik dari satu atau lebih ekstremitas secara mandiri.'),
('L.05043', 'Organisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Integrasi respon fisiologis dan neurobehavior bayi terhadap lingkungan.'),
('L.05045', 'Pola Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Pola tidur dan terjaga yang teratur untuk memberikan istirahat adekuat.'),
('L.05046', 'Tingkat Keletihan', 'Fisiologis', 'Aktivitas dan Istirahat', 'Penurunan kapasitas kerja fisik dan mental yang tidak pulih dengan istirahat.'),
('L.05047', 'Toleransi Aktivitas', 'Fisiologis', 'Aktivitas dan Istirahat', 'Respon biologis terhadap aktivitas yang membutuhkan tenaga.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.04035 Kontinensia Fekal
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.04035', 1, 'Pengontrolan pengeluaran feses', 'Meningkat'),
('L.04035', 2, 'Defekasi', 'Membaik'),
('L.04035', 3, 'Frekuensi buang air besar', 'Membaik'),
('L.04035', 4, 'Konsistensi feses', 'Membaik');

-- L.04036 Kontinensia Urin
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.04036', 1, 'Kemampuan mengontrol pengeluaran urin', 'Meningkat'),
('L.04036', 2, 'Kemampuan menunda pengeluaran urin', 'Membaik'),
('L.04036', 3, 'Nokturia', 'Menurun'),
('L.04036', 4, 'Residu volume urin setelah berkemih', 'Menurun'),
('L.04036', 5, 'Frekuensi berkemih', 'Membaik');

-- L.05042 Mobilitas Fisik
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.05042', 1, 'Pergerakan ekstremitas', 'Meningkat'),
('L.05042', 2, 'Kekuatan otot', 'Meningkat'),
('L.05042', 3, 'Kesulitan gerak', 'Menurun'),
('L.05042', 4, 'Nyeri saat gerak', 'Menurun');

-- L.05043 Organisasi Perilaku Bayi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.05043', 1, 'Gerakan ekstremitas', 'Meningkat'),
('L.05043', 2, 'Kemampuan jari mengengam', 'Meningkat'),
('L.05043', 3, 'Gerakan terkoordinasi', 'Meningkat'),
('L.05043', 4, 'Respon normal terhadap stimulus sensorik', 'Meningkat');

-- L.05045 Pola Tidur
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.05045', 1, 'Keluhan sulit tidur', 'Menurun'),
('L.05045', 2, 'Keluhan sering terjaga', 'Menurun'),
('L.05045', 3, 'Keluhan tidak puas tidur', 'Menurun'),
('L.05045', 4, 'Keluhan pola tidur berubah', 'Menurun'),
('L.05045', 5, 'Keluhan istirahat tidak cukup', 'Menurun');

-- L.05046 Tingkat Keletihan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.05046', 1, 'Kemampuan melakukan aktivitas rutin', 'Meningkat'),
('L.05046', 2, 'Verbalisasi lelah', 'Menurun'),
('L.05046', 3, 'Lesu', 'Menurun'),
('L.05046', 4, 'Konsentrasi', 'Meningkat');

-- L.05047 Toleransi Aktivitas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.05047', 1, 'Kemudahan melakukan aktivitas sehari-hari', 'Meningkat'),
('L.05047', 2, 'Keluhan lelah', 'Menurun'),
('L.05047', 3, 'Dispnea saat aktivitas', 'Menurun'),
('L.05047', 4, 'Frekuensi nadi meningkat >20%', 'Menurun');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.04151', 'Manajemen Eliminasi Fekal', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola gangguan pola eliminasi fekal.'),
('I.04148', 'Kateterisasi Urin', 'Fisiologis', 'Eliminasi', 'Utama', 'Memasukkan selang kateter urin ke dalam kandung kemih.'),
('I.04149', 'Latihan Berkemih', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengajarkan kemampuan melakukan eliminasi urin.'),
('I.04163', 'Perawatan Inkontinensia Urin', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan merawat pasien yang mengalami pengeluaran urin secara involunter.'),
('I.07215', 'Latihan Otot Panggul', 'Fisiologis', 'Eliminasi', 'Pendukung', 'Melatih otot panggul untuk meningkatkan kontrol berkemih.'),
('I.05173', 'Dukungan Mobilisasi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Utama', 'Memfasilitasi pasien untuk meningkatkan aktivitas pergerakan fisik.'),
('I.05174', 'Dukungan Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Utama', 'Memfasilitasi siklus tidur dan terjaga yang teratur.'),
('I.05178', 'Manajemen Energi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Utama', 'Mengidentifikasi dan mengelola penggunaan energi untuk mencegah kelelahan.'),
('I.12362', 'Edukasi Aktivitas/Istirahat', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Mengajarkan pengaturan aktivitas dan istirahat.'),
('I.12379', 'Edukasi Keamanan Bayi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Menyediakan informasi pencegahan cedera pada bayi.'),
('I.04150', 'Latihan Eliminasi Fekal', 'Fisiologis', 'Eliminasi', 'Utama', 'Melatih usus untuk dievakuasi pada interval tertentu.'),
('I.04152', 'Manajemen Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Utama', 'Mengidentifikasi dan mengelola gangguan pola eliminasi urin.'),
('I.04145', 'Pencegahan Konstipasi', 'Fisiologis', 'Eliminasi', 'Pendukung', 'Mengidentifikasi dan menurunkan risiko penurunan frekuensi defekasi.'),
('I.03338', 'Perawatan Bayi', 'Fisiologis', 'Nutrisi dan Cairan', 'Utama', 'Mengidentifikasi dan merawat kesehatan bayi.'),
('I.13490', 'Promosi Keutuhan Keluarga', 'Relasional', 'Peran dan Hubungan', 'Pendukung', 'Meningkatkan pengetahuan dan kemampuan menjaga keutuhan keluarga.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.04151 Manajemen Eliminasi Fekal
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 1, 'Identifikasi masalah usus dan penggunaan obat pencahar'),
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 2, 'Identifikasi pengobatan yang berefek pada kondisi gastrointestinal'),
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 3, 'Monitor buang air besar (warna, frekuensi, konsistensi, volume)'),
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 4, 'Monitor tanda dan gejala diare, konstipasi, atau impaksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Terapeutik', 1, 'Berikan asupan cairan adekuat'),
((SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Kolaborasi', 1, 'Kolaborasi pemberian agen farmakologi, jika perlu');

-- I.04148 Kateterisasi Urin
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Observasi', 1, 'Periksa kondisi pasien (kesadaran, tanda vital, area perineal, distensi kandung kemih, inkontinensia urin)'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 1, 'Siapkan peralatan, bahan dan ruangan tindakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 2, 'Siapkan pasien: bebaskan pakaian bawah dan posisikan dorsal rekumben'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 3, 'Lakukan teknik aseptik saat memasang kateter'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 4, 'Amankan kateter dengan fiksasi yang tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Kolaborasi', 1, 'Kolaborasi dengan dokter jika terjadi kesulitan pemasangan kateter');

-- I.04149 Latihan Berkemih
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Observasi', 1, 'Periksa kembali penyebab gangguan berkemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Observasi', 2, 'Monitor pola dan kemampuan berkemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Terapeutik', 1, 'Hindari penggunaan kateter indwelling'),
((SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Terapeutik', 2, 'Siapkan area toilet yang aman'),
((SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Edukasi', 1, 'Ajarkan teknik relaksasi untuk memfasilitasi eliminasi urin');

-- I.04163 Perawatan Inkontinensia Urin
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Observasi', 1, 'Identifikasi penyebab inkontinensia urin'),
((SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Observasi', 2, 'Identifikasi perasaan dan persepsi terhadap inkontinensia urin'),
((SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Observasi', 3, 'Monitor efektivitas obat yang dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Terapeutik', 1, 'Berikan produk inkontinensia (popok, pembalut)'),
((SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Edukasi', 1, 'Ajarkan hygiene perineal yang tepat');

-- I.07215 Latihan Otot Panggul
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.07215'), 'Observasi', 1, 'Identifikasi pengetahuan tentang latihan otot panggul'),
((SELECT id FROM siki WHERE kode_intervensi='I.07215'), 'Terapeutik', 1, 'Ajarkan cara mengidentifikasi dan melatih otot panggul'),
((SELECT id FROM siki WHERE kode_intervensi='I.07215'), 'Edukasi', 1, 'Jelaskan manfaat latihan otot panggul untuk meningkatkan kontrol berkemih');

-- I.05173 Dukungan Mobilisasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 1, 'Identifikasi nyeri atau keluhan fisik lainnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 2, 'Identifikasi toleransi fisik melakukan pergerakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 3, 'Monitor frekuensi jantung dan tekanan darah sebelum mobilisasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 1, 'Berikan latihan range of motion pasif atau aktif'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 2, 'Fasilitasi perpindahan posisi (duduk, berdiri, berjalan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Edukasi', 1, 'Ajarkan teknik mobilisasi yang aman');

-- I.05174 Dukungan Tidur
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 1, 'Identifikasi pola aktivitas dan tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 2, 'Identifikasi faktor penggangu tidur (fisik dan psikologis)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 1, 'Modifikasi lingkungan (pencahayaan, kebisingan, suhu, matras)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 2, 'Batasi waktu tidur siang, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 3, 'Fasilitasi menghilangkan stress sebelum tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 1, 'Ajarkan teknik relaksasi untuk meningkatkan kualitas tidur');

-- I.05178 Manajemen Energi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05178'), 'Observasi', 1, 'Monitor pola dan jam tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05178'), 'Observasi', 2, 'Monitor lokasi dan ketidaknyamanan selama melakukan aktivitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 1, 'Sediakan lingkungan nyaman dan rendah stimulus'),
((SELECT id FROM siki WHERE kode_intervensi='I.05178'), 'Terapeutik', 2, 'Berikan aktivitas sesuai kemampuan pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.05178'), 'Edukasi', 1, 'Ajarkan prioritas aktivitas sesuai kemampuan energi');

-- I.12362 Edukasi Aktivitas/Istirahat
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12362'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12362'), 'Terapeutik', 1, 'Sediakan materi edukasi aktivitas dan istirahat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12362'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12362'), 'Edukasi', 1, 'Jelaskan pentingnya keseimbangan aktivitas dan istirahat');

-- I.12379 Edukasi Keamanan Bayi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12379'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12379'), 'Terapeutik', 1, 'Sediakan materi edukasi keamanan bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12379'), 'Edukasi', 1, 'Ajarkan cara aman menjaga bayi dari cedera'),
((SELECT id FROM siki WHERE kode_intervensi='I.12379'), 'Edukasi', 2, 'Anjurkan selalu mengawasi bayi');

-- I.04150 Latihan Eliminasi Fekal
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04150'), 'Observasi', 1, 'Monitor peristaltik usus secara teratur'),
((SELECT id FROM siki WHERE kode_intervensi='I.04150'), 'Terapeutik', 1, 'Anjurkan waktu yang konsisten untuk buang air besar'),
((SELECT id FROM siki WHERE kode_intervensi='I.04150'), 'Edukasi', 1, 'Ajarkan konsumsi makanan tertentu sesuai program'),
((SELECT id FROM siki WHERE kode_intervensi='I.04150'), 'Edukasi', 2, 'Anjurkan asupan cairan adekuat');

-- I.04145 Pencegahan Konstipasi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.04145'), 'Observasi', 1, 'Identifikasi faktor risiko konstipasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.04145'), 'Terapeutik', 1, 'Tingkatkan asupan serat dan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.04145'), 'Terapeutik', 2, 'Dorong aktivitas fisik'),
((SELECT id FROM siki WHERE kode_intervensi='I.04145'), 'Edukasi', 1, 'Ajarkan kebiasaan buang air besar yang teratur');

-- I.03338 Perawatan Bayi
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03338'), 'Observasi', 1, 'Monitor tanda-tanda vital bayi (terutama suhu 36.5-37.5°C)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03338'), 'Observasi', 2, 'Monitor pertumbuhan dan perkembangan bayi'),
((SELECT id FROM siki WHERE kode_intervensi='I.03338'), 'Terapeutik', 1, 'Mandikan bayi dengan air hangat (suhu normal)'),
((SELECT id FROM siki WHERE kode_intervensi='I.03338'), 'Terapeutik', 2, 'Mandikan bayi 5-10 menit, 2x sehari'),
((SELECT id FROM siki WHERE kode_intervensi='I.03338'), 'Kolaborasi', 1, 'Kolaborasi dengan dokter untuk pemeriksaan kesehatan bayi');

-- I.13490 Promosi Keutuhan Keluarga
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Observasi', 1, 'Identifikasi pemahaman keluarga terhadap masalah'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Observasi', 2, 'Identifikasi adanya konflik prioritas antar anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Observasi', 3, 'Identifikasi mekanisme koping keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Observasi', 4, 'Monitor hubungan antar anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Terapeutik', 1, 'Fasilitasi komunikasi terbuka antar anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13490'), 'Edukasi', 1, 'Jelaskan pentingnya keutuhan keluarga');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0041', 'Inkontinensia Fekal', 'Fisiologis', 'Eliminasi', 'Aktual', 'Perubahan kebiasaan buang air besar dari pola normal yang ditandai dengan pengeluaran feses secara involunter (tidak disadari).'),
('D.0042', 'Inkontinensia Urin Berlanjut', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin tidak terkendali dan terus menerus tanpa distensi atau perasaan penuh pada kandung kemih.'),
('D.0043', 'Inkontinensia Urin Berlebih', 'Fisiologis', 'Eliminasi', 'Aktual', 'Kehilangan urin yang tidak terkendali akibat overdistensi kandung kemih.'),
('D.0044', 'Inkontinensia Urin Fungsional', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin tidak terkendali karena kesulitan dan tidak mampu mencapai toilet pada waktu yang tepat.'),
('D.0045', 'Inkontinensia Urin Refleks', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin yang tidak terkendali pada saat volume kandung kemih tertentu tercapai.'),
('D.0046', 'Inkontinensia Urin Stres', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin tanpa disadari saat ada peningkatan tekanan intra-abdomen.'),
('D.0047', 'Inkontinensia Urin Urgensi', 'Fisiologis', 'Eliminasi', 'Aktual', 'Keluarnya urin tidak terkendali sesaat setelah keinginan yang kuat untuk berkemih (kebelet).'),
('D.0048', 'Kesiapan Peningkatan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Promosi Kesehatan', 'Pola fungsi sistem perkemihan yang cukup untuk memenuhi kebutuhan eliminasi dan dapat ditingkatkan.'),
('D.0049', 'Konstipasi', 'Fisiologis', 'Eliminasi', 'Aktual', 'Penurunan defekasi normal yang disertai pengeluaran feses sulit, tidak tuntas, serta feses kering dan banyak.'),
('D.0050', 'Retensi Urin', 'Fisiologis', 'Eliminasi', 'Aktual', 'Ketidakmampuan mengosongkan kandung kemih secara sempurna.');


-- ============================================
-- 6. SDKI PENYEBAB / FAKTOR RISIKO
-- ============================================

-- D.0041 Inkontinensia Fekal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), 'Fisiologis', 1, 'Kerusakan susunan saraf motorik bawah'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), 'Fisiologis', 2, 'Penurunan tonus otot'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), 'Fisiologis', 3, 'Gangguan kognitif'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), 'Fisiologis', 4, 'Penyalahgunaan laksatif'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), 'Fisiologis', 5, 'Diare kronis');

-- D.0042 Inkontinensia Urin Berlanjut
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), 'Fisiologis', 1, 'Neuropati arkus refleks'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), 'Fisiologis', 2, 'Disfungsi neurologis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), 'Fisiologis', 3, 'Kerusakan medula spinalis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), 'Fisiologis', 4, 'Trauma');

-- D.0043 Inkontinensia Urin Berlebih
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), 'Fisiologis', 1, 'Blok spingter'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), 'Fisiologis', 2, 'Kerusakan atau ketidakadekuatan jalur aferen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), 'Fisiologis', 3, 'Obstruksi jalan keluar urin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), 'Fisiologis', 4, 'Ketidakadekuatan detrusor');

-- D.0044 Inkontinensia Urin Fungsional
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0044'), 'Fisiologis', 1, 'Ketidakmampuan atau penurunan mengenali tanda-tanda berkemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0044'), 'Situasional', 1, 'Ketidakmampuan mencapai toilet pada waktu yang tepat');

-- D.0045 Inkontinensia Urin Refleks
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0045'), 'Fisiologis', 1, 'Kerusakan konduksi impuls di atas arkus refleks'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0045'), 'Fisiologis', 2, 'Kerusakan jaringan (terapi radiasi)');

-- D.0046 Inkontinensia Urin Stres
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0046'), 'Fisiologis', 1, 'Peningkatan tekanan intra-abdomen'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0046'), 'Fisiologis', 2, 'Kelemahan otot pelvis');

-- D.0047 Inkontinensia Urin Urgensi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), 'Fisiologis', 1, 'Iritasi reseptor kontraksi kandung kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), 'Fisiologis', 2, 'Penurunan kapasitas kandung kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), 'Fisiologis', 3, 'Hiperaktivitas detrusor'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), 'Fisiologis', 4, 'Efek agen farmakologis (diuretik)');

-- D.0049 Konstipasi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 1, 'Penurunan mobilitas gastrointestinal'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 2, 'Ketidakadekuatan asupan makanan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 3, 'Ketidakcukupan diet'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 4, 'Ketidakcukupan asupan cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 1, 'Tirah baring lama');

-- D.0050 Retensi Urin
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0050'), 'Fisiologis', 1, 'Kerusakan saraf saluran kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0050'), 'Fisiologis', 2, 'Obstruksi saluran kemih'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0050'), 'Situasional', 1, 'Efek agen farmakologis');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), (SELECT id FROM slki WHERE kode_luaran='L.04035')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0044'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0045'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0046'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), (SELECT id FROM slki WHERE kode_luaran='L.04036')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0048'), (SELECT id FROM slki WHERE kode_luaran='L.04034')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), (SELECT id FROM slki WHERE kode_luaran='L.04033')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0050'), (SELECT id FROM slki WHERE kode_luaran='L.04034'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), (SELECT id FROM siki WHERE kode_intervensi='I.04150'), 'Pendukung'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), (SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0044'), (SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0045'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0046'), (SELECT id FROM siki WHERE kode_intervensi='I.07215'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0047'), (SELECT id FROM siki WHERE kode_intervensi='I.04149'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0048'), (SELECT id FROM siki WHERE kode_intervensi='I.04152'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0050'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Utama');


-- ============================================
-- 9. RASIONAL
-- ============================================

-- D.0041 ↔ I.04151
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 1, 'Untuk mengetahui masalah pada usus dan penggunaan obat pencahar'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0041'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 2, 'Untuk mengetahui pengobatan yang berefek pada kondisi gastrointestinal');

-- D.0042 ↔ I.04148
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Observasi', 1, 'Untuk mengetahui perkembangan status kesehatan pasien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 1, 'Agar tindakan sesuai dengan prosedur yang tepat'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0042'), (SELECT id FROM siki WHERE kode_intervensi='I.04148'), 'Terapeutik', 2, 'Untuk mempermudah klien berkemih dan mencegah infeksi');

-- D.0043 ↔ I.04163
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), (SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Observasi', 1, 'Untuk mengetahui penyebab inkontinensia pada urin klien'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0043'), (SELECT id FROM siki WHERE kode_intervensi='I.04163'), 'Observasi', 2, 'Untuk mengetahui perasaan yang dialami klien terhadap inkontinensia urin');

-- D.0049 ↔ I.04151
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 1, 'Untuk melihat warna, frekuensi, konsistensi, dan volume dari buang air besar'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0049'), (SELECT id FROM siki WHERE kode_intervensi='I.04151'), 'Observasi', 2, 'Untuk mengetahui tanda dan gejala dari konstipasi atau impaksi');

SET FOREIGN_KEY_CHECKS = 1;
