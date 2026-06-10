-- ============================================
-- DATA MASTER SIKI - DigiKep
-- Sumber: Standar Intervensi Keperawatan Indonesia (PPNI)
-- Halaman 34-83 (I.08233 - I.12376)
-- Catatan: Beberapa intervensi tidak memiliki kode pada cetakan buku,
--          ditandai dengan kode_intervensi = NULL
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- BATCH INSERT TABEL siki
-- ============================================

INSERT INTO siki (kode_intervensi, nama_intervensi, kategori, subkategori, definisi) VALUES
('I.08233', 'Aromaterapi', 'Fisiologis', 'Nyeri dan Kenyamanan', 'Memberikan minyak esensial melalui inhalasi, pemijatan, mandi uap, atau kompres untuk meredakan nyeri, menurunkan tekanan darah, meningkatkan relaksasi dan kenyamanan.'),
('I.02028', 'Balut Tekan', 'Fisiologis', 'Sirkulasi', 'Membalut luka dengan tekanan untuk mencegah atau menghentikan perdarahan.'),
('I.09254', 'Biblioterapi', 'Psikologis', 'Integritas Ego', 'Menggunakan literatur untuk mengekspresikan perasaan, menyelesaikan masalah secara aktif, meningkatkan kemampuan koping atau pengetahuan.'),
('I.12359', 'Bimbingan Antisipatif', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mempersiapkan pasien dan keluarga untuk mengantisipasi perkembangan atau krisis situasional.'),
('I.12360', 'Bimbingan Sistem Kesehatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Mengidentifikasi dan mengembangkan kemampuan untuk mengatasi masalah kesehatan.'),
('I.02029', 'Code Management', 'Fisiologis', 'Sirkulasi', 'Mengkoordinasikan penanganan gawat darurat untuk penyelamatan jiwa pasien.'),
('I.13476', 'Delegasi', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Melimpahkan wewenang dan tanggung jawab formal kepada orang lain untuk melaksanakan kegiatan tertentu.'),
(NULL, 'Diskusi Kelompok Terarah', 'Psikologis', 'Integritas Ego', 'Melakukan diskusi semi terstruktur untuk mengidentifikasi suatu masalah dalam kelompok.'),
(NULL, 'Dukungan Ambulasi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi pasien untuk meningkatkan aktivitas berpindah.'),
(NULL, 'Dukungan Berhenti Merokok', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Meningkatkan keinginan dan kesiapan proses berhenti merokok.'),
(NULL, 'Dukungan Emosional', 'Psikologis', 'Integritas Ego', 'Memfasilitasi penerimaan kondisi emosional selama masa stres.'),
('I.09261', 'Dukungan Hipnosis Diri', 'Psikologis', 'Integritas Ego', 'Memfasilitasi penggunaan kondisi hipnosis yang dilakukan sendiri untuk manfaat terapeutik.'),
('I.09262', 'Dukungan Kelompok', 'Psikologis', 'Integritas Ego', 'Memfasilitasi peningkatan kemampuan penyelesaian masalah dan perasaan didukung oleh kelompok individu dengan pengalaman dan masalah yang sama sehingga lebih memahami situasi masing-masing.'),
('I.13477', 'Dukungan Keluarga Merencanakan Perawatan', 'Relasional', 'Interaksi Sosial', 'Memfasilitasi perencanaan pelaksanaan perawatan kesehatan keluarga.'),
('I.12361', 'Dukungan Kepatuhan Program Pengobatan', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memfasilitasi ketepatan dan keteraturan menjalani program pengobatan yang sudah ditentukan.'),
('I.09260', 'Dukungan Keyakinan', 'Psikologis', 'Integritas Ego', 'Memfasilitasi integrasi keyakinan ke dalam rencana perawatan untuk menunjang pemulihan kondisi kesehatan.'),
('I.13478', 'Dukungan Koping Keluarga', 'Relasional', 'Interaksi Sosial', 'Memfasilitasi peningkatan nilai-nilai, minat dan tujuan dalam keluarga.'),
('I.09255', 'Dukungan Meditasi', 'Psikologis', 'Integritas Ego', 'Memfasilitasi perubahan tingkat kesadaran dengan berfokus secara khusus pada pemikiran dan perasaan.'),
(NULL, 'Dukungan Memaafkan', 'Psikologis', 'Integritas Ego', 'Memfasilitasi pengalihan perasaan marah dan dendam dengan empati dan kerendahan hati.'),
('I.05173', 'Dukungan Mobilisasi', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi pasien untuk meningkatkan aktivitas pergerakan fisik.'),
('I.09256', 'Dukungan Pelaksanaan Ibadah', 'Psikologis', 'Integritas Ego', 'Memfasilitasi pemulihan dan penyembuhan dalam perawatan melalui pelaksanaan ibadah.'),
('I.14501', 'Dukungan Pemeliharaan Rumah', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi dalam mempertahankan lingkungan rumah bersih, aman, dan mendukung pertumbuhan anggota keluarga.'),
('I.09263', 'Dukungan Pemulihan Penyalahgunaan Alkohol', 'Psikologis', 'Integritas Ego', 'Memfasilitasi proses menghentikan penyalahgunaan alkohol, meningkatkan kesehatan, kesejahteraan dan kualitas hidup.'),
('I.09264', 'Dukungan Pemulihan Penyalahgunaan Zat', 'Psikologis', 'Integritas Ego', 'Memudahkan proses perubahan menghentikan penyalahgunaan zat, meningkatkan kesehatan, kesejahteraan dan kualitas hidup.'),
(NULL, 'Dukungan Penampilan Peran', 'Relasional', 'Interaksi Sosial', 'Memfasilitasi pasien dan keluarga untuk memperbaiki hubungan dengan mengklarifikasi dan memenuhi perilaku peran tertentu.'),
('I.09265', 'Dukungan Pengambilan Keputusan', 'Psikologis', 'Integritas Ego', 'Memberikan informasi dan dukungan saat pembuatan keputusan kesehatan.'),
('I.09266', 'Dukungan Pengungkapan Kebutuhan', 'Psikologis', 'Integritas Ego', 'Memudahkan mengungkapkan kebutuhan dan keinginan secara efektif.'),
('I.09267', 'Dukungan Pengungkapan Perasaan', 'Psikologis', 'Integritas Ego', 'Memudahkan mengekspresikan, memahami dan mengelola emosi.'),
(NULL, 'Dukungan Perasaan Bersalah', 'Psikologis', 'Integritas Ego', 'Memfasilitasi dalam mengatasi perasaan menyakitkan akibat kegagalan tanggung jawab.'),
('I.11348', 'Dukungan Perawatan Diri', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan perawatan diri.'),
('I.11349', 'Dukungan Perawatan Diri: BAB/BAK', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan buang air kecil (BAK) dan buang air besar (BAB).'),
('I.11350', 'Dukungan Perawatan Diri: Berpakaian', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan berpakaian dan berhias.'),
('I.11351', 'Dukungan Perawatan Diri: Makan/Minum', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan makan/minum.'),
('I.11352', 'Dukungan Perawatan Diri: Mandi', 'Perilaku', 'Kebersihan Diri', 'Memfasilitasi pemenuhan kebutuhan kebersihan diri.'),
('I.09269', 'Dukungan Perkembangan Spiritual', 'Psikologis', 'Integritas Ego', 'Memfasilitasi pengembangan kemampuan mengidentifikasi, berhubungan, dan mencari sumber makna, tujuan, kekuatan dan harapan dalam hidup.'),
('I.09270', 'Dukungan Perlindungan Penganiayaan', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi pencegahan dan penanganan bahaya fisik, psikologis dan/atau seksual.'),
(NULL, 'Dukungan Perlindungan Penganiayaan Agama', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi identifikasi risiko tinggi, pengendalian hubungan dan kegiatan keagamaan.'),
(NULL, 'Dukungan Perlindungan Penganiayaan Lansia', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi pencegahan dan penanganan terjadinya bahaya fisik, seksual, emosional, dan eksploitasi pada lanjut usia.'),
(NULL, 'Dukungan Perlindungan Penganiayaan Pasangan', 'Lingkungan', 'Keamanan dan Proteksi', 'Memfasilitasi pencegahan dan penanganan terjadinya bahaya fisik, seksual, emosional, dan eksploitasi dari pasangan rumah tangga.'),
(NULL, 'Dukungan Proses Berduka', 'Psikologis', 'Integritas Ego', 'Memfasilitasi menyelesaikan proses berduka terhadap kehilangan yang bermakna.'),
(NULL, 'Dukungan Proses Berduka: Kematian Perinatal', 'Psikologis', 'Integritas Ego', 'Memfasilitasi proses berduka orang tua terhadap kematian perinatal.'),
(NULL, 'Dukungan Sibling', 'Relasional', 'Interaksi Sosial', 'Memfasilitasi saudara kandung untuk beradaptasi dengan kondisi saudaranya yang sakit/kondisi kronis/berkebutuhan khusus.'),
('I.09271', 'Dukungan Spiritual', 'Psikologis', 'Integritas Ego', 'Memfasilitasi peningkatan perasaan seimbang dan terhubung dengan kekuatan yang lebih besar.'),
('I.09272', 'Dukungan Sumber Finansial', 'Psikologis', 'Integritas Ego', 'Memfasilitasi pengelolaan sumber keuangan secara tepat untuk mendukung perawatan dan kesehatan.'),
('I.09273', 'Dukungan Tanggung Jawab Pada Diri Sendiri', 'Psikologis', 'Integritas Ego', 'Memfasilitasi agar dapat bertanggung jawab atas perilaku sendiri dan konsekuensi yang ditimbulkannya.'),
('I.05174', 'Dukungan Tidur', 'Fisiologis', 'Aktivitas dan Istirahat', 'Memfasilitasi siklus tidur dan terjaga yang teratur.'),
('I.01011', 'Dukungan Ventilasi', 'Fisiologis', 'Respirasi', 'Memfasilitasi dalam mempertahankan pernapasan spontan untuk memaksimalkan pertukaran gas di paru-paru.'),
('I.13479', 'Dukungan Visitasi', 'Relasional', 'Interaksi Sosial', 'Memfasilitasi tim kesehatan untuk mengunjungi pasien di ruang rawat.'),
(NULL, 'Edukasi Aktivitas/Istirahat', 'Fisiologis', 'Aktivitas dan Istirahat', 'Mengajarkan pengaturan aktivitas dan istirahat.'),
('I.12363', 'Edukasi Alat Bantu Dengar', 'Fisiologis', 'Neurosensori', 'Mengajarkan penggunaan dan perawatan alat bantu dengar.'),
('I.12364', 'Edukasi Analgesia Terkontrol', 'Fisiologis', 'Nyeri dan Kenyamanan', 'Memberikan informasi cara pengendalian nyeri dengan agen analgesik yang terkontrol.'),
('I.12365', 'Edukasi Berat Badan Efektif', 'Fisiologis', 'Nutrisi dan Cairan', 'Memberikan informasi tentang berat badan dan persentase lemak tubuh yang optimal.'),
('I.12366', 'Edukasi Berhenti Merokok', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi terkait dampak merokok dan upaya untuk berhenti merokok.'),
('I.12367', 'Edukasi Dehidrasi', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengajarkan pengelolaan kekurangan cairan dan elektrolit.'),
('I.12368', 'Edukasi Dialisis Peritoneal', 'Fisiologis', 'Eliminasi', 'Mengajarkan cara melakukan pengeluaran produk metabolisme tubuh melalui membran peritoneal secara mandiri.'),
('I.12369', 'Edukasi Diet', 'Fisiologis', 'Nutrisi dan Cairan', 'Mengajarkan jumlah, jenis dan jadwal asupan makanan yang diprogramkan.'),
('I.12370', 'Edukasi Edema', 'Fisiologis', 'Nutrisi dan Cairan', 'Memberikan informasi penanganan dan pencegahan penumpukan cairan baik pada ekstremitas maupun seluruh tubuh.'),
('I.12371', 'Edukasi Efek Samping Obat', 'Perilaku', 'Penyuluhan dan Pembelajaran', 'Memberikan informasi untuk meminimalkan efek samping dari agen farmakologis yang diprogramkan.'),
('I.12372', 'Edukasi Fisioterapi Dada', 'Fisiologis', 'Respirasi', 'Mengajarkan memobilisasi sekresi jalan napas melalui perkusi, getaran, dan drainase postural.'),
('I.12373', 'Edukasi Hemodialisis', 'Fisiologis', 'Eliminasi', 'Memberikan informasi tentang proses pembersihan darah untuk meningkatkan efektifitas terapi dan meminimalkan kemungkinan komplikasi.'),
('I.12374', 'Edukasi Infertilitas', 'Fisiologis', 'Reproduksi dan Seksualitas', 'Memberikan informasi pada pasien dan pasangan tentang ketidaksuburan.'),
('I.12375', 'Edukasi Irigasi Kandung Kemih', 'Fisiologis', 'Eliminasi', 'Memberikan informasi tentang irigasi kandung kemih.'),
('I.12376', 'Edukasi Irigasi Kolostomi', 'Fisiologis', 'Eliminasi', 'Mengajarkan cara merawat dan membersihkan kolon dan feses melalui lubang buatan.');

-- ============================================
-- I.08233 Aromaterapi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Observasi', 1, 'Identifikasi pilihan aroma yang disukai dan tidak disukai'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Observasi', 2, 'Identifikasi tingkat nyeri, stres, kecemasan, dan alam perasaan sebelum dan sesudah aromaterapi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Observasi', 3, 'Monitor ketidaknyamanan sebelum dan setelah pemberian (mis. mual, pusing)'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Observasi', 4, 'Monitor masalah yang terjadi saat pemberian aromaterapi (mis. dermatitis kontak, asma)'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Observasi', 5, 'Monitor tanda-tanda vital sebelum dan sesudah aromaterapi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Terapeutik', 1, 'Pilih minyak esensial yang tepat sesuai dengan indikasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Terapeutik', 2, 'Lakukan uji kepekaan kulit dengan uji tempel (patch test) dengan larutan 2% pada daerah lipatan lengan atau lipatan belakang leher'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Terapeutik', 3, 'Berikan minyak esensial dengan metode yang tepat (mis. inhalasi, pemijatan, mandi uap, atau kompres)'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Edukasi', 1, 'Ajarkan cara menyimpan minyak esensial dengan tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Edukasi', 2, 'Anjurkan menggunakan minyak esensial secara bervariasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Edukasi', 3, 'Anjurkan menghindarkan kemasan minyak esensial dari jangkauan anak-anak'),
((SELECT id FROM siki WHERE kode_intervensi='I.08233'), 'Kolaborasi', 1, 'Konsultasikan jenis dan dosis minyak esensial yang tepat dan aman');

-- ============================================
-- I.02028 Balut Tekan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Observasi', 1, 'Monitor perban untuk memantau drainase luka'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Observasi', 2, 'Monitor jumlah dan warna cairan drainase dari luka'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Observasi', 3, 'Periksa kecepatan dan kekuatan denyut nadi distal'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Observasi', 4, 'Periksa akral, kondisi kulit dan pengisian kapiler distal'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 1, 'Pasang sarung tangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 2, 'Tinggikan bagian tubuh yang cedera di atas level jantung, jika tidak ada fraktur'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 3, 'Tutup luka dengan kasa tebal'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 4, 'Tekan kasa dengan kuat di atas luka selama beberapa menit'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 5, 'Fiksasi kasa dengan plaster setelah perdarahan berhenti'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Terapeutik', 6, 'Tekan arteri (pressure point) yang mengarah ke area perdarahan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur balut tekan'),
((SELECT id FROM siki WHERE kode_intervensi='I.02028'), 'Edukasi', 2, 'Anjurkan membatasi gerak pada area cedera');

-- ============================================
-- I.09254 Biblioterapi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Observasi', 1, 'Identifikasi kebutuhan emosional, kognitif, perkembangan, dan situasional'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Observasi', 2, 'Identifikasi kemampuan membaca'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 1, 'Tetapkan tujuan terapi (mis. perubahan emosi, pengembangan kepribadian, pembelajaran perilaku baru)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 2, 'Pilih literatur (cerita, puisi, esai, artikel, buku, atau novel) berdasarkan kemampuan membaca, atau sesuai situasi/perasaan yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 3, 'Gunakan gambar dan ilustrasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 4, 'Diskusikan perasaan yang diungkapkan oleh karakter dalam literatur'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 5, 'Diskusikan untuk membandingkan citra, karakter, situasi, atau konsep dalam literatur dengan situasi yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 6, 'Fasilitasi mengenali situasi dalam literatur untuk melakukan perubahan perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 7, 'Lanjutkan sesi membaca dengan sesi bermain peran, baik individu maupun kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Terapeutik', 8, 'Berikan waktu jeda beberapa menit agar pasien dapat merefleksikan materi bacaannya'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur biblioterapi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Edukasi', 2, 'Anjurkan membaca dengan suara yang dapat didengar, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Edukasi', 3, 'Anjurkan membaca ulang'),
((SELECT id FROM siki WHERE kode_intervensi='I.09254'), 'Kolaborasi', 1, 'Konsultasikan dengan pustakawan untuk penelusuran buku/literatur yang tepat');

-- ============================================
-- I.12359 Bimbingan Antisipatif
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Observasi', 1, 'Identifikasi metode penyelesaian masalah yang biasa digunakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Observasi', 2, 'Identifikasi kemungkinan perkembangan atau krisis situasional yang akan terjadi serta dampaknya pada individu dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 1, 'Fasilitasi memutuskan bagaimana masalah akan diselesaikan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 2, 'Fasilitasi memutuskan siapa yang akan dilibatkan dalam menyelesaikan masalah'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 3, 'Gunakan contoh kasus untuk meningkatkan keterampilan menyelesaikan masalah'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 4, 'Fasilitasi mengidentifikasi sumber daya yang tersedia'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 5, 'Fasilitasi menyesuaikan diri dengan perubahan peran'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 6, 'Jadwalkan kunjungan pada setiap tahap perkembangan atau sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 7, 'Jadwalkan tindak lanjut untuk memantau atau memberi dukungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 8, 'Berikan nomor kontak yang dapat dihubungi, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 9, 'Libatkan keluarga dan pihak terkait, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Terapeutik', 10, 'Berikan referensi baik cetak ataupun elektronik (mis. materi pendidikan, pamflet)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Edukasi', 1, 'Jelaskan perkembangan dan perilaku normal'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Edukasi', 2, 'Informasikan harapan yang realistis terkait perilaku pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Edukasi', 3, 'Latih teknik koping yang dibutuhkan untuk mengatasi perkembangan atau krisis situasional'),
((SELECT id FROM siki WHERE kode_intervensi='I.12359'), 'Kolaborasi', 1, 'Rujuk ke lembaga pelayanan masyarakat, jika perlu');

-- ============================================
-- I.12360 Bimbingan Sistem Kesehatan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Observasi', 1, 'Identifikasi masalah kesehatan individu, keluarga dan masyarakat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Observasi', 2, 'Identifikasi inisiatif individu, keluarga dan masyarakat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Terapeutik', 1, 'Fasilitasi pemenuhan kebutuhan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Terapeutik', 2, 'Fasilitasi pemenuhan kebutuhan kesehatan mandiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Terapeutik', 3, 'Libatkan kolega/teman untuk membimbing pemenuhan kebutuhan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Terapeutik', 4, 'Siapkan pasien untuk mampu berkolaborasi dan bekerjasama dalam pemenuhan kebutuhan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12360'), 'Edukasi', 1, 'Bimbing untuk bertanggung jawab mengidentifikasi dan mengembangkan kemampuan memecahkan masalah kesehatan secara mandiri');

-- ============================================
-- I.02029 Code Management
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 1, 'Monitor tingkat kesadaran'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 2, 'Monitor irama jantung'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 3, 'Monitor pemberian Advanced Cardiac Life Support sesuai protokol yang tersedia'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 4, 'Monitor kualitas resusitasi jantung paru yang diberikan (mis. kedalaman kompresi, kecepatan kompresi, rekoil dada penuh, tidak ada interupsi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 5, 'Interpretasi EKG dengan akurat untuk pemberian kardioversi/defibrilasi yang tepat, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Observasi', 6, 'Periksa ketersediaan obat-obat emergensi'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 1, 'Panggil bantuan jika pasien tidak sadar'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 2, 'Aktifkan code blue'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 3, 'Lakukan resusitasi jantung paru, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 4, 'Pastikan jalan napas terbuka'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 5, 'Berikan bantuan napas, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 6, 'Pasang monitor jantung'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 7, 'Minimalkan interupsi pada saat kompresi dan defibrilasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 8, 'Pasang akses vena, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 9, 'Siapkan intubasi, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 10, 'Berikan kesempatan kepada keluarga untuk melihat pasien saat resusitasi, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 11, 'Berikan dukungan kepada keluarga yang hadir pada saat resusitasi berlangsung'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 12, 'Akhiri tindakan jika ada tanda-tanda sirkulasi spontan (mis. nadi karotis teraba, kesadaran pulih)'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Terapeutik', 13, 'Lakukan perawatan post cardiac arrest'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Kolaborasi', 1, 'Kolaborasi pemberian defibrilasi atau kardioversi, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Kolaborasi', 2, 'Kolaborasi pemberian epinefrin atau adrenalin, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.02029'), 'Kolaborasi', 3, 'Kolaborasi pemberian amiodaron, jika perlu');

-- ============================================
-- I.13476 Delegasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Observasi', 1, 'Identifikasi tugas-tugas yang dapat dilimpahkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Observasi', 2, 'Identifikasi orang yang tepat untuk didelegasikan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Observasi', 3, 'Monitor kinerja dalam pelaksanaan delegasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Terapeutik', 1, 'Susun perencanaan delegasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Terapeutik', 2, 'Tetapkan tujuan dan sasaran yang realistis'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Terapeutik', 3, 'Sesuaikan tugas atau kewajiban dengan kemampuan staf'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Terapeutik', 4, 'Hindari mengambil kembali tugas yang sudah didelegasikan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Terapeutik', 5, 'Kontrol dan koordinasikan pekerjaan staf dengan mengukur pencapaian tujuan berdasarkan standar'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Edukasi', 1, 'Jelaskan tujuan dilakukan delegasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13476'), 'Edukasi', 2, 'Latih staf dengan memberikan tugas dan wewenang baik secara tertulis maupun lisan');

-- ============================================
-- Diskusi Kelompok Terarah (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi kebutuhan diskusi kelompok terarah'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi peserta diskusi'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Observasi', 3, 'Catat pemikiran atau ide yang muncul dalam diskusi'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Atur ruangan dengan suasana nyaman, rancang posisi tempat duduk'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Persiapkan alat (mis. sistem audio, perekam, media tulis)'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Lakukan orientasi kelompok: salam, peserta diminta memberikan nama dan informasi data diri'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Lakukan kontrak waktu'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Sampaikan diskusi akan direkam'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Arahkan pertanyaan sesuai tujuan dan hindari pertanyaan yang tidak relevan'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 7, 'Berikan kesempatan semua peserta untuk berpartisipasi selama diskusi'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 8, 'Motivasi interaksi peserta untuk berbicara satu sama lain, tidak harus ke fasilitator'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 9, 'Motivasi peserta yang enggan berbicara'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 10, 'Batasi peserta yang mendominasi diskusi melalui isyarat verbal dan nonverbal'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 11, 'Tunjukkan sikap mendengar aktif agar menjadi model perilaku bagi peserta'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 12, 'Lakukan eksplorasi mendalam tanpa mengarahkan peserta'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 13, 'Sampaikan ringkasan secara verbal'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Terapeutik', 14, 'Berikan umpan balik diskusi berupa analisis dan laporan'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur FGD'),
((SELECT id FROM siki WHERE nama_intervensi='Diskusi Kelompok Terarah' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Informasikan topik yang akan didiskusikan');

-- ============================================
-- Dukungan Ambulasi (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi adanya nyeri atau keluhan fisik lainnya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi toleransi fisik melakukan ambulasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Observasi', 3, 'Monitor frekuensi jantung dan tekanan darah sebelum memulai ambulasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Observasi', 4, 'Monitor kondisi umum selama melakukan ambulasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Fasilitasi aktivitas ambulasi dengan alat bantu (mis. tongkat, kruk)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Fasilitasi melakukan mobilisasi fisik, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Libatkan keluarga untuk membantu pasien dalam meningkatkan ambulasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur ambulasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan melakukan ambulasi dini'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Ambulasi' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Ajarkan ambulasi sederhana yang harus dilakukan (mis. berjalan dari tempat tidur ke kursi roda, berjalan dari tempat tidur ke kamar mandi, berjalan sesuai toleransi)');

-- ============================================
-- Dukungan Berhenti Merokok (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi keinginan berhenti merokok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi upaya berhenti merokok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Diskusikan motivasi penghentian merokok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Diskusikan kesiapan perubahan gaya hidup'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Lakukan pendekatan psikoedukasi untuk mendukung dan membimbing upaya berhenti merokok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan efek langsung berhenti merokok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Berhenti Merokok' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Jelaskan berbagai intervensi dengan farmakoterapi (mis. terapi penggantian nikotin)');

-- ============================================
-- Dukungan Emosional (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi fungsi marah, frustrasi, dan amuk bagi pasien'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi hal yang telah memicu emosi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Fasilitasi mengungkapkan perasaan cemas, marah, atau sedih'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Buat pernyataan suportif atau empati selama fase berduka'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Lakukan sentuhan untuk memberikan dukungan (mis. merangkul, menepuk-nepuk)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Tetap bersama pasien dan pastikan keamanan selama ansietas, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Kurangi tuntutan berpikir saat sakit atau lelah'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan konsekuensi tidak menghadapi rasa bersalah dan malu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan mengungkapkan perasaan yang dialami (mis. ansietas, marah, sedih)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Anjurkan mengungkapkan pengalaman emosional sebelumnya dan pola respons yang biasa digunakan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Ajarkan penggunaan mekanisme pertahanan yang tepat'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Emosional' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk untuk konseling, jika perlu');

-- ============================================
-- I.09261 Dukungan Hipnosis Diri
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 1, 'Identifikasi apakah hipnosis diri dapat digunakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 2, 'Identifikasi masalah yang akan diatasi dengan hipnosis diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 3, 'Identifikasi penerimaan terhadap hipnosis diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 4, 'Identifikasi mitos dan kesalahpahaman terhadap penggunaan hipnosis diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 5, 'Identifikasi kesesuaian sugesti hipnosis'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 6, 'Identifikasi teknik induksi yang sesuai (mis. ilusi pendulum Chevreul, relaksasi, relaksasi otot, latihan visualisasi, perhatian pada pernapasan, mengulang kata/frase kunci)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 7, 'Identifikasi teknik pendalaman yang sesuai (mis. gerakan tangan ke wajah, teknik eskalasi imajinasi, fraksinasi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 8, 'Monitor respons terhadap hipnosis diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Observasi', 9, 'Monitor kemajuan yang dicapai terhadap tujuan terapi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Terapeutik', 1, 'Tetapkan tujuan hipnosis diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Terapeutik', 2, 'Buatkan jadwal latihan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Edukasi', 1, 'Jelaskan jenis hipnosis diri sebagai penunjang terapi modalitas (mis. hipnoterapi, psikoterapi, terapi kelompok, terapi keluarga)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Edukasi', 2, 'Ajarkan prosedur hipnosis diri sesuai kebutuhan dan tujuan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09261'), 'Edukasi', 3, 'Anjurkan memodifikasi prosedur hipnosis diri (frekuensi, intensitas, teknik) berdasarkan respons dan kenyamanan');

-- ============================================
-- I.09262 Dukungan Kelompok
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Observasi', 1, 'Identifikasi masalah yang sebenarnya dialami kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Observasi', 2, 'Identifikasi kelompok memiliki masalah yang sama'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Observasi', 3, 'Identifikasi hambatan menghadiri sesi kelompok (mis. stigma, cemas, tidak aman)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Observasi', 4, 'Identifikasi aturan dan norma yang perlu dimodifikasi pada sesi selanjutnya, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 1, 'Siapkan lingkungan terapeutik dan rileks'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 2, 'Bentuk kelompok dengan pengalaman dan masalah yang sama'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 3, 'Mulai sesi kelompok dengan mengenalkan semua anggota kelompok dan terapis'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 4, 'Mulai dengan percakapan ringan, berbagi informasi tentang diri masing-masing dan alasan terlibat dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 5, 'Buat aturan dan norma dalam kelompok, terutama kerahasiaan dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 6, 'Sepakati jumlah sesi yang diperlukan dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 7, 'Bangun rasa tanggung jawab dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 8, 'Diskusikan penyelesaian masalah dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 9, 'Berikan kesempatan individu untuk berhenti sejenak saat merasa distres akibat topik tertentu sampai mampu berpartisipasi kembali'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 10, 'Berikan kesempatan istirahat di setiap sesi untuk memfasilitasi percakapan individual dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 11, 'Berikan kesempatan saling mendukung dalam kelompok terkait masalah dan penyelesaian masalah'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 12, 'Berikan kesempatan kelompok menyimpulkan masalah, penyelesaian masalah dan dukungan yang diperlukan untuk setiap anggota kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 13, 'Hindarkan percakapan ofensif, tidak sensitif seksual atau humor yang tidak perlu/tidak pada tempatnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 14, 'Sediakan media untuk kebutuhan berkomunikasi di luar kelompok (mis. email, telepon, SMS, WA)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 15, 'Lakukan refleksi manfaat dukungan kelompok pada setiap awal dan akhir pertemuan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Terapeutik', 16, 'Akhiri kegiatan sesuai sesi yang disepakati'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Edukasi', 1, 'Anjurkan anggota kelompok mendengarkan dan memberi dukungan saat mendiskusikan masalah dan perasaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Edukasi', 2, 'Anjurkan bersikap jujur dalam menceritakan perasaan dan masalah'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Edukasi', 3, 'Anjurkan setiap anggota kelompok mengemukakan ketidakpuasan, keluhan, kritik dalam kelompok dengan cara santun'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Edukasi', 4, 'Anjurkan kelompok untuk menuntaskan ketidakpuasan, keluhan dan kritik'),
((SELECT id FROM siki WHERE kode_intervensi='I.09262'), 'Edukasi', 5, 'Ajarkan relaksasi pada setiap sesi, jika perlu');

-- ============================================
-- I.13477 Dukungan Keluarga Merencanakan Perawatan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Observasi', 1, 'Identifikasi kebutuhan dan harapan keluarga tentang kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Observasi', 2, 'Identifikasi konsekuensi tidak melakukan tindakan bersama keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Observasi', 3, 'Identifikasi sumber-sumber yang dimiliki keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Observasi', 4, 'Identifikasi tindakan yang dapat dilakukan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Terapeutik', 1, 'Motivasi pengembangan sikap dan emosi yang mendukung upaya kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Terapeutik', 2, 'Gunakan sarana dan fasilitas yang ada dalam keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Terapeutik', 3, 'Ciptakan perubahan lingkungan rumah secara optimal'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Edukasi', 1, 'Informasikan fasilitas kesehatan yang ada di lingkungan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Edukasi', 2, 'Anjurkan menggunakan fasilitas kesehatan yang ada'),
((SELECT id FROM siki WHERE kode_intervensi='I.13477'), 'Edukasi', 3, 'Ajarkan cara perawatan yang bisa dilakukan keluarga');

-- ============================================
-- I.12361 Dukungan Kepatuhan Program Pengobatan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Observasi', 1, 'Identifikasi kepatuhan menjalani program pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 1, 'Buat komitmen menjalani program pengobatan dengan baik'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 2, 'Buat jadwal pendampingan keluarga untuk bergantian menemani pasien selama menjalani program pengobatan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 3, 'Dokumentasikan aktivitas selama menjalani proses pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 4, 'Diskusikan hal-hal yang dapat mendukung atau menghambat berjalannya program pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Terapeutik', 5, 'Libatkan keluarga untuk mendukung program pengobatan yang dijalani'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Edukasi', 1, 'Informasikan program pengobatan yang harus dijalani'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Edukasi', 2, 'Informasikan manfaat yang akan diperoleh jika teratur menjalani program pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Edukasi', 3, 'Anjurkan keluarga untuk mendampingi dan merawat pasien selama menjalani program pengobatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12361'), 'Edukasi', 4, 'Anjurkan pasien dan keluarga melakukan konsultasi ke pelayanan kesehatan terdekat, jika perlu');

-- ============================================
-- I.09260 Dukungan Keyakinan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Observasi', 1, 'Identifikasi keyakinan, masalah, dan tujuan perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Observasi', 2, 'Identifikasi kesembuhan jangka panjang sesuai kondisi pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Observasi', 3, 'Monitor kesehatan fisik dan mental pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 1, 'Integrasikan keyakinan dalam rencana perawatan sepanjang tidak membahayakan/berisiko keselamatan, sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 2, 'Berikan harapan yang realistis sesuai prognosis'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 3, 'Fasilitasi pertemuan antara keluarga dan tim kesehatan untuk membuat keputusan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Terapeutik', 4, 'Fasilitasi memberikan makna terhadap kondisi kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Edukasi', 1, 'Jelaskan bahaya atau risiko yang terjadi akibat keyakinan negatif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Edukasi', 2, 'Jelaskan alternatif yang berdampak positif untuk memenuhi keyakinan dan perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09260'), 'Edukasi', 3, 'Berikan penjelasan yang relevan dan mudah dipahami');

-- ============================================
-- I.13478 Dukungan Koping Keluarga
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Observasi', 1, 'Identifikasi respons emosional terhadap kondisi saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Observasi', 2, 'Identifikasi beban prognosis secara psikologis'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Observasi', 3, 'Identifikasi pemahaman tentang keputusan perawatan setelah pulang'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Observasi', 4, 'Identifikasi kesesuaian antara harapan pasien, keluarga, dan tenaga kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 1, 'Dengarkan masalah, perasaan, dan pertanyaan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 2, 'Terima nilai-nilai keluarga dengan cara yang tidak menghakimi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 3, 'Diskusikan rencana medis dan perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 4, 'Fasilitasi pengungkapan perasaan antara pasien dan keluarga atau antar anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 5, 'Fasilitasi pengambilan keputusan dalam merencanakan perawatan jangka panjang, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 6, 'Fasilitasi anggota keluarga dalam mengidentifikasi dan menyelesaikan konflik nilai'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 7, 'Fasilitasi pemenuhan kebutuhan dasar keluarga (mis. tempat tinggal, makanan, pakaian)'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 8, 'Fasilitasi anggota keluarga melalui proses kematian dan berduka, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 9, 'Fasilitasi memperoleh pengetahuan, keterampilan, dan peralatan yang diperlukan untuk mempertahankan keputusan perawatan pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 10, 'Bersikap sebagai pengganti keluarga untuk menenangkan pasien dan/atau jika keluarga tidak dapat memberikan perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 11, 'Hargai dan dukung mekanisme koping adaptif yang digunakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Terapeutik', 12, 'Berikan kesempatan berkunjung bagi anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Edukasi', 1, 'Informasikan kemajuan pasien secara berkala'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Edukasi', 2, 'Informasikan fasilitas perawatan kesehatan yang tersedia'),
((SELECT id FROM siki WHERE kode_intervensi='I.13478'), 'Kolaborasi', 1, 'Rujuk untuk terapi keluarga, jika perlu');

-- ============================================
-- I.09255 Dukungan Meditasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Observasi', 1, 'Identifikasi kesiapan menjalani meditasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Observasi', 2, 'Identifikasi penerimaan terhadap meditasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Observasi', 3, 'Monitor efektifitas meditasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Terapeutik', 1, 'Sediakan lingkungan yang tenang'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Terapeutik', 2, 'Fasilitasi memilih kata-kata yang memiliki efek menenangkan (mis. mengulangi kata "satu", "ikhlas", "sabar", "alhamdulillah", "astaghfirullah")'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Terapeutik', 3, 'Setelah selesai, mintalah pasien untuk duduk diam selama beberapa menit dengan mata terbuka'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 1, 'Anjurkan mengabaikan pikiran yang mengganggu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 2, 'Anjurkan duduk dengan tenang dalam posisi yang nyaman'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 3, 'Anjurkan menutup mata, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 4, 'Anjurkan memfokuskan perhatian pada saat tarik napas sambil mengucapkan kata pilihan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 5, 'Anjurkan melemaskan semua otot dan tetap rileks'),
((SELECT id FROM siki WHERE kode_intervensi='I.09255'), 'Edukasi', 6, 'Anjurkan melakukan meditasi 1-2 kali sehari');

-- ============================================
-- Dukungan Memaafkan (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi sumber kemarahan dan kebencian'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi keyakinan yang menghambat dan membantu mengungkapkan masalah'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi perasaan marah, kepahitan, dan dendam'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Dengarkan ungkapan perasaan dan pikiran secara empati'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Gunakan teknik kehadiran, sentuhan, dan empati, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Fasilitasi mengatasi hambatan pemulihan dengan cara spiritual (mis. doa, bimbingan, bersikap bijaksana)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Fasilitasi kegiatan ibadah, bermohon ampun/taubat kepada Tuhan (mis. sholat taubat, pengakuan dosa)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan bahwa memaafkan adalah sebuah proses'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Jelaskan bahwa memaafkan memiliki dimensi kesehatan dan pemulihan diri'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Memaafkan' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Ajarkan teknik melepaskan emosi dan relaksasi');

-- ============================================
-- I.05173 Dukungan Mobilisasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 1, 'Identifikasi adanya nyeri atau keluhan fisik lainnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 2, 'Identifikasi toleransi fisik melakukan pergerakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 3, 'Monitor frekuensi jantung dan tekanan darah sebelum memulai mobilisasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Observasi', 4, 'Monitor kondisi umum selama melakukan mobilisasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 1, 'Fasilitasi aktivitas mobilisasi dengan alat bantu (mis. pagar tempat tidur)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 2, 'Fasilitasi melakukan pergerakan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Terapeutik', 3, 'Libatkan keluarga untuk membantu pasien dalam meningkatkan pergerakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur mobilisasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Edukasi', 2, 'Anjurkan melakukan mobilisasi dini'),
((SELECT id FROM siki WHERE kode_intervensi='I.05173'), 'Edukasi', 3, 'Ajarkan mobilisasi sederhana yang harus dilakukan (mis. duduk di tempat tidur, duduk di sisi tempat tidur, pindah dari tempat tidur ke kursi)');

-- ============================================
-- I.09256 Dukungan Pelaksanaan Ibadah
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Observasi', 1, 'Identifikasi kebutuhan pelaksanaan ibadah sesuai agama yang dianut'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 1, 'Sediakan sarana yang aman dan nyaman untuk pelaksanaan ibadah (mis. tempat berwudhu, perlengkapan sholat, arah kiblat, perlengkapan kebaktian)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 2, 'Fasilitasi konsultasi medis dan tokoh agama terhadap prosedur khusus (mis. donor, transfusi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 3, 'Fasilitasi penggunaan ibadah sebagai sumber koping'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 4, 'Fasilitasi kebutuhan diet sesuai dengan agama yang dianut (mis. tidak makan babi bagi muslim, tidak makan daging sapi bagi hindu)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 5, 'Fasilitasi pemenuhan ritual pada situasi khusus (mis. mengadzankan bayi, pembaptisan, pengakuan dosa, menuntun syahadat saat sakaratul maut, menghadap kiblat)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Terapeutik', 6, 'Fasilitasi penuntunan ibadah oleh keluarga dan/atau rohaniawan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Kolaborasi', 1, 'Konsultasi medis terkait pelaksanaan ibadah yang memerlukan perhatian (mis. puasa)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09256'), 'Kolaborasi', 2, 'Rujuk pada rohaniawan, konseling profesi, dan kelompok pendukung pada situasi spiritual dan ritual, jika sesuai');

-- ============================================
-- I.14501 Dukungan Pemeliharaan Rumah
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Observasi', 1, 'Identifikasi faktor yang berkontribusi terhadap gangguan pemeliharaan rumah (mis. tambahan anggota keluarga baru, anggota keluarga sakit, kematian, masalah finansial, manajemen kesehatan yang buruk)'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 1, 'Dukung anggota keluarga dalam menetapkan tujuan yang dapat dicapai terkait pemeliharaan rumah'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 2, 'Fasilitasi dalam mencuci pakaian kotor'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 3, 'Fasilitasi perbaikan rumah, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 4, 'Bantu keluarga menggunakan dukungan sosial'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Terapeutik', 5, 'Koordinasi penggunaan sumber-sumber di komunitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Edukasi', 1, 'Ajarkan strategi menciptakan lingkungan rumah yang aman dan bersih'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Edukasi', 2, 'Anjurkan modifikasi penataan perabotan rumah agar lebih mudah dicapai'),
((SELECT id FROM siki WHERE kode_intervensi='I.14501'), 'Edukasi', 3, 'Anjurkan menggunakan jasa pengendalian hama, jika perlu');

-- ============================================
-- I.09263 Dukungan Pemulihan Penyalahgunaan Alkohol
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Observasi', 1, 'Identifikasi penerimaan dan pengakuan ketidakberdayaan terhadap adiksi yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Observasi', 2, 'Monitor kemajuan pemulihan penyalahgunaan alkohol'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 1, 'Fasilitasi mengubah perilaku adiksi secara bertahap'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 2, 'Fasilitasi mengembangkan hubungan yang mendukung ketenangan dan pemulihan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 3, 'Fasilitasi memeriksa keyakinan keluarga yang menyebabkan disfungsi gaya hidup'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 4, 'Fasilitasi mengembangkan koping produktif dan bertanggung jawab tanpa penyalahgunaan alkohol'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 5, 'Ciptakan suasana saling mendukung dalam kelompok'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Terapeutik', 6, 'Libatkan dalam kelompok pendukung dan pencegahan kekambuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Edukasi', 1, 'Jelaskan pentingnya pulih dari penyalahgunaan alkohol'),
((SELECT id FROM siki WHERE kode_intervensi='I.09263'), 'Edukasi', 2, 'Ajarkan pemulihan trauma akibat penyalahgunaan alkohol');

-- ============================================
-- I.09264 Dukungan Pemulihan Penyalahgunaan Zat
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Observasi', 1, 'Identifikasi penerimaan dan pengakuan ketidakberdayaan terhadap adiksi yang dialami'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 1, 'Fasilitasi melalui fase putus zat sampai mampu mengendalikan pikiran dan perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 2, 'Fasilitasi mengubah perilaku adiksi secara bertahap'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 3, 'Fasilitasi mengidentifikasi pola dan keyakinan keluarga yang menyebabkan disfungsi gaya hidup'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 4, 'Fasilitasi mengubah dan memperbaiki kesalahan gaya hidup selama penggunaan zat'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 5, 'Fasilitasi mengembangkan koping produktif dan bertanggung jawab'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 6, 'Libatkan kelompok pendukung'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Terapeutik', 7, 'Libatkan dalam sesi kelompok pencegahan kekambuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Edukasi', 1, 'Jelaskan pentingnya pulih dari penyalahgunaan zat'),
((SELECT id FROM siki WHERE kode_intervensi='I.09264'), 'Edukasi', 2, 'Ajarkan pemulihan trauma akibat penyalahgunaan zat');

-- ============================================
-- Dukungan Penampilan Peran (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi berbagai peran dan periode transisi sesuai tingkat perkembangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi peran yang ada dalam keluarga'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi adanya peran yang tidak terpenuhi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Fasilitasi adaptasi peran keluarga terhadap perubahan peran yang tidak diinginkan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Fasilitasi bermain peran dalam mengantisipasi reaksi orang lain terhadap perilaku'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Fasilitasi diskusi perubahan peran anak terhadap bayi baru lahir, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Fasilitasi diskusi tentang peran orang tua, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Fasilitasi diskusi tentang adaptasi peran saat anak meninggalkan rumah, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Fasilitasi diskusi harapan dengan keluarga dalam peran timbal balik'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Diskusikan perilaku yang dibutuhkan untuk pengembangan peran'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Diskusikan perubahan peran yang diperlukan akibat penyakit atau ketidakmampuan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Diskusikan perubahan peran dalam menerima ketergantungan orang tua'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Diskusikan strategi positif untuk mengelola perubahan peran'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Edukasi', 5, 'Ajarkan perilaku baru yang dibutuhkan oleh pasien/orang tua untuk memenuhi peran'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Penampilan Peran' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk dalam kelompok untuk mempelajari peran baru');

-- ============================================
-- I.09265 Dukungan Pengambilan Keputusan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Observasi', 1, 'Identifikasi persepsi mengenai masalah dan informasi yang memicu konflik'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 1, 'Fasilitasi mengklarifikasi nilai dan harapan yang membantu membuat pilihan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 2, 'Diskusikan kelebihan dan kekurangan dari setiap solusi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 3, 'Fasilitasi melihat situasi secara realistis'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 4, 'Motivasi mengungkapkan tujuan perawatan yang diharapkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 5, 'Fasilitasi pengambilan keputusan secara kolaboratif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 6, 'Hormati hak pasien untuk menerima atau menolak informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 7, 'Fasilitasi menjelaskan keputusan kepada orang lain, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Terapeutik', 8, 'Fasilitasi hubungan antara pasien, keluarga, dan tenaga kesehatan lainnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Edukasi', 1, 'Informasikan alternatif solusi secara jelas'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Edukasi', 2, 'Berikan informasi yang diminta pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.09265'), 'Kolaborasi', 1, 'Kolaborasi dengan tenaga kesehatan lain dalam memfasilitasi pengambilan keputusan');

-- ============================================
-- I.09266 Dukungan Pengungkapan Kebutuhan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Observasi', 1, 'Periksa gangguan komunikasi verbal (mis. ketidakmampuan berbicara, kesulitan mengekspresikan pikiran secara verbal)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Terapeutik', 1, 'Ciptakan lingkungan yang tenang'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Terapeutik', 2, 'Hindari berbicara keras'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Terapeutik', 3, 'Ajukan pertanyaan dengan jawaban yang singkat, dengan isyarat anggukan kepala jika mengalami kesulitan berbicara'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Terapeutik', 4, 'Jadwalkan waktu istirahat sebelum waktu kunjungan dan sesi terapi wicara'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Terapeutik', 5, 'Fasilitasi komunikasi dengan media (mis. pensil dan kertas, komputer, kartu kata)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Edukasi', 1, 'Informasikan keluarga dan tenaga kesehatan lain teknik berkomunikasi, dan gunakan secara konsisten'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Edukasi', 2, 'Anjurkan keluarga dan staf mengajak bicara meskipun tidak mampu berkomunikasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09266'), 'Kolaborasi', 1, 'Rujuk pada terapis wicara, jika perlu');

-- ============================================
-- I.09267 Dukungan Pengungkapan Perasaan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Observasi', 1, 'Identifikasi tingkat emosi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Observasi', 2, 'Identifikasi isyarat verbal dan non verbal'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Observasi', 3, 'Identifikasi perasaan saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Observasi', 4, 'Identifikasi hubungan antara apa yang dirasakan dan perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Terapeutik', 1, 'Fasilitasi mengungkapkan pengalaman emosional yang menyakitkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Terapeutik', 2, 'Fasilitasi mengidentifikasi asumsi interpersonal yang melatarbelakangi pengalaman emosional'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Terapeutik', 3, 'Fasilitasi pertimbangan menunda perilaku dalam merespons emosi yang menyakitkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Terapeutik', 4, 'Fasilitasi membedakan pengungkapan ekspresi emosi yang kuat diperbolehkan dan yang merusak hubungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Terapeutik', 5, 'Fasilitasi menetralkan emosi yang negatif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Edukasi', 1, 'Ajarkan mengekspresikan perasaan secara asertif'),
((SELECT id FROM siki WHERE kode_intervensi='I.09267'), 'Edukasi', 2, 'Informasikan menekan perasaan dapat mempengaruhi hubungan interpersonal');

-- ============================================
-- Dukungan Perasaan Bersalah (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi adanya keyakinan tidak rasional'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Fasilitasi mengidentifikasi situasi perasaan muncul dan respons terhadap situasi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Fasilitasi mengidentifikasi refleksi perasaan yang destruktif'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Fasilitasi mengidentifikasi dampak situasi pada hubungan keluarga'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Fasilitasi memahami rasa bersalah adalah reaksi umum terhadap trauma, penganiayaan, berduka, bencana, atau kecelakaan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Fasilitasi dukungan spiritual, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Bimbing untuk mengakui kesalahan diri sendiri'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Ajarkan mengidentifikasi perasaan bersalah yang menyakitkan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Ajarkan menggunakan teknik menghentikan pikiran dan substitusi pikiran dengan relaksasi otot saat pikiran bersalah terus dirasakan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perasaan Bersalah' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Ajarkan mengidentifikasi pilihan untuk mencegah, mengganti, menebus kesalahan, dan penyelesaian');

-- ============================================
-- I.11348 Dukungan Perawatan Diri
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Observasi', 1, 'Identifikasi kebiasaan aktivitas perawatan diri sesuai usia'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Observasi', 2, 'Monitor tingkat kemandirian'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Observasi', 3, 'Identifikasi kebutuhan alat bantu kebersihan diri, berpakaian, berhias, dan makan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 1, 'Sediakan lingkungan yang terapeutik (mis. suasana hangat, rileks, privasi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 2, 'Siapkan keperluan pribadi (mis. parfum, sikat gigi, dan sabun mandi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 3, 'Dampingi dalam melakukan perawatan diri sampai mandiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 4, 'Fasilitasi untuk menerima keadaan ketergantungan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Terapeutik', 5, 'Jadwalkan rutinitas perawatan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11348'), 'Edukasi', 1, 'Anjurkan melakukan perawatan diri secara konsisten sesuai kemampuan');

-- ============================================
-- I.11349 Dukungan Perawatan Diri: BAB/BAK
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Observasi', 1, 'Identifikasi kebiasaan BAK/BAB sesuai usia'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Observasi', 2, 'Monitor integritas kulit pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 1, 'Buka pakaian yang diperlukan untuk memudahkan eliminasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 2, 'Dukung penggunaan toilet/commode/pispot/urinal secara konsisten'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 3, 'Jaga privasi selama eliminasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 4, 'Ganti pakaian pasien setelah eliminasi, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 5, 'Bersihkan alat bantu BAB/BAK setelah digunakan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 6, 'Latih BAK/BAB sesuai jadwal, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Terapeutik', 7, 'Sediakan alat bantu (mis. kateter eksternal, urinal), jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Edukasi', 1, 'Anjurkan BAK/BAB secara rutin'),
((SELECT id FROM siki WHERE kode_intervensi='I.11349'), 'Edukasi', 2, 'Anjurkan ke kamar mandi/toilet, jika perlu');

-- ============================================
-- I.11350 Dukungan Perawatan Diri: Berpakaian
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Observasi', 1, 'Identifikasi usia dan budaya dalam membantu berpakaian/berhias'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 1, 'Sediakan pakaian pada tempat yang mudah dijangkau'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 2, 'Sediakan pakaian pribadi, sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 3, 'Fasilitasi mengenakan pakaian, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 4, 'Fasilitasi berhias (mis. menyisir rambut, merapikan kumis/jenggot)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 5, 'Jaga privasi selama berpakaian'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 6, 'Tawarkan untuk laundry, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Terapeutik', 7, 'Berikan pujian terhadap kemampuan berpakaian secara mandiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Edukasi', 1, 'Informasikan pakaian yang tersedia untuk dipilih, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11350'), 'Edukasi', 2, 'Ajarkan mengenakan pakaian, jika perlu');

-- ============================================
-- I.11351 Dukungan Perawatan Diri: Makan/Minum
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 1, 'Identifikasi diet yang dianjurkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 2, 'Monitor kemampuan menelan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Observasi', 3, 'Monitor status hidrasi pasien, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 1, 'Ciptakan lingkungan yang menyenangkan selama makan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 2, 'Atur posisi yang nyaman untuk makan/minum'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 3, 'Lakukan oral hygiene sebelum makan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 4, 'Letakkan makanan di sisi mata yang sehat'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 5, 'Sediakan sedotan untuk minum, sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 6, 'Siapkan makanan dengan suhu yang meningkatkan nafsu makan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 7, 'Sediakan makanan dan minuman yang disukai'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 8, 'Berikan bantuan saat makan/minum sesuai tingkat kemandirian, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Terapeutik', 9, 'Motivasi untuk makan di ruang makan, jika tersedia'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Edukasi', 1, 'Jelaskan posisi makanan pada pasien yang mengalami gangguan penglihatan dengan menggunakan arah jarum jam (mis. sayur di jam 12, rendang di jam 3)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11351'), 'Kolaborasi', 1, 'Kolaborasi pemberian obat (mis. analgesik, antiemetik), sesuai indikasi');

-- ============================================
-- I.11352 Dukungan Perawatan Diri: Mandi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Observasi', 1, 'Identifikasi usia dan budaya dalam membantu kebersihan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Observasi', 2, 'Identifikasi jenis bantuan yang dibutuhkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Observasi', 3, 'Monitor kebersihan tubuh (mis. rambut, mulut, kulit, kuku)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Observasi', 4, 'Monitor integritas kulit'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 1, 'Sediakan peralatan mandi (mis. sabun, sikat gigi, sampo, pelembab kulit)'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 2, 'Sediakan lingkungan yang aman dan nyaman'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 3, 'Fasilitasi menggosok gigi, sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 4, 'Fasilitasi mandi, sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 5, 'Pertahankan kebiasaan kebersihan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Terapeutik', 6, 'Berikan bantuan sesuai tingkat kemandirian'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Edukasi', 1, 'Jelaskan manfaat mandi dan dampak tidak mandi terhadap kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.11352'), 'Edukasi', 2, 'Ajarkan kepada keluarga cara memandikan pasien, jika perlu');

-- ============================================
-- I.09269 Dukungan Perkembangan Spiritual
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 1, 'Sediakan lingkungan yang tenang untuk refleksi diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 2, 'Fasilitasi mengidentifikasi masalah spiritual'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 3, 'Fasilitasi mengidentifikasi hambatan dalam pengenalan diri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 4, 'Fasilitasi mengeksplorasi keyakinan terkait pemulihan tubuh, pikiran, dan jiwa'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Terapeutik', 5, 'Fasilitasi hubungan persahabatan dengan orang lain dan pelayanan keagamaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Edukasi', 1, 'Anjurkan membuat komitmen spiritual berdasarkan keyakinan dan nilai'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Edukasi', 2, 'Anjurkan berpartisipasi dalam kegiatan ibadah (hari raya, ritual) dan meditasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Kolaborasi', 1, 'Rujuk pada pemuka agama/kelompok agama, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09269'), 'Kolaborasi', 2, 'Rujuk kepada kelompok pendukung, swabantu, atau program spiritual, jika perlu');

-- ============================================
-- I.09270 Dukungan Perlindungan Penganiayaan
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 1, 'Identifikasi pengalaman tidak menyenangkan atau traumatis (mis. penganiayaan, penolakan, kritik berlebihan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 2, 'Identifikasi hubungan dan kemampuan mengambil tanggung jawab antar anggota keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 3, 'Identifikasi adanya perbedaan perlakuan dalam keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 4, 'Identifikasi situasi krisis yang memicu penganiayaan (mis. kemiskinan, pengangguran, perceraian, atau kematian orang yang dicintai)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 5, 'Identifikasi kesulitan mempercayai diri dan orang lain'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 6, 'Identifikasi tingkat isolasi sosial dalam keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 7, 'Identifikasi ketidaksesuaian penjelasan dengan cedera dan/atau trauma yang terjadi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 8, 'Identifikasi adanya ketidaksesuaian peran (mis. anak menghibur orang tua, atau perilaku berlebihan atau agresif)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Observasi', 9, 'Periksa tanda-tanda penganiayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Terapeutik', 1, 'Dengarkan penjelasan kronologis cedera dan/atau trauma yang terjadi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Terapeutik', 2, 'Fasilitasi keluarga untuk mengidentifikasi strategi koping terhadap situasi stres'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Terapeutik', 3, 'Laporkan situasi dugaan penganiayaan kepada pihak berwajib'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Edukasi', 1, 'Informasikan layanan hukum yang relevan dengan peristiwa penganiayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Edukasi', 2, 'Jelaskan harapan yang realistis pada anak sesuai perkembangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Edukasi', 3, 'Anjurkan rawat inap untuk pemeriksaan dan penyelidikan lebih lanjut, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Edukasi', 4, 'Anjurkan untuk menghubungi polisi jika keamanan fisik terancam'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Kolaborasi', 1, 'Rujuk ke dukungan kelompok atau tempat perlindungan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09270'), 'Kolaborasi', 2, 'Rujuk anggota keluarga berisiko pada spesialis yang sesuai');

-- ============================================
-- Dukungan Perlindungan Penganiayaan Agama (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi ketergantungan pada "pemimpin" agama'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi pola perilaku, pemikiran, dan perasaan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi riwayat penyalahgunaan agama dan/atau ritual, metode, pemecahan masalah dan koping, stabilitas emosional, tingkat penggunaan teknik persuasif dan manipulatif'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 4, 'Identifikasi tanda-tanda penganiayaan fisik, emosional, atau adiksi agama'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 5, 'Monitor interaksi dengan "pemimpin" agama'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 6, 'Identifikasi jaringan fungsional keagamaan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Observasi', 7, 'Identifikasi sumber-sumber untuk memenuhi kebutuhan religius dan dukungan individu dan kelompok'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Tawarkan kegiatan ibadah yang sesuai untuk pemulihan bagi pasien dan keluarga/kelompok agama'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Berikan dukungan interpersonal secara reguler sesuai kebutuhan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Laporkan dugaan penyalahgunaan terhadap rumah ibadah dan/atau otoritas hukum'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk konseling agama sesuai'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Agama' AND kode_intervensi IS NULL), 'Kolaborasi', 2, 'Rujuk jika diduga terdapat penyalahgunaan ritual gaib');

