-- ============================================
-- DATA MASTER SLKI — D.0001 s.d. D.0020
-- DigiKep - Standar Luaran Keperawatan Indonesia
-- Sumber: PDF PPNI (batch halaman 7–116)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. LUARAN SLKI (tabel master)
-- Kolom: kode_luaran, label_luaran, kategori, subkategori, definisi
-- Gunakan INSERT IGNORE agar aman jika sudah ada
-- ============================================

INSERT IGNORE INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.01001', 'Bersihan Jalan Napas',         'Fisiologis', 'Respirasi',          'Kemampuan membersihkan sekret atau obstruksi jalan napas untuk mempertahankan jalan napas tetap paten.'),
('L.01002', 'Penyapihan Ventilator',         'Fisiologis', 'Respirasi',          'Kemampuan beradaptasi dengan pengurangan bantuan ventilator mekanik selama proses penyapihan.'),
('L.01003', 'Pertukaran Gas',                'Fisiologis', 'Respirasi',          'Keadekuatan oksigenasi dan/atau eliminasi karbon dioksida pada membran alveolus-kapiler.'),
('L.01004', 'Pola Napas',                    'Fisiologis', 'Respirasi',          'Inspirasi dan/atau ekspirasi yang memberikan ventilasi adekuat.'),
('L.01006', 'Tingkat Aspirasi',              'Fisiologis', 'Respirasi',          'Kondisi masuknya partikel cair atau padat ke dalam paru-paru.'),
('L.02008', 'Curah Jantung',                 'Fisiologis', 'Sirkulasi',          'Keadekuatan jantung memompa darah untuk memenuhi kebutuhan metabolisme tubuh.'),
('L.02010', 'Perfusi Gastrointestinal',      'Fisiologis', 'Sirkulasi',          'Keadekuatan aliran darah ke gastrointestinal untuk menunjang fungsi jaringan.'),
('L.02011', 'Perfusi Perifer',               'Fisiologis', 'Sirkulasi',          'Keadekuatan aliran darah pembuluh darah distal untuk menunjang fungsi jaringan.'),
('L.02012', 'Perfusi Miokard',               'Fisiologis', 'Sirkulasi',          'Keadekuatan aliran darah pada arteri koroner untuk menunjang fungsi miokard.'),
('L.02013', 'Perfusi Renal',                 'Fisiologis', 'Sirkulasi',          'Keadekuatan aliran darah pada pembuluh darah ginjal untuk menunjang fungsi ginjal.'),
('L.02014', 'Perfusi Serebral',              'Fisiologis', 'Sirkulasi',          'Keadekuatan aliran darah serebral untuk menunjang fungsi otak.'),
('L.02015', 'Sirkulasi Spontan',             'Fisiologis', 'Sirkulasi',          'Kemampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan.'),
('L.02017', 'Tingkat Perdarahan',            'Fisiologis', 'Sirkulasi',          'Kehilangan darah baik internal maupun eksternal.'),
('L.03018', 'Berat Badan',                   'Fisiologis', 'Nutrisi dan Cairan', 'Keadekuatan berat badan sesuai usia dan jenis kelamin.'),
('L.03027', 'Perilaku Menurunkan Berat Badan','Fisiologis', 'Nutrisi dan Cairan','Tindakan untuk mencapai dan mempertahankan berat badan yang sehat.'),
('L.03030', 'Status Nutrisi',                'Fisiologis', 'Nutrisi dan Cairan', 'Keadekuatan asupan nutrisi untuk memenuhi kebutuhan metabolisme.'),
('L.04033', 'Eliminasi Fekal',               'Fisiologis', 'Eliminasi',          'Kemampuan saluran gastrointestinal untuk membentuk dan mengeluarkan feses secara teratur.');


-- ============================================
-- 2. KRITERIA HASIL SLKI
-- Kolom: luaran_id (FK ke luaran_slki.id), urutan, deskripsi, arah
-- ============================================

-- L.01001 Bersihan Jalan Napas (D.0001)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'), 1, 'Batuk efektif',              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'), 2, 'Produksi sputum',            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'), 3, 'Mengi',                      'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'), 4, 'Wheezing',                   'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'), 5, 'Mekonium (pada neonatus)',   'Menurun');

-- L.01002 Penyapihan Ventilator (D.0002)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 1, 'Kesinkronan bantuan ventilator',         'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 2, 'Penggunaan otot bantu napas',            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 3, 'Napas megap-megap (gasping)',            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 4, 'Napas dangkal',                         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 5, 'Agitasi',                               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'), 6, 'Frekuensi napas / nilai gas darah arteri', 'Membaik');

-- L.01003 Pertukaran Gas (D.0003)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 1, 'Dispnea',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 2, 'Bunyi napas tambahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 3, 'Takikardi',         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 4, 'PCO₂',              'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 5, 'PO₂',               'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'), 6, 'pH arteri',         'Membaik');

-- L.01004 Pola Napas (D.0005)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01004'), 1, 'Dispnea',                  'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01004'), 2, 'Penggunaan otot bantu napas', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01004'), 3, 'Frekuensi napas',           'Membaik');

