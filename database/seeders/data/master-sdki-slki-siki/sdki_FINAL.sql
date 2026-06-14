-- ============================================
-- DATA MASTER SDKI FINAL - DigiKep
-- Sumber: Standar Diagnosis Keperawatan Indonesia (PPNI)
-- Tabel: diagnosa_sdki, sdki_penyebab, sdki_gejala,
--        sdki_faktor_risiko, sdki_kondisi_klinis
-- Coverage: D.0001-D.0105, D.0129, D.0130
-- Note: D.0106-D.0128, D.0131-D.0149 belum tersedia
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0001', 'Bersihan Jalan Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual', 'Ketidakmampuan membersihkan sekret atau obstruksi jalan napas untuk mempertahankan jalan napas tetap paten.'),
('D.0002', 'Gangguan Penyapihan Ventilator', 'Fisiologis', 'Respirasi', 'Aktual', 'Ketidakmampuan beradaptasi dengan pengurangan bantuan ventilator mekanik yang dapat menghambat dan memperlama proses penyapihan.'),
('D.0003', 'Gangguan Pertukaran Gas', 'Fisiologis', 'Respirasi', 'Aktual', 'Kelebihan atau kekurangan oksigenasi dan/atau eliminasi karbondioksida pada membran alveolus-kapiler.'),
('D.0004', 'Gangguan Ventilasi Spontan', 'Fisiologis', 'Respirasi', 'Aktual', 'Penurunan cadangan energi yang mengakibatkan individu tidak mampu bernapas secara adekuat.'),
('D.0005', 'Pola Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual', 'Inspirasi dan/atau ekspirasi yang tidak memberikan ventilasi adekuat.'),
('D.0006', 'Risiko Aspirasi', 'Fisiologis', 'Respirasi', 'Risiko', 'Berisiko mengalami masuknya sekresi gastrointestinal, sekresi orofaring, benda cair atau padat ke dalam saluran trakeobronkhial akibat disfungsi mekanisme protektif saluran napas.'),
('D.0007', 'Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Ketidakmampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.'),
('D.0008', 'Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Ketidakadekuatan jantung memompa darah untuk memenuhi kebutuhan metabolisme tubuh.'),
('D.0009', 'Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Aktual', 'Penurunan sirkulasi darah pada level kapiler yang dapat mengganggu metabolisme tubuh.'),
('D.0010', 'Risiko Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami ketidakmampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.'),
('D.0011', 'Risiko Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami pemompaan jantung yang tidak adekuat untuk memenuhi kebutuhan metabolisme tubuh.'),
('D.0012', 'Risiko Perdarahan', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami kehilangan darah baik internal (terjadi di dalam tubuh) maupun eksternal (terjadi hingga keluar tubuh).'),
('D.0013', 'Risiko Perfusi Gastrointestinal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi gastrointestinal.'),
('D.0014', 'Risiko Perfusi Miokard Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi arteri koroner yang dapat mengganggu metabolisme miokard.'),
('D.0015', 'Risiko Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah pada level kapiler yang dapat mengganggu metabolisme tubuh.'),
('D.0016', 'Risiko Perfusi Renal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah ke ginjal.'),
('D.0017', 'Risiko Perfusi Serebral Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko', 'Berisiko mengalami penurunan sirkulasi darah ke otak.'),
('D.0018', 'Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin.'),
('D.0019', 'Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme.'),
('D.0020', 'Diare', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Pengeluaran feses yang sering, lunak dan tidak berbentuk.'),
('D.0021', 'Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Peningkatan, penurunan, tidak efektif atau kurangnya aktivitas peristaltik gastrointestinal.');


-- INSERT sdki_penyebab

-- D.0001 Bersihan Jalan Napas Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 1, 'Spasme jalan napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 2, 'Hipersekresi jalan napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 3, 'Disfungsi neuromuskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 4, 'Benda asing dalam jalan napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 5, 'Adanya jalan napas buatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 6, 'Sekresi yang tertahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 7, 'Hiperplasia dinding jalan napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 8, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 9, 'Respon alergi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Fisiologis', 10, 'Efek agen farmakologis (mis. anastesi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Situasional', 1, 'Merokok aktif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Situasional', 2, 'Merokok pasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Situasional', 3, 'Terpajan polutan');

-- D.0002 Gangguan Penyapihan Ventilator
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Fisiologis', 1, 'Hipersekresi jalan napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Fisiologis', 2, 'Ketidakcukupan energi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Fisiologis', 3, 'Hambatan upaya napas (mis. nyeri saat bernapas, kelemahan otot pernapasan, efek sedasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Psikologis', 1, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Psikologis', 2, 'Perasaan tidak berdaya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Psikologis', 3, 'Kurang informasi tentang proses penyapihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Psikologis', 4, 'Penurunan motivasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Situasional', 1, 'Ketidakadekuatan dukungan sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Situasional', 2, 'Ketidaktepatan kecepatan proses penyapihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Situasional', 3, 'Riwayat kegagalan berulang dalam upaya penyapihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Situasional', 4, 'Riwayat ketergantungan ventilator >4 hari');

-- D.0003 Gangguan Pertukaran Gas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Umum', 1, 'Ketidakseimbangan ventilasi-perfusi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Umum', 2, 'Perubahan membran alveolus-kapiler');

-- D.0004 Gangguan Ventilasi Spontan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Umum', 1, 'Gangguan metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Umum', 2, 'Kelemahan otot pernapasan');

-- D.0005 Pola Napas Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 1, 'Depresi pusat pernapasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 2, 'Hambatan upaya napas (mis. nyeri saat bernapas, kelemahan otot pernapasan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 3, 'Deformitas dinding dada'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 4, 'Deformitas tulang dada'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 5, 'Gangguan neuromuskular'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 6, 'Gangguan neurologis (mis. elektroensefalogram [EEG] positif, cedera kepala, ganguan kejang)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 7, 'Imaturitas neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 8, 'Penurunan energi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 9, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 10, 'Posisi tubuh yang menghambat ekspansi paru'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 11, 'Sindrom hipoventilasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 12, 'Kerusakan inervasi diafragma (kerusakan saraf C5 ke atas)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 13, 'Cedera pada medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 14, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Umum', 15, 'Kecemasan');

-- D.0006 Risiko Aspirasi - tidak ada penyebab (tipe Risiko)

-- D.0007 Gangguan Sirkulasi Spontan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Umum', 1, 'Abnormalitas kelistrikan jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Umum', 2, 'Abnormalitas struktur jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Umum', 3, 'Penurunan fungsi ventrikel');

-- D.0008 Penurunan Curah Jantung
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Umum', 1, 'Perubahan irama jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Umum', 2, 'Perubahan frekuensi jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Umum', 3, 'Perubahan kontraktilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Umum', 4, 'Perubahan preload'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Umum', 5, 'Perubahan afterload');

-- D.0009 Perfusi Perifer Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 1, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 2, 'Penurunan konsentrasi hemoglobin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 3, 'Peningkatan tekanan darah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 4, 'Kekurangan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 5, 'Penurunan aliran arteri dan/atau vena'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 6, 'Kurang terpapar informasi tentang faktor pemberat (mis. merokok, gaya hidup monoton, trauma, obesitas, asupan garam, imobilitas)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 7, 'Kurang terpapar informasi tentang proses penyakit (mis. diabetes melitus, hiperlipidemia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Umum', 8, 'Kurang aktivitas fisik');

-- D.0010–D.0017 Risiko - tidak ada penyebab (tipe Risiko)

-- D.0018 Berat Badan Lebih
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 2, 'Kelebihan konsumsi gula'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 4, 'Gangguan persepsi makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 5, 'Kelebihan konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 6, 'Penggunaan energi kurang dari asupan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 7, 'Sering mengemil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 8, 'Sering memakan makanan berminyak/berlemak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 9, 'Faktor keturunan (mis. distribusi jaringan adiposa, pengeluaran energi, aktivitas lipase lipoprotein, sintesis lipid, lipolisis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 10, 'Penggunaan makanan formula atau makanan campuran (pada bayi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 11, 'Asupan kalsium rendah (pada anak-anak)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 12, 'Berat badan bertambah cepat (selama masa anak-anak, selama masa bayi, termasuk minggu pertama, 4 bulan pertama, dan tahun pertama)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Umum', 13, 'Makanan padat sebagai sumber makanan utama pada usia <5 bulan');

-- D.0019 Defisit Nutrisi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 1, 'Kurangnya asupan makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 2, 'Ketidakmampuan menelan makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 3, 'Ketidakmampuan mencerna makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 4, 'Ketidakmampuan mengabsorbsi nutrien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 5, 'Peningkatan kebutuhan metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 6, 'Faktor ekonomi (mis. finansial tidak mencukupi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Umum', 7, 'Faktor psikologis (mis. stres, keengganan untuk makan)');

-- D.0020 Diare
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 1, 'Inflamasi gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 2, 'Iritasi gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 3, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Fisiologis', 4, 'Malabsorpsi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Psikologis', 1, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Psikologis', 2, 'Tingkat stres tinggi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 1, 'Terpapar kontaminan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 2, 'Terpapar toksin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 3, 'Penyalahgunaan laksatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 4, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 5, 'Program pengobatan (mis. agen tiroid, analgesik, pelunak feses, ferosulfat, antasida, cimetidine dan antibiotik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 6, 'Perubahan air dan makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Situasional', 7, 'Bakteri pada air');

-- D.0021 Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 1, 'Asupan enteral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 2, 'Intoleransi makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 3, 'Imobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 4, 'Makanan kontaminan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 5, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 6, 'Pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 7, 'Efek agen farmakologis (mis. narkotik/opiat, antibiotik, laksatif, anastesia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 8, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Umum', 9, 'Kecemasan');


-- INSERT sdki_faktor_risiko

-- D.0006 Risiko Aspirasi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 1, 'Penurunan tingkat kesadaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 2, 'Penurunan refleks muntah dan/atau batuk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 3, 'Gangguan menelan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 4, 'Disfagia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 5, 'Kerusakan mobilitas fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 6, 'Peningkatan residu lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 7, 'Peningkatan tekanan intragastrik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 8, 'Penurunan motilitas gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 9, 'Sfingter esofagus bawah inkompeten'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 10, 'Perlambatan pengosongan lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 11, 'Terpasang selang nasogastrik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 12, 'Terpasang trakeostomi atau endotracheal tube'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 13, 'Trauma/pembedahan leher, mulut, dan/atau wajah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 14, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 15, 'Ketidakmatangan koordinasi menghisap, menelan dan bernapas');

-- D.0010 Risiko Gangguan Sirkulasi Spontan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 1, 'Kekurangan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 2, 'Hipoksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 3, 'Hipotermia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 4, 'Hipokalemia/hiperkalemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 5, 'Hipoglikemia/hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 6, 'Asidosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 7, 'Toksin (mis. keracunan, overdosis obat)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 8, 'Tamponade jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 9, 'Tension pneumothorax'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 10, 'Trombosis jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 11, 'Trombosis paru (emboli paru)');

-- D.0011 Risiko Penurunan Curah Jantung
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 1, 'Perubahan afterload'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 2, 'Perubahan frekuensi jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 3, 'Perubahan irama jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 4, 'Perubahan kontraktilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 5, 'Perubahan preload');

-- D.0012 Risiko Perdarahan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 1, 'Aneurisma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 2, 'Gangguan gastrointestinal (mis. ulkus lambung, polip, varises)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 3, 'Gangguan fungsi hati (mis. sirosis hepatitis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 4, 'Komplikasi kehamilan (mis. ketuban pecah sebelum waktunya, plasenta previa/abrupsio, kehamilan kembar)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 5, 'Komplikasi pasca partum (mis. atoni uterus, retensi plasenta)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 6, 'Gangguan koagulasi (mis. trombositopenia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 7, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 8, 'Tindakan pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 9, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 10, 'Kurang terpapar informasi tentang pencegahan perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 11, 'Proses keganasan');

-- D.0013 Risiko Perfusi Gastrointestinal Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 1, 'Perdarahan gastrointestinal akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 2, 'Trauma abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 3, 'Sindroma kompartemen abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 4, 'Aneurisma aorta abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 5, 'Varises gastroesofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 6, 'Penurunan kinerja ventrikel kiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 7, 'Koagulopati (mis. anemia sel sabit, koagulopati intravaskuler diseminata)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 8, 'Penurunan konsentrasi hemoglobin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 9, 'Keabnormalan masa protrombin dan/atau masa tromboplastin parsial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 10, 'Disfungsi hati (mis. sirosis, hepatitis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 11, 'Disfungsi ginjal (mis. ginjal polikistik, stenosis arteri ginjal, gagal ginjal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 12, 'Disfungsi gastrointestinal (mis. ulkus duodenum atau ulkus lambung, kolitis iskemik, pankreatitis iskemik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 13, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 14, 'Ketidakstabilan hemodinamik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 15, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 16, 'Usia >60 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 17, 'Efek samping tindakan (cardiopulmunary bypass, anastesi, pembedahan lambung)');

-- D.0014 Risiko Perfusi Miokard Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 1, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 2, 'Hiperlipidemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 3, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 4, 'Hipoksemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 5, 'Hipoksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 6, 'Kekurangan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 7, 'Pembedahan jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 8, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 9, 'Spasme arteri koroner'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 10, 'Peningkatan protein C-reaktif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 11, 'Tamponade jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 12, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 13, 'Riwayat penyakit kardiovaskuler pada keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 14, 'Kurang terpapar informasi tentang faktor risiko yang dapat diubah (mis. merokok, gaya hidup kurang gerak, obesitas)');

-- D.0015 Risiko Perfusi Perifer Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 1, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 2, 'Gaya hidup kurang gerak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 3, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 4, 'Merokok'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 5, 'Prosedur endovaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 6, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 7, 'Kurang terpapar informasi tentang faktor pemberat (mis. merokok, gaya hidup kurang gerak, obesitas, imobilitas)');

-- D.0016 Risiko Perfusi Renal Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 1, 'Kekurangan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 2, 'Embolisme vaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 3, 'Vaskulitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 4, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 5, 'Disfungsi ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 6, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 7, 'Keganasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 8, 'Pembedahan jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 9, 'Bypass kardiopulmonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 10, 'Hipoksemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 11, 'Hipoksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 12, 'Asidosis metabolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 13, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 14, 'Sindrom kompartemen abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 15, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 16, 'Sepsis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 17, 'Sindrom respon inflamasi sistemik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 18, 'Lanjut usia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 19, 'Merokok'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 20, 'Penyalahgunaan zat');

-- D.0017 Risiko Perfusi Serebral Tidak Efektif
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 1, 'Keabnormalan masa protrombin dan/atau masa tromboplastin parsial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 2, 'Penurunan kinerja ventrikel kiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 3, 'Aterosklerosis aorta'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 4, 'Diseksi arteri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 5, 'Fibrilasi atrium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 6, 'Tumor otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 7, 'Stenosis karotis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 8, 'Miksoma atrium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 9, 'Aneurisma serebri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 10, 'Koagulopati (mis. anemia sel sabit)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 11, 'Dilatasi kardiomiopati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 12, 'Koagulasi intravaskuler diseminata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 13, 'Embolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 14, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 15, 'Hiperkolesteronemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 16, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 17, 'Endokarditis infektif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 18, 'Katup prostetik mekanis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 19, 'Stenosis mitral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 20, 'Neoplasma otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 21, 'Infark miokard akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 22, 'Sindrom sick sinus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 23, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 24, 'Terapi tombolitik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 25, 'Efek samping tindakan (mis. tindakan operasi bypass)');


-- INSERT sdki_gejala

-- D.0001 Bersihan Jalan Napas Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Mayor', 'Objektif', 1, 'Batuk tidak efektif atau tidak mampu batuk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Mayor', 'Objektif', 2, 'Sputum berlebih / obstruksi di jalan napas / mekonium di jalan napas (pada neonatus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Mayor', 'Objektif', 3, 'Mengi, wheezing dan/atau ronkhi kering'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Subjektif', 1, 'Dispnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Subjektif', 2, 'Sulit bicara'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Subjektif', 3, 'Ortopnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Objektif', 1, 'Gelisah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Objektif', 2, 'Sianosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Objektif', 3, 'Bunyi napas menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Objektif', 4, 'Frekuensi napas berubah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 'Minor', 'Objektif', 5, 'Pola napas berubah');

-- D.0002 Gangguan Penyapihan Ventilator
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 1, 'Frekuensi napas meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 2, 'Penggunaan otot bantu napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 3, 'Napas megap-megap (gasping)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 4, 'Upaya napas dan bantuan ventilator tidak sinkron'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 5, 'Napas dangkal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 6, 'Agitasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Mayor', 'Objektif', 7, 'Nilai gas darah arteri abnormal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Subjektif', 1, 'Lelah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Subjektif', 2, 'Kuatir mesin rusak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Subjektif', 3, 'Fokus meningkat pada pernapasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 1, 'Auskultasi suara inspirasi menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 2, 'Warna kulit abnormal (mis. pucat, sianosis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 3, 'Napas paradoks abdominal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 4, 'Diaforesis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 5, 'Ekspresi wajah takut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 6, 'Tekanan darah meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 7, 'Frekuensi nadi meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 8, 'Kesadaran menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 'Minor', 'Objektif', 9, 'Gelisah');

-- D.0003 Gangguan Pertukaran Gas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Subjektif', 1, 'Dispnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Objektif', 1, 'PCO2 meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Objektif', 2, 'PO2 menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Objektif', 3, 'Takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Objektif', 4, 'pH arteri meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Mayor', 'Objektif', 5, 'Bunyi napas tambahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Subjektif', 1, 'Pusing'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Subjektif', 2, 'Penglihatan kabur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 1, 'Sianosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 2, 'Diaforesis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 3, 'Gelisah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 4, 'Napas cuping hidung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 5, 'Pola napas abnormal (cepat/lambat, regular/ireguler, dalam/dangkal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 6, 'Warna kulit abnormal (mis. pucat, kebiruan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 'Minor', 'Objektif', 7, 'Kesadaran menurun');

-- D.0004 Gangguan Ventilasi Spontan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Subjektif', 1, 'Dispnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Objektif', 1, 'Penggunaan otot bantu napas meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Objektif', 2, 'Volume tidal menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Objektif', 3, 'PCO2 meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Objektif', 4, 'PO2 menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Mayor', 'Objektif', 5, 'SaO2 menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Minor', 'Objektif', 1, 'Gelisah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 'Minor', 'Objektif', 2, 'Takikardia');

-- D.0005 Pola Napas Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Mayor', 'Subjektif', 1, 'Dispnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Mayor', 'Objektif', 1, 'Penggunaan otot bantu pernapasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Mayor', 'Objektif', 2, 'Fase ekspirasi memanjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Mayor', 'Objektif', 3, 'Pola napas abnormal (mis. takipnea, bradipnea, hiperventilasi, kussmaul, cheyne-stokes)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Subjektif', 1, 'Ortopnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 1, 'Pernapasan pursed-lip'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 2, 'Pernapasan cuping hidung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 3, 'Diameter thoraks anterior-posterior meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 4, 'Ventilasi semenit menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 5, 'Kapasitas vital menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 6, 'Tekanan ekspirasi menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 7, 'Tekanan inspirasi menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 'Minor', 'Objektif', 8, 'Ekskursi dada berubah');

-- D.0007 Gangguan Sirkulasi Spontan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Mayor', 'Subjektif', 1, 'Tidak berespon'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Mayor', 'Objektif', 1, 'Frekuensi nadi <50 kali/menit atau >150 kali/menit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Mayor', 'Objektif', 2, 'Tekanan darah sistolik <60 mmHg atau >200 mmHg'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Mayor', 'Objektif', 3, 'Frekuensi napas <6 kali/menit atau >30 kali/menit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Mayor', 'Objektif', 4, 'Kesadaran menurun atau tidak sadar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 1, 'Suhu tubuh <34,5 °C'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 2, 'Tidak ada produksi urin dalam 6 jam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 3, 'Saturasi oksigen <85%'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 4, 'Gambaran EKG menunjukkan aritmia letal (mis. Ventricular Tachycardia [VT], Ventricular Fibrillation [VF], Asistol, Pulseless Electrical Activity [PEA])'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 5, 'Gambaran EKG menunjukkan aritmia mayor (mis. AV block derajat 2 tipe 2, AV block total, takiaritmia/bradiaritmia, Supraventricular Tachycardia [SVT], Ventricular Extrasystole [VES] simptomatik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 6, 'ETCO2 <35 mmHg');