-- ============================================
-- Dukungan Perlindungan Penganiayaan Lansia (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi ketergantungan pada pemberi asuhan (mis. akibat gangguan status mental, keterbatasan sumber ekonomi, depresi)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi situasi krisis keluarga yang memicu penganiayaan (mis. kemiskinan, pengangguran, perceraian)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi pemberi asuhan yang menunjukan gangguan kesehatan fisik atau mental'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 4, 'Identifikasi tanda-tanda pelecehan fisik, seksual dan psikologis (mis. laserasi, memar, adanya air mani atau darah kering, harga diri rendah, depresi)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 5, 'Identifikasi tanda-tanda eksploitasi (mis. pemenuhan kebutuhan dasar tidak sesuai dengan sumber memadai)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 6, 'Identifikasi harapan pemberi asuhan yang tidak realistis'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Observasi', 7, 'Monitor interaksi pasien dan pemberi asuhan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Berikan penegasan positif tentang nilai diri'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Fasilitasi keluarga dalam mengidentifikasi strategi penanggulangan situasi stres'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Diskusikan indikasi penganiayaan dengan pasien dan pemberi asuhan secara terpisah'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Ajarkan cara mengatasi masalah dalam perawatan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan mengungkapkan perasaan (mis. takut, kuatir, sedih, kesal, marah)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Anjurkan rawat inap untuk pemeriksaan dan penyelidikan lebih lanjut, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Anjurkan penyesuaian lingkungan rumah untuk meningkatkan kemandirian'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 5, 'Anjurkan melakukan program aktivitas fisik rutin dan program latihan yang sesuai'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 6, 'Anjurkan perawatan mandiri melalui latihan, penguatan dan penanggulangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Edukasi', 7, 'Informasikan sumber daya komunitas (mis. alamat dan nomor telepon lembaga yang memberikan bantuan layanan kesehatan lansia di rumah)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk ke program terapi fisik atau olahraga, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Kolaborasi', 2, 'Rujuk kepada perawat komunitas, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Lansia' AND kode_intervensi IS NULL), 'Kolaborasi', 3, 'Rujuk kepada layanan hak asasi manusia, jika perlu');

-- ============================================
-- Dukungan Perlindungan Penganiayaan Pasangan (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi faktor risiko terkait kekerasan dalam rumah tangga (mis. riwayat kekerasan, pelecehan, penolakan, kritik berlebihan, perasaan tidak berharga, kemiskinan, pengangguran, ketergantungan finansial, perselingkuhan)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi riwayat kekerasan dalam rumah tangga (mis. banyak luka cedera, gejala somatik multiple, sakit perut kronis, sakit kepala kronis, nyeri panggul, kecemasan, depresi, sindrom stres pasca trauma, dan gangguan kejiwaan lainnya)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi tanda dan gejala kekerasan fisik (mis. banyak luka dalam berbagai tahap penyembuhan; laserasi yang tidak dapat dijelaskan, memar pada lengan bawah; gigitan manusia)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 4, 'Identifikasi tanda dan gejala kekerasan seksual (mis. adanya air mani/darah kering, luka pada genitalia luar, perubahan perilaku atau kesehatan dramatis tanpa diketahui etiologinya)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 5, 'Identifikasi tanda dan gejala kekerasan emosional (mis. harga diri rendah, depresi, malu dan mengalah, perilaku terlalu hati-hati di sekitar pasangan)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 6, 'Identifikasi tanda dan gejala eksploitasi (mis. kebutuhan dasar tersedia tidak memadai padahal sumber memadai, perampasan barang-barang pribadi, hilangnya jaminan sosial)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 7, 'Identifikasi penjelasan penyebab luka yang tidak konsisten'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 8, 'Identifikasi kesesuaian antara jenis cedera dan gambaran penyebabnya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 9, 'Identifikasi pemanfaatan sumber daya masyarakat untuk pencegahan kekerasan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 10, 'Identifikasi interaksi pasangan (mis. catatan waktu dan lama kunjungan pasangan selama rawat inap, reaksi pasangan yang sedikit atau berlebihan)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 11, 'Identifikasi adanya kepatuhan ekstrim pada pasangan seperti pasrah pada prosedur rumah sakit'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 12, 'Identifikasi kemunduran progresif keadaan fisik dan emosional'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Observasi', 13, 'Identifikasi adanya kunjungan berulang ke klinik, ruang gawat darurat, atau medis karena masalah kecil'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Lakukan wawancara dengan pasien atau orang lain yang mengetahui dugaan kekerasan tanpa dihadiri pasangannya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Dokumentasikan bukti kekerasan fisik atau seksual menggunakan alat perekam dan foto standar'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Dengarkan dengan baik saat mulai membicarakan masalahnya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Buat rencana untuk mencatat dimana diduga terjadi kekerasan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Tegaskan secara positif bahwa diri pasien berharga'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Dukung korban untuk mengambil tindakan dan melakukan perubahan untuk mencegah terjadi kekerasan lebih lanjut'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 7, 'Fasilitasi pasien dan keluarga dalam mengembangkan strategi mengatasi stres'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 8, 'Diskusikan dengan pasien dan keluarga untuk mengidentifikasi kekuatan dan kelemahan hubungan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 9, 'Buat rencana keselamatan yang digunakan jika terjadi kekerasan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Terapeutik', 10, 'Laporkan situasi dimana diduga terjadi penganiayaan sesuai undang-undang yang berlaku'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Anjurkan rawat inap untuk pemeriksaan dan penyelidikan lebih lanjut, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan mengekspresikan kekhawatiran dan perasaan termasuk ketakutan, rasa bersalah, rasa malu, dan menyalahkan diri sendiri'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Informasikan mengenai penampungan korban kekerasan dalam rumah tangga, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Perlindungan Penganiayaan Pasangan' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk pasien yang berisiko kekerasan atau mengalami kekerasan kepada spesialis dan/atau layanan yang sesuai (mis. ners spesialis komunitas, layanan hak asasi manusia, konseling, bantuan hukum)');

-- ============================================
-- Dukungan Proses Berduka (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi kehilangan yang dihadapi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Observasi', 2, 'Identifikasi proses berduka yang dialami'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Observasi', 3, 'Identifikasi sifat keterikatan pada benda yang hilang atau orang yang meninggal'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Observasi', 4, 'Identifikasi reaksi awal terhadap kehilangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Tunjukkan sikap menerima dan empati'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Motivasi agar mau mengungkapkan perasaan kehilangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Motivasi untuk menguatkan dukungan keluarga atau orang terdekat'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Fasilitasi melakukan kebiasaan sesuai dengan budaya, agama, dan norma sosial'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Fasilitasi mengekspresikan perasaan dengan cara yang nyaman (mis. membaca buku, menulis, menggambar, atau bermain)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Diskusikan strategi koping yang dapat digunakan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan kepada pasien dan keluarga bahwa sikap mengingkari, marah, tawar-menawar, depresi dan menerima adalah wajar dalam menghadapi kehilangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan mengidentifikasi ketakutan terbesar pada kehilangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Anjurkan mengekspresikan perasaan tentang kehilangan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Anjurkan melewati proses berduka secara bertahap');

-- ============================================
-- Dukungan Proses Berduka: Kematian Perinatal (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi reaksi awal terhadap kematian bayi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Lakukan kebiasaan kelahiran anak sesuai agama dan budaya (mis. mengadzankan)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Berikan peralatan bayi termasuk catatan kelahiran anak (mis. stampel kaki dan tangan, foto, perlengkapan bayi)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Libatkan orangtua dalam penyelenggaraan jenazah bayi'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Pindahkan bayi ke kamar jenazah'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Persiapkan jenazah untuk dibawa oleh keluarga ke rumah duka'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Diskusikan pengambilan keputusan yang diperlukan (mis. otopsi, konseling genetik)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Terapeutik', 7, 'Diskusikan karakteristik berduka normal dan abnormal, termasuk presipitasi perasaan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Informasikan bentuk bayi berdasarkan usia gestasi dan lamanya kematian'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Informasikan kelompok pendukung yang ada, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Anjurkan orang tua menggendong bayinya saat akan meninggal, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Anjurkan keluarga melihat, menggendong dan bersama bayi selama yang diinginkan'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Proses Berduka: Kematian Perinatal' AND kode_intervensi IS NULL), 'Kolaborasi', 1, 'Rujuk kepada tokoh agama (mis. ustadz, pendeta), pelayanan sosial dan konselor, jika perlu');

