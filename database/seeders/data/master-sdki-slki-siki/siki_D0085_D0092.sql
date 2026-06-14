SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- SIKI: intervensi_siki + siki_tindakan + slki_siki_relations
-- Range: D.0085 – D.0092
-- Sumber: PDF batch 2, halaman 416–455
-- ============================================================

-- ============================================================
-- 1. intervensi_siki (master)
-- ============================================================

INSERT INTO intervensi_siki (kode_intervensi, label_intervensi, kategori, subkategori, definisi) VALUES
('I.09288', 'Manajemen Halusinasi',      'Psikologis', 'Integritas Ego', 'Mengidentifikasi dan mengelola peningkatan keamanan, kenyamanan dan orientasi realita.'),
('I.12463', 'Manajemen Perilaku',        'Psikologis', 'Integritas Ego', 'Mengidentifikasi dan mengelola perilaku negatif.'),
('I.09256', 'Dukungan Emosional',        'Psikologis', 'Integritas Ego', 'Memfasilitasi penerimaan kondisi emosional selama masa stres.'),
('I.09308', 'Promosi Harga Diri',        'Psikologis', 'Integritas Ego', 'Meningkatkan penilaian perasaan/persepsi terhadap diri sendiri atau kemampuan diri.'),
('I.09260', 'Dukungan Koping Keluarga', 'Psikologis', 'Integritas Ego', 'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga.'),
('I.14525', 'Pelibatan Keluarga',        'Psikologis', 'Integritas Ego', 'Memfasilitasi partisipasi anggota keluarga dalam perawatan emosional dan fisik.'),
('I.12383', 'Edukasi Kesehatan',         'Psikologis', 'Integritas Ego', 'Mengajarkan pengelolaan faktor resiko penyakit dan perilaku hidup bersih serta sehat.'),
('I.09307', 'Promosi Harapan',           'Psikologis', 'Integritas Ego', 'Meningkatkan kepercayaan pada kemampuan untuk memulai dan mempertahankan tindakan.'),
('I.09312', 'Promosi Koping',            'Psikologis', 'Integritas Ego', 'Meningkatkan upaya kognitif dan perilaku untuk menilai dan merespon stresor dan/atau kemampuan menggunakan sumber-sumber yang ada.');

-- ============================================================
-- 2. siki_tindakan
-- ============================================================

-- I.09288 Manajemen Halusinasi → D.0085 Gangguan Persepsi Sensori
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Observasi',   1, 'Monitor perilaku yang mengindikasikan halusinasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Observasi',   2, 'Monitor isi halusinasi (mis. kekerasan atau membahayakan diri)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Terapeutik',  1, 'Pertahankan lingkungan yang aman'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Terapeutik',  2, 'Diskusikan perasaan dan respon terhadap halusinasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Edukasi',     1, 'Anjurkan memonitor sendiri situasi terjadi halusinasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Edukasi',     2, 'Anjurkan melakukan distraksi (mis. mendengarkan musik, melakukan aktivitas, dan teknik relaksasi)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Edukasi',     3, 'Ajarkan pasien dan keluarga cara mengontrol halusinasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288'), 'Kolaborasi',  1, 'Kolaborasi pemberian obat antipsikotik dan antiansietas, jika perlu');

-- I.12463 Manajemen Perilaku → D.0086 Harga Diri Rendah Kronis & D.0087 Harga Diri Rendah Situasional
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Observasi',   1, 'Identifikasi harapan untuk mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  1, 'Diskusikan tanggung jawab terhadap perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  2, 'Jadwalkan kegiatan terstruktur'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  3, 'Ciptakan dan pertahankan lingkungan dan kegiatan perawatan konsisten setiap dinas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  4, 'Tingkatkan aktivitas fisik sesuai kemampuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  5, 'Batasi jumlah pengunjung'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  6, 'Bicara dengan nada rendah dan tenang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  7, 'Lakukan kegiatan pengalihan terhadap sumber agitasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  8, 'Cegah perilaku pasif dan agresif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik',  9, 'Beri penguatan positif terhadap keberhasilan mengendalikan perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 10, 'Lakukan pengekangan fisik sesuai indikasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 11, 'Hindari bersikap menyudutkan dan menghentikan pembicaraan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 12, 'Hindari sikap mengancam dan berdebat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Terapeutik', 13, 'Hindari berdebat atau menawar batas perilaku yang telah ditetapkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463'), 'Edukasi',     1, 'Informasikan keluarga bahwa keluarga sebagai dasar pembentukan kognitif');