-- D.0008 Penurunan Curah Jantung
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 1, '[Perubahan irama jantung] Palpitasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 2, '[Perubahan preload] Lelah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 3, '[Perubahan afterload] Dispnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 4, '[Perubahan kontraktilitas] Paroxysmal nocturnal dyspnea (PND)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 5, '[Perubahan kontraktilitas] Ortopnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Subjektif', 6, '[Perubahan kontraktilitas] Batuk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 1, '[Perubahan irama jantung] Bradikardia/takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 2, '[Perubahan irama jantung] Gambaran EKG aritmia atau gangguan konduksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 3, '[Perubahan preload] Edema'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 4, '[Perubahan preload] Distensi vena jugularis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 5, '[Perubahan preload] Central venous pressure (CVP) meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 6, '[Perubahan afterload] Tekanan darah meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 7, '[Perubahan afterload] Nadi perifer teraba lemah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 8, '[Perubahan afterload] Capillary refill time >3 detik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 9, '[Perubahan afterload] Oliguria'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 10, '[Perubahan afterload] Warna kulit pucat dan/atau sianosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 11, '[Perubahan kontraktilitas] Terdengar suara jantung S3 dan/atau S4'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Mayor', 'Objektif', 12, '[Perubahan kontraktilitas] Ejection fraction (EF) menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Subjektif', 1, '[Perilaku/emosional] Cemas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Subjektif', 2, '[Perilaku/emosional] Gelisah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 1, '[Perubahan preload] Murmur jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 2, '[Perubahan preload] Berat badan bertambah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 3, '[Perubahan preload] Pulmonary artery wedge pressure (PAWP) menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 4, '[Perubahan afterload] Pulmonary vascular resistance (PVR) meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 5, '[Perubahan afterload] Systemic vascular resistance (SVR) meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 6, '[Perubahan afterload] Hepatomegali'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 7, '[Perubahan kontraktilitas] Cardiac index (CI) menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 8, '[Perubahan kontraktilitas] Left ventricular stroke work index (LVSWI) menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 'Minor', 'Objektif', 9, '[Perubahan kontraktilitas] Stroke volume index (SVI) menurun');

-- D.0009 Perfusi Perifer Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Objektif', 1, 'Pengisian kapiler >3 detik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Objektif', 2, 'Nadi perifer menurun atau tidak teraba'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Objektif', 3, 'Akral teraba dingin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Objektif', 4, 'Warna kulit pucat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Mayor', 'Objektif', 5, 'Turgor kulit menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Subjektif', 1, 'Parastesia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Subjektif', 2, 'Nyeri ekstremitas (klaudikasi intermiten)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Objektif', 1, 'Edema'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Objektif', 2, 'Penyembuhan luka lambat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Objektif', 3, 'Indeks ankle-brachial <0,90'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 'Minor', 'Objektif', 4, 'Bruit femoralis');

-- D.0018 Berat Badan Lebih
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Mayor', 'Objektif', 1, 'IMT 25-27 kg/m2 (pada dewasa) atau berat dan panjang badan lebih dari presentil 95 (pada anak <2 tahun) atau IMT pada presentil ke 85-95 (pada anak 2-18 tahun)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 'Minor', 'Objektif', 1, 'Tebal lipatan kulit trisep >25 mm');

-- D.0019 Defisit Nutrisi
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Mayor', 'Objektif', 1, 'Berat badan menurun minimal 10% di bawah rentang ideal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Subjektif', 1, 'Cepat kenyang setelah makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Subjektif', 2, 'Kram/nyeri abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Subjektif', 3, 'Nafsu makan menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 1, 'Bising usus hiperaktif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 2, 'Otot pengunyah lemah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 3, 'Otot menelan lemah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 4, 'Membran mukosa pucat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 5, 'Sariawan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 6, 'Serum albumin turun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 7, 'Rambut rontok berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 'Minor', 'Objektif', 8, 'Diare');

-- D.0020 Diare
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Mayor', 'Objektif', 1, 'Defekasi lebih dari tiga kali dalam 24 jam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Mayor', 'Objektif', 2, 'Feses lembek atau cair'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Minor', 'Subjektif', 1, 'Urgency'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Minor', 'Subjektif', 2, 'Nyeri/kram abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Minor', 'Objektif', 1, 'Frekuensi peristaltik meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 'Minor', 'Objektif', 2, 'Bising usus hiperaktif');

-- D.0021 Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan flatus tidak ada'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Mayor', 'Subjektif', 2, 'Nyeri/kram abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Mayor', 'Objektif', 1, 'Suara peristaltik berubah (tidak ada, hipoaktif, atau hiperaktif)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Subjektif', 1, 'Merasa mual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 1, 'Residu lambung meningkat/menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 2, 'Muntah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 3, 'Regurgitasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 4, 'Pengosongan lambung cepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 5, 'Distensi abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 6, 'Diare'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 7, 'Feses kering dan sulit keluar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 'Minor', 'Objektif', 8, 'Feses keras');


-- INSERT sdki_kondisi_klinis

-- D.0001 Bersihan Jalan Napas Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 1, 'Gullian barre syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 2, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 3, 'Myasthenia gravis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 4, 'Prosedur diagnostik (mis. bronkoskopi, transesophageal echocardiography [TEE])'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 5, 'Depresi sistem saraf pusat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 6, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 7, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 8, 'Kuadriplegia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 9, 'Sindrom aspirasi mekonium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 10, 'Infeksi saluran napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), 11, 'Asma');

-- D.0002 Gangguan Penyapihan Ventilator
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 2, 'Coronary artery bypass graft (CABG)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 3, 'Gagal napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 4, 'Cardiac arrest'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 5, 'Transplantasi jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), 6, 'Displasia bronkopulmonal');

-- D.0003 Gangguan Pertukaran Gas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 1, 'Penyakit paru obstruktif kronis (PPOK)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 3, 'Asma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 4, 'Pneumonia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 5, 'Tuberkulosis paru'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 6, 'Penyakit membran hialin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 7, 'Asfiksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 8, 'Persistent pulmonary hypertension of newborn (PPHN)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 9, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), 10, 'Infeksi saluran napas');

-- D.0004 Gangguan Ventilasi Spontan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 1, 'Penyakit paru obstruktif kronis (PPOK)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 2, 'Asma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 3, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 4, 'Gagal napas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 5, 'Bedah jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 6, 'Adult respiratory distress syndrome (ARDS)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 7, 'Persistent pulmonary hypertension of newborn (PPHN)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 8, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), 9, 'Infeksi saluran napas');

-- D.0005 Pola Napas Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 1, 'Depresi sistem saraf pusat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 2, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 3, 'Trauma thoraks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 4, 'Gullian barre syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 5, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 6, 'Myasthenia gravis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 7, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 8, 'Kuadriplegia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), 9, 'Intoksikasi alkohol');

-- D.0006 Risiko Aspirasi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 2, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 3, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 4, 'Guillain barre syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 5, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 6, 'Keracunan obat dan alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 7, 'Pembesaran uterus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 8, 'Miestenia gravis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 9, 'Fistula trakeoesofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 10, 'Striktura esofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 11, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 12, 'Labiopalatoskizis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 13, 'Atresia esofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 14, 'Laringomalasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), 15, 'Prematuritas');

-- D.0007 Gangguan Sirkulasi Spontan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 1, 'Henti Jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 2, 'Bradikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 3, 'Takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 4, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 5, 'Gagal jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 6, 'Kardiomiopati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 7, 'Miokarditis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 8, 'Disritmia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 9, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 10, 'Perdarahan (mis. perdarahan gastrointestinal, ruptur aorta, perdarahan intrakranial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 11, 'Keracunan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 12, 'Overdosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 13, 'Tenggelam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 14, 'Emboli paru');

-- D.0008 Penurunan Curah Jantung
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 1, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 2, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 3, 'Stenosis mitral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 4, 'Regurgitasi mitral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 5, 'Stenosis aorta'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 6, 'Regurgitasi aorta'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 7, 'Stenosis trikuspidal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 8, 'Regurgitasi trikuspidal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 9, 'Stenosis pulmonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 10, 'Regurgitasi pulmonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 11, 'Aritmia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), 12, 'Penyakit jantung bawaan');

-- D.0009 Perfusi Perifer Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 1, 'Tromboflebitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 2, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 3, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 4, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 5, 'Kelainan jantung kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 6, 'Trombosis arteri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 7, 'Varises'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 8, 'Trombosis vena dalam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), 9, 'Sindrom kompartemen');

-- D.0010 Risiko Gangguan Sirkulasi Spontan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 1, 'Bradikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 2, 'Takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 3, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 4, 'Gagal jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 5, 'Kardiomiopati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 6, 'Miokarditis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 7, 'Disritmia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 8, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 9, 'Perdarahan (mis. perdarahan gastrointestinal, ruptur aorta, perdarahan intrakranial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 10, 'Keracunan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 11, 'Overdosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 12, 'Tenggelam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), 13, 'Emboli paru');

-- D.0011 Risiko Penurunan Curah Jantung
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 1, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 2, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 3, 'Gangguan katup jantung (stenosis/regurgitasi aorta, pulmonalis, trikuspidalis, atau mitralis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 4, 'Atrial/ventricular septal defect'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), 5, 'Aritmia');

-- D.0012 Risiko Perdarahan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 1, 'Aneurisma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 2, 'Koagulopati intravaskuler diseminata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 3, 'Sirosis hepatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 4, 'Ulkus lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 5, 'Varises'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 6, 'Trombositopenia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 7, 'Ketuban pecah sebelum waktunya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 8, 'Plasenta previa/abrupsio'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 9, 'Atonia uterus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 10, 'Retensi plasenta'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 11, 'Tindakan pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 12, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), 13, 'Trauma');

-- D.0013 Risiko Perfusi Gastrointestinal Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 1, 'Varises gastroesofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 2, 'Aneurisma aorta abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 3, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 4, 'Sirosis hepatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 5, 'Perdarahan gastrointestinal akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 6, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 7, 'Koagulasi intravaskuler diseminata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 8, 'Ulkus duodenum atau ulkus lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 9, 'Kolitis iskemik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 10, 'Pankreatitis iskemik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 11, 'Ginjal polikistik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 12, 'Stenosis arteri ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 13, 'Gagal ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 14, 'Sindroma kompartemen abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 15, 'Trauma abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 16, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), 17, 'Pembedahan jantung');

-- D.0014 Risiko Perfusi Miokard Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 1, 'Bedah jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 2, 'Tamponade jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 3, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 4, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), 5, 'Hipertensi');

-- D.0015 Risiko Perfusi Perifer Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 1, 'Arterosklerosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 2, 'Raynaud\'s disease'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 3, 'Trombosis arteri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 4, 'Atritis reumatoid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 5, 'Leriche\'s syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 6, 'Aneurisma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 7, 'Buerger\'s disease'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 8, 'Varises'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 9, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 10, 'Hipotensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), 11, 'Kanker');

-- D.0016 Risiko Perfusi Renal Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 1, 'Diabetes mellitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 2, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 3, 'Aterosklerosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 4, 'Syok'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 5, 'Keganasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 6, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 7, 'Pembedahan jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 8, 'Penyakit ginjal (mis. ginjal polikistik, stenosis artesi ginjal, gagal ginjal, glumerulonefritis, nefritis intersisial, nekrosis kortikal bilateral, polinefritis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), 9, 'Trauma');

-- D.0017 Risiko Perfusi Serebral Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 2, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 3, 'Aterosklerotik aortik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 4, 'Infark miokard akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 5, 'Diseksi arteri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 6, 'Embolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 7, 'Endokarditis infektif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 8, 'Fibrilasi atrium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 9, 'Hiperkolesterolemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 10, 'Hipertensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 11, 'Dilatasi kardiomiopati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 12, 'Koagulasi intravaskular diseminata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 13, 'Miksoma atrium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 14, 'Neoplasma otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 15, 'Segmen ventrikel kiri akinetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 16, 'Sindrom sick sinus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 17, 'Stenosis karotid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 18, 'Stenosis mitral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 19, 'Hidrosefalus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), 20, 'Infeksi otak (mis. meningitis, ensefalitis, abses serebri)');

-- D.0018 Berat Badan Lebih
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 1, 'Gangguan genetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 2, 'Faktor keturunan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 3, 'Hipotiroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), 4, 'Diabetes melitus maternal');

-- D.0019 Defisit Nutrisi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 2, 'Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 3, 'Mobius syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 4, 'Cerebral palsy'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 5, 'Cleft lip'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 6, 'Cleft palate'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 7, 'Amyotropic lateral sclerosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 8, 'Kerusakan neuromuskular'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 9, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 10, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 11, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 12, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 13, 'Penyakit Crohn\'s'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 14, 'Enterokolitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), 15, 'Fibrosis kistik');

-- D.0020 Diare
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 1, 'Kanker kolon'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 2, 'Diverticulitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 3, 'Iritasi usus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 4, 'Crohn\'s disease'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 5, 'Ulkus peptikum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 6, 'Gastritis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 7, 'Spasme kolon'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 8, 'Kolitis ulseratif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 9, 'Hipertiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 10, 'Demam typoid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 11, 'Malaria'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 12, 'Sigelosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 13, 'Kolera'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 14, 'Disentri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), 15, 'Hepatitis');

-- D.0021 Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 1, 'Pembedahan abdomen atau usus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 2, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 3, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 4, 'Kanker empedu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 5, 'Kolesistektomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 6, 'Infeksi pencernaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 7, 'Gastroesophageal reflux disease (GERD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 8, 'Dialisis peritoneal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 9, 'Terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'), 10, 'Multiple organ dysfunction syndrome');


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0022', 'Hipervolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Peningkatan volume cairan intravaskuler, interstisiel, dan/atau intraseluler.'),
('D.0023', 'Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Penurunan volume cairan intravaskuler, interstisiel, dan/atau intraseluler.'),
('D.0024', 'Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Kulit dan membran mukosa neonatus menguning setelah 24 jam kelahiran akibat bilirubin tidak terkonjugasi masuk ke dalam sirkulasi.'),
('D.0025', 'Kesiapan Peningkatan Keseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pola ekuilibrium antara volume cairan dan komposisi kimia cairan tubuh yang cukup untuk memenuhi kebutuhan fisik dan dapat ditingkatkan.'),
('D.0026', 'Kesiapan Peningkatan Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pola asupan nutrisi yang cukup untuk memenuhi kebutuhan metabolisme dan dapat ditingkatkan.'),
('D.0027', 'Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Variasi kadar glukosa darah naik/turun dari rentang normal.'),
('D.0028', 'Menyusui Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan', 'Pemberian ASI secara langsung dari payudara kepada bayi dan anak yang dapat memenuhi kebutuhan nutrisi.'),
('D.0029', 'Menyusui Tidak Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Kondisi dimana ibu dan bayi mengalami ketidakpuasan atau kesukaran pada proses menyusui.'),
('D.0030', 'Obesitas', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin, serta melampaui kondisi berat badan lebih (overweight).'),
('D.0031', 'Risiko Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin.'),
('D.0032', 'Risiko Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme.'),
('D.0033', 'Risiko Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Risiko peningkatan, penurunan atau tidak efektifnya aktivitas peristaltik pada sistem gastrointestinal.'),
('D.0034', 'Risiko Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami penurunan volume cairan intravaskuler, interstisiel, dan/atau intraseluler.'),
('D.0035', 'Risiko Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami kulit dan membran mukosa neonatus menguning setelah 24 jam kelahiran akibat bilirubin tak terkonjugasi masuk ke dalam sirkulasi.'),
('D.0036', 'Risiko Ketidakseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami penurunan, peningkatan atau percepatan perpindahan cairan dari intravaskuler, interstisial atau intraselular.'),
('D.0037', 'Risiko Ketidakseimbangan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami perubahan kadar serum elektrolit.'),
('D.0038', 'Risiko Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Risiko terhadap variasi kadar glukosa darah dari rentang normal.'),
('D.0039', 'Risiko Syok', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko', 'Berisiko mengalami ketidakcukupan aliran darah ke jaringan tubuh, yang dapat mengakibatkan disfungsi seluler yang mengancam jiwa.'),
('D.0040', 'Gangguan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Aktual', 'Disfungsi eliminasi urin.'),
('D.0041', 'Inkontinensia Fekal', 'Fisiologis', 'Eliminasi', 'Aktual', 'Perubahan kebiasaan buang air besar dari pola normal yang ditandai dengan pengeluaran feses secara involunter (tidak disadari).'),
('D.0042', 'Inkontinensia Urin Berlanjut', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin tidak terkendali dan terus menerus tanpa distensi atau perasaan penuh pada kandung kemih.'),
('D.0043', 'Inkontinensia Urin Berlebih', 'Fisiologis', 'Eliminasi', 'Aktual', 'Kehilangan urin yang tidak terkendali akibat overdistensi kandung kemih.'),
('D.0044', 'Inkontinensia Urin Fungsional', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin tidak terkendali karena kesulitan dan tidak mampu mencapai toilet pada waktu yang tepat.'),
('D.0045', 'Inkontinensia Urin Refleks', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengeluaran urin yang tidak terkendali pada saat volume kandung kemih tertentu tercapai.'),
('D.0046', 'Inkontinensia Urin Stres', 'Fisiologis', 'Eliminasi', 'Aktual', 'Kebocoran urin mendadak dan tidak dapat dikendalikan karena aktivitas yang meningkatkan tekanan intraabdominal.'),
('D.0047', 'Inkontinensia Urin Urgensi', 'Fisiologis', 'Eliminasi', 'Aktual', 'Keluarnya urin tidak terkendali sesaat setelah keinginan yang kuat untuk berkemih (kebelet).');


-- INSERT sdki_penyebab

-- D.0022 Hipervolemia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Umum', 1, 'Gangguan mekanisme regulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Umum', 2, 'Kelebihan asupan cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Umum', 3, 'Kelebihan asupan natrium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Umum', 4, 'Gangguan aliran balik vena'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Umum', 5, 'Efek agen farmakologis (mis. kortikosteroid, chlorpropamide, tolbutamide, vincristine, tryptilinescarbamazepine)');

-- D.0023 Hipovolemia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Umum', 1, 'Kehilangan cairan aktif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Umum', 2, 'Kegagalan mekanisme regulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Umum', 3, 'Peningkatan permeabilitas kapiler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Umum', 4, 'Kekurangan intake cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Umum', 5, 'Evaporasi');

-- D.0024 Ikterik Neonatus
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Umum', 1, 'Penurunan berat badan abnormal (>7-8% pada bayi baru lahir yang menyusu ASI, >15% pada bayi cukup bulan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Umum', 2, 'Pola makan tidak ditetapkan dengan baik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Umum', 3, 'Kesulitan transisi ke kehidupan ekstra uterin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Umum', 4, 'Usia kurang dari 7 hari'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Umum', 5, 'Keterlambatan pengeluaran feses (mekonium)');

-- D.0025 Kesiapan Peningkatan Keseimbangan Cairan - tidak ada penyebab (promosi kesehatan)

-- D.0026 Kesiapan Peningkatan Nutrisi - tidak ada penyebab (promosi kesehatan)

-- D.0027 Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 1, '[Hiperglikemia] Disfungsi pankreas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 2, '[Hiperglikemia] Resistensi insulin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 3, '[Hiperglikemia] Gangguan toleransi glukosa darah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 4, '[Hiperglikemia] Gangguan glukosa darah puasa'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 5, '[Hipoglikemia] Penggunaan insulin atau obat glikemik oral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 6, '[Hipoglikemia] Hiperinsulinemia (mis. insulinoma)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 7, '[Hipoglikemia] Endokrinopati (mis. kerusakan adrenal atau pituitari)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 8, '[Hipoglikemia] Disfungsi hati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 9, '[Hipoglikemia] Disfungsi ginjal kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 10, '[Hipoglikemia] Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 11, '[Hipoglikemia] Tindakan pembedahan neoplasma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Umum', 12, '[Hipoglikemia] Gangguan metabolik bawaan (mis. gangguan penyimpanan lisosomal, galaktosemia, gangguan penyimpanan glikogen)');

-- D.0028 Menyusui Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 1, 'Hormon oksitosin dan prolaktin adekuat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 2, 'Payudara membesar, alveoli mulai terisi ASI'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 3, 'Tidak ada kelainan pada struktur payudara'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 4, 'Puting menonjol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 5, 'Bayi aterm'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Fisiologis', 6, 'Tidak ada kelainan bentuk pada mulut bayi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Situasional', 1, 'Rawat gabung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Situasional', 2, 'Dukungan keluarga dan tenaga kesehatan adekuat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Situasional', 3, 'Faktor budaya');

-- D.0029 Menyusui Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 1, 'Ketidakadekuatan suplai ASI'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 2, 'Hambatan pada neonatus (mis. prematuritas, sumbing)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 3, 'Anomali payudara ibu (mis. puting yang masuk ke dalam)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 4, 'Ketidakadekuatan refleks oksitosin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 5, 'Ketidakadekuatan refleks menghisap bayi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 6, 'Payudara bengkak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 7, 'Riwayat operasi payudara'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Fisiologis', 8, 'Kelahiran kembar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 1, 'Tidak rawat gabung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 2, 'Kurang terpapar informasi tentang pentingnya menyusui dan/atau metode menyusui'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 3, 'Kurangnya dukungan keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Situasional', 4, 'Faktor budaya');

-- D.0030 Obesitas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 2, 'Kelebihan konsumsi gula'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 4, 'Gangguan persepsi makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 5, 'Kelebihan konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 6, 'Penggunaan energi kurang dari asupan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 7, 'Sering mengemil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 8, 'Sering memakan makanan berminyak/berlemak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 9, 'Faktor keturunan (mis. distribusi jaringan adiposa, pengeluaran energi, aktivitas lipase lipoprotein, sintesis lipid, lipolisis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 10, 'Penggunaan makanan formula atau makanan campuran pada bayi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 11, 'Asupan kalsium rendah pada anak-anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 12, 'Berat badan bertambah cepat (selama masa anak-anak, selama masa bayi, termasuk minggu pertama, 4 bulan pertama, dan tahun pertama)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Umum', 13, 'Makanan padat sebagai sumber makanan utama pada usia <5 bulan');

-- D.0040 Gangguan Eliminasi Urin
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 1, 'Penurunan kapasitas kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 2, 'Iritasi kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 3, 'Penurunan kemampuan menyadari tanda-tanda gangguan kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 4, 'Efek tindakan medis dan diagnostik (mis. operasi ginjal, operasi saluran kemih, anestesi, dan obat-obatan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 5, 'Kelemahan otot pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 6, 'Ketidakmampuan mengakses toilet (mis. imobilisasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 7, 'Hambatan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 8, 'Ketidakmampuan mengkomunikasikan kebutuhan eliminasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 9, 'Outlet kandung kemih tidak lengkap (mis. anomali saluran kemih kongenital)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Umum', 10, 'Imaturitas (pada anak usia < 3 tahun)');

-- D.0041 Inkontinensia Fekal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 1, 'Kerusakan susunan saraf motorik bawah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 2, 'Penurunan tonus otot'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 3, 'Gangguan kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 4, 'Penyalahgunaan laksatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 5, 'Kehilangan fungsi pengendalian sfingter rektum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 6, 'Pascaoperasi pullthrough dan penutupan kolosomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 7, 'Ketidakmampuan mencapai kamar kecil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 8, 'Diare kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Umum', 9, 'Stres berlebihan');

-- D.0042 Inkontinensia Urin Berlanjut
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 1, 'Neuropati arkus refleks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 2, 'Disfungsi neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 3, 'Kerusakan refleks kontraksi detrusor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 4, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 5, 'Kerusakan medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Umum', 6, 'Kelainan anatomis (mis. fistula)');

-- D.0043 Inkontinensia Urin Berlebih
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Umum', 1, 'Blok sfingter'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Umum', 2, 'Kerusakan atau ketidakadekuatan jalur aferen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Umum', 3, 'Obstruksi jalan keluar urin (mis. impaksi fekal, efek agen farmakologis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Umum', 4, 'Ketidakadekuatan detrusor (mis. pada kondisi stres atau tidak nyaman, deconditioned voiding)');

-- D.0044 Inkontinensia Urin Fungsional
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 1, 'Ketidakmampuan atau penurunan mengenali tanda-tanda berkemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 2, 'Penurunan tonus kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 3, 'Hambatan mobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 4, 'Faktor psikologis: penurunan perhatian pada tanda-tanda keinginan berkemih (depresi, bingung, delirium)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 5, 'Hambatan lingkungan (toilet jauh, tempat tidur terlalu tinggi, lingkungan baru)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 6, 'Kehilangan sensorik dan motorik (pada geriatri)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Umum', 7, 'Gangguan penglihatan');

-- D.0045 Inkontinensia Urin Refleks
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Umum', 1, 'Kerusakan konduksi impuls di atas arkus refleks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Umum', 2, 'Kerusakan jaringan (mis. terapi radiasi)');

-- D.0046 Inkontinensia Urin Stres
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Umum', 1, 'Kelemahan intrinsik sfinkter uretra'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Umum', 2, 'Perubahan degenerasi/non degenerasi otot pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Umum', 3, 'Kekurangan estrogen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Umum', 4, 'Peningkatan tekanan intraabdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Umum', 5, 'Kelemahan otot pelvis');

-- D.0047 Inkontinensia Urin Urgensi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Umum', 1, 'Iritasi reseptor kontraksi kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Umum', 2, 'Penurunan kapasitas kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Umum', 3, 'Hiperaktivitas detrusor dengan kerusakan kontraktilitas kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Umum', 4, 'Efek agen farmakologis (mis. diuretik)');


-- INSERT sdki_faktor_risiko

-- D.0031 Risiko Berat Badan Lebih
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 1, 'Kurang aktivitas fisik harian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 2, 'Kelebihan konsumsi gula'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 3, 'Gangguan kebiasaan makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 4, 'Gangguan persepsi makan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 5, 'Kelebihan konsumsi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 6, 'Penggunaan energi kurang dari asupan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 7, 'Sering mengemil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 8, 'Sering memakan makanan berminyak/berlemak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 9, 'Faktor keturunan (mis. distribusi jaringan adiposa, pengeluaran energi, aktivitas lipase lipoprotein, sintesis lipid, lipolisis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 10, 'Penggunaan makanan formula atau makanan campuran pada bayi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 11, 'Asupan kalsium rendah pada anak-anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 12, 'Berat badan bertambah cepat (selama masa anak-anak, selama masa bayi, termasuk minggu pertama, 4 bulan pertama, dan tahun pertama)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 13, 'Makanan padat sebagai sumber makanan utama pada usia <5 bulan');

-- D.0032 Risiko Defisit Nutrisi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 1, 'Ketidakmampuan menelan makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 2, 'Ketidakmampuan mencerna makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 3, 'Ketidakmampuan mengabsorbsi nutrien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 4, 'Peningkatan kebutuhan metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 5, 'Faktor ekonomi (mis. finansial tidak mencukupi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 6, 'Faktor psikologis (mis. stres, keengganan untuk makan)');

-- D.0033 Risiko Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 1, 'Pembedahan abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 2, 'Penurunan sirkulasi gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 3, 'Intoleransi makanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 4, 'Refluks gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 5, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 6, 'Imobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 7, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 8, 'Infeksi gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 9, 'Efek agen farmakologis (mis. antibiotik, laksatif, narkotika/opiat)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 10, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 11, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 12, 'Stres'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 13, 'Kurangnya sanitasi pada persiapan makanan');

-- D.0034 Risiko Hipovolemia
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 1, 'Kehilangan cairan secara aktif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 2, 'Gangguan absorbsi cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 3, 'Usia lanjut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 4, 'Kelebihan berat badan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 5, 'Status hipermetabolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 6, 'Kegagalan mekanisme regulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 7, 'Evaporasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 8, 'Kekurangan intake cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 9, 'Efek agen farmakologis');

-- D.0035 Risiko Ikterik Neonatus
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 1, 'Penurunan berat badan abnormal >7-8% pada bayi baru lahir yang menyusu ASI, >15% pada bayi cukup bulan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 2, 'Pola makan tidak ditetapkan dengan baik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 3, 'Kesulitan transisi ke kehidupan ekstra uterin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 4, 'Usia kurang dari 7 hari'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 5, 'Keterlambatan pengeluaran feses (mekonium)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 6, 'Prematuritas (<37 minggu)');