-- ============================================
-- Dukungan Sibling (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi pemahaman sibling tentang kondisi saudaranya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Observasi', 2, 'Monitor respons sibling terhadap kesulitan adaptasi dengan kondisi saudaranya (mis. sensitif, menarik diri, stres)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Motivasi orang tua berbicara pada sibling tentang kondisi saudaranya secara jujur'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Libatkan orang tua saat memberikan informasi kondisi saudaranya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Fasilitasi komunikasi antara sibling dan saudaranya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 4, 'Fasilitasi sibling untuk menjenguk saudaranya yang dirawat'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 5, 'Fasilitasi orang tua untuk mengatur kebutuhan sibling di rumah'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 6, 'Fasilitasi sibling untuk melihat perbedaan dan kesamaan antara dirinya dan saudaranya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 7, 'Berikan kesempatan bertemu dengan sesama sibling yang memiliki masalah yang sama'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 8, 'Berikan pujian telah bersabar, telah berkorban, atau telah membantu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 9, 'Komunikasikan kondisi sibling ke perawat sekolah dan guru untuk memberikan dukungan, jika perlu'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Terapeutik', 10, 'Gunakan media untuk memfasilitasi sibling yang tidak bisa bertemu saudaranya (mis. telepon, foto, video)'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Informasikan sibling tentang kondisi saudaranya'),
((SELECT id FROM siki WHERE nama_intervensi='Dukungan Sibling' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Informasikan sibling bahwa dia bukan penyebab kondisi yang dialami saudaranya');

-- ============================================
-- I.09271 Dukungan Spiritual
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Observasi', 1, 'Identifikasi perasaan khawatir, kesepian dan ketidakberdayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Observasi', 2, 'Identifikasi pandangan tentang hubungan antara spiritual dan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Observasi', 3, 'Identifikasi harapan dan kekuatan pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Observasi', 4, 'Identifikasi ketaatan dalam beragama'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 1, 'Berikan kesempatan mengekspresikan perasaan tentang penyakit dan kematian'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 2, 'Berikan kesempatan mengekspresikan dan meredakan marah secara tepat'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 3, 'Yakinkan bahwa perawat bersedia mendukung selama masa ketidakberdayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 4, 'Sediakan privasi dan waktu tenang untuk aktivitas spiritual'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 5, 'Diskusikan keyakinan tentang makna dan tujuan hidup, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Terapeutik', 6, 'Fasilitasi melakukan kegiatan ibadah'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Edukasi', 1, 'Anjurkan berinteraksi dengan keluarga, teman, dan/atau orang lain'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Edukasi', 2, 'Anjurkan berpartisipasi dalam kelompok pendukung'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Edukasi', 3, 'Anjurkan metode relaksasi, meditasi, dan imajinasi terbimbing'),
((SELECT id FROM siki WHERE kode_intervensi='I.09271'), 'Kolaborasi', 1, 'Atur kunjungan dengan rohaniawan (mis. ustadz, pendeta, romo, biksu)');

-- ============================================
-- I.09272 Dukungan Sumber Finansial
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Observasi', 1, 'Identifikasi penggunaan sumber daya keuangan sesuai dengan sumber dana yang dimiliki'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Observasi', 2, 'Identifikasi fasilitas yang dapat dipergunakan setelah pemulangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Observasi', 3, 'Identifikasi efisiensi dan efektivitas penggunaan jaminan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Terapeutik', 1, 'Lakukan advokasi terkait pembiayaan sesuai dengan kebijakan institusi'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Terapeutik', 2, 'Lakukan pencatatan setiap aktivitas pembiayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Terapeutik', 3, 'Fasilitasi pasien mendiskusikan upaya memperoleh sumber pembiayaan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Edukasi', 1, 'Jelaskan tujuan dan prosedur pengurusan penjaminan biaya (mis. BPJS, JKN)'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Edukasi', 2, 'Informasikan pembiayaan pelayanan perawatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09272'), 'Edukasi', 3, 'Informasikan jaminan yang dapat digunakan');

-- ============================================
-- I.09273 Dukungan Tanggung Jawab Pada Diri Sendiri
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Observasi', 1, 'Identifikasi persepsi tentang masalah kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Observasi', 2, 'Monitor pelaksanaan tanggung jawab'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Terapeutik', 1, 'Berikan kesempatan merasakan memiliki tanggung jawab'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Terapeutik', 2, 'Tingkatkan rasa tanggung jawab atas perilaku sendiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Terapeutik', 3, 'Hindari perdebatan atau tawar-menawar tentang perannya di ruang perawat'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Terapeutik', 4, 'Berikan penguatan dan umpan balik positif jika melaksanakan tanggung jawab atau mengubah perilaku'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Edukasi', 1, 'Diskusikan tanggung jawab terhadap profesi pemberi asuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.09273'), 'Edukasi', 2, 'Diskusikan konsekuensi tidak melaksanakan tanggung jawab');

-- ============================================
-- I.05174 Dukungan Tidur
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 1, 'Identifikasi pola aktivitas dan tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 2, 'Identifikasi faktor pengganggu tidur (fisik dan/atau psikologis)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 3, 'Identifikasi makanan dan minuman yang mengganggu tidur (mis. kopi, teh, alkohol, makan mendekati waktu tidur, minum banyak air sebelum tidur)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Observasi', 4, 'Identifikasi obat tidur yang dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 1, 'Modifikasi lingkungan (mis. pencahayaan, kebisingan, suhu, matras dan tempat tidur)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 2, 'Batasi waktu tidur siang, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 3, 'Fasilitasi menghilangkan stres sebelum tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 4, 'Terapkan jadwal tidur rutin'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 5, 'Lakukan prosedur untuk meningkatkan kenyamanan (mis. pijat, pengaturan posisi, terapi akupresur)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Terapeutik', 6, 'Sesuaikan jadwal pemberian obat dan/atau tindakan untuk menunjang siklus tidur-terjaga'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 1, 'Jelaskan pentingnya tidur cukup selama sakit'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 2, 'Anjurkan menepati kebiasaan waktu tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 3, 'Anjurkan menghindari makanan/minuman yang mengganggu tidur'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 4, 'Anjurkan penggunaan obat tidur yang tidak mengandung supresor terhadap tidur REM'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 5, 'Ajarkan faktor-faktor yang berkontribusi terhadap gangguan pola tidur (mis. psikologis, gaya hidup, sering berubah shift bekerja)'),
((SELECT id FROM siki WHERE kode_intervensi='I.05174'), 'Edukasi', 6, 'Ajarkan relaksasi otot autogenik atau cara nonfarmakologi lainnya');

-- ============================================
-- I.01011 Dukungan Ventilasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 1, 'Identifikasi adanya kelelahan otot bantu napas'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 2, 'Identifikasi efek perubahan posisi terhadap status pernapasan'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Observasi', 3, 'Monitor status respirasi dan oksigenasi (mis. frekuensi dan kedalaman napas, penggunaan otot bantu napas, bunyi napas tambahan, saturasi oksigen)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 1, 'Pertahankan kepatenan jalan napas'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 2, 'Berikan posisi semi fowler atau fowler'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 3, 'Fasilitasi mengubah posisi senyaman mungkin'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 4, 'Berikan oksigenasi sesuai kebutuhan (mis. nasal kanul, masker wajah, masker rebreathing atau non-rebreathing)'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Terapeutik', 5, 'Gunakan bag-valve mask, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Edukasi', 1, 'Ajarkan melakukan teknik relaksasi napas dalam'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Edukasi', 2, 'Ajarkan mengubah posisi secara mandiri'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Edukasi', 3, 'Ajarkan teknik batuk efektif'),
((SELECT id FROM siki WHERE kode_intervensi='I.01011'), 'Kolaborasi', 1, 'Kolaborasi pemberian bronkodilator, jika perlu');

-- ============================================
-- I.13479 Dukungan Visitasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Observasi', 1, 'Identifikasi pasien dengan menanyakan minimal dua identitas (mis. nama lengkap, tanggal lahir)'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 1, 'Perkenalkan diri pada pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 2, 'Pastikan tim kesehatan yang datang merupakan tim yang menangani pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 3, 'Dengarkan respons yang disampaikan pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 4, 'Dampingi pasien selama visite'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 5, 'Fasilitasi penerapan rekomendasi yang berbasis bukti untuk menyelesaikan masalah kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Terapeutik', 6, 'Dokumentasikan hasil visite pada catatan terintegrasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Edukasi', 1, 'Anjurkan pasien dan keluarga untuk bertanya jika masih ada hal-hal yang belum dimengerti'),
((SELECT id FROM siki WHERE kode_intervensi='I.13479'), 'Edukasi', 2, 'Informasikan perkembangan hasil visite kepada pasien/keluarga');

