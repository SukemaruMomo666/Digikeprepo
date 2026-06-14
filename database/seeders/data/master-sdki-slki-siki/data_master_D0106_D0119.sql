SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- DIAGNOSA SDKI (D.0106 - D.0119)
-- ============================================================

INSERT INTO diagnosa_sdki (kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi) VALUES
('D.0106', 'Gangguan Tumbuh Kembang', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Aktual', 'Kondisi individu mengalami gangguan kemampuan bertumbuh dan berkembang sesuai dengan kelompok usia'),
('D.0107', 'Risiko Gangguan Perkembangan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Risiko', 'Berisiko mengalami gangguan untuk berkembang sesuai dengan kelompok usianya'),
('D.0108', 'Risiko Gangguan Pertumbuhan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Risiko', 'Berisiko mengalami gangguan untuk bertumbuh sesuai dengan kelompok usianya'),
('D.0109', 'Defisit Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Aktual', 'Tidak mampu melakukan atau menyelesaikan aktivitas perawatan diri'),
('D.0110', 'Defisit Kesehatan Komunitas', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Terdapat masalah kesehatan atau faktor risiko yang dapat mengganggu kesejahteraan pada suatu kelompok'),
('D.0111', 'Defisit Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Ketiadaan atau kurangnya informasi kognitif yang berkaitan dengan topik tertentu'),
('D.0112', 'Kesiapan Peningkatan Manajemen Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Promosi Kesehatan', 'Pola pengaturan dan pengintegrasian program kesehatan ke dalam kehidupan sehari-hari yang cukup untuk memenuhi tujuan kesehatan dan dapat ditingkatkan'),
('D.0113', 'Kesiapan Peningkatan Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Promosi Kesehatan', 'Perkembangan informasi kognitif yang berhubungan dengan topik spesifik cukup untuk memenuhi tujuan kesehatan dan dapat ditingkatkan'),
('D.0114', 'Ketidakpatuhan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Perilaku individu dan/atau pemberi asuhan tidak mengikuti rencana perawatan/pengobatan yang disepakati dengan tenaga kesehatan, sehingga menyebabkan hasil perawatan/pengobatan tidak efektif'),
('D.0115', 'Manajemen Kesehatan Keluarga Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Pola penanganan masalah kesehatan dalam keluarga tidak memuaskan untuk memulihkan kondisi kesehatan anggota keluarga'),
('D.0116', 'Manajemen Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Pola pengaturan dan pengintegrasian penanganan masalah kesehatan ke dalam kebiasaan hidup sehari-hari tidak memuaskan untuk mencapai status kesehatan yang diharapkan'),
('D.0117', 'Pemeliharaan Kesehatan Tidak Efektif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Aktual', 'Ketidakmampuan mengidentifikasi, mengelola, dan/atau menemukan bantuan untuk mempertahankan kesehatan'),
('D.0118', 'Gangguan Interaksi Sosial', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Kuantitas dan/atau kualitas hubungan sosial yang kurang atau berlebihan'),
('D.0119', 'Gangguan Komunikasi Verbal', 'Relasional', 'Interaksi Sosial', 'Aktual', 'Penurunan, pelambatan, atau ketiadaan kemampuan untuk menerima, memproses, mengirim, dan/atau menggunakan sistem simbol');

-- ============================================================
-- SDKI PENYEBAB
-- ============================================================

-- D.0106 Gangguan Tumbuh Kembang
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Fisiologis', 1, 'Efek ketidakmampuan fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Situasional', 2, 'Keterbatasan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Situasional', 3, 'Inkonsistensi respon'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Situasional', 4, 'Pengabaian'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Situasional', 5, 'Terpisah dari orang tua dan/atau orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Situasional', 6, 'Defisiensi stimulus');

-- D.0109 Defisit Perawatan Diri
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 1, 'Gangguan muskuloskeletal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 2, 'Gangguan neuromuskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Fisiologis', 3, 'Kelemahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Psikologis', 4, 'Gangguan psikologis dan/atau psikotik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Psikologis', 5, 'Penurunan motivasi/minat');

-- D.0110 Defisit Kesehatan Komunitas
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 1, 'Hambatan akses ke pemberi pelayanan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 2, 'Keterbatasan sumber daya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 3, 'Program tidak memiliki anggaran yang cukup'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 4, 'Program tidak atau kurang didukung komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 5, 'Komunitas kurang puas dengan program yang dijalankan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 6, 'Program tidak memiliki rencana evaluasi yang optimal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 7, 'Program tidak memiliki data hasil yang memadai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Situasional', 8, 'Program tidak mengatasi seluruh masalah kesehatan komunitas');

-- D.0111 Defisit Pengetahuan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Psikologis', 1, 'Keterbatasan kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Psikologis', 2, 'Gangguan fungsi kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Psikologis', 3, 'Kekeliruan mengikuti anjuran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Situasional', 4, 'Kurang terpapar informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Psikologis', 5, 'Kurang minat dalam belajar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Psikologis', 6, 'Kurang mampu mengingat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Situasional', 7, 'Ketidaktahuan menemukan sumber informasi');

-- D.0114 Ketidakpatuhan
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Fisiologis', 1, 'Disabilitas (mis. penurunan daya ingat, defisit sensorik/motorik)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Fisiologis', 2, 'Efek samping program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 3, 'Beban pembiayaan program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 4, 'Lingkungan tidak terapeutik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 5, 'Program terapi kompleks dan/atau lama'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 6, 'Hambatan mengakses pelayanan kesehatan (mis. gangguan mobilisasi, masalah transportasi, ketiadaan orang merawat anak di rumah, cuaca tidak menentu)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Situasional', 7, 'Program terapi tidak ditanggung asuransi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Psikologis', 8, 'Ketidakadekuatan pemahaman (sekunder akibat defisit kognitif, kecemasan, gangguan penglihatan/pendengaran, kelelahan, kurang motivasi)');

-- D.0115 Manajemen Kesehatan Keluarga Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Situasional', 1, 'Kompleksitas sistem pelayanan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Situasional', 2, 'Kompleksitas program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Psikologis', 3, 'Konflik pengambilan keputusan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Situasional', 4, 'Kesulitan ekonomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Situasional', 5, 'Banyak tuntutan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Situasional', 6, 'Konflik keluarga');

-- D.0116 Manajemen Kesehatan Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 1, 'Kompleksitas sistem pelayanan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 2, 'Kompleksitas program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Psikologis', 3, 'Konflik pengambilan keputusan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 4, 'Kurang terpapar informasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 5, 'Kesulitan ekonomi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 6, 'Tuntutan berlebih (mis. individu, keluarga)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 7, 'Konflik keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 8, 'Ketidakefektifan pola perawatan kesehatan keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 9, 'Ketidakcukupan petunjuk untuk bertindak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Situasional', 10, 'Kekurangan dukungan sosial');

-- D.0117 Pemeliharaan Kesehatan Tidak Efektif
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 1, 'Hambatan kognitif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 2, 'Ketidaktuntasan proses berduka'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 3, 'Ketidakadekuatan keterampilan berkomunikasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Fisiologis', 4, 'Kurangnya keterampilan motorik halus/kasar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 5, 'Ketidakmampuan membuat penilaian yang tepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 6, 'Ketidakmampuan mengatasi masalah (individu atau keluarga)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Situasional', 7, 'Ketidakcukupan sumber daya (mis. keuangan, fasilitas)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Psikologis', 8, 'Gangguan depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Situasional', 9, 'Tidak terpenuhinya tugas perkembangan');

-- D.0118 Gangguan Interaksi Sosial
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Fisiologis', 1, 'Defisiensi bicara'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Fisiologis', 2, 'Hambatan perkembangan/maturasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 3, 'Ketiadaan orang terdekat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Fisiologis', 4, 'Perubahan neurologis (mis. kelahiran prematur, distres fetal, persalinan cepat atau persalinan lama)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 5, 'Disfungsi sistem keluarga'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 6, 'Ketidakteraturan atau kekacauan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 7, 'Penganiayaan atau pengabaian anak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Situasional', 8, 'Hubungan orang tua-anak tidak memuaskan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 9, 'Model peran negatif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 10, 'Impulsif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 11, 'Perilaku menentang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 12, 'Perilaku agresif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Psikologis', 13, 'Keengganan berpisah dengan orang terdekat');

-- D.0119 Gangguan Komunikasi Verbal
INSERT INTO sdki_penyebab (sdki_id, kelompok, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 1, 'Penurunan sirkulasi serebral'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 2, 'Gangguan neuromuskuler'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 3, 'Gangguan pendengaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 4, 'Gangguan muskuloskeletal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Fisiologis', 5, 'Kelainan palatum'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Situasional', 6, 'Hambatan fisik (mis. terpasang trakheostomi, intubasi, krikotiroidektomi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Psikologis', 7, 'Hambatan individu (mis. ketakutan, kecemasan, merasa malu, emosional, kurang privasi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Psikologis', 8, 'Hambatan psikologis (mis. gangguan psikotik, gangguan konsep diri, harga diri rendah, gangguan emosi)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Situasional', 9, 'Hambatan lingkungan (mis. ketidakcukupan informasi, ketiadaan orang terdekat, ketidaksesuaian budaya, bahasa asing)');

-- ============================================================
-- SDKI GEJALA
-- ============================================================

-- D.0106 Gangguan Tumbuh Kembang
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Mayor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Mayor', 'Objektif', 1, 'Tidak mampu melakukan keterampilan atau perilaku khas sesuai usia (fisik, bahasa, motorik, psikososial)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Mayor', 'Objektif', 2, 'Pertumbuhan fisik terganggu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 1, 'Tidak mampu melakukan perawatan diri sesuai usia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 2, 'Afek datar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 3, 'Respon sosial lambat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 4, 'Kontak mata terbatas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 5, 'Nafsu makan menurun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 6, 'Lesu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 7, 'Mudah marah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 8, 'Regresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 'Minor', 'Objektif', 9, 'Pola tidur terganggu (pada bayi)');

-- D.0109 Defisit Perawatan Diri
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Mayor', 'Subjektif', 1, 'Menolak melakukan perawatan diri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Mayor', 'Objektif', 1, 'Tidak mampu mandi/mengenakan pakaian/makan/ke toilet/berhias secara mandiri'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Mayor', 'Objektif', 2, 'Minat melakukan perawatan diri kurang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 'Minor', 'Objektif', 1, '(tidak tersedia)', 0);

-- D.0110 Defisit Kesehatan Komunitas
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Mayor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Mayor', 'Objektif', 1, 'Terjadi masalah kesehatan yang dialami komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Mayor', 'Objektif', 2, 'Terdapat faktor risiko fisiologis dan/atau psikologis yang menyebabkan anggota komunitas menjalani perawatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Minor', 'Objektif', 1, 'Tidak tersedia program untuk meningkatkan kesejahteraan bagi komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Minor', 'Objektif', 2, 'Tidak tersedia program untuk mencegah masalah kesehatan komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Minor', 'Objektif', 3, 'Tidak tersedia program untuk mengurangi masalah kesehatan komunitas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 'Minor', 'Objektif', 4, 'Tidak tersedia program untuk mengatasi masalah kesehatan komunitas');

