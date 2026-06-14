SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- SLKI DATA MASTER — D.0065 s/d D.0084
-- Sumber: PDF PPNI batch 2 (halaman 312–409)
-- Generated: 2026-06-13
-- ============================================================
-- CATATAN:
--   L.06054 (Tingkat Konfusi)   → dipakai oleh D.0065 DAN D.0068
--   L.08066 (Tingkat Nyeri)     → dipakai oleh D.0077, D.0078, D.0079
--   L.07005 → tercantum di PDF untuk D.0072 (kemungkinan typo L.07055),
--              di-insert apa adanya sesuai sumber.
-- ============================================================

-- ------------------------------------------------------------
-- 1. luaran_slki (master)
-- ------------------------------------------------------------
INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.06049', 'Kapasitas Adaptif Intrakranial', 'Fisiologis', 'Neurosensori',
 'Kestabilan mekanisme dinamika intrakranial dalam melakukan kompensasi terhadap stimulus yang dapat menurunkan kapasitas intrakranial.'),
('L.06051', 'Neurovaskuler Perifer', 'Fisiologis', 'Neurosensori',
 'Kemadekuatan sirkulasi, sensasi dan pergerakan neurovaskuler pada ekstremitas.'),
('L.06054', 'Tingkat Konfusi', 'Fisiologis', 'Neurosensori',
 'Derajat gangguan kesadaran, perhatian, kognitif dan persepsi.'),
('L.07005', 'Fungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas',
 'Integrasi aspek fisik dan sosioemosional terkait penyaluran dan kinerja seksual. (kode L.07005 sesuai PDF D.0072; lihat juga L.07055)'),
('L.07055', 'Fungsi Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas',
 'Integrasi aspek fisik dan sosioemosional terkait penyaluran dan kinerja seksual.'),
('L.07056', 'Identitas Seksual', 'Fisiologis', 'Reproduksi dan Seksualitas',
 'Kemampuan individu untuk mempertahankan identitas seksual yang konsisten dan terintegrasi dalam kehidupan sehari-hari.'),
('L.07057', 'Penerimaan Kehamilan', 'Fisiologis', 'Reproduksi dan Seksualitas',
 'Upaya untuk rekonsiliasi terhadap situasi masalah kehamilan.'),
('L.07059', 'Status Antepartum', 'Fisiologis', 'Reproduksi dan Seksualitas',
 'Kondisi pada periode kehamilan yang dihitung sejak hari pertama haid terakhir hingga dimulainya persalinan.'),
('L.07061', 'Status Kenyamanan Pasca Partum', 'Fisiologis', 'Nyeri dan Kenyamanan',
 'Perasaan nyaman yang berhubungan dengan kondisi setelah melahirkan.'),
('L.08064', 'Status Kenyamanan', 'Psikologis', 'Nyeri dan Kenyamanan',
 'Perasaan senang, lega dan sempurna dalam dimensi fisik, psikospiritual, lingkungan dan sosial.'),
('L.08065', 'Tingkat Nausea', 'Psikologis', 'Nyeri dan Kenyamanan',
 'Perasaan tidak nyaman pada bagian belakang tenggorokan atau lambung yang mengakibatkan muntah.'),
('L.08066', 'Tingkat Nyeri', 'Psikologis', 'Nyeri dan Kenyamanan',
 'Pengalaman sensorik atau emosional yang berkaitan dengan kerusakan jaringan aktual atau fungsional dengan onset mendadak atau lambat dan berintensitas ringan hingga berat dan konstan.'),
('L.09067', 'Citra Tubuh', 'Psikologis', 'Integritas Ego',
 'Persepsi tentang penampilan, struktur dan fungsi fisik individual.'),
('L.09070', 'Identitas Diri', 'Psikologis', 'Integritas Ego',
 'Kemampuan mempertahankan keutuhan persepsi terhadap identitas diri.'),
('L.09091', 'Status Spiritual', 'Psikologis', 'Integritas Ego',
 'Kondisi keyakinan atau sistem nilai berupa kemampuan merasakan makna dan tujuan hidup melalui hubungan dengan diri, orang lain, lingkungan atau Tuhan.'),