-- ============================================
-- Edukasi Aktivitas/Istirahat (kode_intervensi NULL)
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Terapeutik', 1, 'Sediakan materi dan media pengaturan aktivitas dan istirahat'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Terapeutik', 2, 'Jadwalkan pemberian pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Terapeutik', 3, 'Berikan kesempatan kepada pasien dan keluarga untuk bertanya'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Edukasi', 1, 'Jelaskan pentingnya melakukan aktivitas fisik/olahraga secara rutin'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Edukasi', 2, 'Anjurkan terlibat dalam aktivitas kelompok, aktivitas bermain atau aktivitas lainnya'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Edukasi', 3, 'Anjurkan menyusun jadwal aktivitas dan istirahat'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Edukasi', 4, 'Ajarkan cara mengidentifikasi kebutuhan istirahat (mis. kelelahan, sesak napas saat aktivitas)'),
((SELECT id FROM siki WHERE nama_intervensi='Edukasi Aktivitas/Istirahat' AND kode_intervensi IS NULL), 'Edukasi', 5, 'Ajarkan cara mengidentifikasi target dan jenis aktivitas sesuai kemampuan');

-- ============================================
-- I.12363 Edukasi Alat Bantu Dengar
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Observasi', 2, 'Periksa telinga yang memerlukan alat bantu dengar'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Terapeutik', 1, 'Sediakan materi dan media alat bantu dengar'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Terapeutik', 2, 'Jadwalkan pemberian pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Terapeutik', 3, 'Berikan kesempatan kepada pasien dan keluarga untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Edukasi', 1, 'Anjurkan membersihkan serumen jika menutupi liang telinga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Edukasi', 2, 'Anjurkan mensejajarkan bagian ujung alat bantu dengar dengan telinga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Edukasi', 3, 'Anjurkan memutar ujung alat bantu dengar ke depan dan masukkan ke bagian saluran telinga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12363'), 'Edukasi', 4, 'Anjurkan menyesuaikan volume dengan kebutuhan pasien');

