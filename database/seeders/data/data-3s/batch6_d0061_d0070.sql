-- ============================================
-- DATA MASTER BATCH 6: D.0061 – D.0070
-- DigiKep - SDKI / SLKI / SIKI
-- Sumber: Data Master Excel (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran)
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.06049', 'Kapasitas Adaptif Intrakranial', 'Fisiologis', 'Neurosensori', 'Kestabilan mekanisme dinamika intrakranial.'),
('L.06051', 'Neurovaskuler Perifer', 'Fisiologis', 'Neurosensori', 'Integritas fungsi neurovaskuler untuk mempertahankan aliran darah dan fungsi motorik/sensori.'),
('L.06052', 'Status Menelan', 'Fisiologis', 'Neurosensori', 'Kemampuan menelan dengan aman dan efektif.'),
('L.06053', 'Status Neurologis', 'Fisiologis', 'Neurosensori', 'Kondisi fungsi sistem saraf pusat dan tepi.'),
('L.06054', 'Tingkat Konfusi', 'Fisiologis', 'Neurosensori', 'Tingkat kesadaran, perhatian, kognisi dan persepsi.'),
('L.07055', 'Fungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Integrasi aspek fisik dan sosioemosional terkait penyaluran dan kinerja seksual.'),
('L.07059', 'Status Antepartum', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Kondisi pada periode kehamilan.'),
('L.09079', 'Memori', 'Fisiologis', 'Neurosensori', 'Kemampuan mengingat beberapa informasi atau perilaku.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.06049 Kapasitas Adaptif Intrakranial
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.06049', 1, 'Tekanan intrakranial', 'Membaik'),
('L.06049', 2, 'Tekanan Cerebral Perfusion Pressure (CPP)', 'Membaik'),
('L.06049', 3, 'Tingkat kesadaran', 'Meningkat');

-- L.06051 Neurovaskuler Perifer
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.06051', 1, 'Sirkulasi arteri', 'Membaik'),
('L.06051', 2, 'Sirkulasi vena', 'Membaik'),
('L.06051', 3, 'Sensasi', 'Meningkat'),
('L.06051', 4, 'Pergerakan', 'Meningkat'),
('L.06051', 5, 'Warna kulit', 'Membaik');

-- L.06052 Status Menelan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.06052', 1, 'Refleks menelan', 'Meningkat'),
('L.06052', 2, 'Kemudahan menelan', 'Meningkat'),
('L.06052', 3, 'Batuk saat menelan', 'Menurun'),
('L.06052', 4, 'Aspirasi', 'Menurun');

-- L.06053 Status Neurologis
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.06053', 1, 'Tingkat kesadaran', 'Meningkat'),
('L.06053', 2, 'Orientasi', 'Meningkat'),
('L.06053', 3, 'Fungsi kognitif', 'Meningkat'),
('L.06053', 4, 'Fungsi motorik', 'Meningkat');

-- L.06054 Tingkat Konfusi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.06054', 1, 'Kesadaran', 'Meningkat'),
('L.06054', 2, 'Perhatian', 'Meningkat'),
('L.06054', 3, 'Kognitif', 'Meningkat'),
('L.06054', 4, 'Persepsi', 'Membaik');

-- L.07055 Fungsi Seksual
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.07055', 1, 'Kepuasan seksual', 'Meningkat'),
('L.07055', 2, 'Kemampuan melakukan hubungan seksual', 'Meningkat'),
('L.07055', 3, 'Kecemasan berkaitan seksualitas', 'Menurun');

-- L.07059 Status Antepartum
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.07059', 1, 'Mual', 'Menurun'),
('L.07059', 2, 'Muntah', 'Menurun'),
('L.07059', 3, 'Edema', 'Menurun'),
('L.07059', 4, 'Nyeri abdomen', 'Menurun'),
('L.07059', 5, 'Perdarahan vagina', 'Menurun'),
('L.07059', 6, 'Konstipasi', 'Menurun');

-- L.09079 Memori
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.09079', 1, 'Kemampuan mempelajari hal baru', 'Meningkat'),
('L.09079', 2, 'Mengingat informasi', 'Meningkat'),
('L.09079', 3, 'Ketakutan terhadap lupa', 'Menurun');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.06188', 'Latihan Memori', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengajarkan kemampuan untuk meningkatkan daya ingat.'),
('I.06189', 'Manajemen Delirium', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi dan mengelola gangguan kesadaran dan kognitif.'),
('I.06190', 'Manajemen Disrefleksia', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi dan mengelola respons hipertonik akibat stimulus berlebihan pada individu dengan cedera medula spinalis.'),
('I.06195', 'Manajemen Sensasi Perifer', 'Fisiologis', 'Neurosensori', 'Utama', 'Mengidentifikasi dan mengelola ketidaknyamanan pada perubahan sensasi perifer.'),
('I.08238', 'Manajemen Nyeri', 'Fisiologis', 'Rasa Nyaman', 'Utama', 'Mengidentifikasi dan mengelola pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan.'),
('I.07214', 'Konseling Seksualitas', 'Relasional', 'Peran dan Hubungan', 'Pendukung', 'Memberikan bimbingan seksual pada pasangan sehingga mampu menjalankan fungsinya secara optimal.'),
('I.11351', 'Dukungan Perawatan Diri: Makan/Minum', 'Fisiologis', 'Perawatan Diri', 'Utama', 'Membantu pasien dalam memenuhi kebutuhan makan dan minum.'),
('I.12437', 'Edukasi Persalinan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Pendukung', 'Memberikan informasi tentang proses persalinan.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.06188 Latihan Memori
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 1, 'Identifikasi masalah memori yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 2, 'Identifikasi kesalahan terhadap orientasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 3, 'Monitor perilaku dan perubahan memori'),
((SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Terapeutik', 1, 'Ajarkan teknik mnemonik untuk meningkatkan memori'),
((SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Edukasi', 1, 'Jelaskan cara meningkatkan daya ingat');

-- I.06189 Manajemen Delirium
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Observasi', 1, 'Identifikasi faktor risiko delirium'),
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Observasi', 2, 'Monitor tingkat kesadaran dan perubahan mental'),
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Observasi', 3, 'Monitor orientasi waktu, tempat, orang'),
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 1, 'Ciptakan lingkungan yang aman dan nyaman'),
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Terapeutik', 2, 'Modifikasi lingkungan (pencahayaan, kebisingan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat neuroleptik, jika perlu');

-- I.06190 Manajemen Disrefleksia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 1, 'Identifikasi penyebab disrefleksia'),
((SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 2, 'Monitor tanda vital dan gejala disrefleksia'),
((SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 3, 'Monitor tekanan darah dan perubahan lainnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Terapeutik', 1, 'Cegah stimulus yang dapat memicu disrefleksia'),
((SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat antihipertensi, jika perlu');

-- I.06195 Manajemen Sensasi Perifer
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Observasi', 1, 'Identifikasi penyebab perubahan sensasi perifer'),
((SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Observasi', 2, 'Monitor tingkat ketidaknyamanan'),
((SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Observasi', 3, 'Monitor sensasi dan motorik ekstremitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Terapeutik', 1, 'Lindungi area dengan ketidaknyamanan sensasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Edukasi', 1, 'Ajarkan pencegahan trauma pada area dengan perubahan sensasi');

-- I.08238 Manajemen Nyeri
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Observasi', 1, 'Identifikasi lokasi, karakteristik, durasi, frekuensi nyeri'),
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Observasi', 2, 'Identifikasi skala nyeri'),
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Observasi', 3, 'Monitor respons pasien terhadap penanganan nyeri'),
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 1, 'Berikan analgesik sesuai orde dokter'),
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Terapeutik', 2, 'Ajarkan teknik relaksasi dan distraksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08238'), 'Edukasi', 1, 'Jelaskan penyebab nyeri dan cara mengatasinya');

-- I.07214 Konseling Seksualitas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Observasi', 1, 'Identifikasi waktu disfungsi seksual'),
((SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Observasi', 2, 'Identifikasi kemungkinan penyebab'),
((SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Terapeutik', 1, 'Gunakan teknik mendengarkan aktif'),
((SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Edukasi', 1, 'Ajarkan tentang fungsi seksual normal');

-- I.11351 Dukungan Perawatan Diri: Makan/Minum
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 1, 'Monitor kemampuan makan dan minum'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 2, 'Monitor asupan nutrisi dan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 1, 'Bantu posisi yang aman saat makan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 2, 'Sediakan makanan dan minuman dalam jumlah kecil'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Edukasi', 1, 'Ajarkan cara makan yang aman');

-- I.12437 Edukasi Persalinan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Observasi', 1, 'Identifikasi tingkat pengetahuan tentang persalinan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Observasi', 2, 'Identifikasi pemahaman ibu tentang persalinan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Edukasi', 1, 'Jelaskan proses persalinan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Edukasi', 2, 'Ajarkan teknik pernapasan dan relaksasi');


-- ============================================
-- 5. SDKI (Diagnosa)
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0061', 'Disrefleksia Otonom', 'Fisiologis', 'Neurosensori', 'Aktual', 'Respons hipertonik tidak terkoordinasi dari sistem saraf simpatik berikut cedera medula spinalis di T6 atau di atasnya, yang menyebabkan pelepasan katekholamin.'),
('D.0062', 'Gangguan Memori', 'Fisiologis', 'Neurosensori', 'Aktual', 'Ketidakmampuan mengingat beberapa informasi atau perilaku.'),
('D.0063', 'Gangguan Menelan', 'Fisiologis', 'Neurosensori', 'Aktual', 'Kesulitan dalam keadaan fisiologis transisi makanan dari mulut melalui faring ke esofagus.'),
('D.0064', 'Konfusi Akut', 'Fisiologis', 'Neurosensori', 'Aktual', 'Gangguan kesadaran, perhatian, kognisi dan persepsi yang reversibel dan terjadi dalam periode waktu singkat.'),
('D.0065', 'Konfusi Kronis', 'Fisiologis', 'Neurosensori', 'Aktual', 'Gangguan kesadaran, perhatian, kognisi dan persepsi yang irreversibel dan terjadi dalam periode waktu lama.'),
('D.0066', 'Penurunan Kapasitas Adaptif Intrakranial', 'Fisiologis', 'Neurosensori', 'Aktual', 'Dinamika mekanisme kompensasi intrakranial tidak mampu mengatasi peningkatan volume intrakranial dan tekanan mengakibatkan penurunan kesadaran dan perubahan status neurologis.'),
('D.0067', 'Risiko Disfungsi Neurovaskuler Perifer', 'Fisiologis', 'Neurosensori', 'Risiko', 'Berisiko mengalami gangguan sirkulasi, sensasi dan pergerakan.'),
('D.0068', 'Risiko Konfusi Akut', 'Fisiologis', 'Neurosensori', 'Risiko', 'Berisiko mengalami gangguan kesadaran, perhatian, kognisi dan persepsi yang reversibel dalam periode waktu singkat.'),
('D.0069', 'Disfungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Aktual', 'Perubahan fungsi seksual selama fase respon seksual berupa hasrat, terangsang, orgasme, dan/atau relaksasi yang dirasa tidak memuaskan.'),
('D.0070', 'Kesiapan Peningkatan Persalinan', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Promosi Kesehatan', 'Pola mempersiapkan, mempertahankan dan memperkuat proses kehamilan dan persalinan serta perawatan bayi baru lahir yang dapat ditingkatkan.');


-- ============================================
-- 6. SDKI PENYEBAB / FAKTOR RISIKO
-- ============================================

-- D.0061 Disrefleksia Otonom (penyebab - kondisi klinis)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), 'Umum', 1, 'Cedera medula spinalis di T6 atau di atasnya');

-- D.0062 Gangguan Memori (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), 'Fisiologis', 1, 'Ketidakuatan stimulasi intelektual'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), 'Fisiologis', 2, 'Gangguan sirkulasi ke otak'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), 'Fisiologis', 3, 'Gangguan volume cairan');

-- D.0063 Gangguan Menelan (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), 'Fisiologis', 1, 'Disfungsi neuromuskuler'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), 'Fisiologis', 2, 'Kerusakan struktur mekanik');

-- D.0064 Konfusi Akut (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0064'), 'Fisiologis', 1, 'Perubahan metabolik'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0064'), 'Fisiologis', 2, 'Infeksi');

-- D.0065 Konfusi Kronis (penyebab minimal)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0065'), 'Fisiologis', 1, 'Degenerasi neurologis'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0065'), 'Fisiologis', 2, 'Penyakit kronis');

-- D.0066 Penurunan Kapasitas Adaptif Intrakranial (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0066'), 'Fisiologis', 1, 'Peningkatan volume intrakranial'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0066'), 'Fisiologis', 2, 'Cedera kepala'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0066'), 'Fisiologis', 3, 'Tumor otak');

-- D.0067 Risiko Disfungsi Neurovaskuler Perifer (faktor risiko)
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0067'), 1, 'Kompresi saraf'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0067'), 2, 'Immobilisasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0067'), 3, 'Trauma');

-- D.0068 Risiko Konfusi Akut (faktor risiko)
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0068'), 1, 'Usia di atas 60 tahun'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0068'), 2, 'Dementia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0068'), 3, 'Infeksi');

-- D.0069 Disfungsi Seksual (penyebab)
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), 'Fisiologis', 1, 'Gangguan endokrin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), 'Psikologis', 1, 'Stres atau kecemasan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), 'Situasional', 1, 'Efek obat');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), (SELECT id FROM slki WHERE kode_luaran='L.06053')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), (SELECT id FROM slki WHERE kode_luaran='L.09079')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), (SELECT id FROM slki WHERE kode_luaran='L.06052')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0064'), (SELECT id FROM slki WHERE kode_luaran='L.06054')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0065'), (SELECT id FROM slki WHERE kode_luaran='L.06054')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0066'), (SELECT id FROM slki WHERE kode_luaran='L.06049')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0067'), (SELECT id FROM slki WHERE kode_luaran='L.06051')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0068'), (SELECT id FROM slki WHERE kode_luaran='L.06054')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), (SELECT id FROM slki WHERE kode_luaran='L.07055')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0070'), (SELECT id FROM slki WHERE kode_luaran='L.07059'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), (SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), (SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), (SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0064'), (SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0065'), (SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0066'), (SELECT id FROM siki WHERE kode_intervensi='I.06194'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0067'), (SELECT id FROM siki WHERE kode_intervensi='I.06195'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0068'), (SELECT id FROM siki WHERE kode_intervensi='I.06189'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), (SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0070'), (SELECT id FROM siki WHERE kode_intervensi='I.12437'), 'Utama');