-- D.0111 Defisit Pengetahuan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Mayor', 'Subjektif', 1, 'Menanyakan masalah yang dihadapi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Mayor', 'Objektif', 1, 'Menunjukkan perilaku tidak sesuai anjuran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Mayor', 'Objektif', 2, 'Menunjukkan persepsi yang keliru terhadap masalah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Minor', 'Objektif', 1, 'Menjalani pemeriksaan yang tidak tepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 'Minor', 'Objektif', 2, 'Menunjukkan perilaku berlebihan (mis. apatis, bermusuhan, adikasi dan histeria)');

-- D.0112 Kesiapan Peningkatan Manajemen Kesehatan (Promosi Kesehatan - hanya gejala)
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 'Mayor', 'Subjektif', 1, 'Mengekspresikan keinginan untuk mengelola masalah kesehatan dan pencegahannya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 'Mayor', 'Objektif', 1, 'Pilihan hidup sehari-hari tepat untuk memenuhi tujuan program kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 'Minor', 'Subjektif', 1, 'Mengekspresikan tidak adanya hambatan yang berarti dalam mengintegrasikan program yang ditetapkan untuk mengatasi masalah kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 'Minor', 'Subjektif', 2, 'Menggambarkan berkurangnya faktor risiko terjadinya masalah kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 'Minor', 'Objektif', 1, 'Tidak ditemukan adanya gejala masalah kesehatan atau penyakit yang tidak terduga');

-- D.0113 Kesiapan Peningkatan Pengetahuan (Promosi Kesehatan - hanya gejala)
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan minat dalam belajar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Mayor', 'Subjektif', 2, 'Menjelaskan pengetahuan tentang suatu topik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Mayor', 'Subjektif', 3, 'Menggambarkan pengalaman sebelumnya yang sesuai dengan topik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Mayor', 'Objektif', 1, 'Perilaku sesuai dengan pengetahuan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), 'Minor', 'Objektif', 1, '(tidak tersedia)', 0);

-- D.0114 Ketidakpatuhan
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Mayor', 'Subjektif', 1, 'Menolak menjalani perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Mayor', 'Subjektif', 2, 'Menolak mengikuti anjuran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Mayor', 'Objektif', 1, 'Perilaku tidak mengikuti program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Mayor', 'Objektif', 2, 'Perilaku tidak menjalankan anjuran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Minor', 'Objektif', 1, 'Tampak tanda/gejala penyakit/masalah kesehatan masih ada atau meningkat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 'Minor', 'Objektif', 2, 'Tampak komplikasi penyakit/masalah kesehatan menetap atau meningkat');