-- ============================================
-- I.12364 Edukasi Analgesia Terkontrol
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Observasi', 1, 'Identifikasi kesiapan, kemampuan menerima informasi dan persepsi terhadap nyeri'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Observasi', 2, 'Identifikasi tingkat nyeri dan dosis pemberian opioid'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Observasi', 3, 'Identifikasi kemampuan pasien dan keluarga dalam menggunakan analgesia terkontrol'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Terapeutik', 1, 'Persiapkan alat-alat PCA'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan penjelasan tentang analgesia terkontrol'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 1, 'Jelaskan alasan, waktu dan cara pemberian analgesia terkontrol'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 2, 'Jelaskan efek samping dari pemberian opioid berlebihan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 3, 'Jelaskan tindakan yang harus dilakukan saat mengalami penurunan kesadaran (mis. stop PCA, hubungi rumah sakit atau petugas kesehatan, tinggikan kepala 30 derajat)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 4, 'Ajarkan cara mengidentifikasi keefektifan dari analgesia (mis. penurunan skala nyeri)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 5, 'Informasikan untuk menghubungi tenaga kesehatan jika mengalami kesulitan dalam mengatur dosis alat PCA'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 6, 'Demonstrasikan cara mengatur dosis analgesia terkontrol'),
((SELECT id FROM siki WHERE kode_intervensi='I.12364'), 'Edukasi', 7, 'Demonstrasikan cara mencatat dosis dan efektifitas pengobatan');