-- D.0036 Risiko Ketidakseimbangan Cairan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 1, 'Prosedur pembedahan mayor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 2, 'Trauma/perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 3, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 4, 'Aferesis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 5, 'Asites'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 6, 'Obstruksi intestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 7, 'Peradangan pankreas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 8, 'Penyakit ginjal dan kelenjar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 9, 'Disfungsi intestinal');

-- D.0037 Risiko Ketidakseimbangan Elektrolit
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 1, 'Ketidakseimbangan cairan (mis. dehidrasi dan intoksikasi air)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 2, 'Kelebihan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 3, 'Gangguan mekanisme regulasi (mis. diabetes)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 4, 'Efek samping prosedur (mis. pembedahan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 5, 'Diare'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 6, 'Muntah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 7, 'Disfungsi ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 8, 'Disfungsi regulasi endokrin');

-- D.0038 Risiko Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 1, 'Kurang terpapar informasi tentang manajemen diabetes'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 2, 'Ketidaktepatan pemantauan glukosa darah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 3, 'Kurang patuh pada rencana manajemen diabetes'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 4, 'Manajemen medikasi tidak terkontrol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 5, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 6, 'Periode pertumbuhan cepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 7, 'Stres berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 8, 'Penambahan berat badan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 9, 'Kurang dapat menerima diagnosis');

-- D.0039 Risiko Syok
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 1, 'Hipoksemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 2, 'Hipoksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 3, 'Hipotensi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 4, 'Kekurangan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 5, 'Sepsis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 6, 'Sindrom respons inflamasi sistemik (systemic inflammatory response syndrome [SIRS])');


-- INSERT sdki_gejala

-- D.0022 Hipervolemia
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Subjektif', 1, 'Ortopnea', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Subjektif', 2, 'Dispnea', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Subjektif', 3, 'Paroxysmal nocturnal dyspnea (PND)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Objektif', 1, 'Edema anasarka dan/atau edema perifer', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Objektif', 2, 'Berat badan meningkat dalam waktu singkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Objektif', 3, 'Jugular Venous Pressure (JVP) dan/atau Central Venous Pressure (CVP) meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Mayor', 'Objektif', 4, 'Refleks hepatojugular positif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 1, 'Distensi vena jugularis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 2, 'Terdengar suara napas tambahan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 3, 'Hepatomegali', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 4, 'Kadar Hb/Ht turun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 5, 'Oliguria', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 6, 'Intake lebih banyak dari output (balans cairan positif)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 'Minor', 'Objektif', 7, 'Kongesti paru', 1);

-- D.0023 Hipovolemia
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 1, 'Frekuensi nadi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 2, 'Nadi teraba lemah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 3, 'Tekanan darah menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 4, 'Tekanan nadi menyempit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 5, 'Turgor kulit menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 6, 'Membran mukosa kering', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 7, 'Volume urin menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Mayor', 'Objektif', 8, 'Hematokrit meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Subjektif', 1, 'Merasa lemah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Subjektif', 2, 'Mengeluh haus', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Objektif', 1, 'Pengisian vena menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Objektif', 2, 'Status mental berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Objektif', 3, 'Suhu tubuh meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Objektif', 4, 'Konsentrasi urin meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 'Minor', 'Objektif', 5, 'Berat badan turun tiba-tiba', 1);

-- D.0024 Ikterik Neonatus
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Mayor', 'Objektif', 1, 'Profil darah abnormal (hemolisis, bilirubin serum total >2mg/dL, bilirubin serum total pada rentang risiko tinggi menurut usia)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Mayor', 'Objektif', 2, 'Membran mukosa kuning', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Mayor', 'Objektif', 3, 'Kulit kuning', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Mayor', 'Objektif', 4, 'Sklera kuning', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0025 Kesiapan Peningkatan Keseimbangan Cairan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan keseimbangan cairan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Mayor', 'Objektif', 1, 'Membran mukosa lembab', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Mayor', 'Objektif', 2, 'Asupan makanan dan cairan adekuat untuk kebutuhan harian', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Mayor', 'Objektif', 3, 'Turgor jaringan baik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Mayor', 'Objektif', 4, 'Tidak ada tanda edema atau dehidrasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Minor', 'Objektif', 1, 'Urin berwarna kuning bening dengan berat jenis dalam rentang normal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Minor', 'Objektif', 2, 'Haluaran urin sesuai dengan asupan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 'Minor', 'Objektif', 3, 'Berat badan stabil', 1);

-- D.0026 Kesiapan Peningkatan Nutrisi
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan nutrisi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Mayor', 'Objektif', 1, 'Makan teratur dan adekuat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Minor', 'Subjektif', 1, 'Mengekspresikan pengetahuan tentang pilihan makanan dan cairan yang sehat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Minor', 'Subjektif', 2, 'Mengikuti standar asupan nutrisi yang tepat (mis. piramida makanan, pedoman American Diabetic Association atau pedoman lainnya)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Minor', 'Objektif', 1, 'Penyiapan dan penyimpanan makanan dan minuman yang aman', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 'Minor', 'Objektif', 2, 'Sikap terhadap makanan dan minuman sesuai dengan tujuan kesehatan', 1);

-- D.0027 Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Subjektif', 1, '[Hipoglikemia] Mengantuk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Subjektif', 2, '[Hipoglikemia] Pusing', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Subjektif', 3, '[Hiperglikemia] Lelah atau lesu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Objektif', 1, '[Hipoglikemia] Gangguan koordinasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Objektif', 2, '[Hipoglikemia] Kadar glukosa dalam darah/urin rendah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Mayor', 'Objektif', 3, '[Hiperglikemia] Kadar glukosa dalam darah/urin tinggi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Subjektif', 1, '[Hipoglikemia] Palpitasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Subjektif', 2, '[Hipoglikemia] Mengeluh lapar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Subjektif', 3, '[Hiperglikemia] Mulut kering', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Subjektif', 4, '[Hiperglikemia] Haus meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 1, '[Hipoglikemia] Gemetar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 2, '[Hipoglikemia] Kesadaran menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 3, '[Hipoglikemia] Perilaku aneh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 4, '[Hipoglikemia] Sulit bicara', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 5, '[Hipoglikemia] Berkeringat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 'Minor', 'Objektif', 6, '[Hiperglikemia] Jumlah urin meningkat', 1);

-- D.0028 Menyusui Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Subjektif', 1, 'Ibu merasa percaya diri selama proses menyusui', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 1, 'Bayi melekat pada payudara ibu dengan benar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 2, 'Ibu mampu memposisikan bayi dengan benar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 3, 'Miksi bayi lebih dari 8 kali dalam 24 jam', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 4, 'Berat badan bayi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 5, 'ASI menetes/memancar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 6, 'Suplai ASI adekuat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Mayor', 'Objektif', 7, 'Puting tidak lecet setelah minggu kedua', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Minor', 'Objektif', 1, 'Bayi tidur setelah menyusui', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Minor', 'Objektif', 2, 'Payudara ibu kosong setelah menyusui', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 'Minor', 'Objektif', 3, 'Bayi tidak rewel dan menangis setelah menyusui', 1);

-- D.0029 Menyusui Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Subjektif', 1, 'Kelelahan maternal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Subjektif', 2, 'Kecemasan maternal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Objektif', 1, 'Bayi tidak mampu melekat pada payudara ibu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Objektif', 2, 'ASI tidak menetes/memancar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Objektif', 3, 'BAK bayi kurang dari 8 kali dalam 24 jam', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Mayor', 'Objektif', 4, 'Nyeri dan/atau lecet terus menerus setelah minggu kedua', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Objektif', 1, 'Intake bayi tidak adekuat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Objektif', 2, 'Bayi menghisap tidak terus menerus', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Objektif', 3, 'Bayi menangis saat disusui', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Objektif', 4, 'Bayi rewel dan menangis terus dalam jam-jam pertama setelah menyusui', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 'Minor', 'Objektif', 5, 'Menolak untuk menghisap', 1);

-- D.0030 Obesitas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Mayor', 'Objektif', 1, 'IMT >27 kg/m² (pada dewasa) atau lebih dari presentil ke 95 untuk usia dan jenis kelamin (pada anak)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 'Minor', 'Objektif', 1, 'Tebal lipatan kulit trisep >25 mm', 1);

-- D.0040 Gangguan Eliminasi Urin
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 1, 'Desakan berkemih (Urgensi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 2, 'Urin menetes (dribbling)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 3, 'Sering buang air kecil', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 4, 'Nokturia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 5, 'Mengompol', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Subjektif', 6, 'Enuresis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Objektif', 1, 'Distensi kandung kemih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Objektif', 2, 'Berkemih tidak tuntas (hesitancy)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Mayor', 'Objektif', 3, 'Volume residu urin meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0041 Inkontinensia Fekal
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Mayor', 'Subjektif', 1, 'Tidak mampu mengontrol pengeluaran feses', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Mayor', 'Subjektif', 2, 'Tidak mampu menunda defekasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Mayor', 'Objektif', 1, 'Feses keluar sedikit-sedikit dan sering', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Minor', 'Objektif', 1, 'Bau feses', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 'Minor', 'Objektif', 2, 'Kulit perianal kemerahan', 1);

-- D.0042 Inkontinensia Urin Berlanjut
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Mayor', 'Subjektif', 1, 'Keluarnya urin konstan tanpa distensi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Mayor', 'Subjektif', 2, 'Nokturia lebih dari 2 kali sepanjang tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Minor', 'Subjektif', 1, 'Berkemih tanpa sadar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Minor', 'Subjektif', 2, 'Tidak sadar inkontinensia urin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0043 Inkontinensia Urin Berlebih
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Mayor', 'Subjektif', 1, 'Residu volume urin setelah berkemih atau keluhan kebocoran sedikit urin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Mayor', 'Subjektif', 2, 'Nokturia atau kandung kemih distensi dengan sering, sedikit berkemih atau dribbling', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Mayor', 'Objektif', 1, 'Kandung kemih distensi (bukan berhubungan dengan penyebab reversibel akut)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 'Minor', 'Objektif', 1, 'Residu urin 100 ml atau lebih', 1);

-- D.0044 Inkontinensia Urin Fungsional
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Mayor', 'Subjektif', 1, 'Mengompol sebelum mencapai atau selama usaha mencapai toilet', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Minor', 'Subjektif', 1, 'Mengompol di waktu pagi hari', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Minor', 'Subjektif', 2, 'Mampu mengosongkan kandung kemih lengkap', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0045 Inkontinensia Urin Refleks
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 1, 'Tidak mengalami sensasi berkemih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 2, 'Dribbling', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 3, 'Sering buang air kecil', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 4, 'Hesitancy', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 5, 'Nokturia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Subjektif', 6, 'Enuresis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Mayor', 'Objektif', 1, 'Volume residu urin meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0046 Inkontinensia Urin Stres
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Mayor', 'Subjektif', 1, 'Mengeluh keluar urin <50 ml saat tekanan abdominal meningkat (mis. saat berdiri, bersin, tertawa, berlari atau mengangkat benda berat)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Minor', 'Subjektif', 1, 'Pengeluaran urin tidak tuntas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Minor', 'Subjektif', 2, 'Urgensi miksi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Minor', 'Subjektif', 3, 'Frekuensi berkemih meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 'Minor', 'Objektif', 1, 'Overdistensi abdomen', 1);

-- D.0047 Inkontinensia Urin Urgensi
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Mayor', 'Subjektif', 1, 'Keinginan berkemih yang kuat disertai dengan inkontinensia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);


-- INSERT sdki_kondisi_klinis

-- D.0022 Hipervolemia
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 1, 'Penyakit ginjal: gagal ginjal akut/kronis, sindrom nefrotik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 2, 'Hipoalbuminemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 3, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 4, 'Kelainan hormon'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 5, 'Penyakit hati (mis. sirosis, asites, kanker hati)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 6, 'Penyakit vena perifer (mis. varises vena, trombus vena, plebitis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'), 7, 'Imobilitas');

-- D.0023 Hipovolemia
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 1, 'Penyakit Addison'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 2, 'Trauma / perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 3, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 4, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 5, 'Penyakit Crohn'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 6, 'Muntah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 7, 'Diare'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 8, 'Kolitis ulseratif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'), 9, 'Hipoalbuminemia');

-- D.0024 Ikterik Neonatus
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 1, 'Neonatus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'), 2, 'Bayi prematur');

-- D.0025 Kesiapan Peningkatan Keseimbangan Cairan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 1, 'Gagal jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 2, 'Sindrom iritasi usus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 3, 'Penyakit Addison'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'), 4, 'Makanan enteral atau parenteral');

-- D.0026 Kesiapan Peningkatan Nutrisi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'), 1, 'Perilaku upaya peningkatan kesehatan');

-- D.0027 Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 1, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 2, 'Ketoasidosis diabetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 3, 'Hipoglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 4, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 5, 'Diabetes gestasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 6, 'Penggunaan kortikosteroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'), 7, 'Nutrisi parenteral total (TPN)');

-- D.0028 Menyusui Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 1, 'Status kesehatan ibu baik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'), 2, 'Status kesehatan bayi baik');

-- D.0029 Menyusui Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 1, 'Abses payudara'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 2, 'Mastitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'), 3, 'Carpal tunnel syndrome');

-- D.0030 Obesitas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 1, 'Gangguan genetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 2, 'Faktor keturunan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 3, 'Hipotiroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'), 4, 'Diabetes melitus maternal');

