-- ============================================
-- DATA MASTER BATCH 14: D.0141 – D.0149
-- DigiKep - SDKI / SLKI / SIKI (FINAL BATCH)
-- Sumber: Data Master Markdown (mahasiswa Polsub)
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. SLKI (Luaran) - Physiological Final
-- ============================================

INSERT IGNORE INTO slki (kode_luaran, nama_luaran, kategori, subkategori, definisi) VALUES
('L.14135', 'Hipotermia', 'Fisiologis', 'Regulasi Fisiologis', 'Suhu tubuh berada dalam rentang normal atau hangat.'),
('L.02015', 'Bersih Jalan Napas', 'Fisiologis', 'Respirasi', 'Terbukanya jalan napas dalam kondisi normal.'),
('L.02011', 'Status Pernapasan', 'Fisiologis', 'Respirasi', 'Kemampuan bernapas dengan cukup untuk memenuhi kebutuhan oksigen.'),
('L.01017', 'Status Kardiovaskular', 'Fisiologis', 'Kardiovaskular', 'Kemampuan kardiovaskular dalam memenuhi kebutuhan sirkulasi darah.'),
('L.08072', 'Tingkat Nyeri', 'Fisiologis', 'Kenyamanan', 'Tingkat nyeri yang dirasakan pasien.'),
('L.03034', 'Status Hidrasi', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Keseimbangan cairan tubuh dalam rentang normal.');


-- ============================================
-- 2. SLKI KRITERIA HASIL
-- ============================================

-- L.14135 Hipotermia
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.14135', 1, 'Menggigil menurun', 'Menurun'),
('L.14135', 2, 'Suhu tubuh meningkat', 'Meningkat'),
('L.14135', 3, 'Kesadaran meningkat', 'Meningkat');

-- L.02015 Bersih Jalan Napas
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02015', 1, 'Kemampuan batuk efektif', 'Meningkat'),
('L.02015', 2, 'Suara napas normal', 'Meningkat');

-- L.02011 Status Pernapasan
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, deskripsi, arah) VALUES
('L.02011', 1, 'Frekuensi pernapasan normal', 'Meningkat'),
('L.02011', 2, 'Kedalaman pernapasan normal', 'Meningkat'),
('L.02011', 3, 'Saturasi oksigen normal', 'Meningkat');

-- L.01017 Status Kardiovaskular
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.01017', 1, 'Tekanan darah normal', 'Meningkat'),
('L.01017', 2, 'Denyut jantung normal', 'Meningkat'),
('L.01017', 3, 'Isi nadi normal', 'Meningkat');

-- L.08072 Tingkat Nyeri
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.08072', 1, 'Nyeri berkurang', 'Menurun'),
('L.08072', 2, 'Kemampuan tidur meningkat', 'Meningkat'),
('L.08072', 3, 'Kemampuan aktivitas meningkat', 'Meningkat');

-- L.03034 Status Hidrasi
INSERT INTO slki_kriteria_hasil (kode_luaran, urutan, descripsi, arah) VALUES
('L.03034', 1, 'Asupan cairan normal', 'Meningkat'),
('L.03034', 2, 'Turgor kulit elastis', 'Meningkat'),
('L.03034', 3, 'Membran mukosa lembab', 'Meningkat');


-- ============================================
-- 3. SIKI (Intervensi)
-- ============================================