-- I.09256 Dukungan Emosional → D.0088 Keputusasaan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Observasi',   1, 'Identifikasi fungsi marah, frustasi, dan amuk bagi pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Observasi',   2, 'Identifikasi hal yang telah memicu emosi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik',  1, 'Fasilitasi mengungkapkan perasaan cemas, marah, atau sedih'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik',  2, 'Buat pernyataan suportif atau empati selama fase berduka'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik',  3, 'Lakukan sentuhan untuk memberikan dukungan (mis. merangkul, menepuk-nepuk)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik',  4, 'Tetap bersama pasien dan pastikan keamanan selama ansietas, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Terapeutik',  5, 'Kurangi tuntutan berpikir saat sakit atau lelah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Edukasi',     1, 'Jelaskan konsekuensi tidak menghadapi rasa bersalah dan malu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Edukasi',     2, 'Anjurkan mengungkapkan perasaan yang dialami (mis. ansietas, marah, sedih)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Edukasi',     3, 'Anjurkan mengungkapkan pengalaman emosional pola respons yang biasa digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Edukasi',     4, 'Ajarkan penggunaan mekanisme pertahanan yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256'), 'Kolaborasi',  1, 'Rujuk untuk konseling, jika perlu');

-- I.09308 Promosi Harga Diri → D.0089 Kesiapan Peningkatan Konsep Diri
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi',   1, 'Identifikasi budaya, agama, ras, jenis kelamin, dan usia terhadap harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi',   2, 'Monitor verbalisasi yang merendahkan diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Observasi',   3, 'Monitor tingkat harga diri setiap waktu, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  1, 'Motivasi terlibat dalam verbalisasi positif untuk diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  2, 'Motivasi menerima tantangan atau hal baru'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  3, 'Diskusikan pernyataan tentang harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  4, 'Diskusikan kepercayaan terhadap penilaian diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  5, 'Diskusikan pengalaman yang meningkatkan harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  6, 'Diskusikan persepsi negatif diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  7, 'Diskusikan alasan mengkritik diri atau rasa bersalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  8, 'Diskusikan penetapan tujuan realistis untuk mencapai harga diri yang lebih tinggi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik',  9, 'Diskusikan bersama keluarga untuk menetapkan harapan dan batasan yang jelas'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 10, 'Berikan umpan balik positif atas peningkatan mencapai tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Terapeutik', 11, 'Fasilitasi lingkungan dan aktivitas yang meningkatkan harga diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     1, 'Jelaskan kepada keluarga pentingnya dukungan dalam perkembangan konsep positif diri pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     2, 'Anjurkan mengidentifikasi kekuatan yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     3, 'Anjurkan mempertahankan kontak mata saat berkomunikasi dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     4, 'Anjurkan membuka diri terhadap kritik negatif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     5, 'Anjurkan mengevaluasi perilaku'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     6, 'Anjurkan cara mengatasi bullying'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     7, 'Latih peningkatan tanggung jawab untuk diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     8, 'Latih pernyataan/kemampuan positif diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',     9, 'Latih cara berfikir dan berperilaku positif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308'), 'Edukasi',    10, 'Latih meningkatkan kepercayaan pada kemampuan dalam menangani situasi');