-- D.0031 Risiko Berat Badan Lebih
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 1, 'Gangguan genetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 2, 'Hipotiroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 3, 'Diabetes melitus gestasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'), 4, 'Pola hidup kurang aktivitas');

-- D.0032 Risiko Defisit Nutrisi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 2, 'Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 3, 'Mobius syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 4, 'Cerebral palsy'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 5, 'Cleft lip'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 6, 'Cleft palate'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 7, 'Amyotropic lateral sclerosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 8, 'Kerusakan neuromuskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 9, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 10, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 11, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 12, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 13, 'Penyakit Crohn\'s'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 14, 'Enterokolitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'), 15, 'Fibrosis kistik');

-- D.0033 Risiko Disfungsi Motilitas Gastrointestinal
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 1, 'Pembedahan abdomen atau usus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 2, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 3, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 4, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 5, 'Kanker empedu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 6, 'Kolesistektomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 7, 'Infeksi pencernaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 8, 'Gastroesophageal Reflux Disease (GERD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 9, 'Dialisis peritoneal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 10, 'Terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'), 11, 'Multiple organ dysfunction syndrome');

-- D.0034 Risiko Hipovolemia
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 1, 'Penyakit Addison'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 2, 'Trauma/perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 3, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 4, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 5, 'Penyakit Crohn'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 6, 'Muntah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 7, 'Diare'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'), 8, 'Kolitis ulseratif');

-- D.0035 Risiko Ikterik Neonatus
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 1, 'Neonatus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'), 2, 'Bayi prematur');

-- D.0036 Risiko Ketidakseimbangan Cairan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 1, 'Prosedur pembedahan mayor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 2, 'Penyakit ginjal dan kelenjar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 3, 'Perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'), 4, 'Luka bakar');

-- D.0037 Risiko Ketidakseimbangan Elektrolit
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 1, 'Gagal ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 2, 'Anoreksia nervosa'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 3, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 4, 'Penyakit Chron'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 5, 'Gastroenteritis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 6, 'Pankreatitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 7, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 8, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 9, 'Trauma multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 10, 'Luka bakar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'), 11, 'Anemia sel sabit');

-- D.0038 Risiko Ketidakstabilan Kadar Glukosa Darah
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 1, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 2, 'Ketoasidosis diabetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 3, 'Hipoglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 4, 'Diabetes gestasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 5, 'Penggunaan kortikosteroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'), 6, 'Nutrisi parenteral total (TPN)');

-- D.0039 Risiko Syok
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 1, 'Perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 2, 'Trauma multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 3, 'Pneumothoraks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 4, 'Infark miokard'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 5, 'Kardiomiopati'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 6, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 7, 'Anafilaksis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 8, 'Sepsis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 9, 'Koagulasi intravaskuler diseminata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0039'), 10, 'Sindrom respons inflamasi sistemik (systemic inflammatory response syndrome [SIRS])');

-- D.0040 Gangguan Eliminasi Urin
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 1, 'Infeksi ginjal dan saluran kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 2, 'Hiperglikemi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 3, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 4, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 5, 'Cedera/tumor/infeksi medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 6, 'Neuropati diabetikum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 7, 'Neuropati alkoholik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 8, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 9, 'Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 10, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'), 11, 'Obat alpha adrenergik');

-- D.0041 Inkontinensia Fekal
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 1, 'Spina bifida'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 2, 'Atresia ani'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'), 3, 'Penyakit Hirschsprung');

-- D.0042 Inkontinensia Urin Berlanjut
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 2, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 3, 'Tumor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 4, 'Infeksi medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'), 5, 'Fistula saluran kemih');

-- D.0043 Inkontinensia Urin Berlebih
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 1, 'Asma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 2, 'Alergi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 3, 'Penyakit neurologi: cedera/tumor/infeksi medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 4, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 5, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 6, 'Dimielinisasi saraf'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 7, 'Neuropati diabetikum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 8, 'Neuropati alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 9, 'Striktura uretra/leher kandung kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 10, 'Pembesaran prostat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'), 11, 'Pembengkakan perineal');

-- D.0044 Inkontinensia Urin Fungsional
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 2, 'Neuropati alkoholik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 3, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 4, 'Penyakit dimielinisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 5, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 6, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 7, 'Demensia progresif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'), 8, 'Depresi');

-- D.0045 Inkontinensia Urin Refleks
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 1, 'Cedera/tumor/infeksi medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 2, 'Cystitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 3, 'Pembedahan pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 4, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 5, 'Kanker kandung kemih atau pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 6, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'), 7, 'Demensia');

-- D.0046 Inkontinensia Urin Stres
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 1, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 2, 'Kehamilan/melahirkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 3, 'Menopause'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 4, 'Infeksi saluran kemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 5, 'Operasi abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 6, 'Operasi prostat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 7, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'), 8, 'Cedera medula spinalis');

-- D.0047 Inkontinensia Urin Urgensi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 1, 'Riwayat penyakit peradangan pelvis dan/atau vagina'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 2, 'Riwayat penggunaan kateter urin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 3, 'Infeksi kandung kemih dan/atau uretra'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 4, 'Gangguan neurogenik/tumor/infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 5, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 6, 'Neuropati diabetikum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'), 7, 'Operasi abdomen');


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0048', 'Kesiapan Peningkatan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Promosi Kesehatan', 'Pola fungsi sistem perkemihan yang cukup untuk memenuhi kebutuhan eliminasi yang dapat ditingkatkan.'),
('D.0049', 'Konstipasi', 'Fisiologis', 'Eliminasi', 'Aktual', 'Penurunan defekasi normal yang disertai pengeluaran feses sulit dan tidak tuntas serta feses kering dan banyak.'),
('D.0050', 'Retensi Urin', 'Fisiologis', 'Eliminasi', 'Aktual', 'Pengosongan kandung kemih yang tidak lengkap.'),
('D.0051', 'Risiko Inkontinensia Urin Urgensi', 'Fisiologis', 'Eliminasi', 'Risiko', 'Berisiko mengalami pengeluaran urin yang tidak terkendali.'),
('D.0052', 'Risiko Konstipasi', 'Fisiologis', 'Eliminasi', 'Risiko', 'Berisiko mengalami penurunan frekuensi normal defekasi disertai kesulitan dan pengeluaran feses tidak lengkap.'),
('D.0053', 'Disorganisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual', 'Disintegrasi respon fisiologis dan neurobehaviour bayi terhadap lingkungan.'),
('D.0054', 'Gangguan Mobilitas Fisik', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual', 'Keterbatasan dalam gerakan fisik dari satu atau lebih ekstremitas secara mandiri.'),
('D.0055', 'Gangguan Pola Tidur', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual', 'Gangguan kualitas dan kuantitas waktu tidur akibat faktor eksternal.'),
('D.0056', 'Intoleransi Aktivitas', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual', 'Ketidakcukupan energi untuk melakukan aktivitas sehari-hari.'),
('D.0057', 'Keletihan', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual', 'Penurunan kapasitas kerja fisik dan mental yang tidak pulih dengan istirahat.'),
('D.0058', 'Kesiapan Peningkatan Tidur', 'Fisiologis', 'Aktivitas/Istirahat', 'Promosi Kesehatan', 'Pola penurunan kesadaran alamiah dan periodik yang memungkinkan istirahat adekuat, mempertahankan gaya hidup yang diinginkan dan dapat ditingkatkan.'),
('D.0059', 'Risiko Disorganisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas/Istirahat', 'Risiko', 'Berisiko mengalami disintegrasi respon fisiologis dan neurobehaviour bayi terhadap lingkungan.'),
('D.0060', 'Risiko Intoleransi Aktivitas', 'Fisiologis', 'Aktivitas/Istirahat', 'Risiko', 'Berisiko mengalami ketidakcukupan energi untuk melakukan aktivitas sehari-hari.'),
('D.0061', 'Disrefleksia Otonom', 'Fisiologis', 'Neurosensori', 'Aktual', 'Respon sistem saraf simpatis yang terjadi secara spontan dan mengancam jiwa terhadap stimulus berbahaya akibat cedera medula spinalis pada T7 atau di atasnya.'),
('D.0062', 'Gangguan Memori', 'Fisiologis', 'Neurosensori', 'Aktual', 'Ketidakmampuan mengingat beberapa informasi atau perilaku.'),
('D.0063', 'Gangguan Menelan', 'Fisiologis', 'Neurosensori', 'Aktual', 'Fungsi menelan abnormal akibat defisit struktur atau fungsi oral, faring atau esofagus.'),
('D.0064', 'Konfusi Akut', 'Fisiologis', 'Neurosensori', 'Aktual', 'Gangguan kesadaran, perhatian, kognitif dan persepsi yang reversibel, berlangsung tiba-tiba dan singkat.'),
('D.0065', 'Konfusi Kronis', 'Fisiologis', 'Neurosensori', 'Aktual', 'Gangguan kesadaran, perhatian, kognitif dan persepsi yang ireversibel, berlangsung lama, dan/atau progresif.'),
('D.0066', 'Penurunan Kapasitas Adaptif Intrakranial', 'Fisiologis', 'Neurosensori', 'Aktual', 'Gangguan mekanisme dinamika intrakranial dalam melakukan kompensasi terhadap stimulus yang dapat menurunkan kapasitas intrakranial.'),
('D.0067', 'Risiko Disfungsi Neurovaskuler Perifer', 'Fisiologis', 'Neurosensori', 'Risiko', 'Berisiko mengalami gangguan sirkulasi, sensasi dan pergerakan pada ekstermitas.'),
('D.0068', 'Risiko Konfusi Akut', 'Fisiologis', 'Neurosensori', 'Risiko', 'Berisiko mengalami gangguan kesadaran, perhatian, kognisi dan persepsi yang reversibel dan terjadi dalam periode waktu singkat.'),
('D.0069', 'Disfungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Aktual', 'Perubahan fungsi seksual selama fase respon seksual berupa hasrat, terangsang, orgasme, dan/atau relaksasi yang dirasa tidak memuaskan, tidak bermakna atau tidak adekuat.'),
('D.0070', 'Kesiapan Persalinan', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Promosi Kesehatan', 'Pola mempersiapkan, mempertahankan dan memperkuat proses kehamilan dan persalinan serta perawatan bayi baru lahir.'),
('D.0071', 'Pola Seksual Tidak Efektif', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Aktual', 'Kekhawatiran individu melakukan hubungan seksual yang berisiko menyebabkan perubahan kesehatan.'),
('D.0072', 'Risiko Disfungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Risiko', 'Berisiko mengalami perubahan fungsi seksual selama fase respon seksual.'),
('D.0073', 'Risiko Kehamilan Tidak Dikehendaki', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Risiko', 'Berisiko mengalami kehamilan yang tidak direncanakan atau tidak diinginkan.');


-- INSERT sdki_penyebab

-- D.0049 Konstipasi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 1, 'Penurunan motilitas gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 2, 'Ketidakadekuatan pertumbuhan gigi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 3, 'Ketidakcukupan diet'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 4, 'Ketidakcukupan asupan serat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 5, 'Ketidakcukupan asupan cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 6, 'Aganglionik (mis. penyakit Hircsprung)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Fisiologis', 7, 'Kelemahan otot abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Psikologis', 1, 'Konfusi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Psikologis', 2, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Psikologis', 3, 'Gangguan emosional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 1, 'Perubahan kebiasaan makan (mis. jenis makanan, jadwal makan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 2, 'Ketidakadekuatan toileting'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 3, 'Aktivitas fisik harian kurang dari yang dianjurkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 4, 'Penyalahgunaan laksatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 5, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 6, 'Ketidakteraturan kebiasaan defekasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 7, 'Kebiasaan menahan dorongan defekasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Situasional', 8, 'Perubahan lingkungan');

-- D.0050 Retensi Urin
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Umum', 1, 'Peningkatan tekanan uretra'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Umum', 2, 'Kerusakan arkus refleks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Umum', 3, 'Blok spingter'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Umum', 4, 'Disfungsi neurologis (mis. trauma, penyakit saraf)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Umum', 5, 'Efek agen farmakologis (mis. atropine, belladonna, psikotropik, antihistamin, opiate)');

-- D.0053 Disorganisasi Perilaku Bayi
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 1, 'Keterbatasan lingkungan fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 2, 'Ketidaktepatan sensori'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 3, 'Kelebihan stimulasi sensorik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 4, 'Imaturitas sistem sensoris'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 5, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 6, 'Prosedur invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 7, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 8, 'Gangguan motorik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 9, 'Kelainan kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 10, 'Kelainan genetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Umum', 11, 'Terpapar teratogenik');

-- D.0054 Gangguan Mobilitas Fisik
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 1, 'Kerusakan integritas struktur tulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 2, 'Perubahan metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 3, 'Ketidakbugaran fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 4, 'Penurunan kendali otot'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 5, 'Penurunan massa otot'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 6, 'Penurunan kekuatan otot'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 7, 'Keterlambatan perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 8, 'Kekakuan sendi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 9, 'Kontraktur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 10, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 11, 'Gangguan muskuloskeletal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 12, 'Gangguan neuromuskular'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 13, 'Indeks masa tubuh diatas persentil ke-75 sesuai usia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 14, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 15, 'Program pembatasan gerak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 16, 'Nyeri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 17, 'Kurang terpapar informasi tentang aktivitas fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 18, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 19, 'Gangguan kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 20, 'Keengganan melakukan pergerakan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Umum', 21, 'Gangguan sensoripersepsi');

-- D.0055 Gangguan Pola Tidur
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 1, 'Hambatan lingkungan (mis. kelembapan lingkungan sekitar, suhu lingkungan, pencahayaan, kebisingan, bau tidak sedap, jadwal pemantauan/pemeriksaan/tindakan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 2, 'Kurangnya kontrol tidur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 3, 'Kurangnya privasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 4, 'Restraint fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 5, 'Ketiadaan teman tidur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Umum', 6, 'Tidak familiar dengan peralatan tidur');

-- D.0056 Intoleransi Aktivitas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Umum', 1, 'Ketidakseimbangan antara suplai dan kebutuhan oksigen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Umum', 2, 'Tirah baring'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Umum', 3, 'Kelemahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Umum', 4, 'Imobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Umum', 5, 'Gaya hidup monoton');

-- D.0057 Keletihan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 1, 'Gangguan tidur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 2, 'Gaya hidup monoton'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 3, 'Kondisi fisiologis (mis. penyakit kronis, penyakit terminal, anemia, malnutrisi, kehamilan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 4, 'Program perawatan/pengobatan jangka panjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 5, 'Peristiwa hidup negatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 6, 'Stres berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Umum', 7, 'Depresi');

-- D.0061 Disrefleksia Otonom
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Umum', 1, 'Cedera pada medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Umum', 2, 'Pembedahan medula spinalis pada T7 keatas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Umum', 3, 'Proses keganasan pada medula spinalis');

-- D.0062 Gangguan Memori
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 1, 'Ketidakadekuatan stimulasi intelektual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 2, 'Gangguan sirkulasi ke otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 3, 'Gangguan volume cairan dan/atau elektrolit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 4, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 5, 'Hipoksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 6, 'Gangguan neurologis (mis. EEG positif, cedera kepala, gangguan kejang)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 7, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 8, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 9, 'Faktor psikologis (mis. kecemasan, depresi, stres berlebihan, berduka, gangguan tidur)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Umum', 10, 'Distraksi lingkungan');

-- D.0063 Gangguan Menelan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 1, 'Gangguan serebrovaskular'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 2, 'Gangguan saraf kranialis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 3, 'Paralisis serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 4, 'Akalasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 5, 'Abnormalitas laring'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 6, 'Abnormalitas orofaring'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 7, 'Anomali jalan napas atas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 8, 'Defek anatomik kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 9, 'Defek laring'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 10, 'Defek nasal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 11, 'Defek rongga nasofaring'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 12, 'Defek trakea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 13, 'Refluk gastroesofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 14, 'Obstruksi mekanis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Umum', 15, 'Prematuritas');

-- D.0064 Konfusi Akut
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Umum', 1, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Umum', 2, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Umum', 3, 'Fluktuasi siklus tidur-bangun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Umum', 4, 'Usia lebih dari 60 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Umum', 5, 'Penyalahgunaan zat');

-- D.0065 Konfusi Kronis
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Umum', 1, 'Cedera otak (mis. kerusakan serebrovaskuler, penyakit neurologis, trauma, tumor)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Umum', 2, 'Psikosis Korsakoff'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Umum', 3, 'Demensia multi infark');

-- D.0066 Penurunan Kapasitas Adaptif Intrakranial
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 1, 'Lesi menempati ruang (mis. space-occupying lesion - akibat tumor, abses)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 2, 'Gangguan metabolisme (mis. akibat hiponatremia, ensefalopati uremikum, ensefalopati hepatikum, ketoasidosis diabetik, septikemia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 3, 'Edema serebral (mis. akibat cedera kepala [hematoma epidural, hematoma subdural, hematoma subarachnoid, hematoma intraserebral], stroke iskemik, stroke hemoragik, hipoksia, ensefalopati iskemik, pascaoperasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 4, 'Peningkatan tekanan vena (mis. akibat trombosis sinus vena serebral, gagal jantung, trombosis/obstruksi vena jugularis atau vena kava superior)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 5, 'Obstruksi aliran cairan serebrospinalis (mis. hidosefalus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Umum', 6, 'Hipertensi intrakranial idiopatik');

-- D.0069 Disfungsi Seksual
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 1, 'Perubahan fungsi/struktur tubuh (mis. kehamilan, baru melahirkan, obat-obatan, pembedahan, anomali, proses penyakit, trauma, radiasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 2, 'Perubahan biopsikososial seksualitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 3, 'Ketiadaan model peran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 4, 'Model peran tidak dapat mempengaruhi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 5, 'Kurang privasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 6, 'Ketiadaan pasangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 7, 'Kesalahan informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 8, 'Kelainan seksual (mis. hubungan penuh kekerasan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 9, 'Konflik nilai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 10, 'Penganiayaan fisik (mis. kekerasan dalam rumah tangga)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Umum', 11, 'Kurang terpapar informasi');

-- D.0071 Pola Seksual Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 1, 'Kurang privasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 2, 'Ketiadaan pasangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 3, 'Konflik orientasi seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 4, 'Ketakutan hamil'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 5, 'Ketakutan terinfeksi penyakit menular seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 6, 'Hambatan hubungan dengan pasangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Umum', 7, 'Kurang terpapar informasi tentang seksualitas');


-- INSERT sdki_faktor_risiko

-- D.0051 Risiko Inkontinensia Urin Urgensi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 1, 'Efek samping obat, kopi dan alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 2, 'Hiperrefleks destrussor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 3, 'Gangguan sistem saraf pusat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 4, 'Kerusakan kontraksi kandung kemih: relaksasi spingter tidak terkendali'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 5, 'Ketidakefektifan kebiasaan berkemih'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 6, 'Kapasitas kandung kemih kecil');

-- D.0052 Risiko Konstipasi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 1, '[Fisiologis] Penurunan motilitas gastrointestinal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 2, '[Fisiologis] Pertumbuhan gigi tidak adekuat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 3, '[Fisiologis] Ketidakcukupan diet'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 4, '[Fisiologis] Ketidakcukupan asupan serat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 5, '[Fisiologis] Ketidakcukupan asupan cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 6, '[Fisiologis] Aganglionik (mis. penyakit Hircsprung)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 7, '[Fisiologis] Kelemahan otot abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 8, '[Psikologis] Konfusi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 9, '[Psikologis] Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 10, '[Psikologis] Gangguan emosional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 11, '[Situasional] Perubahan kebiasaan makan (mis. jenis makanan, jadwal makan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 12, '[Situasional] Ketidakadekuatan toileting'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 13, '[Situasional] Aktivitas fisik harian kurang dari yang dianjurkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 14, '[Situasional] Penyalahgunaan laksatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 15, '[Situasional] Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 16, '[Situasional] Ketidakteraturan kebiasaan defekasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 17, '[Situasional] Kebiasaan menahan dorongan defekasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 18, '[Situasional] Perubahan lingkungan');

-- D.0059 Risiko Disorganisasi Perilaku Bayi
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 1, 'Kelebihan stimulasi sensorik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 2, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 3, 'Prosedur invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 4, 'Gangguan motorik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 5, 'Kelainan kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 6, 'Kelainan genetik');

-- D.0060 Risiko Intoleransi Aktivitas
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 1, 'Gangguan sirkulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 2, 'Ketidakbugaran status fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 3, 'Riwayat intoleransi aktivitas sebelumnya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 4, 'Tidak berpengalaman dengan suatu aktivitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 5, 'Gangguan pernapasan');

-- D.0067 Risiko Disfungsi Neurovaskuler Perifer
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 1, 'Hiperglikemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 2, 'Obstruksi vaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 3, 'Fraktur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 4, 'Imobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 5, 'Penekanan mekanis (mis. torniket, gips, balutan, restraint)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 6, 'Pembedahan ortopedi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 7, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 8, 'Luka bakar');

