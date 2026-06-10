-- ============================================
-- DATA MASTER SDKI - DigiKep
-- Sumber: Standar Diagnosis Keperawatan Indonesia (PPNI)
-- Halaman 18-61 (D.0001 - D.0021)
-- ============================================

-- ============================================
-- INSERT TABEL sdki
-- ============================================

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
('D.0021', 'Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual', 'Peningkatan, penurunan, tidak efektif atau kurangnya aktivitas peristaltik gastrointestinal.')
ON DUPLICATE KEY UPDATE
  label_diagnosa=VALUES(label_diagnosa), kategori=VALUES(kategori),
  subkategori=VALUES(subkategori), tipe_diagnosa=VALUES(tipe_diagnosa),
  definisi=VALUES(definisi);


-- ============================================
-- INSERT sdki_penyebab
-- ============================================

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

-- D.0010â€“D.0017 Risiko - tidak ada penyebab (tipe Risiko)

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


-- ============================================
-- INSERT sdki_faktor_risiko
-- ============================================

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


-- ============================================
-- INSERT sdki_gejala
-- ============================================

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
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), 'Minor', 'Objektif', 1, 'Suhu tubuh <34,5 Â°C'),
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


-- ============================================
-- INSERT sdki_kondisi_klinis
-- ============================================

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

-- ============================================
-- Selesai: D.0001 - D.0021 (21 diagnosa)
-- ============================================