-- I.09260 Dukungan Koping Keluarga → D.0090 Kesiapan Peningkatan Koping Keluarga
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   1, 'Identifikasi respons emosional terhadap kondisi saat ini'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   3, 'Identifikasi pemahaman keluarga tentang keputusan perawatan setelah pulang'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Observasi',   4, 'Identifikasi kesesuaian antara harapan pasien, keluarga, dan tenaga kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  1, 'Dengarkan masalah, perasaan, dan pertanyaan keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  2, 'Terima nilai-nilai keluarga dengan cara yang tidak menghakimi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  3, 'Diskusikan rencana medis dan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  4, 'Fasilitasi pengungkapan perasaan antara pasien dan keluarga atau antar anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  5, 'Fasilitasi pengambilan keputusan dalam merencanakan perawatan jangka panjang, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  6, 'Fasilitasi anggota keluarga dalam mengidentifikasi dan menyelesaikan konflik nilai'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  7, 'Fasilitasi pemenuhan kebutuhan dasar keluarga (mis. tempat tinggal, makanan, pakaian)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  8, 'Fasilitasi anggota keluarga melalui proses kematian dan berduka, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik',  9, 'Fasilitasi memperoleh pengetahuan, keterampilan, dan peralatan yang diperlukan untuk mempertahankan keputusan perawatan pasien'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 10, 'Bersikap sebagai pengganti keluarga untuk menenangkan pasien dan/atau jika keluarga tidak dapat memberikan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 11, 'Hargai dan dukung mekanisme koping adaptif yang digunakan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 12, 'Berikan kesempatan berkunjung bagi anggota keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi',     1, 'Informasikan kemajuan pasien secara berkala'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Edukasi',     2, 'Informasikan fasilitas perawatan kesehatan yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260'), 'Kolaborasi',  1, 'Rujuk untuk terapi keluarga, jika perlu');

-- I.14525 Pelibatan Keluarga → D.0090 Kesiapan Peningkatan Koping Keluarga (intervensi ke-2)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Observasi',   1, 'Identifikasi kesiapan keluarga untuk terlibat dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Terapeutik',  1, 'Ciptakan hubungan terapeutik pasien dengan keluarga dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Terapeutik',  2, 'Diskusikan cara perawatan di rumah (mis. kelompok, perawatan di rumah, atau rumah singgah)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Terapeutik',  3, 'Motivasi keluarga mengembangkan aspek positif rencana perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Terapeutik',  4, 'Fasilitasi keluarga membuat keputusan perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Edukasi',     1, 'Jelaskan kondisi pasien kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Edukasi',     2, 'Informasikan tingkat ketergantungan pasien kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Edukasi',     3, 'Informasikan harapan pasien kepada keluarga'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Edukasi',     4, 'Anjurkan keluarga bersifat asertif dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525'), 'Edukasi',     5, 'Anjurkan keluarga terlibat dalam perawatan');

-- I.12383 Edukasi Kesehatan → D.0091 Kesiapan Peningkatan Koping Komunitas
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Observasi',   1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Observasi',   2, 'Identifikasi faktor-faktor yang dapat meningkatkan dan menurunkan motivasi perilaku hidup bersih dan sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik',  1, 'Sediakan materi dan media pendidikan kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik',  2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Terapeutik',  3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi',     1, 'Jelaskan faktor resiko yang dapat mempengaruhi kesehatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi',     2, 'Ajarkan perilaku hidup bersih dan sehat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383'), 'Edukasi',     3, 'Ajarkan strategi yang dapat digunakan untuk meningkatkan perilaku hidup bersih dan sehat');

-- I.09307 Promosi Harapan → D.0092 Ketidakberdayaan
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Observasi',   1, 'Identifikasi harapan pasien dan keluarga dalam pencapaian hidup'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  1, 'Sadarkan bahwa kondisi yang dialami memiliki nilai penting'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  2, 'Pandu mengingat kembali kenangan yang menyenangkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  3, 'Libatkan pasien secara aktif dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  4, 'Kembangkan rencana perawatan yang melibatkan tingkat pencapaian tujuan sederhana sampai dengan kompleks'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  5, 'Berikan kesempatan kepada pasien dan keluarga terlibat dengan dukungan kelompok'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Terapeutik',  6, 'Ciptakan lingkungan yang memudahkan mempraktikkan kebutuhan spiritual'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     1, 'Anjurkan mengungkapkan perasaan terhadap kondisi dengan realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     2, 'Anjurkan mempertahankan hubungan (mis. menyebutkan nama orang yang dicintai)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     3, 'Anjurkan mempertahankan hubungan terapeutik dengan orang lain'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     4, 'Latih menyusun tujuan yang sesuai dengan harapan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     5, 'Latih cara mengembangkan spiritual diri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307'), 'Edukasi',     6, 'Latih cara mengenang dan menikmati masa lalu (mis. prestasi, pengalaman)');