-- ============================================
-- 9. RASIONAL
-- ============================================

-- D.0061 ↔ I.06190
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), (SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 1, 'Untuk mengetahui perkembangan status kesehatan pasien dan mencegah komplikasi lanjutan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), (SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 2, 'Untuk mengetahui apa saja yang bisa menjadi penyebab yang dapat memicu disrefleksia'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0061'), (SELECT id FROM siki WHERE kode_intervensi='I.06190'), 'Observasi', 3, 'Untuk dapat mengidentifikasi apa saja gejala yang termasuk dalam disrefleksia');

-- D.0062 ↔ I.06188
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), (SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 1, 'Untuk mengetahui masalah memori yang dialami'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), (SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 2, 'Untuk menemukan solusi yang tepat pada kesalahan orientasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0062'), (SELECT id FROM siki WHERE kode_intervensi='I.06188'), 'Observasi', 3, 'Untuk mengetahui perilaku dan perubahan memori klien pada saat melakukan terapi');

-- D.0063 ↔ I.11351
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), (SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 1, 'Untuk mengetahui kemampuan menelan dan mencegah aspirasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0063'), (SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 2, 'Untuk memastikan asupan nutrisi terpenuhi dengan aman');

-- D.0069 ↔ I.07214
INSERT INTO siki_rasional (sdki_id, siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), (SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Observasi', 1, 'Untuk mengetahui waktu dan kemungkinan penyebab disfungsi seksual'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0069'), (SELECT id FROM siki WHERE kode_intervensi='I.07214'), 'Observasi', 2, 'Untuk memberikan dukungan dan konseling yang tepat');

SET FOREIGN_KEY_CHECKS = 1;