-- D.0115 Manajemen Kesehatan Keluarga Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan tidak memahami masalah kesehatan yang diderita'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Mayor', 'Subjektif', 2, 'Mengungkapkan kesulitan menjalankan perawatan yang ditetapkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Mayor', 'Objektif', 1, 'Gejala penyakit anggota keluarga semakin memberat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Mayor', 'Objektif', 2, 'Aktivitas keluarga untuk mengatasi masalah kesehatan tidak tepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 'Minor', 'Objektif', 1, 'Gagal melakukan tindakan untuk mengurangi faktor risiko');

-- D.0116 Manajemen Kesehatan Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Mayor', 'Subjektif', 1, 'Mengungkapkan kesulitan dalam menjalani program perawatan/pengobatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Mayor', 'Objektif', 1, 'Gagal melakukan tindakan untuk mengurangi faktor risiko'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Mayor', 'Objektif', 2, 'Gagal menerapkan program perawatan/pengobatan dalam kehidupan sehari-hari'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Mayor', 'Objektif', 3, 'Aktivitas hidup sehari-hari tidak efektif untuk memenuhi tujuan kesehatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 'Minor', 'Objektif', 1, '(tidak tersedia)', 0);

-- D.0117 Pemeliharaan Kesehatan Tidak Efektif
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Mayor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Mayor', 'Objektif', 1, 'Kurang menunjukkan perilaku adaptif terhadap perubahan lingkungan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Mayor', 'Objektif', 2, 'Kurang menunjukkan pemahaman tentang perilaku sehat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Mayor', 'Objektif', 3, 'Tidak mampu menjalankan perilaku sehat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Minor', 'Objektif', 1, 'Memiliki riwayat perilaku mencari bantuan kesehatan yang kurang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Minor', 'Objektif', 2, 'Kurang menunjukkan minat untuk meningkatkan perilaku sehat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 'Minor', 'Objektif', 3, 'Tidak memiliki sistem pendukung (support system)');

-- D.0118 Gangguan Interaksi Sosial
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Mayor', 'Subjektif', 1, 'Merasakan tidak nyaman dengan situasi sosial'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Mayor', 'Subjektif', 2, 'Merasakan sulit menerima atau mengkomunikasikan perasaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Mayor', 'Objektif', 1, 'Kurang responsif atau tertarik pada orang lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Mayor', 'Objektif', 2, 'Tidak berminat melakukan kontak emosi dan fisik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Subjektif', 1, 'Sulit mengungkapkan kasih sayang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Objektif', 1, 'Gejala cemas berat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Objektif', 2, 'Kontak mata kurang'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Objektif', 3, 'Ekspresi wajah tidak responsif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Objektif', 4, 'Tidak kooperatif dalam bermain dan berteman dengan sebaya'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 'Minor', 'Objektif', 5, 'Perilaku tidak sesuai usia');

-- D.0119 Gangguan Komunikasi Verbal
INSERT INTO sdki_gejala (sdki_id, tipe, jenis, urutan, deskripsi, tersedia) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Mayor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Mayor', 'Objektif', 1, 'Tidak mampu berbicara atau mendengar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Mayor', 'Objektif', 2, 'Menunjukkan respon tidak sesuai'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Subjektif', 1, '(tidak tersedia)', 0),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 1, 'Afasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 2, 'Disfasia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 3, 'Apraksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 4, 'Disleksia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 5, 'Disartria'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 6, 'Afonia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 7, 'Dislalia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 8, 'Pelo'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 9, 'Gagap'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 10, 'Tidak ada kontak mata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 11, 'Sulit memahami komunikasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 12, 'Sulit mempertahankan komunikasi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 13, 'Sulit menggunakan ekspresi wajah atau tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 14, 'Tidak mampu menggunakan ekspresi wajah atau tubuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 15, 'Sulit menyusun kalimat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 16, 'Verbalisasi tidak tepat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 17, 'Sulit mengungkapkan kata-kata'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 18, 'Disorientasi orang, ruang, waktu'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 19, 'Defisit penglihatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), 'Minor', 'Objektif', 20, 'Delusi');

-- ============================================================
-- SDKI FAKTOR RISIKO (D.0107, D.0108)
-- ============================================================

-- D.0107 Risiko Gangguan Perkembangan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 1, 'Ketidakadekuatan nutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 2, 'Ketidakadekuatan perawatan prenatal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 3, 'Keterlambatan perawatan prenatal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 4, 'Usia hamil di bawah 15 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 5, 'Usia hamil di atas 35 tahun'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 6, 'Kehamilan tidak terencana'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 7, 'Kehamilan tidak diinginkan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 8, 'Gangguan endokrin'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 9, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 10, 'Kelainan genetik/kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 11, 'Kerusakan otak (mis. perdarahan selama periode pascanatal, penganiayaan, kecelakaan)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 12, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 13, 'Infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 14, 'Efek samping terapi (mis. kemoterapi, terapi radiasi, agen farmakologis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 15, 'Penganiayaan (mis. fisik, psikologis, seksual)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 16, 'Gangguan pendengaran'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 17, 'Gangguan penglihatan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 18, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 19, 'Ketidakmampuan belajar'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 20, 'Anak adopsi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 21, 'Kejadian bencana'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 22, 'Ekonomi lemah');

-- D.0108 Risiko Gangguan Pertumbuhan
INSERT INTO sdki_faktor_risiko (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 1, 'Ketidakadekuatan nutrisi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 2, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 3, 'Nafsu makan tidak terkontrol'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 4, 'Prematuritas'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 5, 'Terpapar teratogen'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 6, 'Ketidakadekuatan nutrisi maternal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 7, 'Proses infeksi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 8, 'Proses infeksi maternal'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 9, 'Perilaku makan maladaptif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 10, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 11, 'Kelainan genetik/kongenital'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 12, 'Penganiayaan (mis. fisik, psikologis, seksual)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 13, 'Ekonomi lemah');

-- ============================================================
-- SDKI KONDISI KLINIS
-- ============================================================

-- D.0106
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 1, 'Hipotiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 2, 'Sindrom gagal tumbuh (Failure to Thrive Syndrome)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 3, 'Leukemia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 4, 'Defisiensi hormon pertumbuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 5, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 7, 'Kelainan jantung bawaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 8, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), 9, 'Gangguan kepribadian (personality disorder)');

-- D.0107
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 1, 'Hipotiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 2, 'Sindrom gagal tumbuh (Failure to Thrive Syndrome)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 3, 'Leukimia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 4, 'Defisiensi hormon pertumbuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 5, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 7, 'Kelainan jantung bawaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 8, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), 9, 'Gangguan kepribadian (personality disorder)');

-- D.0108
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 1, 'Hipotiroidisme'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 2, 'Sindrom gagal tumbuh'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 3, 'Leukimia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 4, 'Defisiensi hormon pertumbuhan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 5, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 7, 'Kelainan jantung bawaan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 8, 'Penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), 9, 'Gangguan kepribadian (personality disorder)');