-- D.0068 Risiko Konfusi Akut
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 1, 'Usia di atas 60 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 2, 'Perubahan fungsi kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 3, 'Perubahan siklus tidur-bangun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 4, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 5, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 6, 'Riwayat stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 7, 'Gangguan fungsi metabolik (mis. azotemia, penurunan hemoglobin, ketidakseimbangan elektrolit, peningkatan nitrogen urea darah [BUN]/kreatinin)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 8, 'Gangguan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 9, 'Penggunaan restraint yang tidak tepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 10, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 11, 'Malnutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 12, 'Nyeri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 13, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 14, 'Deprivasi sensori'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 15, 'Penyalahgunaan zat');

-- D.0072 Risiko Disfungsi Seksual (faktor risiko tidak tercantum lengkap di PDF, mengacu pada penyebab D.0069)
-- D.0073 Risiko Kehamilan Tidak Dikehendaki (halaman tidak termuat penuh di PDF ini)


-- INSERT sdki_gejala

-- D.0048 Kesiapan Peningkatan Eliminasi Urin
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan keinginan untuk meningkatkan eliminasi urin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 'Mayor', 'Objektif', 1, 'Jumlah urin normal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 'Mayor', 'Objektif', 2, 'Karakteristik urin normal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 'Minor', 'Objektif', 1, 'Asupan cairan cukup', 1);

-- D.0049 Konstipasi
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Mayor', 'Subjektif', 1, 'Defekasi kurang dari 2 kali seminggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Mayor', 'Subjektif', 2, 'Pengeluaran feses lama dan sulit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Mayor', 'Objektif', 1, 'Feses keras', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Mayor', 'Objektif', 2, 'Peristaltik usus menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Minor', 'Subjektif', 1, 'Mengejan saat defekasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Minor', 'Objektif', 1, 'Distensi abdomen', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Minor', 'Objektif', 2, 'Kelemahan umum', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 'Minor', 'Objektif', 3, 'Teraba massa pada rektal', 1);

-- D.0050 Retensi Urin
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Mayor', 'Subjektif', 1, 'Sensasi penuh pada kandung kemih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Mayor', 'Objektif', 1, 'Disuria/anuria', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Mayor', 'Objektif', 2, 'Distensi kandung kemih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Minor', 'Subjektif', 1, 'Dribbling', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Minor', 'Objektif', 1, 'Inkontinensia berlebih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 'Minor', 'Objektif', 2, 'Residu urin 150 ml atau lebih', 1);

-- D.0053 Disorganisasi Perilaku Bayi
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Mayor', 'Objektif', 1, 'Hiperekstensi ekstermitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Mayor', 'Objektif', 2, 'Jari-jari meregang atau tangan menggenggam', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Mayor', 'Objektif', 3, 'Respon abnormal terhadap stimulus sensorik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Mayor', 'Objektif', 4, 'Gerakan tidak terkoordinasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 1, 'Menangis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 2, 'Tidak mampu menghambat respon terkejut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 3, 'Iritabilitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 4, 'Gangguan refleks', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 5, 'Tonus motorik berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 6, 'Tangan di wajah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 7, 'Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 8, 'Tremor', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 9, 'Tersentak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 10, 'Aritmia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 11, 'Bradikardia atau takikardia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 12, 'Saturasi menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 13, 'Tidak mau menyusu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 'Minor', 'Objektif', 14, 'Warna kulit berubah', 1);

-- D.0054 Gangguan Mobilitas Fisik
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Mayor', 'Subjektif', 1, 'Mengeluh sulit menggerakkan ekstremitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Mayor', 'Objektif', 1, 'Kekuatan otot menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Mayor', 'Objektif', 2, 'Rentang gerak (ROM) menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Subjektif', 1, 'Nyeri saat bergerak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Subjektif', 2, 'Enggan melakukan pergerakan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Subjektif', 3, 'Merasa cemas saat bergerak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Objektif', 1, 'Sendi kaku', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Objektif', 2, 'Gerakan tidak terkoordinasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Objektif', 3, 'Gerakan terbatas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 'Minor', 'Objektif', 4, 'Fisik lemah', 1);

-- D.0055 Gangguan Pola Tidur
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Subjektif', 1, 'Mengeluh sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Subjektif', 2, 'Mengeluh sering terjaga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Subjektif', 3, 'Mengeluh tidak puas tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Subjektif', 4, 'Mengeluh pola tidur berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Subjektif', 5, 'Mengeluh istirahat tidak cukup', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Minor', 'Subjektif', 1, 'Mengeluh kemampuan beraktivitas menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0056 Intoleransi Aktivitas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Mayor', 'Subjektif', 1, 'Mengeluh lelah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Mayor', 'Objektif', 1, 'Frekuensi jantung meningkat >20% dari kondisi istirahat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Subjektif', 1, 'Dispnea saat/setelah aktivitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Subjektif', 2, 'Merasa tidak nyaman setelah beraktivitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Subjektif', 3, 'Merasa lemah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Objektif', 1, 'Tekanan darah berubah >20% dari kondisi istirahat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Objektif', 2, 'Gambaran EKG menunjukkan aritmia saat/setelah aktivitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Objektif', 3, 'Gambaran EKG menunjukkan iskemia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 'Minor', 'Objektif', 4, 'Sianosis', 1);

-- D.0057 Keletihan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Mayor', 'Subjektif', 1, 'Merasa energi tidak pulih walaupun telah tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Mayor', 'Subjektif', 2, 'Merasa kurang tenaga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Mayor', 'Subjektif', 3, 'Mengeluh lelah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Mayor', 'Objektif', 1, 'Tidak mampu mempertahankan aktivitas rutin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Mayor', 'Objektif', 2, 'Tampak lesu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Minor', 'Subjektif', 1, 'Merasa bersalah akibat tidak mampu menjalankan tanggung jawab', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Minor', 'Subjektif', 2, 'Libido menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 'Minor', 'Objektif', 1, 'Kebutuhan istirahat meningkat', 1);

-- D.0058 Kesiapan Peningkatan Tidur
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 'Mayor', 'Subjektif', 2, 'Mengekspresikan perasaan cukup istirahat setelah tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 'Mayor', 'Objektif', 1, 'Jumlah waktu tidur sesuai dengan pertumbuhan perkembangan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 'Minor', 'Subjektif', 1, 'Tidak menggunakan obat tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 'Minor', 'Objektif', 1, 'Menerapkan rutinitas tidur yang meningkatkan kebiasaan tidur', 1);

-- D.0061 Disrefleksia Otonom
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Subjektif', 1, 'Sakit kepala', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Objektif', 1, 'Tekanan darah sistolik meningkat >20%', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Objektif', 2, 'Bercak merah pada kulit di atas lokasi cedera', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Objektif', 3, 'Diaforesis diatas lokasi cedera', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Objektif', 4, 'Pucat di bawah lokasi cedera', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Mayor', 'Objektif', 5, 'Bradikardia dan/atau takikardia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 1, 'Nyeri dada', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 2, 'Pandangan kabur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 3, 'Kongesti konjungtiva', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 4, 'Kongesti nasal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 5, 'Parestesia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Subjektif', 6, 'Sensasi logam di mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 1, 'Menggigil', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 2, 'Sindrom Horner', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 3, 'Refleks pilomotorik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 4, 'Dilatasi pupil', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 5, 'Penile erection', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 'Minor', 'Objektif', 6, 'Semen emission', 1);

-- D.0062 Gangguan Memori
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Subjektif', 1, 'Melaporkan pernah mengalami pengalaman lupa', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Subjektif', 2, 'Tidak mampu mempelajari keterampilan baru', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Subjektif', 3, 'Tidak mampu mengingat informasi faktual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Subjektif', 4, 'Tidak mampu mengingat perilaku tertentu yang pernah dilakukan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Subjektif', 5, 'Tidak mampu mengingat peristiwa', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Mayor', 'Objektif', 1, 'Tidak mampu melakukan kemampuan yang dipelajari sebelumnya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Minor', 'Subjektif', 1, 'Lupa melakukan perilaku pada waktu yang telah dijadwalkan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Minor', 'Subjektif', 2, 'Merasa mudah lupa', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0063 Gangguan Menelan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Mayor', 'Subjektif', 1, 'Mengeluh sulit menelan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Mayor', 'Objektif', 1, 'Batuk sebelum menelan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Mayor', 'Objektif', 2, 'Batuk setelah makan atau minum', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Mayor', 'Objektif', 3, 'Tersedak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Mayor', 'Objektif', 4, 'Makanan tertinggal di rongga mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Subjektif', 1, '[Oral] tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 1, '[Oral] Bolus masuk terlalu cepat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 2, '[Oral] Refluks nasal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 3, '[Oral] Tidak mampu membersihkan rongga mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 4, '[Oral] Makanan jatuh dari mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 5, '[Oral] Makanan terdorong keluar dari mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 6, '[Oral] Sulit mengunyah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 7, '[Oral] Muntah sebelum menelan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 8, '[Oral] Bolus terbentuk lama', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 9, '[Oral] Waktu makan lama', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 10, '[Oral] Porsi makanan tidak habis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 11, '[Oral] Fase oral abnormal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 12, '[Oral] Mengiler', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Subjektif', 2, '[Faring] Menolak makan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 13, '[Faring] Muntah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 14, '[Faring] Posisi kepala kurang elevasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 15, '[Faring] Menelan berulang-ulang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Subjektif', 3, '[Esofagus] Mengeluh bangun dimalam hari', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Subjektif', 4, '[Esofagus] Nyeri epigastrik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 16, '[Esofagus] Hematemesis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 17, '[Esofagus] Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 18, '[Esofagus] Regurgitasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 19, '[Esofagus] Odinofagia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 'Minor', 'Objektif', 20, '[Esofagus] Bruksisme', 1);

-- D.0064 Konfusi Akut
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Mayor', 'Subjektif', 1, 'Kurang motivasi untuk memulai/menyelesaikan perilaku berorientasi tujuan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Mayor', 'Subjektif', 2, 'Kurang motivasi untuk memulai/menyelesaikan perilaku terarah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Mayor', 'Objektif', 1, 'Fluktuasi fungsi kognitif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Mayor', 'Objektif', 2, 'Fluktuasi tingkat kesadaran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Mayor', 'Objektif', 3, 'Fluktuasi aktivitas psikomotori', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Minor', 'Subjektif', 1, 'Salah persepsi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Minor', 'Objektif', 1, 'Halusinasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 'Minor', 'Objektif', 2, 'Gelisah', 1);

-- D.0065 Konfusi Kronis
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Subjektif', 1, 'Kurang motivasi untuk memulai/menyelesaikan perilaku berorientasi tujuan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Subjektif', 2, 'Kurang motivasi untuk memulai/menyelesaikan perilaku terarah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Objektif', 1, 'Fungsi kognitif berubah progresif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Objektif', 2, 'Memori jangka pendek dan/atau panjang berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Objektif', 3, 'Interpretasi berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Objektif', 4, 'Fungsi sosial terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Mayor', 'Objektif', 5, 'Respon terhadap stimulus berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Minor', 'Subjektif', 1, 'Salah persepsi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 'Minor', 'Objektif', 1, 'Gangguan otak organik', 1);

-- D.0066 Penurunan Kapasitas Adaptif Intrakranial
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Subjektif', 1, 'Sakit kepala', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 1, 'Tekanan darah meningkat dengan tekanan nadi (pulse pressure) melebar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 2, 'Bradikardia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 3, 'Pola napas ireguler', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 4, 'Tingkat kesadaran menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 5, 'Respon pupil melambat atau tidak sama', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Mayor', 'Objektif', 6, 'Refleks neurologis terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 1, 'Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 2, 'Agitasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 3, 'Muntah (tanpa disertai mual)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 4, 'Tampak lesu/lemah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 5, 'Fungsi kognitif terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 6, 'Tekanan intrakranial (TIK) ≥20 mmHg', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 7, 'Papiledema', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 8, 'Postur deserebrasi (ektensi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 'Minor', 'Objektif', 9, 'Postur dekortikasi (fleksi)', 1);

-- D.0069 Disfungsi Seksual
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan aktivitas seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 2, 'Mengungkapkan eksitasi seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 3, 'Merasa hubungan seksual tidak memuaskan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 4, 'Mengungkapkan peran seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 5, 'Mengeluhkan hasrat seksual menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 6, 'Mengungkapkan fungsi seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Subjektif', 7, 'Mengeluh nyeri saat berhubungan seksual (dispareunia)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Minor', 'Subjektif', 1, 'Mengungkapkan ketertarikan pada pasangan berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Minor', 'Subjektif', 2, 'Mengeluh hubungan seksual terbatas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Minor', 'Subjektif', 3, 'Mencari informasi tentang kemampuan mencapai kepuasan seksual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0070 Kesiapan Persalinan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Mayor', 'Subjektif', 1, 'Menyatakan keinginan untuk menerapkan gaya hidup yang tepat untuk persalinan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Mayor', 'Subjektif', 2, 'Menyatakan keinginan untuk menerapkan penatalaksanaan gejala ketidaknyamanan selama persalinan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Mayor', 'Subjektif', 3, 'Menyatakan rasa percaya diri menjalani persalinan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 'Minor', 'Objektif', 1, 'Menunjukkan perilaku proaktif selama persiapan persalinan', 1);

-- D.0071 Pola Seksual Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Mayor', 'Subjektif', 1, 'Mengeluh sulit melakukan aktivitas seksual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Mayor', 'Subjektif', 2, 'Mengungkapkan aktivitas seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Mayor', 'Subjektif', 3, 'Mengungkapkan perilaku seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Mayor', 'Subjektif', 4, 'Orientasi seksual berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Minor', 'Subjektif', 1, 'Mengungkapkan hubungan dengan pasangan berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 'Minor', 'Objektif', 1, 'Konflik nilai', 1);


-- INSERT sdki_kondisi_klinis

-- D.0048 Kesiapan Peningkatan Eliminasi Urin
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 1, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 2, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 3, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 4, 'Trauma pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 5, 'Pembedahan abdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'), 6, 'Penyakit prostat');

-- D.0049 Konstipasi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 1, 'Lesi/cedera pada medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 2, 'Spina bifida'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 4, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 5, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 6, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 7, 'Hiperparatiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 8, 'Hipoparatiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 9, 'Ketidakseimbangan elektrolit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 10, 'Hemoroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 11, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 12, 'Pasca operasi obstruksi bowel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 13, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 14, 'Pembesaran prostat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 15, 'Abses rektal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 16, 'Fisura anorektal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 17, 'Striktura anorektal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 18, 'Prolaps rektal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 19, 'Ulkus rektal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 20, 'Rektokel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 21, 'Tumor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 22, 'Penyakit Hircsprung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'), 23, 'Impaksi feses');

-- D.0050 Retensi Urin
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 1, 'Benigna prostat hiperplasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 2, 'Pembengkakan perineal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 3, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 4, 'Rektokel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'), 5, 'Tumor di saluran kemih');

-- D.0051 Risiko Inkontinensia Urin Urgensi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 1, 'Infeksi/tumor/batu saluran kemih dan/atau ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'), 2, 'Gangguan sistem saraf pusat');

-- D.0052 Risiko Konstipasi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 1, 'Lesi/cedera pada medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 2, 'Spina bifida'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 4, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 5, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 6, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 7, 'Hiperparatiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'), 8, 'Hipoparatiroidisme');

-- D.0053 Disorganisasi Perilaku Bayi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 1, 'Hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 2, 'Prosedur invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 3, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 4, 'Gangguan neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 5, 'Gangguan pernapasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'), 6, 'Gangguan kardiovaskuler');

-- D.0054 Gangguan Mobilitas Fisik
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 2, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 3, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 4, 'Fraktur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 5, 'Osteoarthritis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 6, 'Ostemalasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0054'), 7, 'Keganasan');

-- D.0055 Gangguan Pola Tidur
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 1, 'Nyeri/kolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 2, 'Hipertiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 3, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 4, 'Penyakit paru obstruktif kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 5, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 6, 'Periode pasca partum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'), 7, 'Kondisi pasca operasi');

-- D.0056 Intoleransi Aktivitas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 1, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 3, 'Penyakit jantung koroner'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 4, 'Penyakit katup jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 5, 'Aritmia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 6, 'Penyakit paru obstruktif kronis (PPOK)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 7, 'Gangguan metabolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'), 8, 'Gangguan muskuloskeletal');

-- D.0057 Keletihan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 1, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 2, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 3, 'Hipotiroidisme/Hipertiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 4, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 5, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'), 6, 'Menopause');

-- D.0058 Kesiapan Peningkatan Tidur
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 1, 'Pemulihan pasca operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 2, 'Nyeri kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 3, 'Kehamilan (periode prenatal/postnatal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'), 4, 'Sleep apnea');

-- D.0059 Risiko Disorganisasi Perilaku Bayi
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 1, 'Hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 2, 'Prosedur invasif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 3, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 4, 'Gangguan neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 5, 'Gangguan pernapasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'), 6, 'Gangguan kardiovaskuler');

-- D.0060 Risiko Intoleransi Aktivitas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 1, 'Anemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 3, 'Penyakit katup jantung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 4, 'Aritmia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 5, 'Penyakit paru obstruktif kronis (PPOK)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 6, 'Gangguan metabolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'), 7, 'Gangguan muskuloskeletal');

-- D.0061 Disrefleksia Otonom
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 1, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 2, 'Fraktur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'), 3, 'Trombosis vena dalam');

-- D.0062 Gangguan Memori
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 2, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 3, 'Kejang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 4, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 5, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 6, 'Intoksikasi alkohol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'), 7, 'Penyalahgunaan zat');

-- D.0063 Gangguan Menelan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 2, 'Distrofi muskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 3, 'Poliomielitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 4, 'Cerebral palsy'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 5, 'Penyakit Parkinson'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 6, 'Guillain Barre Syndrome'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 7, 'Myastenia gravis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 8, 'Amyotropic lateral sclerosis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 9, 'Neoplasma otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 10, 'Kerusakan saraf kranialis V, VII, IX, X, XII'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'), 11, 'Esofagitis');

-- D.0064 Konfusi Akut
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 2, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 3, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 4, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 5, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'), 6, 'Delirium');

-- D.0065 Konfusi Kronis
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 2, 'Tumor otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 4, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 5, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), 6, 'Demensia multi infark');

-- D.0066 Penurunan Kapasitas Adaptif Intrakranial
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 2, 'Iskemik serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 3, 'Tumor serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 4, 'Hidrosefalus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 5, 'Hematoma kranial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 6, 'Pembentukan arteriovenous'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 7, 'Edema vasogenik atau sitotoksik serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 8, 'Hiperemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), 9, 'Obstruksi aliran vena');

-- D.0067 Risiko Disfungsi Neurovaskuler Perifer
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 1, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 2, 'Obstruksi vaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 3, 'Fraktur'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 4, 'Pembedahan ortopedi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 5, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), 6, 'Luka bakar');

-- D.0068 Risiko Konfusi Akut
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 1, 'Cedera kepala'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 2, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 3, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 4, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), 5, 'Demensia');

-- D.0069 Disfungsi Seksual
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 1, 'Gangguan endokrin, perkemihan, neuromuskuler, muskuloskeletal, kardiovaskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 2, 'Trauma genital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 3, 'Pembedahan pelvis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 4, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 5, 'Menopause'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), 6, 'Gangguan psikiatrik seperti mania, depresi berat, demensia, gangguan kepribadian, penyalahgunaan atau penggunaan zat, gangguan kecemasan, dan schizophrenia');

-- D.0070 Kesiapan Persalinan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 1, 'Status kesehatan ibu sehat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), 2, 'Status kesehatan janin sehat');

-- D.0071 Pola Seksual Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 1, 'Mastektomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 2, 'Histerektomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 3, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 4, 'Kondisi yang menyebabkan paralisis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), 5, 'Penyakit menular seksual (mis. sifilis, gonore, AIDS)');


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES

('D.0074', 'Gangguan Rasa Nyaman', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan kurang senang, lega dan sempurna dalam dimensi fisik, psikospiritual, lingkungan dan sosial.'),
('D.0075', 'Ketidaknyamanan Pasca Partum', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan tidak nyaman yang berhubungan dengan kondisi setelah melahirkan.'),
('D.0076', 'Nausea', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Perasaan tidak nyaman pada bagian belakang tenggorok atau lambung yang dapat mengakibatkan muntah.'),
('D.0077', 'Nyeri Akut', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional, dengan onset mendadak atau lambat dan berintensitas ringan hingga berat yang berlangsung kurang dari 3 bulan.'),
('D.0078', 'Nyeri Kronis', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional, dengan onset mendadak atau lambat dan berintensitas ringan hingga berat dan konstan, yang berlangsung lebih dari 3 bulan.'),
('D.0079', 'Nyeri Melahirkan', 'Psikologis', 'Nyeri dan Kenyamanan', 'Aktual', 'Pengalaman sensorik dan emosional yang bervariasi dari menyenangkan sampai tidak menyenangkan yang berhubungan dengan persalinan.'),
('D.0080', 'Ansietas', 'Psikologis', 'Integritas Ego', 'Aktual', 'Kondisi emosi dan pengalaman subyektif individu terhadap objek yang tidak jelas dan spesifik akibat antisipasi bahaya yang memungkinkan individu melakukan tindakan untuk menghadapi ancaman.'),
('D.0081', 'Berduka', 'Psikologis', 'Integritas Ego', 'Aktual', 'Respon psikososial yang ditunjukkan oleh klien akibat kehilangan (orang, objek, fungsi, status, bagian tubuh atau hubungan).'),
('D.0082', 'Distres Spiritual', 'Psikologis', 'Integritas Ego', 'Aktual', 'Gangguan pada keyakinan atau sistem nilai berupa kesulitan merasakan makna dan tujuan hidup melalui hubungan dengan diri, orang lain, lingkungan atau tuhan.'),
('D.0083', 'Gangguan Citra Tubuh', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perubahan persepsi tentang penampilan, struktur dan fungsi fisik individu.'),
('D.0084', 'Gangguan Identitas Diri', 'Psikologis', 'Integritas Ego', 'Aktual', 'Tidak mampu mempertahankan keutuhan persepsi terhadap identitas diri.'),
('D.0085', 'Gangguan Persepsi Sensori', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perubahan persepsi terhadap stimulus baik internal maupun eksternal yang disertai dengan respon yang berkurang, berlebihan atau terdistorsi.'),
('D.0086', 'Harga Diri Rendah Kronis', 'Psikologis', 'Integritas Ego', 'Aktual', 'Evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan klien seperti tidak berarti, tidak berharga, tidak berdaya yang berlangsung dalam waktu lama dan terus menerus.'),
('D.0087', 'Harga Diri Rendah Situasional', 'Psikologis', 'Integritas Ego', 'Aktual', 'Evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan klien sebagai respon terhadap situasi saat ini.'),
('D.0088', 'Keputusasaan', 'Psikologis', 'Integritas Ego', 'Aktual', 'Kondisi individu yang memandang adanya keterbatasan atau tidak tersedianya alternatif pemecahan pada masalah yang dihadapi.'),
('D.0089', 'Kesiapan Peningkatan Konsep Diri', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola persepsi diri yang cukup untuk merasa sejahtera dan dapat ditingkatkan.'),
('D.0090', 'Kesiapan Peningkatan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola adaptasi anggota keluarga dalam mengatasi situasi yang dialami klien secara efektif dan menunjukkan keinginan serta kesiapan untuk meningkatkan kesehatan keluarga dan klien.'),
('D.0091', 'Kesiapan Peningkatan Koping Komunitas', 'Psikologis', 'Integritas Ego', 'Promosi Kesehatan', 'Pola adaptasi dan penyelesaian masalah komunitas yang memuaskan untuk memenuhi tuntutan atau kebutuhan masyarakat, serta dapat ditingkatkan untuk penatalaksanaan masalah saat ini dan mendatang.'); persepsi kurang kontrol pada situasi saat ini atau yang akan datang.'),
('D.0093', 'Ketidakmampuan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perilaku orang terdekat (anggota keluarga atau orang berarti) yang membatasi kemampuan dirinya dan klien untuk beradaptasi dengan masalah kesehatan yang dihadapi klien.'),
('D.0094', 'Koping Defensif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Proyeksi evaluasi diri untuk melindungi diri dari ancaman terhadap harga diri.'),
('D.0095', 'Koping Komunitas Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Pola adaptasi aktivitas komunitas dan penyelesaian masalah yang tidak memuaskan untuk memenuhi tuntutan atau kebutuhan masyarakat.'),
('D.0096', 'Koping Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Ketidakmampuan menilai dan merespons stresor dan/atau ketidakmampuan menggunakan sumber-sumber yang ada untuk mengatasi masalah.');


-- INSERT sdki_faktor_risiko
-- (khusus diagnosa Risiko: D.0072, D.0073)

-- D.0072 Risiko Disfungsi Seksual


-- D.0073 Risiko Kehamilan Tidak Dikehendaki


-- INSERT sdki_penyebab
-- (diagnosa Aktual & Promosi Kesehatan)

-- D.0074 Gangguan Rasa Nyaman
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 1, 'Gejala penyakit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 2, 'Kurang pengendalian situasional/lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 3, 'Ketidakadekuatan sumber daya (mis. dukungan finansial, sosial dan pengetahuan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 4, 'Kurangnya privasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 5, 'Gangguan stimulus lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 6, 'Efek samping terapi (mis. medikasi, radiasi, kemoterapi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Umum', 7, 'Gangguan adaptasi kehamilan');

-- D.0075 Ketidaknyamanan Pasca Partum
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 1, 'Trauma perineum selama persalinan dan kelahiran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 2, 'Involusi uterus, proses pengembalian ukuran rahim ke ukuran semula'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 3, 'Pembengkakan payudara dimana alveoli mulai terisi ASI'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 4, 'Kekurangan dukungan dari keluarga dan tenaga kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 5, 'Ketidaktepatan posisi duduk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Umum', 6, 'Faktor budaya');

-- D.0076 Nausea
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 1, 'Gangguan biokimiawi (mis. uremia, ketoasidosis diabetik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 2, 'Gangguan pada esofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 3, 'Distensi lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 4, 'Iritasi lambung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 5, 'Gangguan pankreas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 6, 'Peregangan kapsul limpa'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 7, 'Tumor terlokalisasi (mis. neuroma akustik, tumor otak primer atau sekunder, metastasis tulang di dasar tengkorak)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 8, 'Peningkatan tekanan intraabdominal (mis. keganasan intraabdomen)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 9, 'Peningkatan tekanan intrakranial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 10, 'Peningkatan tekanan intraorbital (mis. glaukoma)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 11, 'Mabuk perjalanan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 12, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 13, 'Aroma tidak sedap'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 14, 'Rasa makanan/minuman yang tidak enak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 15, 'Stimulus penglihatan tidak menyenangkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 16, 'Faktor psikologis (mis. kecemasan, ketakutan, stres)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 17, 'Efek agen farmakologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Umum', 18, 'Efek toksin');

-- D.0077 Nyeri Akut
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Umum', 1, 'Agen pencedera fisiologis (mis. inflamasi, iskemia, neoplasma)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Umum', 2, 'Agen pencedera kimiawi (mis. terbakar, bahan kimia iritan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Umum', 3, 'Agen pencedera fisik (mis. abses, amputasi, terbakar, terpotong, mengangkat berat, prosedur operasi, trauma, latihan fisik berlebihan)');

-- D.0078 Nyeri Kronis
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 1, 'Kondisi muskuloskeletal kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 2, 'Kerusakan sistem saraf'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 3, 'Penekanan saraf'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 4, 'Infiltrasi tumor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 5, 'Ketidakseimbangan neurotransmiter, neuromodulator, dan reseptor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 6, 'Gangguan imunitas (mis. neuropati terkait HIV, virus varicella-zoster)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 7, 'Gangguan fungsi metabolik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 8, 'Riwayat posisi kerja statis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 9, 'Peningkatan indeks massa tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 10, 'Kondisi pasca trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 11, 'Tekanan emosional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 12, 'Riwayat penganiayaan (mis. fisik, psikologis, seksual)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Umum', 13, 'Riwayat penyalahgunaan obat/zat');

-- D.0079 Nyeri Melahirkan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Umum', 1, 'Dilatasi serviks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Umum', 2, 'Pengeluaran janin');

-- D.0080 Ansietas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 1, 'Krisis situasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 2, 'Kebutuhan tidak terpenuhi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 3, 'Krisis maturasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 4, 'Ancaman terhadap konsep diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 5, 'Ancaman terhadap kematian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 6, 'Kekhawatiran mengalami kegagalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 7, 'Disfungsi sistem keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 8, 'Hubungan orang tua-anak tidak memuaskan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 9, 'Faktor keturunan (temperamen mudah teragitasi sejak lahir)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 10, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 11, 'Terpapar bahaya lingkungan (mis. toksin, polutan, dan lain-lain)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Umum', 12, 'Kurang terpapar informasi');

-- D.0081 Berduka
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Umum', 1, 'Kematian keluarga atau orang yang berarti'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Umum', 2, 'Antisipasi kematian keluarga atau orang yang berarti'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Umum', 3, 'Kehilangan (objek, pekerjaan, fungsi, status, bagian tubuh, hubungan sosial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Umum', 4, 'Antisipasi kehilangan (objek, pekerjaan, fungsi, status, bagian tubuh, hubungan sosial)');

-- D.0082 Distres Spiritual
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 1, 'Menjelang ajal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 2, 'Kondisi penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 3, 'Kematian orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 4, 'Perubahan pola hidup'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 5, 'Kesepian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 6, 'Pengasingan diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 7, 'Pengasingan sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 8, 'Gangguan sosio-kultural'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 9, 'Peningkatan ketergantungan pada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Umum', 10, 'Kejadian hidup yang tidak diharapkan');

-- D.0083 Gangguan Citra Tubuh
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 1, 'Perubahan struktur/bentuk tubuh (mis. amputasi, trauma, luka bakar, obesitas, jerawat)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 2, 'Perubahan fungsi tubuh (mis. proses penyakit, kehamilan, kelumpuhan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 3, 'Perubahan fungsi kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 4, 'Ketidaksesuaian budaya, keyakinan atau sistem nilai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 5, 'Transisi perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 6, 'Gangguan psikososial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Umum', 7, 'Efek tindakan/pengobatan (mis. pembedahan, kemoterapi, terapi radiasi)');

-- D.0084 Gangguan Identitas Diri
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Umum', 1, 'Gangguan peran sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Umum', 2, 'Tidak terpenuhinya tugas perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Umum', 3, 'Gangguan neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Umum', 4, 'Ketidakadekuatan stimulasi sensori');

-- D.0085 Gangguan Persepsi Sensori
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 1, 'Gangguan penglihatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 2, 'Gangguan pendengaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 3, 'Gangguan penghiduan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 4, 'Gangguan perabaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 5, 'Hipoksia serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 7, 'Usia lanjut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Umum', 8, 'Pemajanan toksin lingkungan');

-- D.0086 Harga Diri Rendah Kronis
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 1, 'Terpapar situasi traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 2, 'Kegagalan berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 3, 'Kurangnya pengakuan dari orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 4, 'Ketidakefektifan mengatasi masalah kehilangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 5, 'Gangguan psikiatri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 6, 'Penguatan negatif berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Umum', 7, 'Ketidaksesuaian budaya');

-- D.0087 Harga Diri Rendah Situasional
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 1, 'Perubahan pada citra tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 2, 'Perubahan peran sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 3, 'Ketidakadekuatan pemahaman'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 4, 'Perilaku tidak konsisten dengan nilai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 5, 'Kegagalan hidup berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 6, 'Riwayat kehilangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 7, 'Riwayat penolakan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Umum', 8, 'Transisi perkembangan');

-- D.0088 Keputusasaan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 1, 'Stres jangka panjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 2, 'Penurunan kondisi fisiologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 3, 'Kehilangan kepercayaan pada kekuatan spiritual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 4, 'Kehilangan kepercayaan pada nilai-nilai penting'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 5, 'Pembatasan aktivitas jangka panjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Umum', 6, 'Pengasingan');

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Umum', 1, 'Program perawatan/pengobatan yang kompleks atau jangka panjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Umum', 2, 'Lingkungan tidak mendukung perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Umum', 3, 'Interaksi interpersonal tidak memuaskan');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Umum', 1, 'Hubungan keluarga ambivalen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Umum', 2, 'Pola koping yang berbeda diantara klien dan orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Umum', 3, 'Resistensi keluarga terhadap perawatan/pengobatan yang kompleks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Umum', 4, 'Ketidakmampuan orang terdekat mengungkapkan perasaan');

-- D.0094 Koping Defensif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 1, 'Konflik antara persepsi diri dan sistem nilai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 2, 'Takut mengalami kegagalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 3, 'Takut mengalami penghinaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 4, 'Takut terhadap dampak situasi yang dihadapi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 5, 'Kurangnya rasa percaya kepada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 6, 'Kurangnya kepercayaan diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 7, 'Kurangnya dukungan sistem pendukung (support system)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Umum', 8, 'Harapan yang tidak realistis');

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Umum', 1, 'Paparan bencana (alam atau buatan manusia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Umum', 2, 'Riwayat bencana (alam atau buatan manusia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Umum', 3, 'Ketidakadekuatan sumber daya untuk pemecahan masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Umum', 4, 'Ketidakcukupan sumber daya masyarakat (mis. istirahat, rekreasi, dukungan sosial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Umum', 5, 'Tidak adanya sistem masyarakat');

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 1, 'Ketidakpercayaan terhadap kemampuan diri mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 2, 'Ketidakadekuatan sistem pendukung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 3, 'Ketidakadekuatan strategi koping'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 4, 'Ketidakteraturan atau kekacauan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 5, 'Ketidakcukupan persiapan untuk menghadapi stresor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 6, 'Disfungsi sistem keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 7, 'Krisis situasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 8, 'Krisis maturasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 9, 'Kerentanan personalitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Umum', 10, 'Ketidakpastian');


-- INSERT sdki_gejala

-- D.0074 Gangguan Rasa Nyaman
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Mayor', 'Subjektif', 1, 'Mengeluh tidak nyaman', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Mayor', 'Objektif', 1, 'Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 1, 'Mengeluh sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 2, 'Tidak mampu rileks', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 3, 'Mengeluh kedinginan/kepanasan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 4, 'Merasa gatal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 5, 'Mengeluh mual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Subjektif', 6, 'Mengeluh lelah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Objektif', 1, 'Menunjukkan gejala distres', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Objektif', 2, 'Tampak merintih/menangis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Objektif', 3, 'Pola eliminasi berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Objektif', 4, 'Postur tubuh berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 'Minor', 'Objektif', 5, 'Iritabilitas', 1);

-- D.0075 Ketidaknyamanan Pasca Partum
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Mayor', 'Subjektif', 1, 'Mengeluh tidak nyaman', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Mayor', 'Objektif', 1, 'Tampak meringis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Mayor', 'Objektif', 2, 'Terdapat kontraksi uterus', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Mayor', 'Objektif', 3, 'Luka episiotomi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Mayor', 'Objektif', 4, 'Payudara bengkak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Objektif', 1, 'Tekanan darah meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Objektif', 2, 'Frekuensi nadi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Objektif', 3, 'Berkeringat berlebihan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Objektif', 4, 'Menangis/merintih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 'Minor', 'Objektif', 5, 'Haemorroid', 1);

-- D.0076 Nausea
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Mayor', 'Subjektif', 1, 'Mengeluh mual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Mayor', 'Subjektif', 2, 'Merasa ingin muntah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Mayor', 'Subjektif', 3, 'Tidak berminat makan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Subjektif', 1, 'Merasa asam di mulut', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Subjektif', 2, 'Sensasi panas/dingin', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Subjektif', 3, 'Sering menelan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Objektif', 1, 'Saliva meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Objektif', 2, 'Pucat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Objektif', 3, 'Diaforesis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Objektif', 4, 'Takikardia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 'Minor', 'Objektif', 5, 'Pupil dilatasi', 1);

-- D.0077 Nyeri Akut
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Subjektif', 1, 'Mengeluh nyeri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Objektif', 1, 'Tampak meringis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Objektif', 2, 'Bersikap protektif (mis. waspada, posisi menghindari nyeri)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Objektif', 3, 'Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Objektif', 4, 'Frekuensi nadi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Mayor', 'Objektif', 5, 'Sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 1, 'Tekanan darah meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 2, 'Pola napas berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 3, 'Nafsu makan berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 4, 'Proses berpikir terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 5, 'Menarik diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 6, 'Berfokus pada diri sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 'Minor', 'Objektif', 7, 'Diaforesis', 1);

-- D.0078 Nyeri Kronis
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Mayor', 'Subjektif', 1, 'Mengeluh nyeri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Mayor', 'Subjektif', 2, 'Merasa depresi (tertekan)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Mayor', 'Objektif', 1, 'Tampak meringis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Mayor', 'Objektif', 2, 'Gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Mayor', 'Objektif', 3, 'Tidak mampu menuntaskan aktivitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Subjektif', 1, 'Merasa takut mengalami cedera berulang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 1, 'Bersikap protektif (mis. posisi menghindari nyeri)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 2, 'Waspada', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 3, 'Pola tidur berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 4, 'Anoreksia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 5, 'Fokus menyempit', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 'Minor', 'Objektif', 6, 'Berfokus pada diri sendiri', 1);

-- D.0079 Nyeri Melahirkan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Mayor', 'Subjektif', 1, 'Mengeluh nyeri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Mayor', 'Subjektif', 2, 'Perineum terasa tertekan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Mayor', 'Objektif', 1, 'Ekspresi wajah meringis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Mayor', 'Objektif', 2, 'Berposisi meringankan nyeri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Mayor', 'Objektif', 3, 'Uterus teraba membulat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Subjektif', 1, 'Mual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Subjektif', 2, 'Nafsu makan menurun/meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 1, 'Tekanan darah meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 2, 'Frekuensi nadi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 3, 'Ketegangan otot meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 4, 'Pola tidur berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 5, 'Fungsi berkemih berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 6, 'Diaforesis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 7, 'Gangguan perilaku', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 8, 'Perilaku ekspresif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 9, 'Pupil dilatasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 10, 'Muntah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 'Minor', 'Objektif', 11, 'Fokus pada diri sendiri', 1);

-- D.0080 Ansietas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Subjektif', 1, 'Merasa bingung', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Subjektif', 2, 'Merasa khawatir dengan akibat dari kondisi yang dihadapi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Subjektif', 3, 'Sulit berkonsentrasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Objektif', 1, 'Tampak gelisah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Objektif', 2, 'Tampak tegang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Mayor', 'Objektif', 3, 'Sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Subjektif', 1, 'Mengeluh pusing', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Subjektif', 2, 'Anoreksia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Subjektif', 3, 'Palpitasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Subjektif', 4, 'Merasa tidak berdaya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 1, 'Frekuensi napas meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 2, 'Frekuensi nadi meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 3, 'Tekanan darah meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 4, 'Diaforesis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 5, 'Tremor', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 6, 'Muka tampak pucat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 7, 'Suara bergetar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 8, 'Kontak mata buruk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 9, 'Sering berkemih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 'Minor', 'Objektif', 10, 'Berorientasi pada masa lalu', 1);

-- D.0081 Berduka
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Subjektif', 1, 'Merasa sedih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Subjektif', 2, 'Merasa bersalah atau menyalahkan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Subjektif', 3, 'Tidak menerima kehilangan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Subjektif', 4, 'Merasa tidak ada harapan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Objektif', 1, 'Menangis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Objektif', 2, 'Pola tidur berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Mayor', 'Objektif', 3, 'Tidak mampu berkonsentrasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Subjektif', 1, 'Mimpi buruk atau pola mimpi berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Subjektif', 2, 'Merasa tidak berguna', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Subjektif', 3, 'Fobia', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Objektif', 1, 'Marah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Objektif', 2, 'Tampak panik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 'Minor', 'Objektif', 3, 'Fungsi imunitas terganggu', 1);

-- D.0082 Distres Spiritual
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Mayor', 'Subjektif', 1, 'Mempertanyakan makna/tujuan hidupnya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Mayor', 'Subjektif', 2, 'Menyatakan hidupnya terasa tidak/kurang bermakna', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Mayor', 'Subjektif', 3, 'Merasa menderita/tidak berdaya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Mayor', 'Objektif', 1, 'Tidak mampu beribadah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Mayor', 'Objektif', 2, 'Marah pada tuhan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Subjektif', 1, 'Menyatakan hidupnya terasa tidak/kurang tenang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Subjektif', 2, 'Mengeluh tidak dapat menerima (kurang pasrah)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Subjektif', 3, 'Merasa bersalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Subjektif', 4, 'Merasa terasing', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Subjektif', 5, 'Menyatakan telah diabaikan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Objektif', 1, 'Menolak berinteraksi dengan orang terdekat/pemimpin spiritual', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Objektif', 2, 'Tidak mampu berkreativitas (mis. menyanyi, mendengarkan musik, menulis)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Objektif', 3, 'Koping tidak efektif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 'Minor', 'Objektif', 4, 'Tidak berminat pada alam/literatur spiritual', 1);

-- D.0083 Gangguan Citra Tubuh
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan kecacatan/kehilangan bagian tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Mayor', 'Objektif', 1, 'Kehilangan bagian tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Mayor', 'Objektif', 2, 'Fungsi/struktur tubuh berubah/hilang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Subjektif', 1, 'Tidak mau mengungkapkan kecacatan/kehilangan bagian tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Subjektif', 2, 'Mengungkapkan perasaan negatif tentang perubahan tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Subjektif', 3, 'Mengungkapkan kekhawatiran pada penolakan/reaksi orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Subjektif', 4, 'Mengungkapkan perubahan gaya hidup', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 1, 'Menyembunyikan/menunjukkan bagian tubuh secara berlebihan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 2, 'Menghindari melihat dan/atau menyentuh bagian tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 3, 'Fokus berlebihan pada perubahan tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 4, 'Respon nonverbal pada perubahan dan persepsi tubuh', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 5, 'Fokus pada penampilan dan kekuatan masa lalu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 'Minor', 'Objektif', 6, 'Hubungan sosial berubah', 1);

-- D.0084 Gangguan Identitas Diri
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Subjektif', 1, 'Persepsi terhadap diri berubah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Subjektif', 2, 'Bingung dengan nilai-nilai budaya, tujuan hidup, jenis kelamin, dan/atau nilai-nilai ideal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Subjektif', 3, 'Perasaan yang fluktuatif terhadap diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Objektif', 1, 'Perilaku tidak konsisten', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Objektif', 2, 'Hubungan yang tidak efektif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Objektif', 3, 'Strategi koping tidak efektif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Mayor', 'Objektif', 4, 'Penampilan peran tidak efektif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0085 Gangguan Persepsi Sensori
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Mayor', 'Subjektif', 1, 'Mendengar suara bisikan atau melihat bayangan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Mayor', 'Subjektif', 2, 'Merasakan sesuatu melalui indera perabaan, penciuman, perabaan, atau pengecapan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Mayor', 'Objektif', 1, 'Distorsi sensori', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Mayor', 'Objektif', 2, 'Respons tidak sesuai', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Mayor', 'Objektif', 3, 'Bersikap seolah melihat, mendengar, mengecap, meraba, atau mencium sesuatu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Subjektif', 1, 'Menyatakan kesal', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 1, 'Menyendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 2, 'Melamun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 3, 'Konsentrasi buruk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 4, 'Disorientasi waktu, tempat, orang atau situasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 5, 'Curiga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 6, 'Melihat ke satu arah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 7, 'Mondar-mandir', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 'Minor', 'Objektif', 8, 'Bicara sendiri', 1);

-- D.0086 Harga Diri Rendah Kronis
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 1, 'Menilai diri negatif (mis. tidak berguna, tidak tertolong)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 2, 'Merasa malu/bersalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 3, 'Merasa tidak mampu melakukan apapun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 4, 'Meremehkan kemampuan mengatasi masalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 5, 'Merasa tidak memiliki kelebihan atau kemampuan positif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 6, 'Melebih-lebihkan penilaian negatif tentang diri sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Subjektif', 7, 'Menolak penilaian positif tentang diri sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Objektif', 1, 'Enggan mencoba hal baru', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Objektif', 2, 'Berjalan menunduk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Mayor', 'Objektif', 3, 'Postur tubuh menunduk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Subjektif', 1, 'Merasa sulit konsentrasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Subjektif', 2, 'Sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Subjektif', 3, 'Mengungkapkan keputusasaan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 1, 'Kontak mata kurang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 2, 'Lesu dan tidak bergairah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 3, 'Berbicara pelan dan lirih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 4, 'Pasif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 5, 'Perilaku tidak asertif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 6, 'Mencari penguatan secara berlebihan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 7, 'Bergantung pada pendapat orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 8, 'Sulit membuat keputusan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 'Minor', 'Objektif', 9, 'Sering kali mencari penegasan', 1);

-- D.0087 Harga Diri Rendah Situasional
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Subjektif', 1, 'Menilai diri negatif (mis. tidak berguna, tidak tertolong)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Subjektif', 2, 'Merasa malu/bersalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Subjektif', 3, 'Melebih-lebihkan penilaian negatif tentang diri sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Subjektif', 4, 'Menolak penilaian positif tentang diri sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Objektif', 1, 'Berbicara pelan dan lirih', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Objektif', 2, 'Menolak berinteraksi dengan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Objektif', 3, 'Berjalan menunduk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Mayor', 'Objektif', 4, 'Postur tubuh menunduk', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Minor', 'Subjektif', 1, 'Sulit berkonsentrasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Minor', 'Objektif', 1, 'Kontak mata kurang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Minor', 'Objektif', 2, 'Lesu dan tidak bergairah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Minor', 'Objektif', 3, 'Pasif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 'Minor', 'Objektif', 4, 'Tidak mampu membuat keputusan', 1);

-- D.0088 Keputusasaan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan keputusasaan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Mayor', 'Objektif', 1, 'Kurang terlibat dalam aktivitas perawatan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Mayor', 'Objektif', 2, 'Afek datar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Subjektif', 1, 'Sulit tidur', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Subjektif', 2, 'Selera makan menurun', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Objektif', 1, 'Berperilaku pasif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Objektif', 2, 'Kurang inisiatif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Objektif', 3, 'Meninggalkan lawan bicara', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 'Minor', 'Objektif', 4, 'Mengangkat bahu sebagai respon pada lawan bicara', 1);

-- D.0089 Kesiapan Peningkatan Konsep Diri
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk meningkatkan konsep diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Mayor', 'Subjektif', 2, 'Mengekspresikan kepuasan dengan diri, harga diri, penampilan peran, citra tubuh dan identitas pribadi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Minor', 'Subjektif', 1, 'Merasa percaya diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Minor', 'Subjektif', 2, 'Menerima kelebihan dan keterbatasan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 'Minor', 'Objektif', 1, 'Tindakan sesuai dengan perasaan dan pikiran yang diekspresikan', 1);

-- D.0090 Kesiapan Peningkatan Koping Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Mayor', 'Subjektif', 1, 'Anggota keluarga menetapkan tujuan untuk meningkatkan gaya hidup sehat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Mayor', 'Subjektif', 2, 'Anggota keluarga menetapkan sasaran untuk meningkatkan kesehatan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Mayor', 'Objektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Minor', 'Subjektif', 1, 'Anggota keluarga mengidentifikasi pengalaman yang mengoptimalkan kesejahteraan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Minor', 'Subjektif', 2, 'Anggota keluarga berupaya menjelaskan dampak krisis terhadap perkembangan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Minor', 'Subjektif', 3, 'Anggota keluarga mengungkapkan minat dalam membuat kontak dengan orang lain yang mengalami situasi yang sama', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 'Minor', 'Objektif', 1, 'tidak tersedia', 0);

-- D.0091 Kesiapan Peningkatan Koping Komunitas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Mayor', 'Subjektif', 1, 'Perencanaan aktif oleh komunitas mengenai prediksi stressor', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Mayor', 'Subjektif', 2, 'Pemecahan masalah aktif oleh komunitas saat menghadapi masalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Mayor', 'Objektif', 1, 'Terdapat sumber-sumber daya yang adekuat untuk mengatasi stresor', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Minor', 'Subjektif', 1, 'Bersepakat bahwa komunitas bertanggung jawab terhadap penatalaksanaan stres', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Minor', 'Subjektif', 2, 'Berkomunikasi positif di antara anggota komunitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Minor', 'Subjektif', 3, 'Berkomunikasi positif di antara komunitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Minor', 'Objektif', 1, 'Tersedia program untuk rekreasi', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 'Minor', 'Objektif', 2, 'Tersedia program untuk relaksasi/bersantai', 1);

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Mayor', 'Subjektif', 1, 'Menyatakan frustasi atau tidak mampu melaksanakan aktivitas sebelumnya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Mayor', 'Objektif', 1, 'Bergantung pada orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 1, 'Merasa diasingkan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 2, 'Menyatakan keraguan tentang kinerja peran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 3, 'Menyatakan kurang kontrol', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 4, 'Menyatakan rasa malu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 5, 'Merasa tertekan (depresi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Objektif', 1, 'Tidak berpartisipasi dalam perawatan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Objektif', 2, 'Pengasingan', 1);

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Subjektif', 1, 'Merasa diabaikan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 1, 'Tidak memenuhi kebutuhan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 2, 'Tidak toleran', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 3, 'Mengabaikan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Subjektif', 1, 'Terlalu khawatir dengan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Subjektif', 2, 'Merasa tertekan (depresi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 1, 'Perilaku menyerang (agresi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 2, 'Perilaku menghasut (agitasi)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 3, 'Tidak berkomitmen', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 4, 'Menunjukkan gejala psikosomatis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 5, 'Perilaku menolak', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 6, 'Perawatan yang mengabaikan kebutuhan dasar klien', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 7, 'Mengabaikan perawatan/pengobatan anggota keluarga', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 8, 'Perilaku bermusuhan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 9, 'Perilaku individualistik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 10, 'Upaya membangun hidup bermakna terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 11, 'Perilaku sehat terganggu', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 12, 'Ketergantungan anggota keluarga meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 13, 'Realitas kesehatan anggota keluarga terganggu', 1);

-- D.0094 Koping Defensif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 1, 'Menyalahkan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 2, 'Menyangkal adanya masalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 3, 'Menyangkal kelemahan diri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 4, 'Merasionalisasi kegagalan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Objektif', 1, 'Hipersensitif terhadap kritik', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Subjektif', 1, 'Meremehkan orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 1, 'Melemparkan tanggung jawab', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 2, 'Tawa permusuhan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 3, 'Sikap superior terhadap orang lain', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 4, 'Tidak dapat membedakan realitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 5, 'Kurang minat mengikuti perawatan/pengobatan', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 6, 'Sulit membangun atau mempertahankan hubungan', 1);

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan ketidakberdayaan komunitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 1, 'Komunitas tidak memenuhi harapan anggotanya', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 2, 'Konflik masyarakat meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 3, 'Insiden masalah masyarakat tinggi (mis. pembunuhan, pengrusakan, terorisme, perampokan, pelecehan, pengangguran, kemiskinan, penyakit mental)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Subjektif', 1, 'Mengungkapkan kerentanan komunitas', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 1, 'Partisipasi masyarakat kurang', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 2, 'Tingkat penyakit masyarakat meningkat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 3, 'Stres meningkat', 1);

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan tidak mampu mengatasi masalah', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Objektif', 1, 'Tidak mampu memenuhi peran yang diharapkan (sesuai usia)', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Objektif', 2, 'Menggunakan mekanisme koping yang tidak sesuai', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Subjektif', 1, 'Tidak mampu memenuhi kebutuhan dasar', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Subjektif', 2, 'Kekhawatiran kronis', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 1, 'Penyalahgunaan zat', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 2, 'Memanipulasi orang lain untuk memenuhi keinginannya sendiri', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 3, 'Perilaku tidak asertif', 1),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 4, 'Partisipasi sosial kurang', 1);


-- INSERT sdki_kondisi_klinis

-- D.0072 Risiko Disfungsi Seksual


-- D.0073 Risiko Kehamilan Tidak Dikehendaki


-- D.0074 Gangguan Rasa Nyaman
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 2, 'Keganasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 3, 'Distres psikologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), 4, 'Kehamilan');

-- D.0075 Ketidaknyamanan Pasca Partum
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), 1, 'Kondisi pasca persalinan');