-- ============================================
-- I.12365 Edukasi Berat Badan Efektif
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 1, 'Sediakan materi dan media edukasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Terapeutik', 3, 'Beri kesempatan pada keluarga untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Edukasi', 1, 'Jelaskan hubungan asupan makanan, latihan, peningkatan dan penurunan berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Edukasi', 2, 'Jelaskan kondisi medis yang dapat mempengaruhi berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Edukasi', 3, 'Jelaskan risiko kondisi kegemukan (overweight) dan kurus (underweight)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Edukasi', 4, 'Jelaskan kebiasaan, tradisi dan budaya, serta faktor genetik yang mempengaruhi berat badan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12365'), 'Edukasi', 5, 'Ajarkan cara mengelola berat badan secara efektif');

-- ============================================
-- I.12366 Edukasi Berhenti Merokok
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Terapeutik', 1, 'Sediakan materi dan media edukasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Terapeutik', 3, 'Beri kesempatan pada keluarga untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Edukasi', 1, 'Jelaskan gejala fisik penarikan nikotin (mis. sakit kepala, pusing, mual, dan insomnia)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Edukasi', 2, 'Jelaskan gejala berhenti merokok (mis. mulut kering, batuk, tenggorokan gatal)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Edukasi', 3, 'Jelaskan aspek psikososial yang mempengaruhi perilaku merokok'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Edukasi', 4, 'Informasikan produk pengganti nikotin (mis. permen karet, semprotan hidung, inhaler)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12366'), 'Edukasi', 5, 'Ajarkan cara berhenti merokok');