-- I.09312 Promosi Koping → D.0092 Ketidakberdayaan (intervensi ke-2)
INSERT INTO siki_tindakan (intervensi_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   1, 'Identifikasi kegiatan jangka pendek dan panjang sesuai tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   2, 'Identifikasi kemampuan yang dimiliki'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   3, 'Identifikasi sumber daya yang tersedia untuk memenuhi tujuan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   4, 'Identifikasi pemahaman proses penyakit'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   5, 'Identifikasi dampak situasi terhadap peran dan hubungan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   6, 'Identifikasi metode penyelesaian masalah'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Observasi',   7, 'Identifikasi kebutuhan dan keinginan terhadap dukungan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  1, 'Diskusikan perubahan peran yang dialami'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  2, 'Gunakan pendekatan yang tenang dan meyakinkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  3, 'Diskusikan alasan mengkritik diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  4, 'Diskusikan untuk mengklarifikasi kesalahpahaman dan mengevaluasi perilaku sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  5, 'Diskusikan konsekuensi tidak menggunakan rasa bersalah dan rasa malu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  6, 'Diskusikan risiko yang menimbulkan bahaya pada diri sendiri'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  7, 'Fasilitasi dalam memperoleh informasi yang dibutuhkan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  8, 'Berikan pilihan realistis mengenai aspek-aspek tertentu dalam perawatan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik',  9, 'Motivasi untuk menentukan harapan yang realistis'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 10, 'Tinjau kembali kemampuan dalam pengambilan keputusan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 11, 'Hindari mengambil keputusan saat pasien berada di bawah tekanan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 12, 'Motivasi terlibat dalam kegiatan sosial'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 13, 'Motivasi mengidentifikasi sistem pendukung yang tersedia'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 14, 'Dampingi saat berduka (mis. penyakit kronis, kecacatan)'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 15, 'Perkenalkan dengan orang atau kelompok yang berhasil mengalami pengalaman sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 16, 'Dukung penggunaan mekanisme pertahanan yang tepat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Terapeutik', 17, 'Kurangi rangsangan lingkungan yang mengancam'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     1, 'Anjurkan menjalin hubungan yang memiliki kepentingan dan tujuan yang sama'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     2, 'Anjurkan penggunaan sumber spiritual, jika perlu'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     3, 'Anjurkan mengungkapkan perasaan dan persepsi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     4, 'Anjurkan keluarga terlibat'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     5, 'Anjurkan membuat tujuan yang lebih spesifik'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     6, 'Ajarkan cara memecahkan masalah secara konstruktif'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     7, 'Latih penggunaan teknik relaksasi'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     8, 'Latih keterampilan sosial, sesuai kebutuhan'),
((SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'), 'Edukasi',     9, 'Latih mengembangkan penilaian obyektif');

-- ============================================================
-- 3. slki_siki_relations
-- ============================================================

INSERT INTO slki_siki_relations (luaran_id, intervensi_id) VALUES
-- D.0085: L.06048 → I.09288
((SELECT id FROM luaran_slki WHERE kode_luaran='L.06048'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09288')),
-- D.0086 & D.0087: L.09069 → I.12463
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09069'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12463')),
-- D.0088: L.09068 → I.09256
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09068'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09256')),
-- D.0089: L.09076 → I.09308
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09076'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09308')),
-- D.0090: L.09088 → I.09260, I.14525
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09260')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09088'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.14525')),
-- D.0091: L.09089 → I.12383
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09089'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.12383')),
-- D.0092: L.09071 → I.09307, I.09312
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09307')),
((SELECT id FROM luaran_slki WHERE kode_luaran='L.09071'), (SELECT id FROM intervensi_siki WHERE kode_intervensi='I.09312'));

SET FOREIGN_KEY_CHECKS = 1;