-- D.0076 Nausea
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 1, 'Meningitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 2, 'Labirinitis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 3, 'Uremia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 4, 'Ketoasidosis diabetik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 5, 'Ulkus peptikum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 6, 'Penyakit esofagus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 7, 'Tumor intraabdomen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 8, 'Penyakit Meniere'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 9, 'Neuroma akustik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 10, 'Tumor otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 11, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), 12, 'Glaukoma');

-- D.0077 Nyeri Akut
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 1, 'Kondisi pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 2, 'Cedera traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 3, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 4, 'Sindrom koroner akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), 5, 'Glaukoma');

-- D.0078 Nyeri Kronis
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 1, 'Kondisi kronis (mis. arthritis reumatoid)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 2, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 3, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 4, 'Kondisi pasca trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), 5, 'Tumor');

-- D.0079 Nyeri Melahirkan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), 1, 'Proses persalinan');

-- D.0080 Ansietas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 1, 'Penyakit kronis progresif (mis. kanker, penyakit autoimun)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 2, 'Penyakit akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 3, 'Hospitalisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 4, 'Rencana operasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 5, 'Kondisi diagnosis penyakit belum jelas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 6, 'Penyakit neurologis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), 7, 'Tahap tumbuh kembang');

-- D.0081 Berduka
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 1, 'Kematian anggota keluarga atau orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 2, 'Amputasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 3, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 4, 'Kondisi kehilangan perinatal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 5, 'Penyakit terminal (mis. kanker)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), 6, 'Putus hubungan kerja');

-- D.0082 Distres Spiritual
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 1, 'Penyakit kronis (mis. arthritis rheumatoid, sklerosis multipel)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 2, 'Penyakit terminal (mis. kanker)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 3, 'Retardasi mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 4, 'Kehilangan bagian tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 5, 'Sudden infant death syndrome (SIDS)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 6, 'Kelahiran mati, kematian janin, keguguran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 7, 'Kemandulan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), 8, 'Gangguan psikiatrik');

-- D.0083 Gangguan Citra Tubuh
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 1, 'Mastektomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 2, 'Amputasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 3, 'Jerawat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 4, 'Parut atau luka bakar yang terlihat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 5, 'Obesitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 6, 'Hiperpigmentasi pada kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 7, 'Gangguan psikiatrik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 8, 'Program terapi neoplasma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), 9, 'Alopecia chemically induced');

-- D.0084 Gangguan Identitas Diri
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 1, 'Gangguan autistik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 2, 'Gangguan orientasi seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), 3, 'Periode perkembangan remaja');

-- D.0085 Gangguan Persepsi Sensori
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 1, 'Glaukoma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 2, 'Katarak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 3, 'Gangguan refraksi (miopia, hiperopia, astigmatisma, presbiopia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 4, 'Trauma okuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 5, 'Trauma pada saraf kranialis II, III, IV dan VI akibat stroke, aneurisma intrakranial, trauma/tumor otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 6, 'Infeksi okuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 7, 'Presbikusis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 8, 'Malfungsi alat bantu dengar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 9, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 10, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 11, 'Gangguan amnestik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 12, 'Penyakit terminal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0085'), 13, 'Gangguan psikotik');

-- D.0086 Harga Diri Rendah Kronis
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 1, 'Cedera traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 2, 'Pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 3, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 4, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 5, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 6, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 7, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0086'), 8, 'Pengalaman tidak menyenangkan');

-- D.0087 Harga Diri Rendah Situasional
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 1, 'Cedera traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 2, 'Pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 3, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 4, 'Kondisi baru terdiagnosis (mis. diabetes melitus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 5, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 7, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0087'), 8, 'Pengalaman tidak menyenangkan');

-- D.0088 Keputusasaan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 2, 'Penyakit terminal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0088'), 3, 'Penyakit yang tidak dapat disembuhkan');

-- D.0089 Kesiapan Peningkatan Konsep Diri
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0089'), 1, 'Perilaku upaya peningkatan kesehatan');

-- D.0090 Kesiapan Peningkatan Koping Keluarga
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 1, 'Kelainan genetik (mis. sindrom down, fibrosis kistik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 2, 'Cedera traumatik (mis. amputasi, cedera spinal)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0090'), 3, 'Kondisi kronis (mis. asma, AIDS, penyakit alzhaimer)');

-- D.0091 Kesiapan Peningkatan Koping Komunitas
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0091'), 1, 'Penurunan tingkat penyakit, kecelakaan atau kekerasan');

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 1, 'Diagnosis yang tidak terduga atau baru'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 2, 'Peristiwa traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 3, 'Diagnosis penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 4, 'Diagnosis penyakit terminal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 5, 'Rawat inap');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 1, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 2, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 3, 'Kelainan yang menyebabkan paralisis permanen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 4, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 5, 'Penyakit kronis (mis. kanker, arthritis reumatoid)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 7, 'Krisis keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 8, 'Konflik keluarga yang belum terselesaikan');

-- D.0094 Koping Defensif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 2, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 3, 'Attention-deficit/hyperactivity disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 4, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 5, 'Oppositional Defiant Disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 7, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 8, 'Gangguan amnestik');

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 1, 'Insiden kekerasan tinggi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 2, 'Tingkat penyakit tinggi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 3, 'Sedikitnya kesempatan atau lokasi untuk interaksi komunitas');

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 1, 'Kondisi perawatan kritis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 2, 'Attention Deficit/Hyperactivty Disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 3, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 4, 'Oppositional Defiant Disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 5, 'Gangguan kecemasan perpisahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 7, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 8, 'Gangguan amnestik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 9, 'Intoksikasi zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 10, 'Putus zat');


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES

('D.0129', 'Gangguan Integritas Kulit/Jaringan', 'Lingkungan', 'Keamanan dan Proteksi', 'Aktual', 'Kerusakan kulit (dermis dan/atau epidermis) atau jaringan (membran mukosa, kornea, fasia, otot, tendon, tulang, kartilago, kapsul sendi dan/atau ligamen).'),
('D.0130', 'Hipertermia', 'Lingkungan', 'Keamanan dan Proteksi', 'Aktual', 'Suhu tubuh meningkat di atas rentang normal tubuh.');


-- INSERT sdki_penyebab

-- D.0077 Nyeri Akut


-- D.0129 Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 1, 'Perubahan sirkulasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 2, 'Perubahan status nutrisi (kelebihan atau kekurangan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 3, 'Kekurangan/kelebihan volume cairan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 4, 'Penurunan mobilitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 5, 'Bahan kimia iritatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 6, 'Suhu lingkungan yang ekstrem'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 7, 'Faktor mekanis (mis. penekanan pada tonjolan tulang, gesekan) atau faktor elektris (elektrodiatemi, energi listrik bertegangan tinggi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 8, 'Efek samping terapi radiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 9, 'Kelembaban'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 10, 'Proses penuaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 11, 'Neuropati perifer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 12, 'Perubahan pigmentasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 13, 'Perubahan hormonal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Umum', 14, 'Kurang terpapar informasi tentang upaya mempertahankan/melindungi integritas jaringan');

-- D.0130 Hipertermia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 1, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 2, 'Terpapar lingkungan panas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 3, 'Proses penyakit (mis. infeksi, kanker)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 4, 'Ketidaksesuaian pakaian dengan suhu lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 5, 'Peningkatan laju metabolisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 6, 'Respon trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 7, 'Aktivitas berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Umum', 8, 'Penggunaan inkubator');


-- INSERT sdki_gejala

-- D.0077 Nyeri Akut


-- D.0129 Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Mayor', 'Objektif', 1, 'Kerusakan jaringan dan/atau lapisan kulit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif', 1, 'Nyeri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif', 2, 'Perdarahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif', 3, 'Kemerahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 'Minor', 'Objektif', 4, 'Hematoma');

-- D.0130 Hipertermia
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Mayor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Mayor', 'Objektif', 1, 'Suhu tubuh diatas nilai normal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Subjektif', 1, 'tidak tersedia', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif', 1, 'Kulit merah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif', 2, 'Kejang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif', 3, 'Takikardia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif', 4, 'Takipnea'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 'Minor', 'Objektif', 5, 'Kulit terasa hangat');


-- INSERT sdki_kondisi_klinis

-- D.0077 Nyeri Akut


-- D.0129 Gangguan Integritas Kulit/Jaringan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 1, 'Imobilisasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 2, 'Gagal jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 3, 'Gagal ginjal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 4, 'Diabetes melitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'), 5, 'Imunodefisiensi (mis. AIDS)');

-- D.0130 Hipertermia
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES

((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 1, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 2, 'Hipertiroid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 4, 'Dehidrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 5, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'), 6, 'Prematuritas');


-- INSERT TABEL sdki

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0092', 'Ketidakberdayaan', 'Psikologis', 'Integritas Ego', 'Aktual', 'Persepsi bahwa tindakan seseorang tidak akan memengaruhi hasil secara signifikan; persepsi kurang kontrol pada situasi saat ini atau yang akan datang.'),
('D.0093', 'Ketidakmampuan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Aktual', 'Perilaku orang terdekat (anggota keluarga atau orang berarti) yang membatasi kemampuan dirinya dan klien untuk beradaptasi dengan masalah kesehatan yang dihadapi klien.'),
('D.0094', 'Koping Defensif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Proyeksi evaluasi diri untuk melindungi diri dari ancaman terhadap harga diri.'),
('D.0095', 'Koping Komunitas Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Pola adaptasi aktivitas komunitas dan penyelesaian masalah yang tidak memuaskan untuk memenuhi tuntutan atau kebutuhan masyarakat.'),
('D.0096', 'Koping Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Ketidakmampuan menilai dan merespons stressor dan/atau ketidakmampuan menggunakan sumber-sumber yang ada untuk mengatasi masalah.'),
('D.0097', 'Penurunan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Aktual', 'Ketidakadekuatan atau ketidakefektifan dukungan, rasa nyaman, bantuan dan motivasi orang terdekat (anggota keluarga atau orang berarti) yang dibutuhkan klien untuk mengelola atau mengatasi masalah kesehatannya.'),
('D.0098', 'Penyangkalan Tidak Efektif', 'Psikologis', 'Integritas Ego', 'Aktual', 'Upaya mengingkari pemahaman atau makna suatu peristiwa secara sadar atau tidak sadar untuk menurunkan kecemasan/ketakutan yang dapat menyebabkan gangguan kesehatan.'),
('D.0099', 'Perilaku Kesehatan Cenderung Berisiko', 'Psikologis', 'Integritas Ego', 'Aktual', 'Hambatan kemampuan dalam mengubah gaya hidup/perilaku untuk memperbaiki status kesehatan.'),
('D.0100', 'Risiko Distres Spiritual', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami gangguan keyakinan atau sistem nilai pada individu atau kelompok berupa kekuatan, harapan dan makna hidup.'),
('D.0101', 'Risiko Harga Diri Rendah Kronis', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan klien yang berlangsung dalam waktu lama dan terus menerus.'),
('D.0102', 'Risiko Harga Diri Rendah Situasional', 'Psikologis', 'Integritas Ego', 'Risiko', 'Berisiko mengalami evaluasi atau perasaan negatif terhadap diri sendiri atau kemampuan klien sebagai respons terhadap situasi saat ini.'),
('D.0103', 'Risiko Ketidakberdayaan', 'Psikologis', 'Integritas Ego', 'Risiko', 'Persepsi bahwa tindakan seseorang tidak akan mempengaruhi hasil secara signifikan; persepsi kurang kontrol pada situasi saat ini atau yang akan datang.'),
('D.0104', 'Sindrom Pasca Trauma', 'Psikologis', 'Integritas Ego', 'Aktual', 'Respon maladaptif yang berkelanjutan terhadap kejadian trauma.'),
('D.0105', 'Waham', 'Psikologis', 'Integritas Ego', 'Aktual', 'Keyakinan yang keliru tentang isi pikiran yang dipertahankan secara kuat atau terus menerus namun tidak sesuai dengan kenyataan.');

-- INSERT sdki_penyebab

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Penyebab', 1, 'Program perawatan/pengobatan yang komplek atau jangka panjang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Penyebab', 2, 'Lingkungan tidak mendukung perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Penyebab', 3, 'Interaksi interpersonal tidak memuaskan');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Penyebab', 1, 'Hubungan keluarga ambivalen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Penyebab', 2, 'Pola koping yang berbeda diantara klien dan orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Penyebab', 3, 'Resistensi keluarga terhadap perawatan/pengobatan yang kompleks'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Penyebab', 4, 'Ketidakmampuan orang terdekat mengungkapkan perasaan');

-- D.0094 Koping Defensif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 1, 'Konflik antar persepsi diri dan sistem nilai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 2, 'Takut mengalami kegagalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 3, 'Takut mengalami penghinaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 4, 'Takut terhadap dampak situasi yang dihadapi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 5, 'Kurangnya rasa percaya kepada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 6, 'Kurangnya kepercayaan diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 7, 'Kurangnya dukungan sistem pendukung (support system)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Penyebab', 8, 'Harapan yang tidak realistis');

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Penyebab', 1, 'Paparan bencana (alam atau buatan manusia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Penyebab', 2, 'Riwayat bencana (alam atau buatan manusia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Penyebab', 3, 'Ketidakadekuatan sumber daya untuk pemecahan masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Penyebab', 4, 'Ketidakcukupan sumber daya masyarakat (mis. istirahat, rekreasi, dukungan sosial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Penyebab', 5, 'Tidak adanya sistem masyarakat');

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 1, 'Ketidakpercayaan terhadap kemampuan diri mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 2, 'Ketidakadekuatan sistem pendukung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 3, 'Ketidakadekuatan strategi koping'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 4, 'Ketidakteraturan atau kekacauan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 5, 'Ketidakcukupan persiapan untuk menghadapi stresor'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 6, 'Disfungsi sistem keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 7, 'Krisis situasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 8, 'Krisis maturasional'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 9, 'Kerentanan personalitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Penyebab', 10, 'Ketidakpastian');

-- D.0097 Penurunan Koping Keluarga
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 1, 'Situasi penyerta yang mempengaruhi orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 2, 'Krisis perkembangan yang dihadapi orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 3, 'Kelelahan orang terdekat dalam memberikan dukungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 4, 'Disorganisasi keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 5, 'Perubahan peran keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 6, 'Tidak tersedianya informasi bagi orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 7, 'Kurangnya saling mendukung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 8, 'Tidak cukupnya dukungan yang diberikan klien pada orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 9, 'Orang terdekat kurang terpapar informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 10, 'Salah/tidak pahamnya informasi yang didapatkan orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 11, 'Orang terdekat terlalu fokus pada kondisi di luar keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 12, 'Penyakit kronis yang menghabiskan kemampuan dukungan orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Penyebab', 13, 'Krisis situasional yang dialami orang terdekat');

-- D.0098 Penyangkalan Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 1, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 2, 'Ketakutan terhadap kematian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 3, 'Ketakutan mengalami kehilangan kemandirian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 4, 'Ketakutan terhadap perpisahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 5, 'Ketidakefektifan strategi koping'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 6, 'Ketidakpercayaan terhadap kemampuan mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Penyebab', 7, 'Ancaman terhadap realitas yang tidak menyenangkan');

-- D.0099 Perilaku Kesehatan Cenderung Berisiko
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 1, 'Kurang terpapar informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 2, 'Ketidakadekuatan dukungan sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 3, 'Self efficacy yang rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 4, 'Status sosio-ekonomi rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 5, 'Stresor berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 6, 'Sikap negatif terhadap pelayanan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Penyebab', 7, 'Pemilihan gaya hidup tidak sehat (mis. merokok, konsumsi alkohol berlebihan)');

-- D.0104 Sindrom Pasca Trauma
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Penyebab', 1, 'Bencana'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Penyebab', 2, 'Peperangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Penyebab', 3, 'Riwayat korban perilaku kekerasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Penyebab', 4, 'Kecelakaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Penyebab', 5, 'Saksi pembunuhan');

-- D.0105 Waham
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Penyebab', 1, 'Faktor biologis: kelainan genetik atau keturunan, kelainan neurologis (mis. gangguan sistem limbik, gangguan ganglia basalis, tumor otak)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Penyebab', 2, 'Faktor psikodinamik (mis. isolasi sosial, hipersensitif)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Penyebab', 3, 'Maladaptasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Penyebab', 4, 'Stress berlebihan');

-- INSERT sdki_gejala

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Mayor', 'Subjektif', 1, 'Menyatakan frustasi atau tidak mampu melaksanakan aktivitas sebelumnya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Mayor', 'Objektif', 1, 'Bergantung pada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 1, 'Merasa diasingkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 2, 'Menyatakan keraguan tentang kinerja peran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 3, 'Menyatakan kurang kontrol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 4, 'Menyatakan rasa malu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Subjektif', 5, 'Merasa tertekan (depresi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Objektif', 1, 'Tidak berpartisipasi dalam perawatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 'Minor', 'Objektif', 2, 'Pengasingan');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Subjektif', 1, 'Merasa diabaikan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 1, 'Tidak memenuhi kebutuhan anggota keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 2, 'Tidak toleran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Mayor', 'Objektif', 3, 'Mengabaikan anggota keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Subjektif', 1, 'Terlalu khawatir dengan anggota keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Subjektif', 2, 'Merasa tertekan (depresi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 1, 'Perilaku menyerang (agresi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 2, 'Perilaku menghasut (agitasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 3, 'Tidak berkomitmen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 4, 'Menunjukkan gejala psikosomatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 5, 'Perilaku menolak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 6, 'Perawatan yang mengabaikan kebutuhan dasar klien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 7, 'Mengabaikan perawatan/pengobatan anggota keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 8, 'Perilaku bermusuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 9, 'Perilaku individualistik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 10, 'Upaya membangun hidup bermakna terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 11, 'Perilaku sehat terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 12, 'Ketergantungan anggota keluarga meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 'Minor', 'Objektif', 13, 'Realitas kesehatan anggota keluarga terganggu');

-- D.0094 Koping Defensif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 1, 'Menyalahkan orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 2, 'Menyangkal adanya masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 3, 'Menyangkal kelemahan diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Subjektif', 4, 'Merasionalisasi kegagalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Mayor', 'Objektif', 1, 'Hipersensitif terhadap kritik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Subjektif', 1, 'Meremehkan orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 1, 'Melemparkan tanggung jawab'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 2, 'Tawa permusuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 3, 'Sikap superior terhadap orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 4, 'Tidak dapat membedakan realitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 5, 'Kurang minat mengikuti perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 'Minor', 'Objektif', 6, 'Sulit membangun atau mempertahankan hubungan');

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan ketidakberdayaan komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 1, 'Komunitas tidak memenuhi harapan anggotanya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 2, 'Konflik masyarakat meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Mayor', 'Objektif', 3, 'Insiden masalah masyarakat meningkat tinggi (mis. pembunuhan, pengerusakan, pelecehan, pengangguran, kemiskinan, penyakit mental)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Subjektif', 1, 'Mengungkapkan kerentanan komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 1, 'Partisipasi masyarakat kurang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 2, 'Tingkat penyakit masyarakat meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 'Minor', 'Objektif', 3, 'Stres meningkat');

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan tidak mampu mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Objektif', 1, 'Tidak mampu memenuhi peran yang diharapkan (sesuai usia)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Mayor', 'Objektif', 2, 'Menggunakan mekanisme koping yang tidak sesuai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Subjektif', 1, 'Tidak mampu memenuhi kebutuhan dasar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Subjektif', 2, 'Kekhawatiran kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 1, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 2, 'Memanipulasi orang lain untuk memenuhi keinginannya sendiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 3, 'Perilaku tidak asertif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 'Minor', 'Objektif', 4, 'Partisipasi sosial kurang');

-- D.0097 Penurunan Koping Keluarga
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Mayor', 'Subjektif', 1, 'Klien mengeluh/khawatir tentang respons orang terdekat pada masalah kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Mayor', 'Objektif', 1, 'Orang terdekat menarik diri dari klien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Mayor', 'Objektif', 2, 'Terbatasnya komunikasi orang terdekat dengan klien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Minor', 'Subjektif', 1, 'Orang terdekat menyatakan kurang terpapar informasi tentang upaya mengatasi masalah klien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Minor', 'Objektif', 1, 'Bantuan yang dilakukan orang terdekat menunjukkan hasil yang tidak memuaskan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 'Minor', 'Objektif', 2, 'Orang terdekat berperilaku protektif yang tidak sesuai dengan kemampuan/kemandirian klien');

-- D.0098 Penyangkalan Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Mayor', 'Subjektif', 1, 'Tidak mengakui dirinya mengalami gejala atau bahaya (walaupun kenyataan sebaliknya)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Mayor', 'Objektif', 1, 'Menunda mencari pertolongan pelayanan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Subjektif', 1, 'Mengaku tidak takut dengan kematian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Subjektif', 2, 'Mengaku tidak takut dengan penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Subjektif', 3, 'Tidak mengakui bahwa penyakit berdampak pada pola hidup'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Objektif', 1, 'Melakukan pengobatan mandiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Objektif', 2, 'Mengalihkan sumber gejala ke orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Objektif', 3, 'Berperilaku acuh tak acuh saat membicarakan peristiwa penyebab stres'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 'Minor', 'Objektif', 4, 'Menunjukkan afek yang tidak sesuai');

-- D.0099 Perilaku Kesehatan Cenderung Berisiko
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Mayor', 'Objektif', 1, 'Menunjukkan penolakan terhadap perubahan status kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Mayor', 'Objektif', 2, 'Gagal melakukan tindakan pencegahan masalah kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Mayor', 'Objektif', 3, 'Menunjukkan upaya peningkatan status kesehatan yang minimal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 'Minor', 'Objektif', 1, 'Gagal mencapai pengendalian yang optimal');

-- D.0104 Sindrom Pasca Trauma
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan secara berlebihan atau menghindari pembicaraan kejadian trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Subjektif', 2, 'Merasa cemas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Subjektif', 3, 'Teringat kembali kejadian traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Objektif', 1, 'Memori masa lalu terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Objektif', 2, 'Mimpi buruk berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Objektif', 3, 'Ketakutan berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Mayor', 'Objektif', 4, 'Menghindari aktivitas, tempat atau orang yang membangkitkan kejadian trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Subjektif', 1, 'Tidak percaya pada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Subjektif', 2, 'Menyalahkan diri sendiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 1, 'Minat berinteraksi dengan orang lain menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 2, 'Konfusi atau disosiasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 3, 'Gangguan interpretasi realitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 4, 'Sulit berkonsentrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 5, 'Waspada berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 6, 'Pola hidup terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 7, 'Tidur terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 'Minor', 'Objektif', 8, 'Merusak diri sendiri (mis. konsumsi alkohol, penggunaan zat, percobaan bunuh diri, tindakan kriminal)');

-- D.0105 Waham
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan isi waham'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Mayor', 'Objektif', 1, 'Menunjukkan perilaku sesuai isi waham'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Mayor', 'Objektif', 2, 'Isi pikiran tidak sesuai realitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Mayor', 'Objektif', 3, 'Isi pembicaraan sulit dimengerti'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Subjektif', 1, 'Merasa sulit berkonsentrasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Subjektif', 2, 'Merasa khawatir'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 1, 'Curiga berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 2, 'Waspada berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 3, 'Bicara berlebihan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 4, 'Sikap menentang atau permusuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 5, 'Wajah tegang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'), 'Minor', 'Objektif', 6, 'Pola tidur berubah');

-- INSERT sdki_faktor_risiko

-- D.0100 Risiko Distres Spiritual
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 1, 'Perubahan hidup'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 2, 'Perubahan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 3, 'Bencana alam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 4, 'Sakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 5, 'Sakit fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 7, 'Kecemasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 8, 'Perubahan dalam ritual agama'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 9, 'Perubahan dalam praktik spiritual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 10, 'Konflik spiritual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 11, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 12, 'Ketidakmampuan memaafkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 13, 'Kehilangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 14, 'Harga diri rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 15, 'Hubungan buruk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 16, 'Konflik rasial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 17, 'Berpisah dengan sistem pendukung'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 18, 'Stres');

-- D.0101 Risiko Harga Diri Rendah Kronis
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 1, 'Gangguan psikiatrik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 2, 'Kegagalan berulang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 3, 'Ketidaksesuaian budaya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 4, 'Ketidaksesuaian spiritual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 5, 'Ketidakefektifan koping terhadap kehilangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 6, 'Kurang mendapat kasih sayang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 7, 'Kurang keterlibatan dalam kelompok/masyarakat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 8, 'Kurang penghargaan dari orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 9, 'Ketidakmampuan menunjukkan perasaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 10, 'Perasaan kurang didukung orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 11, 'Pengalaman traumatik');

-- D.0102 Risiko Harga Diri Rendah Situasional
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 1, 'Gangguan gambaran diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 2, 'Gangguan fungsi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 3, 'Gangguan peran sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 4, 'Harapan tidak realistis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 5, 'Kurang pemahaman terhadap situasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 6, 'Penurunan kontrol terhadap lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 7, 'Penyakit fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 8, 'Perilaku tidak sesuai dengan nilai setempat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 9, 'Kegagalan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 10, 'Perasaan tidak berdaya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 11, 'Riwayat kehilangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 12, 'Riwayat pengabaian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 13, 'Riwayat penolakan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 14, 'Riwayat penganiayaan (mis. fisik, psikologis, seksual)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 15, 'Transisi perkembangan');

-- D.0103 Risiko Ketidakberdayaan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 1, 'Perjalanan penyakit yang berlangsung lama atau tidak dapat diprediksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 2, 'Harga diri rendah yang berlangsung lama'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 3, 'Status ekonomi rendah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 4, 'Ketidakmampuan mengatasi masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 5, 'Kurang dukungan sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 6, 'Penyakit yang melemahkan secara progresif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 7, 'Marginalisasi sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 8, 'Kondisi terstigma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 9, 'Penyakit terstigma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 10, 'Kurang terpapar informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 11, 'Kecemasan');

-- INSERT sdki_kondisi_klinis

-- D.0092 Ketidakberdayaan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 1, 'Diagnosa yang tidak terduga atau baru'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 2, 'Peristiwa traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 3, 'Diagnosa penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 4, 'Diagnosa penyakit terminal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0092'), 5, 'Rawat inap');

-- D.0093 Ketidakmampuan Koping Keluarga
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 1, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 2, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 3, 'Kelainan yang menyebabkan paralisis permanen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 4, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 5, 'Penyakit kronis (mis. kanker, arthritis reumatoid)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 7, 'Krisis keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0093'), 8, 'Konflik keluarga yang belum terselesaikan');

-- D.0094 Koping Defensif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 2, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 3, 'Attention Deficit/Hyperactivity Disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 4, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 5, 'Oppositional Defiant Disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0094'), 6, 'Delirium');

-- D.0095 Koping Komunitas Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 1, 'Insiden kekerasan tinggi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 2, 'Tingkat penyakit tinggi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0095'), 3, 'Sedikitnya kesempatan atau lokasi untuk interaksi komunitas');

-- D.0096 Koping Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 1, 'Kondisi perawatan kritis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 2, 'Attention Deficit/Hyperactivity Disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 3, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 4, 'Oppositional Defiant Disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 5, 'Gangguan kecemasan perpisahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 7, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 8, 'Gangguan amnestic'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 9, 'Intoksikasi zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0096'), 10, 'Putus zat');

-- D.0097 Penurunan Koping Keluarga
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 1, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 2, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 3, 'Kelainan yang menyebabkan paralisis permanen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 4, 'Kanker'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 5, 'Penyakit kronis (mis. kanker, arthritis reumatoid)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 7, 'Krisis keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0097'), 8, 'Konflik keluarga yang belum terselesaikan');

-- D.0098 Penyangkalan Tidak Efektif
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 2, 'Intoksikasi zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 3, 'Penyakit Alzheimer'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0098'), 4, 'Penyakit terminal');

-- D.0099 Perilaku Kesehatan Cenderung Berisiko
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 1, 'Kondisi baru terdiagnosis penyakit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 2, 'Kondisi perubahan gaya hidup baru akibat penyakit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 3, 'Tumor otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 4, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 5, 'Gangguan kepribadian dan psikotik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0099'), 6, 'Depresi/psikosis pasca persalinan');

-- D.0100 Risiko Distres Spiritual
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 1, 'Penyakit kronis (mis. arthritis rheumatoid, sklerosis multipel)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 2, 'Penyakit terminal (mis. kanker)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 3, 'Retardasi mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 4, 'Kehilangan ekstremitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 5, 'Sudden infant death syndrome (SIDS)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 6, 'Kelahiran mati, kematian janin, keguguran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0100'), 7, 'Kemandulan');

-- D.0101 Risiko Harga Diri Rendah Kronis
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 1, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 2, 'Penyakit degeneratif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 3, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 4, 'Gangguan perkembangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 5, 'Gangguan mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 7, 'Gangguan mood'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 8, 'Trauma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 9, 'Pasca pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'), 10, 'Kehilangan fungsi tubuh');

-- D.0102 Risiko Harga Diri Rendah Situasional
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 1, 'Cedera traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 2, 'Pembedahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 3, 'Kehamilan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 4, 'Kondisi baru terdiagnosis (mis. diabetes melitus)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 5, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 6, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'), 7, 'Demensia');

-- D.0103 Risiko Ketidakberdayaan
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 1, 'Diagnosis yang tidak terduga atau baru'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 2, 'Peristiwa traumatis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 3, 'Diagnosis penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 4, 'Diagnosis penyakit terminal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'), 5, 'Rawat inap');

-- D.0104 Sindrom Pasca Trauma
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 1, 'Korban kekerasan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 2, 'Post Traumatic Stress Disorder (PTSD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 3, 'Korban bencana alam'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 4, 'Multiple personality disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 5, 'Korban kekerasan seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 6, 'Korban peperangan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'), 7, 'Cedera multiple (kecelakaan lalu lintas)');


SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: Data master SDKI final
-- ============================================
