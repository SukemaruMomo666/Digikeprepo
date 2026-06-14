SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 1. diagnosa_sdki (127 diagnosa)
-- ============================================================
INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa) VALUES
  ('D.0001', 'Bersihan Jalan Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0002', 'Gangguan Penyapihan Ventilator', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0003', 'Gangguan Pertukaran Gas', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0004', 'Gangguan Ventilasi Spontan', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0005', 'Pola Napas Tidak Efektif', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0006', 'Risiko Aspirasi', 'Fisiologis', 'Respirasi', 'Risiko'),
  ('D.0007', 'Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Aktual'),
  ('D.0008', 'Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Aktual'),
  ('D.0009', 'Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Aktual'),
  ('D.0010', 'Risiko Gangguan Sirkulasi Spontan', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0011', 'Risiko Penurunan Curah Jantung', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0012', 'Risiko Perdarahan', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0013', 'Risiko Perfusi Gastrointestinal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0014', 'Risiko Perfusi Miokard Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0015', 'Risiko Perfusi Perifer Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0016', 'Risiko Perfusi Renal Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0017', 'Risiko Perfusi Serebral Tidak Efektif', 'Fisiologis', 'Sirkulasi', 'Risiko'),
  ('D.0018', 'Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0019', 'Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0020', 'Diare', 'Fisiologis', 'Nutrisi', 'Aktual'),
  ('D.0021', 'Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0022', 'Hipervolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0023', 'Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0024', 'Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0025', 'Kesiapan Peningkatan Keseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan'),
  ('D.0026', 'Kesiapan Peningkatan Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Promosi Kesehatan'),
  ('D.0027', 'Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0028', 'Menyusui Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0029', 'Menyusui Tidak Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Aktual'),
  ('D.0030', 'Obesitas', 'Fisiologis', 'Nutrisi', 'Aktual'),
  ('D.0031', 'Risiko Berat Badan Lebih', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0032', 'Risiko Defisit Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0033', 'Risiko Disfungsi Motilitas Gastrointestinal', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0034', 'Risiko Hipovolemia', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0035', 'Risiko Ikterik Neonatus', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0036', 'Risiko Ketidakseimbangan Cairan', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0037', 'Risiko Ketidakseimbangan Elektrolit', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0038', 'Risiko Ketidakstabilan Kadar Glukosa Darah', 'Fisiologis', 'Nutrisi dan Cairan', 'Risiko'),
  ('D.0040', 'Gangguan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0041', 'Inkontinensia Fekal', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0042', 'Inkontinensia Urin Berlanjut', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0043', 'Inkontinensia Urin Berlebih', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0044', 'Inkontinensia Urin Fungsional', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0045', 'Inkontinensia Urin Refleks', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0046', 'Inkontinensia Urin Sters', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0047', 'Inkontinensia Urine Urgensi', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0048', 'Kesiapan Peningkatan Eliminasi Urin', 'Fisiologis', 'Eliminasi', 'Promosi Kesehatan'),
  ('D.0049', 'Konstipasi', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0050', 'Retensi Urine', 'Fisiologis', 'Eliminasi', 'Aktual'),
  ('D.0051', 'Risiko Inkontinensia Urine Urgensi', 'Fisiologis', 'Eliminasi', 'Risiko'),
  ('D.0052', 'Risiko Konstipasi', 'Fisiologis', 'Eliminasi', 'Risiko'),
  ('D.0053', 'Disorganisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual'),
  ('D.0055', 'Gangguan pola tidur', 'Fisiologis', 'Aktivitas/istirahat', 'Aktual'),
  ('D.0056', 'Intoleransi Aktivitas', 'Fisiologis Aktivitas/Istirahat', NULL, 'Aktual'),
  ('D.0057', 'Keletihan', 'Fisiologis', 'Aktivitas/Istirahat', 'Aktual'),
  ('D.0058', 'Kesiapan Peningkatan tidur', 'Fisiologis', 'Aktivitas/istirahat', 'Promosi Kesehatan'),
  ('D.0059', 'Risiko Disorganisasi Perilaku Bayi', 'Fisiologis', 'Aktivitas / Istirahat', 'Risiko'),
  ('D.0060', 'Risiko Intoleransi Aktivitas', 'Fisiologis', 'Aktivitas/istrahat', 'Risiko'),
  ('D.0061', 'Disrefleksia Otonom', 'Fisiologis', 'Neurosensori', 'Aktual'),
  ('D.0062', 'Gangguan Memori', 'Fisiologis', 'Neurosensori', 'Aktual'),
  ('D.0063', 'Gangguan Menelan', 'Fisiologis', 'Respirasi', 'Aktual'),
  ('D.0064', 'Konfusi Akut', 'fisiologis', 'neurosensory', 'Aktual'),
  ('D.0065', 'Konfusi Kronis', 'Fisiologis', 'Neurosensori', 'Aktual'),
  ('D.0066', 'Penurunan Kapasitas Adaptif Intrakranial', 'Fisiologis', 'Neurosensori', 'Aktual'),
  ('D.0067', 'Risiko Disfungsi Neurovaskuler Perifer', 'Fisiologis', 'Neurosensori', 'Risiko'),
  ('D.0068', 'Risiko Konfusi Akut', 'Fisiologis', 'Neurosensori', 'Risiko'),
  ('D.0069', 'Disfungsi Seksual', 'Fisiologis', 'Reproduksi dan', 'Aktual'),
  ('D.0070', 'Kesiapan Persalinan', 'Fisiologis', 'Reproduksi dan', 'Promosi Kesehatan'),
  ('D.0071', 'Pola seksual tidak efektif', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Aktual'),
  ('D.0072', 'Risiko Disfungsi Seksual', NULL, NULL, 'Risiko'),
  ('D.0073', 'Risiko Kehamilan Tidak Dikehendaki', 'Fisiologis', NULL, 'Risiko'),
  ('D.0074', 'Gangguan Rasa Nyaman', 'Psikologi', 'Nyeri Dan', 'Aktual'),
  ('D.0075', 'Ketidaknyamanan Pasca Partum', 'Fisiologis', 'Nyeri dan', 'Aktual'),
  ('D.0076', 'Neusea', 'psikologis', 'nyeri dan kenyaman', 'Aktual'),
  ('D.0077', 'Nyeri Akut', 'psikologis', 'nyeri dan kenyamanan', 'Aktual'),
  ('D.0078', 'Nyeri Kronis', 'Psikologis', 'Nyeri dan', 'Aktual'),
  ('D.0079', 'Nyeri Melahirkan', 'Psikologis', 'Nyeri dan', 'Aktual'),
  ('D.0080', 'Ansietas', NULL, NULL, 'Aktual'),
  ('D.0081', 'Berduka', 'Psikologis', 'Integritas Ego', 'Aktual'),
  ('D.0101', 'Risiko Harga Diri Rendah', 'Psikologis', 'Integritas Ego', 'Risiko'),
  ('D.0102', 'Risiko Harga Diri Rendah Situasional', 'Psikologis', 'Integritas Ego', 'Risiko'),
  ('D.0103', 'Risiko ketidak berdayaan', 'psikologis', 'integritas ego', 'Risiko'),
  ('D.0104', 'Sindrom Pasca Trauma', NULL, NULL, 'Aktual'),
  ('D.0105', 'Waham', 'Psikologis', 'Integritas Ego', 'Aktual'),
  ('D.0106', 'Gangguan Tumbuh Kembang', 'Psikologis', 'Pertumbuhan dan', 'Aktual'),
  ('D.0107', 'Risiko Gangguan Perkembangan', 'Psikologis', 'Pertumbuhan dan', 'Risiko'),
  ('D.0108', 'Risiko Gangguan Pertumbuhan', 'Psikologis', 'Pertumbuhan dan', 'Risiko'),
  ('D.0109', 'Defisit Perawatan Diri (spesifikan)', 'perilaku', 'kebersihan diri', 'Aktual'),
  ('D.0110', 'Defisit Kesehatan Komunitas', 'Perilaku', NULL, 'Aktual'),
  ('D.0111', 'Syndrome (SARS) Dfisit Pengetahuan', 'perilaku', 'penyuluhan dan pembelajaran', 'Aktual'),
  ('D.0112', 'Kesiapan Peningkatan Manajemen Kesehatan', 'Perilaku', 'Penyuluhan dan', 'Promosi Kesehatan'),
  ('D.0113', 'Kesiapan Peningkatan Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Promosi Kesehatan'),
  ('D.0114', 'Ketidakpatuhan Kategori : Perilaku', NULL, 'Penyuluhan dan', 'Aktual'),
  ('D.0115', 'Manajemen Kesehatan Keluarga Tidak Efektif', 'Perilaku', NULL, 'Aktual'),
  ('D.0116', 'Manajemen Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan', 'Aktual'),
  ('D.0117', 'Pemeliharaan Kesehatan Tidak Efektif', 'Perilaku', NULL, 'Aktual'),
  ('D.0118', 'Gangguan Interaksi Sosial', 'Relasional', NULL, 'Aktual'),
  ('D.0119', 'Gangguan komunikasi verbal', 'Relasional', 'Interaksi Sosial', 'Aktual'),
  ('D.0120', 'Gangguan Proses Keluarga', 'Relational', NULL, 'Aktual'),
  ('D.0121', 'Isolasi Sosial', 'Relasional', 'Interaksi Sosial', 'Aktual'),
  ('D.0122', 'Kesiapan Peningkatan Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan'),
  ('D.0123', 'Kesiapan Peningkatan Proses Keluarga', 'Relasional', 'Interaksi Sosial', 'Promosi Kesehatan'),
  ('D.0124', 'Ketegangan Peran Pemberian Asuhan', 'Relasional', 'Interaksi Sosial', 'Aktual'),
  ('D.0125', 'Penampilan Peran Tidak Efektif', 'Relasional', 'Interaksi Sosial', 'Aktual'),
  ('D.0126', 'Pencapaian Peran Menjadi Orang Tua', 'Relasional', 'Interaksi Sosial', 'Aktual'),
  ('D.0127', 'Risiko Gangguan Perlekatan', 'Relasional', 'Interaksi', 'Risiko'),
  ('D.0128', 'Risiko Proses Pengasuhan Tidak Efaktif', 'Relasional', 'Interaksi sosial', 'Risiko'),
  ('D.0129', 'Gangguan Integritas Kulit/Jaringan', 'Lingkungan', 'Keamanan dan proteksi', 'Aktual'),
  ('D.0130', 'Hipertermia', NULL, NULL, 'Aktual'),
  ('D.0131', 'Hipotermia', 'Lingkungan', 'Keamanan dan', 'Aktual'),
  ('D.0132', 'Perilaku Kekerasan Kategori : Lingkungan', NULL, 'Keamanan dan', 'Aktual'),
  ('D.0133', 'Perlambatan Pemulihan Pascabedah', 'lingkungan', NULL, 'Aktual'),
  ('D.0134', 'Risiko Alergi', 'Lingkungan', 'Keamanan Dan Protekeksi', 'Risiko'),
  ('D.0135', 'Risiko Bunuh Diri', 'lingkungan', 'keamanan dan', 'Risiko'),
  ('D.0136', 'Risiko Cedera', 'lingkungan', 'keamanan dan proteksi', 'Risiko'),
  ('D.0137', 'Risiko cedera pada ibu', 'Lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0138', 'Risiko cedera pada janin', 'lingkungan', 'keamanan dan proteksi', 'Risiko'),
  ('D.0139', 'Risiko Gangguan Integritas Kulit/Jaringan', 'Lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0140', 'Risiko Hipotermia', 'Lingkungan', 'Keamanan dan proteksi', 'Risiko'),
  ('D.0141', 'Risiko Hipotermia Perioperatif', 'Lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0142', 'Tindakan Pembedahan Risiko Infeksi', 'lingkungan', 'keamanan dan proteksi', 'Risiko'),
  ('D.0143', 'Risiko Jatuh', 'Lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0144', 'Risiko Luka Tekan', 'lingkungan', 'keamanan', 'Risiko'),
  ('D.0145', 'Risiko Mutilasi Diri', 'lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0147', 'Abnormalitas neurotransmitter otak Risiko Perlambatan Pemulihan Pascabedah', 'Lingkungan', 'Kemanan dan', 'Risiko'),
  ('D.0148', 'Risiko Termoregulasi Tidak Efektif', 'Lingkungan', 'Keamanan dan', 'Risiko'),
  ('D.0149', 'Termoregulasi Tidak Efektif', 'Lingkungan', 'Keamanan dan', 'Aktual');

-- ============================================================
-- 2. luaran_slki (74 luaran unik)
-- ============================================================
INSERT INTO luaran_slki (kode_luaran, label_luaran) VALUES
  ('L.01001', 'Bersihan Jalan Nafas'),
  ('L.01002', 'Penyapihan ventilator'),
  ('L.01003', 'Pertukaran Gas'),
  ('L.01004', 'Pola Napas'),
  ('L.01006', 'Tingkat Aspirasi'),
  ('L.02008', 'Curah Jantung'),
  ('L.02010', 'Perfusi Gastrointestinal'),
  ('L.02011', 'Perfusi Miokard'),
  ('L.02013', 'Perfusi Renal'),
  ('L.02014', 'Perfusi Serebral'),
  ('L.02015', 'Sirkulasi Spontan'),
  ('L.02017', 'Tingkat Perdarahan'),
  ('L.03018', 'Berat badan'),
  ('L.03020', 'Keseimbangan Cairan'),
  ('L.03021', 'Keseimbangan Elektrolit'),
  ('L.03022', 'Ketidakstabilan glukosa kadar darah'),
  ('L.03023', 'Motilitas Gastrointestinal'),
  ('L.03028', 'Status Cairan Membaik'),
  ('L.03029', 'Status Menyusui'),
  ('L.03030', 'Status Nutrisi'),
  ('L.03033', 'Tingkat Nyeri'),
  ('L.04033', 'Eliminasi Fekal'),
  ('L.04034', 'Eliminasi Urine'),
  ('L.04036', 'Kontinensia Urine'),
  ('L.05043', 'Organisasi Perilaku Bayi'),
  ('L.05045', 'Pola tidur'),
  ('L.05046', 'Tingkat Keletihan'),
  ('L.05047', 'Toleransi Aktivitas'),
  ('L.06049', 'Kapasitas adaptif intrakranial'),
  ('L.06051', 'Neurovaskuler Perifer'),
  ('L.06052', 'Status Menelan'),
  ('L.06053', 'Status Neurologis'),
  ('L.06054', 'Tingkat Konfusi'),
  ('L.07055', 'Fungsi seksual'),
  ('L.07056', 'Identitas Seksual'),
  ('L.07057', 'Penerimaan Kehamilan'),
  ('L.07059', 'Status Antepartum Definisi:'),
  ('L.07061', 'Status Kenyamanan Pasca Partum'),
  ('L.08064', 'Status Kenyamanan'),
  ('L.08065', 'Tingkat Nausea Definisi : perasaan tidak nyaman pada bagian belakang tenggork'),
  ('L.08066', 'Tingkat nyeri'),
  ('L.09069', 'Harga Diri'),
  ('L.09071', 'SLKI Keberdayaan'),
  ('L.09073', 'Ketahanan Personal Definisi :'),
  ('L.09076', 'Kontrol diri'),
  ('L.09079', 'Memori'),
  ('L.09088', 'Status Koping Keluarga'),
  ('L.09090', 'Status orientasi'),
  ('L.09093', 'Tingkat Ansietas'),
  ('L.09094', 'Tingkat Berduka'),
  ('L.10101', 'Status Perkembangan'),
  ('L.10102', 'Status Pertumbuhan'),
  ('L.11103', 'Perawatan Diri'),
  ('L.12104', 'MANAJEMEN KESEHATAN'),
  ('L.12106', 'Pemeliharaan Kesehatan'),
  ('L.12110', 'Tingkat Kepatuhan Definisi :'),
  ('L.12111', 'Tingkat pengetahuan'),
  ('L.13115', 'Interaksi Sosial Definisi :'),
  ('L.13116', 'Keterlibatan Sosial'),
  ('L.13118', 'Komunikasi Verbal'),
  ('L.13119', 'Penampilan Peran'),
  ('L.13120', 'Peran Menjadi Orang Tua'),
  ('L.13121', 'Peran Pemberi Asuhan'),
  ('L.13122', 'PERLEKATAN MENINGKAT'),
  ('L.13123', 'Proses Keluarga Definisi :'),
  ('L.13124', 'Proses Pengasuhan'),
  ('L.14125', 'Integritas Kulit dan Jaringan'),
  ('L.14127', 'Potensi Injuri'),
  ('L.14129', 'Pemulihan Pasca Bedah'),
  ('L.14133', 'Pola Tidur'),
  ('L.14134', 'Termoregulasi'),
  ('L.14136', 'LUARAN UTAMA TINGKAT CEDERA'),
  ('L.14137', 'Tingkat Infeksi'),
  ('L.14138', 'Tingkat Jatuh Kriteria Hasil :');

-- ============================================================
-- 3. intervensi_siki (125 intervensi unik)
-- ============================================================
INSERT INTO intervensi_siki (kode_intervensi, label_intervensi) VALUES
  ('I.003116', 'Manejemen Hipovolemia'),
  ('I.01001', 'Latihan Batuk Efektif'),
  ('I.01004', 'Manajemen pendarahan'),
  ('I.01011', 'Manajemen Jalan Napas'),
  ('I.01014', 'Pemantauan Respirasi'),
  ('I.01018', 'Pencegahan Aspirasi'),
  ('I.01019', ''),
  ('I.01021', 'Mekanik'),
  ('I.01026', 'Terapi Oksigen'),
  ('I.02028', 'Balut tekan'),
  ('I.02038', 'Manajemen Defibrilasi'),
  ('I.02042', 'antepartum dipertahankan'),
  ('I.02045', 'Manejemen pendarahan pervaginam pascapersalinan'),
  ('I.02067', 'Pencegahan Perdarahan'),
  ('I.02068', 'Pencegahan Syok'),
  ('I.02075', 'Perawatan Jantung'),
  ('I.02079', 'Perawatan Sirkulasi'),
  ('I.02080', 'Pertolongan Pertama'),
  ('I.02083', 'Resusitasi Jantung Paru'),
  ('I.02119', 'Manajemen Jalan Napas'),
  ('I.03091', 'Fototerapi Neonatus'),
  ('I.03093', 'Konseling Laktasi'),
  ('I.03094', 'Konseling nutrisi'),
  ('I.03097', 'Manajemen berat badan Observasi'),
  ('I.03098', 'Manajemen Cairan'),
  ('I.03101', 'Manajemen Diare'),
  ('I.03115', 'Manajemen hiperglikemia'),
  ('I.03116', 'Manajemen Hipovolemia'),
  ('I.03119', 'Manajemen Nutrisi'),
  ('I.03121', 'Pemantauan Cairan'),
  ('I.03122', 'Pemantauan Elektrolit'),
  ('I.03130', 'Pendampingan Proses Menyusui'),
  ('I.03132', '1. Perawatan Neonatus'),
  ('I.03135', 'Promosi ASI Eksklusif'),
  ('I.03138', 'Promosi Laktasi'),
  ('I.03139', 'Resusitasi Cairan'),
  ('I.04148', 'Manajemen Eliminasi Fekal'),
  ('I.04149', 'Latihan Berkemih'),
  ('I.04151', 'Manajemen eliminasi fekal'),
  ('I.04152', 'Manajemen Eliminasi Urin'),
  ('I.04163', 'Perawatan inkontinensia urin.'),
  ('I.05166', 'Manajemen Eliminasi Alvi'),
  ('I.05173', 'Dukungan Mobilisasi Definisi : Memfasilitasi pasien untuk meningkatkan aktiviats pergerakan fisik'),
  ('I.05174', 'Dukungan Tidur'),
  ('I.05178', '1. Manajemen Energi'),
  ('I.05186', '3. Terapi Aktivitas'),
  ('I.06188', 'Latihan Memori'),
  ('I.06189', 'Delirium'),
  ('I.06190', 'Manajemen Disrefleksia'),
  ('I.06194', 'Tekanan Intrakranial'),
  ('I.06195', ''),
  ('I.06198', ''),
  ('I.06206', 'Perawatan Telinga Definisi : mengidentifikasi, merawat dan mencegah gangguan pada teliga dan pendegaran'),
  ('I.07214', 'Konseling Seksualitas'),
  ('I.07215', 'Latihan Otot Panggul'),
  ('I.07216', 'Pengaturan Posisi'),
  ('I.07228', ''),
  ('I.08238', 'Manajemen Nyeri'),
  ('I.08239', 'Manajemen Mual'),
  ('I.08242', 'Pemantauan Nyeri Tindakan'),
  ('I.08245', ''),
  ('I.08247', ''),
  ('I.08249', '4. Terapi Murattal'),
  ('I.09256', '3. Dukungan Emosional Definisi'),
  ('I.09260', 'Keluarga'),
  ('I.09266', 'Dukungan pengungkapan kebutuhan'),
  ('I.09274', 'Tindakan :'),
  ('I.09277', 'diri Sendiri Definisi :'),
  ('I.09295', 'Manajemen Waham'),
  ('I.09297', 'Orientasi Realita'),
  ('I.09307', 'Promosi Harapan Defisini: Meningkatkan kepercayaan pada kemampuan untuk memulai dan mempertahankan tindakan.'),
  ('I.09308', ''),
  ('I.09312', ''),
  ('I.09314', '1. Reduksi ansietas'),
  ('I.09322', ''),
  ('I.09326', 'Terapi relaksasi'),
  ('I.10338', 'Perawatan Bayi'),
  ('I.10339', ''),
  ('I.10340', ''),
  ('I.10341', ''),
  ('I.10342', ''),
  ('I.11348', ''),
  ('I.11349', 'BAB/BAK'),
  ('I.11351', 'Diri: Makan/Minum'),
  ('I.11353', 'Konsultasi'),
  ('I.11354', 'Perawatan kaki Definisi :'),
  ('I.12359', 'BIMBINGAN ANTISIPATIF'),
  ('I.12361', 'Pengobatan'),
  ('I.12362', 'Manajemen Energi'),
  ('I.12365', '4. Anjurkan untuk melakukan pencatatan asupan makan, aktivitas fisik dan perubahan berat badan'),
  ('I.12369', '5. Ajarkan cara mengelola berat badan secara efektif'),
  ('I.12379', 'dilakuykan saat meraasa dirinya dalam bahaya(mis. Meminta bantuan orang dewasa, berteriak, segera berlari)'),
  ('I.12381', 'kontrasepsi'),
  ('I.12383', 'PERILAKU'),
  ('I.12389', 'Edukasi latihan fisik Definisi :'),
  ('I.12393', '8. Anjurkan ibu menyusui sesering mungkin segera setelah lahir sesuai kebutuhan bayi'),
  ('I.12397', '8. Informasikan ibu untuk selalu mengosongkan payudara pada payudara yang belum disusui dengan memerah ASI'),
  ('I.12402', ''),
  ('I.12403', 'Menajemen perilaku'),
  ('I.12411', ''),
  ('I.12414', 'Tubuh'),
  ('I.12437', 'Edukasi Persalinan'),
  ('I.12441', ''),
  ('I.12445', ''),
  ('I.12447', 'Edukasi Seksualitas'),
  ('I.12457', 'Edukasi Termoregulasi Definisi : mengajarkan pasien untuk mendukung keseimbangan'),
  ('I.12461', ''),
  ('I.12463', ''),
  ('I.12466', ''),
  ('I.12470', ''),
  ('I.13478', ''),
  ('I.13484', 'Modifikasi Perilaku Keterampilan Sosial Definisi :'),
  ('I.13490', 'Promosi Keutuhan Keluarga'),
  ('I.13496', ''),
  ('I.13498', 'Promosi Sosialisasi Definisi:'),
  ('I.14507', ''),
  ('I.14513', 'MANAJEMEN KESELAMATAN LINGKUNGAN'),
  ('I.14535', ''),
  ('I.14538', 'Pencegahan Bunuh Diri'),
  ('I.14540', ''),
  ('I.14547', 'Pengembangan Kesehatan Masyarakat'),
  ('I.14551', 'Pengontrolan Infeksi'),
  ('I.14578', 'Regulasi Temperatur Definisi : mempertahankan suhu tubuh dalam rentang normal'),
  ('I.15506', 'Manajemen Hipertermia'),
  ('I.15507', 'Manajemen Hipotermia');

-- ============================================================
-- 4. sdki_slki_relations
-- ============================================================
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0001'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0002'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0003'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0004'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0005'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.01004'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0006'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0007'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0008'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0009'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0010'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0011'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0012'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0013'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0014'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0015'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0016'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0017'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0018'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0019'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0020'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0021'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0022'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0023'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0024'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0025'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0026'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0027'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0028'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0029'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0030'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0031'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0032'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0033'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0034'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0035'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0036'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0037'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0038'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0040'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04034'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0041'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0042'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0043'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0044'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0045'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0046'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0047'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0048'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04034'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0049'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0050'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04034'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0051'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0052'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0053'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0055'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0056'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0057'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05046'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0058'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0059'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0060'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0061'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0062'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0063'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0064'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0065'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0066'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0067'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0068'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0069'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0070'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0071'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0072'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0073'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0074'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0075'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0076'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0077'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0078'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0079'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0080'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0081'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0101'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0102'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0103'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0104'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0105'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.10102'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0120'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0121'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13116'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0122'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0123'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0124'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0125'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0126'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0127'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0128'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.13124'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0129'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0130'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0131'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0132'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0133'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0134'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14127'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0135'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0136'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0137'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0138'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14133'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0139'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0140'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0141'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0142'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0143'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0144'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0145'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0147'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0148'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));
INSERT IGNORE INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
  ((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0149'),
   (SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'));

-- ============================================================
-- 5. slki_siki_relations
-- ============================================================
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01001'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01001'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01021'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01002'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01014'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01003'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01026'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03139'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02083'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01004'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01011'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01018'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.01006'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02038'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02008'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02015'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02080'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02067'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02028'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02017'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01004'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02010'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02075'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02011'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02013'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02068'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.02014'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03097'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03101'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03033'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03121'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.003116'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02045'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02042'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03091'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10338'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03020'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03098'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03030'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03022'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03115'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03093'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03135'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03138'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12393'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03130'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03029'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12397'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12365'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03018'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03094'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12369'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03023'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14551'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03028'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03116'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03132'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.03021'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03122'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04034'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04163'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04149'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04152'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04036'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07215'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04033'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04151'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.04034'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12389'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11354'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02079'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05178'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05174'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05046'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05045'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.04148'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05043'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12379'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.05047'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06053'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06190'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06188'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09079'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09297'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06052'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11351'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06189'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06194'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06198'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06049'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06051'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.06054'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12437'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07059'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07214'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07056'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12411'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07055'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12447'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12381'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07216'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07057'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.01019'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09266'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08064'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12362'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.07061'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08247'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08065'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08239'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08242'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08249'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.08066'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08245'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09314'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09093'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09326'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09094'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09073'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09274'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09090'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09295'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.10102'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13496'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09322'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13116'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13498'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13116'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05186'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13120'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12466'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13123'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13121'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12402'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13119'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13478'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13122'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10342'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.13124'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13490'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12441'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12461'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15506'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14507'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12403'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.08238'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14127'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12445'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14127'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14535'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14538'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14513'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14136'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.07228'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14133'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11353'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05166'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.15507'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14137'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.02119'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14138'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14540'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14125'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06195'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.05173'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14129'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12414'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12457'));
INSERT IGNORE INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
  ((SELECT id FROM luaran_slki WHERE kode_luaran='L.14134'),
   (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14578'));

SET FOREIGN_KEY_CHECKS = 1;