('L.09093', 'Tingkat Ansietas', 'Psikologis', 'Integritas Ego',
 'Kondisi emosional dan pengalaman subjektif terhadap objek yang tidak jelas dan spesifik akibat antisipasi bahaya yang memungkinkan individu melakukan tindakan untuk menghadapi ancaman.'),
('L.09094', 'Tingkat Berduka', 'Psikologis', 'Integritas Ego',
 'Derajat respons psikososial akibat kehilangan (orang, objek, fungsi, status, bagian tubuh atau hubungan).');

-- ------------------------------------------------------------
-- 2. slki_kriteria_hasil (child)
-- ------------------------------------------------------------

-- L.06049 — Kapasitas Adaptif Intrakranial (D.0066)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 1, 'Tingkat kesadaran dan fungsi kognitif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 2, 'Sakit kepala', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 3, 'Bradikardi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 4, 'Gelisah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 5, 'Agitasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 6, 'Muntah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 7, 'Postur deserebrasi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 8, 'Papiledema', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 9, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 10, 'Tekanan nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 11, 'Pola napas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 12, 'Respons pupil', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 13, 'Refleks neurologi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'), 14, 'Tekanan intrakranial', 'Membaik');

-- L.06051 — Neurovaskuler Perifer (D.0067)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 1, 'Sirkulasi arteri', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 2, 'Sirkulasi vena', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 3, 'Pergerakan sendi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 4, 'Pergerakan ekstremitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 5, 'Nyeri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 6, 'Perdarahan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 7, 'Luka tekan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 8, 'Frekuensi nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 9, 'Suhu tubuh', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 10, 'Warna kulit', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'), 11, 'Tekanan darah', 'Membaik');

-- L.06054 — Tingkat Konfusi (D.0065, D.0068)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 1, 'Fungsi kognitif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 2, 'Tingkat kesadaran', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 3, 'Aktivitas psikomotrik', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 4, 'Motivasi memulai/menyelesaikan perilaku terarah', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 5, 'Memori jangka pendek', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 6, 'Memori jangka panjang', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 7, 'Interpretasi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 8, 'Fungsi sosial', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'), 9, 'Respons terhadap stimulus', 'Membaik');

-- L.07005 — Fungsi Seksual kode PDF (D.0072)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 1, 'Kepuasan hubungan seksual', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 2, 'Mencari informasi untuk mencapai kepuasan seksual', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 3, 'Verbalisasi aktivitas seksual berubah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 4, 'Verbalisasi eksitasi seksual berubah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 5, 'Verbalisasi peran seksual berubah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 6, 'Verbalisasi fungsi seksual berubah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 7, 'Keluhan nyeri saat berhubungan seksual (dispareunia)', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 8, 'Keluhan hubungan seksual terbatas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 9, 'Keluhan sulit melakukan hubungan seksual', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 10, 'Verbalisasi perilaku seksual berubah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 11, 'Konflik nilai', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 12, 'Hasrat seksual', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 13, 'Orientasi seksual', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07005'), 14, 'Ketertarikan pada pasangan', 'Membaik');

-- L.07055 — Fungsi Seksual (D.0069)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 1, 'Kepuasan hubungan seksual', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 2, 'Verbalisasi aktivitas seksual berubah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 3, 'Verbalisasi eksitasi peran seksual berubah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 4, 'Verbalisasi peran seksual berubah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 5, 'Verbalisasi fungsi seksual berubah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'), 6, 'Keluhan nyeri saat berhubungan seksual (dispareunia)', 'Menurun');

-- L.07056 — Identitas Seksual (D.0071)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'), 1, 'Menunjukkan pendirian seksual yang jelas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'), 2, 'Integrasi orientasi seksual ke dalam kehidupan sehari-hari', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'), 3, 'Menyusun batasan-batasan sesuai jenis kelamin', 'Meningkat');