-- L.01006 Tingkat Aspirasi (D.0006)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 1,  'Tingkat kesadaran',          'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 2,  'Kemampuan menelan',          'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 3,  'Kebersihan mulut',           'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 4,  'Dispnea',                    'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 5,  'Kelemahan otot',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 6,  'Akumulasi sekret',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 7,  'Wheezing',                   'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 8,  'Batuk',                      'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 9,  'Penggunaan otot aksesori',   'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 10, 'Sianosis',                   'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 11, 'Gelisah',                    'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'), 12, 'Frekuensi napas',            'Membaik');

-- L.02008 Curah Jantung (D.0008, D.0011)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 1, 'Kekuatan nadi perifer',   'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 2, 'Bradikardia',             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 3, 'Takikardia',              'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 4, 'Palpitasi',              'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 5, 'Ortopnea',               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 6, 'Suara jantung S3 dan S4', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'), 7, 'Tekanan darah',           'Membaik');

-- L.02010 Perfusi Gastrointestinal (D.0013)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 1, 'Mual',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 2, 'Muntah',         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 3, 'Nyeri abdomen',  'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 4, 'Asites',         'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 5, 'Konstipasi',     'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 6, 'Bising usus',    'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 7, 'Nafsu makan',    'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'), 8, 'Frekuensi BAB',  'Membaik');

-- L.02011 Perfusi Perifer (D.0009, D.0015)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 1, 'Kekuatan nadi perifer',   'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 2, 'Penyembuhan luka',        'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 3, 'Warna kulit pucat',       'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 4, 'Edema perifer',           'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 5, 'Nyeri ekstremitas',       'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 6, 'Pengisian kapiler',       'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 7, 'Akral',                   'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'), 8, 'Turgor kulit',            'Membaik');

-- L.02012 Perfusi Miokard (D.0014)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02012'), 1, 'Tekanan darah', 'Membaik');

-- L.02013 Perfusi Renal (D.0016)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'), 1, 'Jumlah urine',           'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'), 2, 'Tekanan arteri rata-rata', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'), 3, 'Kadar urea nitrogen darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'), 4, 'Kadar kreatinin plasma',  'Membaik');

-- L.02014 Perfusi Serebral (D.0017)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'), 1, 'Tingkat kesadaran',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'), 2, 'Sakit kepala',            'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'), 3, 'Gelisah',                 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'), 4, 'Tekanan intrakranial',    'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'), 5, 'Tekanan arteri rata-rata', 'Membaik');

-- L.02015 Sirkulasi Spontan (D.0004, D.0007, D.0010)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 1, 'Tingkat kesadaran',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 2, 'Frekuensi nadi',          'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 3, 'Tekanan darah',           'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 4, 'Frekuensi napas',         'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 5, 'Suhu tubuh',              'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 6, 'Saturasi oksigen',        'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 7, 'Gambaran EKG aritmia',   'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 8, 'ETCO2',                   'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'), 9, 'Produksi urine',          'Membaik');

-- L.02017 Tingkat Perdarahan (D.0012)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'), 1, 'Hemoglobin',    'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'), 2, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'), 3, 'Suhu tubuh',    'Membaik');

-- L.03018 Berat Badan (D.0018)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'), 1, 'Indeks massa tubuh (IMT)', 'Membaik');

-- L.03027 Perilaku Menurunkan Berat Badan (D.0018)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03027'), 1, 'Menentukan target berat badan dalam rentang normal', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03027'), 2, 'Menghindari makanan dan minuman tinggi kalori',      'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03027'), 3, 'Mengontrol porsi makan',                            'Meningkat');

-- L.03030 Status Nutrisi (D.0018, D.0019)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 1,  'Porsi makanan yang dihabiskan',                        'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 2,  'Kekuatan otot pengunyah',                              'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 3,  'Verbalisasi keinginan untuk meningkatkan nutrisi',     'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 4,  'Pengetahuan tentang pilihan makanan yang sehat',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 5,  'Pengetahuan tentang pilihan minuman yang sehat',       'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 6,  'Pengetahuan tentang standar asupan nutrisi yang tepat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 7,  'Sikap terhadap makanan/minuman sesuai tujuan kesehatan','Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 8,  'Perasaan cepat kenyang',                               'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 9,  'Sariawan',                                             'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 10, 'Berat badan',                                          'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 11, 'Indeks massa tubuh (IMT)',                             'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 12, 'Frekuensi makan',                                      'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'), 13, 'Nafsu makan',                                          'Membaik');

-- L.04033 Eliminasi Fekal (D.0020)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 1, 'Kontrol pengeluaran feses',      'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 2, 'Keluhan defekasi lama dan sulit', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 3, 'Mengejan saat defekasi',          'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 4, 'Konsistensi feses',               'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 5, 'Frekuensi BAB',                   'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'), 6, 'Peristaltik usus',                'Membaik');


-- ============================================
-- 3. MAPPING sdki_slki_relations
-- Kolom: diagnosa_id (FK), luaran_id (FK)
-- ============================================

INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.01001')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.01002')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.01003')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.01004')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.01006')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02008')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02011')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02008')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02017')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02010')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02012')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02011')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02013')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.02014')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03027')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'));

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: SLKI untuk D.0001 - D.0020
-- Luaran unik (INSERT IGNORE): 17 kode luaran
-- Kriteria hasil: 82 baris
-- Mapping sdki_slki_relations: 22 baris
-- ============================================