-- D.0109
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 1, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 2, 'Cedera medula spinalis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 3, 'Depresi'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 4, 'Arthritis reumatoid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 5, 'Retardasi mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 6, 'Delirium'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 7, 'Demensia'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 8, 'Gangguan amnestik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 9, 'Skizofrenia dan gangguan psikotik lain'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), 10, 'Fungsi penilaian terganggu');

-- D.0110
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 1, 'HIV/AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 2, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 3, 'Penyakit menular seksual'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 4, 'Kehamilan di luar nikah'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 5, 'Gizi buruk'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 6, 'Infeksi saluran pernapasan atas (ISPA)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), 7, 'Severe Acute Respiratory Syndrome (SARS)');

-- D.0111
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 1, 'Kondisi klinis yang baru dihadapi oleh klien'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 2, 'Penyakit akut'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), 3, 'Penyakit kronis');

-- D.0112
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 1, 'Diabetes mellitus'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 2, 'Penyakit jantung kongestif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 3, 'Penyakit paru obstruktif kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 4, 'Asma'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 5, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 6, 'Lupus sistemik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 7, 'HIV positif'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 8, 'AIDS'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), 9, 'Prematuritas');

-- D.0114
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 1, 'Kondisi baru terdiagnosis penyakit'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 2, 'Kondisi penyakit kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), 3, 'Masalah kesehatan yang membutuhkan perubahan pola hidup');

-- D.0115
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 1, 'PPOK'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 2, 'Sklerosis multipel'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 3, 'Arthritis rheumatoid'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 4, 'Nyeri kronis'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 5, 'Penyalahgunaan zat'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), 6, 'Gagal ginjal/hati tahap terminal');

-- D.0116
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 1, 'Kondisi kronis (mis. kanker, penyakit paru obstruktif kronis, sklerosis multipel, arthritis, gagal ginjal, hati atau jantung kronis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), 2, 'Diagnosis baru yang mengharuskan perubahan gaya hidup');

-- D.0117
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 1, 'Kondisi kronis (mis. sklerosis multipel, arthritis, nyeri kronis)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 2, 'Cedera otak'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 3, 'Stroke'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), 4, 'Paralisis');

-- D.0118
INSERT INTO sdki_kondisi_klinis (sdki_id, urutan, deskripsi) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 1, 'Retardasi mental'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 2, 'Gangguan autistik'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 3, 'Attention deficit/hyperactivity disorder (ADHD)'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 4, 'Gangguan perilaku'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 5, 'Oppositional defiant disorder'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 6, 'Gangguan tourette'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 7, 'Gangguan kecemasan perpisahan'),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), 8, 'Sindrom down');

-- ============================================================
-- LUARAN SLKI
-- ============================================================

INSERT INTO luaran_slki (kode_luaran, label_luaran, kategori, subkategori, definisi) VALUES
('L.10101', 'Status Perkembangan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Kemampuan untuk berkembang sesuai dengan kelompok usia'),
('L.10102', 'Status Pertumbuhan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Kemampuan untuk bertumbuh sesuai dengan kelompok usia'),
('L.11103', 'Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Kemampuan melakukan atau menyelesaikan aktivitas perawatan diri'),
('L.12109', 'Status Kesehatan Komunitas', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Komunitas kesejahteraan fisik, mental, dan sosial komunitas'),
('L.12111', 'Tingkat Pengetahuan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kecukupan informasi kognitif yang berkaitan dengan topik tertentu'),
('L.12104', 'Manajemen Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kemampuan mengatur dan mengintegrasikan penanganan masalah kesehatan dalam kehidupan sehari-hari untuk mencapai status kesehatan optimal'),
('L.12106', 'Pemeliharaan Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Kemampuan mengidentifikasi, mengelola, dan menemukan bantuan untuk mempertahankan kesehatan'),
('L.12110', 'Tingkat Kepatuhan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Perilaku individu dan/atau pemberi asuhan dalam mengikuti rencana perawatan/pengobatan yang disepakati dengan tenaga kesehatan sehingga hasil perawatan/pengobatan efektif'),
('L.09088', 'Status Koping Keluarga', 'Psikologis', 'Koping dan Toleransi Stres', 'Perilaku anggota keluarga dalam mendukung, memberi rasa nyaman, membantu dan memotivasi anggota keluarga lain yang sakit terhadap kemampuan beradaptasi, mengelola dan mengatasi masalah kesehatan'),
('L.13115', 'Interaksi Sosial', 'Relasional', 'Interaksi Sosial', 'Kuantitas dan/atau kualitas hubungan sosial yang cukup'),
('L.13118', 'Komunikasi Verbal', 'Relasional', 'Interaksi Sosial', 'Kemampuan menerima, memproses, mengirim, dan/atau menggunakan sistem simbol verbal');

-- ============================================================
-- SLKI KRITERIA HASIL
-- ============================================================

-- L.10101 Status Perkembangan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'), 1, 'Keterampilan/perilaku sesuai usia', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'), 2, 'Kemampuan melakukan perawatan diri', 'Meningkat');

-- L.10102 Status Pertumbuhan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10102'), 1, 'Berat badan sesuai usia', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10102'), 2, 'Panjang/tinggi badan sesuai usia', 'Meningkat');

-- L.11103 Perawatan Diri
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), 1, 'Minat melakukan perawatan diri', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), 2, 'Kemampuan mandi', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), 3, 'Kemampuan berpakaian', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), 4, 'Kemampuan makan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), 5, 'Kemampuan ke toilet', 'Meningkat');

-- L.12109 Status Kesehatan Komunitas
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), 1, 'Ketersediaan program promosi kesehatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), 2, 'Pemantauan standar kesehatan komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), 3, 'Partisipasi dalam program kesehatan komunitas', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), 4, 'Angka gangguan kesehatan mental', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), 5, 'Angka kejadian cedera', 'Menurun');

-- L.12111 Tingkat Pengetahuan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 1, 'Perilaku sesuai anjuran', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 2, 'Verbalisasi minat dalam belajar', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 3, 'Kemampuan menjelaskan pengetahuan tentang suatu topik', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 4, 'Perilaku sesuai dengan pengetahuan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 5, 'Persepsi yang keliru terhadap masalah', 'Menurun'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), 6, 'Perilaku upaya peningkatan kesehatan', 'Meningkat');

-- L.12104 Manajemen Kesehatan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), 1, 'Melakukan tindakan untuk mengurangi faktor risiko', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), 2, 'Menerapkan program perawatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), 3, 'Aktivitas hidup sehari-hari efektif memenuhi tujuan kesehatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), 4, 'Verbalisasi kesulitan dalam menjalani program perawatan/pengobatan', 'Menurun');