-- ============================================
-- I.12367 Edukasi Dehidrasi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat formulir balans cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Terapeutik', 2, 'Tentukan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai kesepakatan dengan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarganya bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 1, 'Jelaskan tanda dan gejala dehidrasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 2, 'Anjurkan tidak hanya minum air saat haus, jika sedang berolahraga atau beraktivitas berat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 3, 'Anjurkan memperbanyak minum'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 4, 'Anjurkan memperbanyak mengonsumsi buah yang mengandung banyak air (mis. semangka, pepaya)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 5, 'Anjurkan cara pemberian oralit, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12367'), 'Edukasi', 6, 'Anjurkan menilai status hidrasi berdasarkan warna urine');

-- ============================================
-- I.12368 Edukasi Dialisis Peritoneal
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Observasi', 2, 'Monitor keberhasilan pasien melakukan peritoneal dialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat peraga peritoneal dialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Edukasi', 1, 'Jelaskan tentang pengendalian infeksi (cuci tangan dan prinsip steril) dalam pelaksanaan peritoneal dialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Edukasi', 2, 'Jelaskan tujuan dan masalah/komplikasi peritoneal dialisis (mis. kemerahan, bengkak, cairan peritoneal tidak keluar)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Edukasi', 3, 'Jelaskan cara memonitor cairan masuk dan keluar peritoneal dialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Edukasi', 4, 'Demonstrasikan prosedur peritoneal dialisis langsung pada pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.12368'), 'Edukasi', 5, 'Instruksikan pasien/keluarga menjelaskan dan meredemonstrasikan kembali prosedur peritoneal dialisis');