INSERT IGNORE INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, tipe_intervensi, definisi) VALUES
('I.15507', 'Manajemen Hipotermia', 'Fisiologis', 'Regulasi Fisiologis', 'Utama', 'Mengelola suhu tubuh yang menurun.'),
('I.02119', 'Manajemen Jalan Napas', 'Fisiologis', 'Respirasi', 'Utama', 'Mengidentifikasi dan mengelola jalan napas yang terganggu.'),
('I.02049', 'Manajemen Oksigen', 'Fisiologis', 'Respirasi', 'Utama', 'Memberikan oksigen untuk memenuhi kebutuhan respirasi.'),
('I.01066', 'Dukungan Kardiovaskular', 'Fisiologis', 'Kardiovaskular', 'Utama', 'Memfasilitasi fungsi kardiovaskular yang optimal.'),
('I.08243', 'Manajemen Nyeri', 'Fisiologis', 'Kenyamanan', 'Utama', 'Mengidentifikasi dan mengelola nyeri.'),
('I.03118', 'Manajemen Cairan', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Utama', 'Mengidentifikasi dan mengelola keseimbangan cairan tubuh.');


-- ============================================
-- 4. SIKI TINDAKAN
-- ============================================

-- I.15507 Manajemen Hipotermia
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.15507'), 'Observasi', 1, 'Monitor suhu tubuh'),
((SELECT id FROM siki WHERE kode_intervensi='I.15507'), 'Terapeutik', 1, 'Hangatkan pasien secara gradual'),
((SELECT id FROM siki WHERE kode_intervensi='I.15507'), 'Edukasi', 1, 'Ajarkan pencegahan hipotermia');

-- I.02119 Manajemen Jalan Napas
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02119'), 'Observasi', 1, 'Monitor pola pernapasan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02119'), 'Terapeutik', 1, 'Posisikan untuk pernapasan optimal'),
((SELECT id FROM siki WHERE kode_intervensi='I.02119'), 'Terapeutik', 2, 'Lakukan penghisapan lendir'),
((SELECT id FROM siki WHERE kode_intervensi='I.02119'), 'Edukasi', 1, 'Ajarkan batuk efektif');

-- I.02049 Manajemen Oksigen
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02049'), 'Observasi', 1, 'Monitor saturasi oksigen'),
((SELECT id FROM siki WHERE kode_intervensi='I.02049'), 'Terapeutik', 1, 'Berikan oksigen sesuai order'),
((SELECT id FROM siki WHERE kode_intervensi='I.02049'), 'Edukasi', 1, 'Jelaskan pentingnya oksigenasi');

-- I.01066 Dukungan Kardiovaskular
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01066'), 'Observasi', 1, 'Monitor tanda vital'),
((SELECT id FROM siki WHERE kode_intervensi='I.01066'), 'Terapeutik', 1, 'Posisikan untuk aliran darah optimal'),
((SELECT id FROM siki WHERE kode_intervensi='I.01066'), 'Edukasi', 1, 'Ajarkan aktivitas sesuai kemampuan');

-- I.08243 Manajemen Nyeri
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Observasi', 1, 'Identifikasi karakteristik nyeri'),
((SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Terapeutik', 1, 'Berikan posisi yang nyaman'),
((SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Terapeutik', 2, 'Lakukan relaksasi dan distraksi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Edukasi', 1, 'Ajarkan teknik mengelola nyeri');

-- I.03118 Manajemen Cairan
INSERT INTO siki_tindakan (siki_id, jenis, urutan, descripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.03118'), 'Observasi', 1, 'Monitor asupan dan keluaran cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03118'), 'Terapeutik', 1, 'Fasilitasi asupan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.03118'), 'Edukasi', 1, 'Ajarkan pentingnya hidrasi');


-- ============================================
-- 5. SDKI (Diagnosa) - FINAL 9 DIAGNOSES
-- ============================================

INSERT IGNORE INTO sdki (kode_diagnosa, nama_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0141', 'Hipotermia', 'Fisiologis', 'Regulasi Fisiologis', 'Aktual', 'Suhu tubuh menurun di bawah rentang normal.'),
('D.0142', 'Gangguan Bersihan Jalan Napas', 'Fisiologis', 'Respirasi', 'Aktual', 'Ketidakmampuan membersihkan sekresi atau obstruksi jalan napas.'),
('D.0143', 'Gangguan Pola Pernapasan', 'Fisiologis', 'Respirasi', 'Aktual', 'Perubahan frekuensi, kedalaman, dan ritme pernapasan.'),
('D.0144', 'Gangguan Perfusi Jaringan', 'Fisiologis', 'Kardiovaskular', 'Aktual', 'Gangguan sirkulasi darah ke jaringan.'),
('D.0145', 'Nyeri Akut', 'Fisiologis', 'Kenyamanan', 'Aktual', 'Pengalaman sensorik dan emosional yang tidak menyenangkan akibat kerusakan jaringan.'),
('D.0146', 'Nyeri Kronis', 'Fisiologis', 'Kenyamanan', 'Aktual', 'Pengalaman nyeri yang berlangsung lebih dari 3 bulan.'),
('D.0147', 'Risiko Ketidakseimbangan Cairan', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Risiko', 'Berisiko mengalami ketidakseimbangan asupan dan keluaran cairan.'),
('D.0148', 'Ketidakseimbangan Elektrolit', 'Fisiologis', 'Pencernaan dan Nutrisi', 'Aktual', 'Ketidakseimbangan mineral dalam tubuh.'),
('D.0149', 'Termoregulasi Tidak Efektif', 'Fisiologis', 'Regulasi Fisiologis', 'Aktual', 'Kegagalan mempertahankan suhu tubuh dalam rentang normal.');


-- ============================================
-- 6. SDKI PENYEBAB (minimal)
-- ============================================

-- D.0141 Hipotermia
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0141'), 'Situasional', 1, 'Terpapar lingkungan dingin'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0141'), 'Fisiologis', 1, 'Ketidakadekuatan pakaian');

-- D.0142 Gangguan Bersihan Jalan Napas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0142'), 'Fisiologis', 1, 'Penumpukan sekresi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0142'), 'Fisiologis', 2, 'Edema jalan napas');

-- D.0145 Nyeri Akut
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0145'), 'Fisiologis', 1, 'Kerusakan jaringan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0145'), 'Fisiologis', 2, 'Proses inflamasi');

-- D.0147 Risiko Ketidakseimbangan Cairan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0147'), 'Fisiologis', 1, 'Kehilangan cairan'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0147'), 'Fisiologis', 2, 'Asupan cairan kurang');

-- D.0149 Termoregulasi Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, descripsi) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 1, 'Gangguan pusat termoregulasi'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0149'), 'Fisiologis', 2, 'Fluktuasi suhu lingkungan');


-- ============================================
-- 7. MAPPING SDKI ↔ SLKI
-- ============================================

INSERT IGNORE INTO sdki_slki (sdki_id, slki_id) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0141'), (SELECT id FROM slki WHERE kode_luaran='L.14135')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0142'), (SELECT id FROM slki WHERE kode_luaran='L.02015')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0143'), (SELECT id FROM slki WHERE kode_luaran='L.02011')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0144'), (SELECT id FROM slki WHERE kode_luaran='L.01017')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0145'), (SELECT id FROM slki WHERE kode_luaran='L.08072')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0146'), (SELECT id FROM slki WHERE kode_luaran='L.08072')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0147'), (SELECT id FROM slki WHERE kode_luaran='L.03034')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0148'), (SELECT id FROM slki WHERE kode_luaran='L.03034')),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0149'), (SELECT id FROM slki WHERE kode_luaran='L.14134'));


-- ============================================
-- 8. MAPPING SDKI ↔ SIKI
-- ============================================

INSERT IGNORE INTO sdki_siki (sdki_id, siki_id, tipe_siki) VALUES
((SELECT id FROM sdki WHERE kode_diagnosa='D.0141'), (SELECT id FROM siki WHERE kode_intervensi='I.15507'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0142'), (SELECT id FROM siki WHERE kode_intervensi='I.02119'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0143'), (SELECT id FROM siki WHERE kode_intervensi='I.02049'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0144'), (SELECT id FROM siki WHERE kode_intervensi='I.01066'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0145'), (SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0146'), (SELECT id FROM siki WHERE kode_intervensi='I.08243'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0147'), (SELECT id FROM siki WHERE kode_intervensi='I.03118'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0148'), (SELECT id FROM siki WHERE kode_intervensi='I.03118'), 'Utama'),
((SELECT id FROM sdki WHERE kode_diagnosa='D.0149'), (SELECT id FROM siki WHERE kode_intervensi='I.15506'), 'Utama');

SET FOREIGN_KEY_CHECKS = 1;