-- L.12106 Pemeliharaan Kesehatan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 1, 'Menunjukkan perilaku adaptif', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 2, 'Menunjukkan pemahaman perilaku sehat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 3, 'Kemampuan menjalankan perilaku sehat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 4, 'Perilaku mencari bantuan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 5, 'Menunjukkan minat meningkatkan perilaku sehat', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), 6, 'Memiliki sistem pendukung', 'Meningkat');

-- L.12110 Tingkat Kepatuhan
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'), 1, 'Verbalisasi kemauan mematuhi program perawatan atau pengobatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'), 2, 'Verbalisasi mengikuti anjuran', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'), 3, 'Perilaku mengikuti program perawatan/pengobatan', 'Membaik');

-- L.09088 Status Koping Keluarga
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 1, 'Kemampuan memenuhi kebutuhan anggota keluarga', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 2, 'Komitmen pada perawatan/pengobatan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), 3, 'Komunikasi antara anggota keluarga', 'Meningkat');

-- L.13115 Interaksi Sosial
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'), 1, 'Perasaan nyaman dengan situasi sosial', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'), 2, 'Perasaan mudah menerima atau mengkomunikasikan perasaan', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'), 3, 'Responsif pada orang lain', 'Meningkat');

-- L.13118 Komunikasi Verbal
INSERT INTO slki_kriteria_hasil (luaran_id, urutan, deskripsi, arah) VALUES
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 1, 'Kemampuan berbicara', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 2, 'Kemampuan mendengar', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 3, 'Kesesuaian ekspresi wajah/tubuh', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 4, 'Kontak mata', 'Meningkat'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 5, 'Respon perilaku', 'Membaik'),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), 6, 'Pemahaman komunikasi', 'Membaik');

-- ============================================================
-- INTERVENSI SIKI
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.10339', 'Perawatan Perkembangan', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Mengidentifikasi dan merawat untuk memfasilitasi perkembangan yang optimal pada aspek motorik halus, motorik kasar, bahasa, kognitif, sosial, emosional di tiap tahapan usia anak'),
('I.10340', 'Promosi Perkembangan Anak', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Meningkatkan dan memfasilitasi kemampuan orang tua/pengasuh untuk mengoptimalkan perkembangan motorik kasar, motorik halus, bahasa, kognitif, sosial, dan emosional pada anak usia prasekolah dan usia sekolah'),
('I.10341', 'Promosi Perkembangan Remaja', 'Psikologis', 'Pertumbuhan dan Perkembangan', 'Meningkatkan perkembangan fisik, kognitif, sosial dan emosional dari masa anak-anak ke masa remaja'),
('I.03119', 'Manajemen Nutrisi', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengidentifikasi dan mengelola asupan nutrisi yang seimbang'),
('I.11348', 'Dukungan Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan perawatan diri'),
('I.11349', 'Dukungan Perawatan Diri: BAB/BAK', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan buang air kecil (BAK) dan buang air besar (BAB)'),
('I.09256', 'Dukungan Emosional', 'Psikologis', 'Integritas Ego', 'Memfasilitasi penerimaan kondisi emosional selama masa stres'),
('I.14514', 'Manajemen Lingkungan', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi dan mengelola lingkungan untuk mendapatkan manfaat terapeutik, stimulasi sensorik, dan kesejahteraan psikologis'),
('I.14547', 'Pengembangan Kesehatan Masyarakat', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi anggota kelompok atau masyarakat untuk mengidentifikasi isu kesehatan komunitas dan mengimplementasikan solusi yang ada'),
('I.12383', 'Edukasi Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengajarkan pengelolaan faktor risiko penyakit dan perilaku hidup bersih serta sehat'),
('I.12359', 'Bimbingan Antisipatif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mempersiapkan pasien dan keluarga untuk mengantisipasi perkembangan atau krisis situasional'),
('I.12470', 'Promosi Kesiapan Penerimaan Informasi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Meningkatkan kesiapan pasien dalam menerima informasi tentang kondisi kesehatan'),
('I.12463', 'Manajemen Perilaku', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengidentifikasi dan mengelola perilaku negatif'),
('I.12361', 'Dukungan Kepatuhan Program Pengobatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memfasilitasi ketepatan dan keteraturan menjalani program pengobatan yang sudah ditentukan'),
('I.09277', 'Dukungan Tanggung Jawab pada Diri Sendiri', 'Psikologis', 'Integritas Ego', 'Memfasilitasi agar dapat bertanggung jawab atas perilaku sendiri dan konsekuensi yang ditimbulkannya'),
('I.09260', 'Dukungan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga'),
('I.09265', 'Dukungan Pengambilan Keputusan', 'Psikologis', 'Integritas Ego', 'Memberikan informasi dan dukungan saat pembuatan keputusan kesehatan'),
('I.13484', 'Modifikasi Perilaku Keterampilan Sosial', 'Relasional', 'Interaksi Sosial', 'Mengubah pengembangan atau peningkatan keterampilan sosial interpersonal'),
('I.06206', 'Perawatan Telinga', 'Fisiologis', 'Integritas Ego', 'Mengidentifikasi, merawat dan mencegah gangguan pada telinga dan pendengaran');

-- ============================================================
-- SIKI TINDAKAN
-- ============================================================

-- I.10339 Perawatan Perkembangan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Observasi', 1, 'Identifikasi pencapaian tugas perkembangan anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Observasi', 2, 'Identifikasi isyarat perilaku dan fisiologis yang ditunjukkan bayi (mis. lapar, tidak nyaman)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 1, 'Pertahankan sentuhan seminimal mungkin pada bayi prematur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 2, 'Berikan sentuhan yang bersifat gentle dan tidak ragu-ragu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 3, 'Minimalkan nyeri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 4, 'Minimalkan kebisingan ruangan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 5, 'Pertahankan lingkungan yang mendukung perkembangan optimal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 6, 'Motivasi anak berinteraksi dengan anak lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 7, 'Sediakan aktivitas yang memotivasi anak berinteraksi dengan anak lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 8, 'Fasilitasi anak berbagi dan bergantian/bergilir'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 9, 'Dukung anak mengekspresikan diri melalui penghargaan positif atau umpan balik atas usahanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 10, 'Pertahankan kenyamanan anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 11, 'Fasilitasi anak melatih keterampilan pemenuhan kebutuhan secara mandiri (mis. makan, sikat gigi, cuci tangan, memakai baju)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 12, 'Bernyanyi bersama anak lagu-lagu yang disukai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 13, 'Bacakan cerita atau dongeng'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Terapeutik', 14, 'Dukung partisipasi anak di sekolah, ekstrakurikuler dan aktivitas komunitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Edukasi', 1, 'Jelaskan orang tua dan/atau pengasuh tentang milestone perkembangan anak dan perilaku anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Edukasi', 2, 'Anjurkan orang tua menyentuh dan menggendong bayinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Edukasi', 3, 'Anjurkan orang tua berinteraksi dengan anaknya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Edukasi', 4, 'Ajarkan anak keterampilan berinteraksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Edukasi', 5, 'Ajarkan anak teknik asertif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339'), 'Kolaborasi', 1, 'Rujuk untuk konseling, jika perlu');

-- I.10340 Promosi Perkembangan Anak
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Observasi', 1, 'Identifikasi kebutuhan khusus anak dan kemampuan adaptasi anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 1, 'Fasilitasi hubungan anak dengan teman sebaya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 2, 'Dukung anak berinteraksi dengan anak lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 3, 'Dukung anak mengekspresikan perasaannya secara positif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 4, 'Dukung anak dalam bermimpi atau berfantasi sewajarnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 5, 'Dukung partisipasi anak di sekolah, ekstrakurikuler dan aktivitas komunitas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 6, 'Berikan mainan yang sesuai dengan usia anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 7, 'Bernyanyi bersama anak lagu-lagu yang disukai anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 8, 'Bacakan cerita/dongeng untuk anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 9, 'Diskusikan bersama remaja tujuan dan harapannya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 10, 'Sediakan kesempatan dan alat-alat untuk menggambar, melukis, dan mewarnai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Terapeutik', 11, 'Sediakan mainan berupa puzzle dan maze'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 1, 'Jelaskan nama-nama benda obyek yang ada di lingkungan sekitar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 2, 'Ajarkan pengasuh milestones perkembangan dan perilaku yang dibentuk'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 3, 'Ajarkan sikap kooperatif, bukan kompetisi diantara anak'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 4, 'Ajarkan anak cara meminta bantuan dari anak lain, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 5, 'Ajarkan teknik asertif pada anak dan remaja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Edukasi', 6, 'Demonstrasikan kegiatan yang meningkatkan perkembangan pada pengasuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340'), 'Kolaborasi', 1, 'Rujuk untuk konseling, jika perlu');

-- I.10341 Promosi Perkembangan Remaja
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Observasi', 1, 'Identifikasi tahap perkembangan remaja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 1, 'Sediakan bimbingan dan konseling kesehatan remaja pada remaja dan keluarga/orang tua/pengasuh'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 2, 'Tingkatkan personal hygiene dan penampilan diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 3, 'Dukung partisipasi dalam olahraga yang aman secara teratur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 4, 'Fasilitasi kemampuan pembuatan keputusan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 5, 'Dukung keterampilan komunikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 6, 'Dukung keterampilan sikap asertif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 7, 'Fasilitasi rasa tanggung jawab pada diri dan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 8, 'Dukung respons anti-kekerasan dalam menyelesaikan konflik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 9, 'Dukung perkembangan dan pertahankan hubungan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Terapeutik', 10, 'Dukung aktivitas ekstrakurikuler'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Edukasi', 1, 'Jelaskan perkembangan normal remaja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Edukasi', 2, 'Ajarkan untuk mengenali masalah kesehatan dan penyimpangan pada masa remaja (mis. anemia, masalah kesehatan gigi, kematangan seksual abnormal, alkohol, rokok, penyalahgunaan obat-obatan, gangguan citra tubuh, harga diri rendah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Edukasi', 3, 'Ajarkan strategi pencegahan penyalahgunaan obat, alkohol dan rokok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341'), 'Kolaborasi', 1, 'Rujuk untuk konseling atau hipnoterapi jika perlu');

-- I.03119 Manajemen Nutrisi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 1, 'Identifikasi status nutrisi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 2, 'Identifikasi alergi dan intoleransi makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 3, 'Identifikasi makanan yang disukai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 4, 'Identifikasi kebutuhan kalori dan jenis nutrient'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 5, 'Identifikasi perlunya penggunaan selang nasogastric'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 6, 'Monitor asupan makanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 7, 'Monitor berat badan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Observasi', 8, 'Monitor hasil pemeriksaan laboratorium'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 1, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 2, 'Fasilitasi menentukan pedoman diet (mis. piramida makanan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 3, 'Sajikan makanan secara menarik dan suhu yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 4, 'Berikan makanan tinggi serat untuk mencegah konstipasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 5, 'Berikan makanan tinggi kalori dan tinggi protein'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 6, 'Berikan suplemen makanan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Terapeutik', 7, 'Hentikan pemberian makan melalui selang nasogastrik, jika asupan oral dapat ditoleransi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 1, 'Anjurkan posisi duduk, jika mampu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Edukasi', 2, 'Ajarkan diet yang diprogramkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Kolaborasi', 1, 'Kolaborasi pemberian medikasi sebelum makan (mis. pereda nyeri, antiemetic), jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119'), 'Kolaborasi', 2, 'Kolaborasi dengan ahli gizi untuk menentukan jumlah kalori dan jenis nutrien yang dibutuhkan, jika perlu');