-- L.07057 — Penerimaan Kehamilan (D.0073)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'), 1, 'Verbalisasi penerimaan kehamilan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'), 2, 'Verbalisasi perasaan yang dialami', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'), 3, 'Perilaku mencari perawatan kehamilan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'), 4, 'Menyusun perencanaan kehamilan', 'Meningkat');

-- L.07059 — Status Antepartum (D.0070)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 1, 'Nausea', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 2, 'Muntah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 3, 'Edema', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 4, 'Nyeri abdomen', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 5, 'Nyeri epigastrik', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 6, 'Perdarahan vagina', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'), 7, 'Konstipasi', 'Membaik');

-- L.07061 — Status Kenyamanan Pasca Partum (D.0075)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'), 1, 'Keluhan tidak nyaman', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'), 2, 'Frekuensi nadi', 'Membaik');

-- L.08064 — Status Kenyamanan (D.0074)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 1, 'Keluhan tidak nyaman', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 2, 'Gelisah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 3, 'Keluhan sulit tidur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 4, 'Keluhan kedinginan/kepanasan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 5, 'Keluhan mual', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 6, 'Keluhan lelah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'), 7, 'Iritabilitas', 'Menurun');

-- L.08065 — Tingkat Nausea (D.0076)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 1, 'Perasaan ingin muntah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 2, 'Keluhan mual', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 3, 'Rasa asam di mulut', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 4, 'Pucat', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 5, 'Diaforesis', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 6, 'Takikardia', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 7, 'Saliva', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'), 8, 'Nafsu makan', 'Membaik');

-- L.08066 — Tingkat Nyeri (D.0077, D.0078, D.0079)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 1, 'Keluhan nyeri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 2, 'Meringis', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 3, 'Sikap protektif', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 4, 'Gelisah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 5, 'Kesulitan tidur', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 6, 'Frekuensi nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 7, 'Pola napas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 8, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'), 9, 'Nafsu makan', 'Membaik');

-- L.09067 — Citra Tubuh (D.0083)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 1, 'Melihat bagian tubuh', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 2, 'Menyentuh bagian tubuh', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 3, 'Verbalisasi kecacatan bagian tubuh', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 4, 'Verbalisasi kehilangan bagian tubuh', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 5, 'Respon nonverbal pada perubahan tubuh', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09067'), 6, 'Hubungan sosial', 'Membaik');

-- L.09070 — Identitas Diri (D.0084)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09070'), 1, 'Perilaku konsisten', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09070'), 2, 'Perasaan fluktuatif terhadap diri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09070'), 3, 'Persepsi terhadap diri', 'Membaik');

-- L.09091 — Status Spiritual (D.0082)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 1, 'Verbalisasi makna dan tujuan hidup', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 2, 'Verbalisasi kepuasan terhadap makna hidup', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 3, 'Verbalisasi perasaan keberdayaan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 4, 'Verbalisasi menyalahkan diri sendiri', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09091'), 5, 'Interaksi dengan orang terdekat/tokoh agama', 'Membaik');

-- L.09093 — Tingkat Ansietas (D.0080)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 1, 'Verbalisasi kebingungan', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 2, 'Verbalisasi khawatir akibat kondisi yang dihadapi', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 3, 'Perilaku gelisah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 4, 'Perilaku tegang', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 5, 'Frekuensi napas', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 6, 'Frekuensi nadi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 7, 'Tekanan darah', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 8, 'Konsentrasi', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'), 9, 'Pola tidur', 'Membaik');

-- L.09094 — Tingkat Berduka (D.0081)
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'), 1, 'Verbalisasi menerima kehilangan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'), 2, 'Verbalisasi perasaan sedih', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'), 3, 'Verbalisasi perasaan bersalah atau menyalahkan orang lain', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'), 4, 'Pola tidur', 'Membaik');

-- ------------------------------------------------------------
-- 3. sdki_slki_relations
-- ------------------------------------------------------------
INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.06054')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.06049')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.06051')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.06054')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07055')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07059')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07056')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0072'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07005')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0073'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07057')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.08064')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.07061')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.08065')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09093')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09094')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0082'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09091')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0083'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09067')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0084'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09070'));

SET FOREIGN_KEY_CHECKS = 1;