-- ============================================
-- I.12369 Edukasi Diet
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 2, 'Identifikasi tingkat pengetahuan saat ini'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 3, 'Identifikasi kebiasaan pola makan saat ini dan masa lalu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 4, 'Identifikasi persepsi pasien dan keluarga tentang diet yang diprogramkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Observasi', 5, 'Identifikasi keterbatasan finansial untuk menyediakan makanan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat peraga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Terapeutik', 4, 'Sediakan rencana makan tertulis, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 1, 'Jelaskan tujuan kepatuhan diet terhadap kesehatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 2, 'Informasikan makanan yang diperbolehkan dan dilarang'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 3, 'Informasikan kemungkinan interaksi obat dan makanan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 4, 'Anjurkan mempertahankan posisi semi Fowler (30-45 derajat) 20-30 menit setelah makan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 5, 'Anjurkan mengganti bahan makanan sesuai dengan diet yang diprogramkan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 6, 'Anjurkan melakukan olahraga sesuai toleransi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 7, 'Ajarkan cara membaca label dan memilih makanan yang sesuai'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 8, 'Ajarkan cara merencanakan makanan yang sesuai program'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Edukasi', 9, 'Rekomendasikan resep makanan yang sesuai dengan diet, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12369'), 'Kolaborasi', 1, 'Rujuk ke ahli gizi dan sertakan keluarga, jika perlu');

-- ============================================
-- I.12370 Edukasi Edema
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Observasi', 2, 'Monitor kemampuan dan pemahaman pasien dan keluarga setelah edukasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Terapeutik', 1, 'Persiapkan materi, media edukasi (mis. formulir balans cairan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai kesepakatan dengan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Edukasi', 1, 'Jelaskan tentang definisi, penyebab (penurunan fungsi ginjal, hipoalbuminemia, gagal jantung, retensi natrium), gejala dan tanda edema (kenaikan BB yang drastis, penurunan output urine, albumin darah kurang dari normal, pitting edema)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Edukasi', 2, 'Jelaskan cara penanganan dan pencegahan edema (mis. timbang BB tiap hari, balans cairan, obat diuretik, diet tinggi protein, diet rendah garam, antihipertensi)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12370'), 'Edukasi', 3, 'Instruksikan pasien dan keluarga untuk menjelaskan kembali definisi, penyebab, gejala dan tanda, penanganan dan pencegahan edema');

-- ============================================
-- I.12371 Edukasi Efek Samping Obat
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Terapeutik', 1, 'Persiapkan materi dan media edukasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai kesepakatan dengan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 1, 'Jelaskan tujuan obat diberikan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 2, 'Jelaskan indikasi dan kontra indikasi obat yang akan dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 3, 'Jelaskan cara kerja obat secara umum'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 4, 'Jelaskan dosis dan cara pemberian obat'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 5, 'Jelaskan tanda dan gejala bila obat yang dikonsumsi tidak cocok untuk pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 6, 'Jelaskan reaksi alergi yang memungkinkan timbul saat atau setelah obat dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 7, 'Anjurkan melihat tanggal kadaluarsa obat yang akan dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 8, 'Anjurkan melihat kondisi fisik obat sebelum dikonsumsi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 9, 'Anjurkan untuk segera ke fasilitas kesehatan terdekat jika reaksi obat yang dikonsumsi membahayakan hidup pasien'),
((SELECT id FROM siki WHERE kode_intervensi='I.12371'), 'Edukasi', 10, 'Ajarkan cara mengatasi reaksi obat yang tidak diinginkan');

-- ============================================
-- I.12372 Edukasi Fisioterapi Dada
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Terapeutik', 1, 'Persiapkan materi dan media edukasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai kesepakatan dengan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 1, 'Jelaskan kontraindikasi fisioterapi dada (mis. eksaserbasi PPOK akut, osteoporosis)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 2, 'Jelaskan tujuan dan prosedur fisioterapi dada'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 3, 'Jelaskan segmen paru-paru yang mengandung sekresi berlebihan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 4, 'Jelaskan cara modifikasi posisi agar dapat mentolerir posisi yang ditentukan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 5, 'Jelaskan alat perkusi pneumatik, akustik, atau listrik yang digunakan, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 6, 'Jelaskan cara menggerakkan tangan kaku di daerah yang akan dikeringkan saat pasien menghisap atau batuk 3-4 kali'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 7, 'Anjurkan menghindari perkusi pada tulang belakang, ginjal, payudara wanita, insisi, dan tulang rusuk yang patah'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 8, 'Ajarkan mengeluarkan sekresi melalui pernapasan dalam'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 9, 'Ajarkan batuk selama dan setelah prosedur'),
((SELECT id FROM siki WHERE kode_intervensi='I.12372'), 'Edukasi', 10, 'Jelaskan cara memantau efektifitas prosedur (mis. oksimetri nadi, tanda vital, dan tingkat kenyamanan)');

-- ============================================
-- I.12373 Edukasi Hemodialisis
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat peraga hemodialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Terapeutik', 2, 'Buat media dan format evaluasi hemodialisis'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Terapeutik', 3, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai kesepakatan dengan pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Terapeutik', 4, 'Lakukan modifikasi proses pendidikan kesehatan sesuai kebutuhan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Terapeutik', 5, 'Berikan kesempatan pasien dan keluarga untuk bertanya dan mengemukakan perasaannya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Edukasi', 1, 'Jelaskan pengertian, tanda dan gejala, dampak, diet, hal-hal yang harus diperhatikan pasien gagal ginjal'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Edukasi', 2, 'Jelaskan manfaat memonitor intake dan output cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Edukasi', 3, 'Ajarkan cara memantau kelebihan volume cairan (mis. pitting edema, kenaikan berat badan 1kg = 1L air, sesak napas)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12373'), 'Edukasi', 4, 'Jelaskan pentingnya dukungan keluarga');

-- ============================================
-- I.12374 Edukasi Infertilitas
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Observasi', 1, 'Identifikasi kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Observasi', 2, 'Identifikasi tingkat pengetahuan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Observasi', 3, 'Identifikasi pengalaman selama prosedur pemeriksaan infertilitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Terapeutik', 1, 'Jadwalkan pengajaran dengan pasangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Terapeutik', 2, 'Siapkan media dan alat bantu yang diperlukan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Terapeutik', 3, 'Fasilitasi menentukan masa ovulasi melalui basal suhu tubuh, perubahan sekresi vagina, dan indikator fisiologis lainnya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Terapeutik', 4, 'Siapkan pasien secara fisik dan psikologis untuk pemeriksaan ginekologi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Edukasi', 1, 'Jelaskan siklus reproduksi wanita, jika perlu'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Edukasi', 2, 'Jelaskan tujuan prosedur pemeriksaan infertilitas'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Edukasi', 3, 'Jelaskan infertilitas dan penanganannya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Edukasi', 4, 'Jelaskan efek infertilitas pada hubungan pasangan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12374'), 'Edukasi', 5, 'Informasikan pusat layanan infertilitas');

-- ============================================
-- I.12375 Edukasi Irigasi Kandung Kemih
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Observasi', 1, 'Identifikasi kesiapan dan kemampuan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat peraga irigasi kandung kemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Terapeutik', 2, 'Jadwalkan waktu yang tepat untuk memberikan pendidikan kesehatan sesuai program yang telah disepakati oleh pasien dan keluarga'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Terapeutik', 3, 'Berikan kesempatan pasien dan keluarga bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 1, 'Jelaskan definisi, indikasi, tujuan dan manfaat irigasi kandung kemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 2, 'Jelaskan tentang pengendalian infeksi dan keamanan pasien (cuci tangan dan prinsip steril)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 3, 'Demonstrasikan teknik cuci tangan aseptik'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 4, 'Anjurkan meredemonstrasikan teknik cuci tangan aseptik'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 5, 'Jelaskan alat-alat, bahan-bahan dan prosedur irigasi kandung kemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 6, 'Demonstrasikan prosedur irigasi kandung kemih dan pemantauan keseimbangan cairan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 7, 'Jelaskan kemungkinan masalah-masalah yang dapat timbul dan solusinya selama irigasi kandung kemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 8, 'Anjurkan meredemonstrasikan irigasi kandung kemih'),
((SELECT id FROM siki WHERE kode_intervensi='I.12375'), 'Edukasi', 9, 'Anjurkan menghubungi perawat jika mengalami komplikasi irigasi kandung kemih');

-- ============================================
-- I.12376 Edukasi Irigasi Kolostomi
-- ============================================
INSERT INTO siki_tindakan (siki_id, jenis, urutan, deskripsi) VALUES
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Observasi', 1, 'Identifikasi kebutuhan irigasi kolostomi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Observasi', 2, 'Identifikasi kesiapan pasien dan keluarga menerima informasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Observasi', 3, 'Monitor keberhasilan dan kemampuan pasien dan keluarga dalam irigasi kolostomi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Terapeutik', 1, 'Persiapkan materi, media dan alat-alat (mis. set infus, cairan irigasi, sarung tangan, kantung kolostomi dan peralatan yang dibutuhkan lainnya)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Terapeutik', 2, 'Jadwalkan pendidikan kesehatan sesuai kesepakatan'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Terapeutik', 3, 'Berikan kesempatan untuk bertanya'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Edukasi', 1, 'Jelaskan definisi, prosedur, indikasi, kontraindikasi irigasi kolostomi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Edukasi', 2, 'Jelaskan prinsip-prinsip pencegahan infeksi (mis. cuci tangan, penggunaan sarung tangan)'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Edukasi', 3, 'Jelaskan tindakan yang harus dilakukan jika pada proses irigasi didapatkan kram abdomen yaitu menurunkan kecepatan tetesan cairan irigasi'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Edukasi', 4, 'Jelaskan feses akan keluar sekitar 40-60 menit setelah cairan irigasi masuk'),
((SELECT id FROM siki WHERE kode_intervensi='I.12376'), 'Edukasi', 5, 'Jelaskan cara mencatat tindakan-tindakan yang dilakukan dan diperhatikan warna dan kondisi stoma dan kulit peristoma, catat warna, konsistensi dan jumlah feses yang keluar');

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: I.08233 - I.12376
-- Total: 61 intervensi
-- Catatan: 19 intervensi memiliki kode_intervensi NULL
--          (kode tidak tercantum pada halaman buku yang dikirim)
-- ============================================