-- I.11348 Dukungan Perawatan Diri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Observasi', 1, 'Identifikasi kebiasaan aktivitas perawatan diri sesuai usia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Observasi', 2, 'Identifikasi kebutuhan alat bantu kebersihan diri, berpakaian, berhias dan makan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 1, 'Sediakan lingkungan yang terapeutik (mis. suasana hangat, rileks, privasi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 2, 'Siapkan keperluan pribadi (mis. parfum, sikat gigi, dan sabun mandi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 3, 'Dampingi dalam melakukan perawatan diri sampai mandiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348'), 'Edukasi', 1, 'Anjurkan melakukan perawatan diri secara konsisten sesuai kemampuan');

-- I.11349 Dukungan Perawatan Diri: BAB/BAK
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349'), 'Observasi', 1, 'Identifikasi kebiasaan BAK/BAB sesuai usia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349'), 'Observasi', 2, 'Monitor integritas kulit pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 1, 'Bersihkan alat bantu BAK/BAB setelah digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349'), 'Edukasi', 1, 'Anjurkan BAK/BAB secara rutin');

-- I.09256 Dukungan Emosional
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Observasi', 1, 'Identifikasi fungsi marah, frustasi, dan amuk bagi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Observasi', 2, 'Identifikasi hal yang telah memicu emosi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 1, 'Fasilitasi mengungkapkan perasaan cemas, marah atau sedih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 2, 'Tetap bersama pasien dan pastikan keamanan selama ansietas, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 3, 'Kurangi tuntutan berpikir saat sakit atau lelah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Edukasi', 1, 'Anjurkan mengungkapkan pengalaman emosional sebelumnya dan pola respon yang biasa digunakan');

-- I.14514 Manajemen Lingkungan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Observasi', 1, 'Identifikasi keamanan dan kenyamanan lingkungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Terapeutik', 1, 'Atur suhu lingkungan yang sesuai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Terapeutik', 2, 'Sediakan tempat tidur dan lingkungan yang bersih dan nyaman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Terapeutik', 3, 'Fasilitasi penggunaan barang-barang pribadi (mis. piyama, jubah, perlengkapan mandi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Edukasi', 1, 'Jelaskan cara membuat lingkungan rumah yang aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514'), 'Edukasi', 2, 'Ajarkan pasien dan keluarga/pengunjung tentang upaya pencegahan infeksi');

-- I.14547 Pengembangan Kesehatan Masyarakat
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Observasi', 1, 'Identifikasi masalah atau isu kesehatan dan prioritasnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Observasi', 2, 'Identifikasi potensi atau aset dalam masyarakat terkait isu yang dihadapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Observasi', 3, 'Identifikasi kekuatan dan partner dalam pengembangan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Observasi', 4, 'Identifikasi pemimpin/tokoh dalam masyarakat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 1, 'Berikan kesempatan kepada setiap anggota masyarakat untuk berpartisipasi sesuai aset yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 2, 'Libatkan anggota masyarakat untuk meningkatkan kesadaran terhadap isu dan masalah kesehatan yang dihadapi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 3, 'Libatkan masyarakat dalam musyawarah untuk mendefinisikan isu kesehatan dan mengembangkan rencana kerja'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 4, 'Libatkan masyarakat dalam proses perencanaan dan implementasi serta revisinya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 5, 'Libatkan anggota masyarakat dalam mengembangkan jaringan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 6, 'Pertahankan komunikasi yang terbuka dengan anggota masyarakat dan pihak-pihak yang terlibat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 7, 'Perkuat komunikasi antara individu dan kelompok untuk bermusyawarah terkait daya tarik yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 8, 'Kembangkan strategi dalam manajemen konflik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 9, 'Persatukan anggota masyarakat dengan cita-cita komunitas yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547'), 'Terapeutik', 10, 'Bangun komitmen antar anggota masyarakat');

-- I.12383 Edukasi Kesehatan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Observasi', 2, 'Identifikasi faktor-faktor yang dapat meningkatkan dan menurunkan motivasi perilaku hidup bersih dan sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik', 1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi', 1, 'Jelaskan faktor risiko yang dapat mempengaruhi kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi', 2, 'Ajarkan perilaku hidup bersih dan sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi', 3, 'Ajarkan strategi yang dapat digunakan untuk meningkatkan perilaku hidup bersih dan sehat');

-- I.12359 Bimbingan Antisipatif
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Observasi', 1, 'Identifikasi metode penyelesaian masalah yang biasa digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Observasi', 2, 'Identifikasi kemungkinan perkembangan atau krisis situasional yang akan terjadi serta dampaknya pada individu dan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 1, 'Fasilitasi memutuskan bagaimana masalah akan diselesaikan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 2, 'Fasilitasi memutuskan siapa yang akan dilibatkan dalam menyelesaikan masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 3, 'Gunakan contoh kasus untuk meningkatkan keterampilan menyelesaikan masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 4, 'Fasilitasi mengidentifikasi sumber daya yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 5, 'Fasilitasi menyesuaikan diri dengan perubahan peran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 6, 'Jadwalkan kunjungan pada setiap tahap perkembangan atau sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 7, 'Jadwalkan tindak lanjut untuk memantau atau memberi dukungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 8, 'Berikan nomor kontak yang dapat dihubungi, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 9, 'Libatkan keluarga dan pihak terkait, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 10, 'Berikan referensi baik cetak ataupun elektronik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Edukasi', 1, 'Jelaskan perkembangan dan perilaku normal'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Edukasi', 2, 'Informasikan harapan yang realistis terkait perilaku pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Edukasi', 3, 'Latih teknik koping yang dibutuhkan untuk mengatasi perkembangan atau krisis situasional'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359'), 'Kolaborasi', 1, 'Rujuk ke lembaga pelayanan masyarakat, jika perlu');

-- I.12470 Promosi Kesiapan Penerimaan Informasi
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Observasi', 1, 'Identifikasi informasi yang akan disampaikan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Observasi', 2, 'Identifikasi pemahaman tentang kondisi kesehatan saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Observasi', 3, 'Identifikasi kesiapan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 1, 'Lakukan penguatan potensi pasien dan keluarga untuk menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 2, 'Libatkan pengambilan keputusan dalam keluarga untuk menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 3, 'Fasilitasi mengenali kondisi tubuh yang membutuhkan layanan keperawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 4, 'Dahulukan menyampaikan informasi baik (positif) sebelum menyampaikan informasi kurang baik (negatif) terkait kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 5, 'Berikan nomor kontak yang dapat dihubungi jika pasien membutuhkan bantuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 6, 'Catat identitas dan nomor kontak pasien untuk mengingatkan atau follow up kondisi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Terapeutik', 7, 'Fasilitasi akses pelayanan pada saat dibutuhkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Edukasi', 1, 'Berikan informasi berupa alur, leaflet atau gambar untuk memudahkan pasien mendapatkan informasi kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470'), 'Edukasi', 2, 'Anjurkan keluarga mendampingi pasien selama fase akut, progresif atau terminal, jika memungkinkan');

-- I.12463 Manajemen Perilaku
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Observasi', 1, 'Identifikasi harapan untuk mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 1, 'Diskusikan tanggung jawab terhadap perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 2, 'Jadwalkan kegiatan terstruktur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 3, 'Ciptakan dan pertahankan lingkungan dan kegiatan perawatan konsisten setiap dinas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 4, 'Tingkatkan aktivitas fisik sesuai kemampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 5, 'Batasi jumlah pengunjung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 6, 'Bicara dengan nada rendah dan tenang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 7, 'Lakukan kegiatan pengalihan terhadap sumber agitasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 8, 'Cegah perilaku pasif dan agresif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 9, 'Beri penguatan positif terhadap keberhasilan mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 10, 'Lakukan pengekangan fisik sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 11, 'Hindari bersikap menyudutkan dan menghentikan pembicaraan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 12, 'Hindari sikap mengancam dan berdebat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 13, 'Hindari berdebat atau menawar batas perilaku yang telah ditetapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Edukasi', 1, 'Informasikan keluarga bahwa keluarga sebagai dasar pembentukan kognitif');

-- I.12361 Dukungan Kepatuhan Program Pengobatan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Observasi', 1, 'Identifikasi kepatuhan menjalani program pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 1, 'Buat komitmen menjalani program pengobatan dengan baik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 2, 'Buat jadwal pendampingan keluarga untuk bergantian menemani pasien selama menjalani program pengobatan, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 3, 'Dokumentasikan aktivitas selama menjalani proses pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 4, 'Diskusikan hal-hal yang dapat mendukung atau menghambat berjalannya program pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 5, 'Libatkan keluarga untuk mendukung program pengobatan yang dijalani'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Edukasi', 1, 'Informasikan program pengobatan yang harus dijalani'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Edukasi', 2, 'Informasikan manfaat yang akan diperoleh jika teratur menjalani program pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Edukasi', 3, 'Anjurkan keluarga untuk mendampingi dan merawat pasien selama menjalani program pengobatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361'), 'Edukasi', 4, 'Anjurkan pasien dan keluarga melakukan konsultasi ke pelayanan kesehatan terdekat');

-- I.09277 Dukungan Tanggung Jawab pada Diri Sendiri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Observasi', 1, 'Identifikasi persepsi tentang masalah kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Observasi', 2, 'Monitor pelaksanaan tanggung jawab'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Terapeutik', 1, 'Berikan kesempatan merasakan memiliki tanggung jawab'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Terapeutik', 2, 'Tingkatkan rasa tanggung jawab atas perilaku sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Terapeutik', 3, 'Hindari berdebat atau tawar-menawar tentang perannya di ruang perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Terapeutik', 4, 'Berikan penguatan dan umpan balik positif jika melaksanakan tanggung jawab atau mengubah perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Edukasi', 1, 'Diskusikan tanggung jawab terhadap profesi pemberian asuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277'), 'Edukasi', 2, 'Diskusikan konsekuensi tidak melaksanakan tanggung jawab');

-- I.09260 Dukungan Koping Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 1, 'Identifikasi respon emosional terhadap kondisi saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 3, 'Identifikasi pemahaman tentang keputusan perawatan setelah pulang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi', 4, 'Identifikasi kesesuaian antara harapan pasien, keluarga, dan tenaga kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 1, 'Dengarkan masalah, perasaan, dan pertanyaan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 2, 'Fasilitasi pengungkapan perasaan antara pasien dan keluarga atau antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 3, 'Fasilitasi pengambilan keputusan dalam merencanakan perawatan jangka panjang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi', 1, 'Informasikan kemajuan pasien secara berkala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi', 2, 'Informasikan fasilitas perawatan kesehatan yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Kolaborasi', 1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.09265 Dukungan Pengambilan Keputusan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Observasi', 1, 'Identifikasi persepsi mengenai masalah dan informasi yang memicu konflik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 1, 'Fasilitasi mengklarifikasi nilai dan harapan yang membantu membuat pilihan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 2, 'Diskusikan kelebihan dan kekurangan dari setiap solusi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 3, 'Fasilitasi melihat situasi secara realistik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 4, 'Motivasi mengungkapkan tujuan perawatan yang diharapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 5, 'Fasilitasi pengambilan keputusan secara kolaboratif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 6, 'Hormati hak pasien untuk menerima atau menolak informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 7, 'Fasilitasi menjelaskan keputusan kepada orang lain, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 8, 'Fasilitasi hubungan antara pasien, keluarga, dan tenaga kesehatan lainnya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Edukasi', 1, 'Informasikan alternatif solusi secara jelas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Edukasi', 2, 'Berikan informasi yang diminta pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'), 'Kolaborasi', 1, 'Kolaborasi dengan tenaga kesehatan lain dalam memfasilitasi pengambilan keputusan');

-- I.13484 Modifikasi Perilaku Keterampilan Sosial
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Observasi', 1, 'Identifikasi penyebab kurangnya keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Observasi', 2, 'Identifikasi fokus pelatihan keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Terapeutik', 1, 'Motivasi untuk berlatih keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Terapeutik', 2, 'Beri umpan balik positif (mis. pujian atau penghargaan) terhadap kemampuan sosialisasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Terapeutik', 3, 'Libatkan keluarga selama latihan keterampilan sosial, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 1, 'Jelaskan tujuan melatih keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 2, 'Jelaskan respons dan konsekuensi keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 3, 'Anjurkan mengungkapkan perasaan akibat masalah yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 4, 'Anjurkan mengevaluasi pencapaian setiap interaksi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 5, 'Edukasi keluarga untuk dukungan keterampilan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484'), 'Edukasi', 6, 'Latih keterampilan sosial secara bertahap');

-- I.06206 Perawatan Telinga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Observasi', 1, 'Pemeriksaan fungsi pendengaran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Observasi', 2, 'Monitor tanda dan gejala infeksi telinga (mis. inflamasi dan pengeluaran cairan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Observasi', 3, 'Monitor tanda dan gejala disfungsi telinga (mis. nyeri, nyeri tekan, gatal, perubahan pendengaran, tinitus, vertigo)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Terapeutik', 1, 'Bersihkan telinga luar'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Terapeutik', 2, 'Bersihkan seruman telinga dengan kapas yang lembut'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Terapeutik', 3, 'Lakukan irigasi telinga, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Terapeutik', 4, 'Hindari paparan suara keras'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Edukasi', 1, 'Jelaskan tanda dan gejala disfungsi pendengaran'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Edukasi', 2, 'Anjurkan menggunakan sumbat telinga saat berenang atau dalam pesawat, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206'), 'Edukasi', 3, 'Ajarkan membersihkan telinga luar');

-- ============================================================
-- RELASI SDKI → SLKI
-- ============================================================

INSERT INTO sdki_slki_relations (diagnosa_id, luaran_id) VALUES
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0106'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.10101')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0107'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.10101')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0108'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.10102')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0109'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.11103')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0110'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12109')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0111'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12111')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0112'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12104')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0113'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12111')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0114'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12110')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0115'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.09088')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0116'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12104')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0117'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.12106')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0118'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13115')),
((SELECT id FROM diagnosa_sdki WHERE kode_diagnosa='D.0119'), (SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'));

-- ============================================================
-- RELASI SLKI → SIKI
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
-- L.10101 → Perawatan Perkembangan, Promosi Perkembangan Anak, Promosi Perkembangan Remaja
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10339')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10340')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10101'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.10341')),
-- L.10102 → Manajemen Nutrisi
((SELECT id FROM luaran_slki WHERE kode_luaran='L.10102'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.03119')),
-- L.11103 → Dukungan Perawatan Diri, BAB/BAK, Emosional, Manajemen Lingkungan
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11348')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.11349')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.11103'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14514')),
-- L.12109 → Pengembangan Kesehatan Masyarakat
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12109'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14547')),
-- L.12111 → Edukasi Kesehatan, Promosi Kesiapan Penerimaan Informasi
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12111'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12470')),
-- L.12104 → Bimbingan Antisipatif, Edukasi Kesehatan, Manajemen Perilaku
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12359')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12104'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463')),
-- L.12110 → Dukungan Kepatuhan Program Pengobatan, Dukungan Tanggung Jawab
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12361')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12110'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09277')),
-- L.09088 → Dukungan Koping Keluarga
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260')),
-- L.12106 → Edukasi Kesehatan
((SELECT id FROM luaran_slki WHERE kode_luaran='L.12106'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383')),
-- L.13115 → Modifikasi Perilaku Keterampilan Sosial
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13115'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.13484')),
-- L.13118 → Perawatan Telinga, Dukungan Pengambilan Keputusan
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.06206')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.13118'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09265'));

SET FOREIGN_KEY_CHECKS = 1;
