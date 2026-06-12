<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ExcelDataMaster3SSeeder extends Seeder
{
    public function run(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('siki_tindakan')->truncate();
        DB::table('slki_siki_relations')->truncate();
        DB::table('sdki_slki_relations')->truncate();
        DB::table('slki_kriteria_hasil')->truncate();
        DB::table('sdki_faktor_risiko')->truncate();
        DB::table('sdki_kondisi_klinis')->truncate();
        DB::table('sdki_gejala')->truncate();
        DB::table('sdki_penyebab')->truncate();
        DB::table('intervensi_siki')->truncate();
        DB::table('luaran_slki')->truncate();
        DB::table('diagnosa_sdki')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        $now = now();

        // SDKI
        DB::table('diagnosa_sdki')->insert([
            ['kode_diagnosa' => 'D.0001', 'label_diagnosa' => 'Bersihan Jalan Napas Tidak Efektif', 'definisi' => 'Ketidakmampuan membersihkan sekret atau obstruksi jalan napas untuk mempertahankan jalan napas tetap paten', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0002', 'label_diagnosa' => 'Gangguan Penyapihan Ventilator', 'definisi' => 'Ketidakmampuan beradaptasi dengan pengurangan bantuan ventilator mekanik yang dapat menghambat dan memperlama proses penyapihan.', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0006', 'label_diagnosa' => 'Rsiko Aspirasi', 'definisi' => 'Beresiko mengalami masuknya sekresi gastrointestinal, sekresi orofaring, benda cair atau padat ke dalam saluran trakeobronkhial akibat disfungsi mekanisme protektif saluran napas Faktor Risiko 1. Penurunan tingkat kesadaran 2. Penurunan refleks muntah dan/atau batuk 3. Gangguan menelan 4. Disfagia 5. Kerusakan mobilitas fisik 6. Peningkatan residu lambung 7. Peningkatan tekanan intragastric 8. Penurunan motilitas gastrointestinal 9. Sfingter esofagus bawah inkompeten 10. Perlambatan pengosongan lambung 11. Terpasang selang nasogastric 12. Terpasang trakeostomi atau endotracheal tube 13. Trauma/pembedahan leher, mulut, dan/atau wajah 14. Efek agen farmakologis 15. Ketidakmatangan koordinasi menghisap, menelan, bernapas', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0010', 'label_diagnosa' => 'Risiko Gangguan Sirkulasi Spontan', 'definisi' => 'Beresiko mengalami ketidakmampuan untuk mempertahankan sirkulasi yang adekuat untuk menunjang kehidupan Faktor Risiko 1. Kekurangan volume cairan 2. Hipoksia 3. Hipotermia 4. Hipokalemia/hiperkalemia 5. Hipoglikemia/hiperglikem ia 6. Asidosis 7. Toksin (mis. Keracunan, overdosis obat) 8. Tamponade jantung 9. Tension pneumothorax 10. Thrombosis jantung 11. Thrombosis paru (emboli paru)', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0011', 'label_diagnosa' => 'Resiko Penurunan Curah Jantung', 'definisi' => 'Beresiko mengalami pemompaan jantung yang tiak adekuat untuk memenuhi kebutuhan metabolisme tubuh. Faktor Resiko 1. Perubahan afterload 2. Perubahan frekuensi jantung 3. Perubahan irama jantung 4. Perubahan kontraktilitas 5. Perubahan preload', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0012', 'label_diagnosa' => 'Resiko Perdarahan', 'definisi' => 'Beresiko mengalami kehilangan darah baik internal (terjadi dalam tubuh) maaupun eksternal (terjadi diluar tubuh). Faktor Resiko: - Aneurisma - Gangguan gastrointestinal (mis. Ulkus lambung, polip, varises) - Gangguan fungsi hati (mis. Sirosis hepatitis) - Komplikasi kehamilan (mis. Ketuban pecah sebelum waktunya, plasenta previa/abrubsio, kehamilan kembar) - Komplikasi pasca partum (mis. Atoni uterus, retensi plasenta) - Gangguan koagulasi (mis. Trombositopenia) - Efek agen farmakologis - Tindakan pembedahan - Trauma - Kurang terpapar informasi tentang pencegahan perdarahan - Proses keganasan', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0013', 'label_diagnosa' => 'Resiko Perfusi Gastrointestinal Tidak Efektif', 'definisi' => 'Beresiko mengalami penurunan sirkulasi gastrointestinal Faktor Risiko 1. Perdarahan gastrointestinal akut 2. Trauma abdomen 3. Sindroma kompartemen abdomen 4. Aneurisma aorta abdomen 5. Varises gastroesofagus 6. Penurunan kinerja ventrikel kiri 7. Kagulatipati (mis. anemia sel sabit, koagulopati intravaskuler diseminata 8. Penurunan konsentrasi hemoglobin 9. Keabnormalan masa protrombin dan/atau masa tromboplastin parsial 10. Disfungsi hati (mis. sirosis, hepatitis) 11. Disfungsi ginjal (mis. ginjal polikstik, stenosis arteri ginjal, gagal ginjal) 12. Disfungsi grastrointestinal (mis . ulkus duodenum atau ulkus lambung,kolitis iskemik, pankreatitis iskemik 13. Hiperglikemia 14. Ketidakstabilan hemodinamik 15. Efek agen farmakologis 16. Usia > 60 tahun 17. Efek samping tindakan (cardiopulmonary bypass, anestesi, pembedahan lambung)', 'kategori' => 'Fisologi', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0014', 'label_diagnosa' => 'Resiko Perfusi Miokard Tidak Efektif', 'definisi' => '', 'kategori' => 'Fisiologis Sub Kategori : Sirkulasi Definisi :', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0015', 'label_diagnosa' => 'Risiko Perfusi Perifer Tidak Efektif', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0016', 'label_diagnosa' => 'Risiko Perfusi Renal Tidak Efektif', 'definisi' => 'Beresiko mengalami penurunan sirkulasi darah ke ginjal. Faktor Risiko 1. Kekurangan volume cairan 2. Embolisme vaskuler 3. Vaskulitis 4. Hipertenai 5. Disfungsi ginjal 6. Hiperglikemia 7. Keganasan 8. Pembedahan jantung 9. Bypass kardiopulmonal 10. Hipoksemia 11. Hipoksia 12. Asidosis metabolik 13. Trauma 14. Sindrom kompartemen abdomen 15. Luka bakar 16. Sepsis 17. Sindrom respon inflamasi sistemik 18. Lanjut usia 19. Merokok 20. Penyalahgunaan zat', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0017', 'label_diagnosa' => 'Risiko Perfusi Serebral Tidak Efektif', 'definisi' => 'Beresiko mengalami penurunan sirkulasi darah ke otak. Faktor Risiko 1. Keabnormalan masa protrombin dan/atau masa tromboplastin parsial 2. Penurunan kinerja ventrikel kiri 3. Aterosklerosis aorta 4. Diseksi arteri 5. Fibrilasi atrium 6. Tumor otak 7. Stenosis karotis 8. Miksoma atrium 9. Aneurisma serebri 10. Koagulopati (mis. anemia sel sabit) 11. Dilatasi kardiomiopati 12. Koagulasi intravaskuler diseminata 13. Embolisme 14. Cedera kepala 15. Hiperkolesteronemia 16. Hipertensi 17. Endokarditis infektif 18. Katup prostetik mekanis 19. Stenosis mitral 20. Neoplasma otak 21. Infark miokard akut 22. Sindrom sick sinus 23. Penyalahgunaan zat 24. Terapi tombolotik 25. Efek samping tindakan (mis. tindakan operasi bypass)', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0018', 'label_diagnosa' => 'Berat Badan Lebih', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan Cairan Definisi : Akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin Penyebab :', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0019', 'label_diagnosa' => 'Defisit Nutrisi', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan Cairan Definisi : Asupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme.', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0020', 'label_diagnosa' => 'Diare', 'definisi' => 'Pengeluaran feses yang sering, lunak dan tidak berbentuk Penyebab 21. Inflamasi gastrointestinal 22. Iritasi gastrointestinal 23. Proses infeksi 24. Malabsorpsi 25. Kecemasan 26. Tingkat stress tinggi 27. Terpapar kontaminan 28. Terpapar toksin 29. Penyalahgunaan laksatif 30. Penyalahgunaan zat 31. Program pengobatan (mis. Agen tiroid, analgesic, pelunak feses, frosulfat, antasida, cimetidine dan antibiotik) 32. Perubahan air dan makanan 33. Bakteri pada air', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0021', 'label_diagnosa' => 'Disfungsi Motilitas Gastrointestinal', 'definisi' => '', 'kategori' => 'Fisiologis Subkategori : Nutrisi dan Definisi:', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0022', 'label_diagnosa' => 'Hipervolemia', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0023', 'label_diagnosa' => 'Hipovolomia', 'definisi' => 'Penurunan volume cairan intravascular, interstisial, dan atau intraselular.', 'kategori' => '', 'subkategori' => 'Nutrisi dan cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0024', 'label_diagnosa' => 'Ikterik Neonatus', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0025', 'label_diagnosa' => 'Kesiapan Peningkatan Keseimbangan Cairan', 'definisi' => 'Pola ekuilibrium antara volume cairan dan komposisi kimia cairan tubuh yang cukup untuk memenuhi kebutuhan fisik dan dapat ditingkatkan.', 'kategori' => 'Fisiologi', 'subkategori' => 'Nutrisi dan Cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0026', 'label_diagnosa' => 'Kesiapan Peningkatan Nutrisi', 'definisi' => 'Pola asupan nutrisi yang cukup untuk memenuhi kebutuhan metabolisme dan dapat ditingkatkan.', 'kategori' => 'Fisiologis Subkategori : Nutrisi dan Cairan', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0027', 'label_diagnosa' => 'Ketidakstabilan Kadar Glukosa Darah', 'definisi' => 'Variasi kadar glukosa naik/turun dari rentang normal.', 'kategori' => 'Fisiologi', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0028', 'label_diagnosa' => 'Nutrisi parenteral total (TPN) Menyusui Efektif', 'definisi' => 'Pemberian ASI secara langsung dari payudaya kepada bayi dan anak yang dapat memenuhi kebutuhan nutrisi', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0030', 'label_diagnosa' => 'Obesitas', 'definisi' => 'Akumulasi lemak berlebih atau apnormal yang tidak sesuai dengan usia dan jenis kelamin, serta melampaui kondisi berat badan lebih (overweight).', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0031', 'label_diagnosa' => 'Risiko Berat Badan Lebih', 'definisi' => 'Berisiko mengalamin akumulasi lemak berlebih atau abnormal yang tidak sesuai dengan usia dan jenis kelamin. Faktor Resiko 1. Kurang aktivitas fisikharian 2. Kelebihan konsumsi gula 3. Gangguan kebiasaan makan 4. Gangguan presepsi makan 5. Kelebihan konsumsi alkohol 6. Penggunaan energi kurang dari asupan 7. Sering mengemil 8. Sering memakan makanan berminyak/berlemak 9. Faktor keturunan (mis. Distribusi jaringan adiposa,pengeluaran energi,aktivitas lipase lipoprotein,sintesis lipid,lipolisis) 10. Penggunaan makanan formula atau makanan campuran pada bayi 11. Asupan kalsium rendah pada anak-anak. 12. Berat badan bertambah cepat ( selama masa anakanak, selama masa bayi, termasuk minggu pertama, 4 bulan pertama, dan tahun pertama) 13. Makanan padat sebagai sumber makanan utama pada usia <5 bulan. 14. Penggunaan otot bantu pernapasan 15. Fase ekspirasi memanjang', 'kategori' => 'Fisiologis Subkategori : Nutrisi dan cairan', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0032', 'label_diagnosa' => 'Resiko Defisit Nutrisi', 'definisi' => 'Beresiko mengalami aupan nutrisi tidak cukup untuk memenuhi kebutuhan metabolisme Faktor Risiko 1. Ketidakmampuan menelan makanan 2. Ketidakmampuan mencerna makanan 3. Ketidakmampuan mengbsorbsi nutrien 4. Peningkatan kebutuhan metbolisme 5. Faktor ekonomi (mis. finansial tiak mencukupi) 6. Faktor psikologis (mis. stress, keengganan untuk makan)', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0033', 'label_diagnosa' => 'Risiko disfungsi motilitas gastrointestinal', 'definisi' => 'Risiko peningkatan, penurunan atau tidak efektifnya aktivitas peristaltik pada sistem gastrointestinal. Faktor Risiko 1. Pembedahan abdomen 2. Penurunan sirkulasi gastrointestinal 3. Intoleransi makanan 4. Refluks gastrointestinal 5. Hiperglikemia 6. Imobilitas 7. Proses penuaan 8. Infeksi gastrointestinal 9. Efek agen farmokologis (mis, antibiotik, laksatif, narkotika/opiat) 10. Prematuritas 11. Kecemasan 12. Stres 13. Kurangnya sanitasi pada persiapan makanan', 'kategori' => 'Fisiologis', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0034', 'label_diagnosa' => 'Risiko Hipovolemia', 'definisi' => 'Berisiko mengalami penurunan volume cairan intravaskuler, interstisiel, dan/atau intraseluler. Faktor Risiko 1. Kehilangan cairan secara aktif 2. Gangguan absorbsi cairan 3. Usia lanjut 4. Kelebihan berat badan 5. Status hipermetabolik 6. Kegagalan mekanisme regulasi 7. Evaporasi 8. Kekurangan intake cairan 9. Efek agen farmakologis', 'kategori' => 'Fisiologis Subkategori : Nutrisi dan Cairan', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0035', 'label_diagnosa' => 'Risiko Ikterik Neonatus', 'definisi' => 'Beresiko mengalami kulit dan membran mukosa neonatus menguning setelah 24 jam kelahiran akibat bilirubin tak terkonjugasi masuk ke dalam sirkulasi Faktor Risiko 1. Penurunan berat badan abnormal > 7-8% pada bayi baru lahir yang menyusu ASI, > 15% pada bayi cukup bulan 2. Pola makan tidak ditetapkan dengan baik 3. Kesulitan transisi ke kehidupan ekstra uterin 4. Usia kurang dari 7 hari 5. Keterlambatan pengeluaran feses (mekonium) 6. Prematuritas (<37 minggu)', 'kategori' => 'Fisiologis Subkategori : Nutrisi dan Cairan', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0037', 'label_diagnosa' => 'Resiko Ketidakseimbangan Elektrolit', 'definisi' => 'Beresiko mengalami perubahan kadar serum elektrolit Faktor Resiko 1. Ketidakseimbangan cairan (mis. dehidrasi dan intoksikasi air) 2. Kelebihan volume cairan 3. Gangguan mekanisme regulasi (mis. diabetes) 4. Efek samping prosedur (mis. pembedahan) 5. Diare 6. Muntah 7. Disfungsi ginjal 8. Disfungsi regulasi endokrin', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0038', 'label_diagnosa' => 'Resiko Keidakstabilan Glukosa Darah', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0041', 'label_diagnosa' => 'Obat alpha adrenergic Inkontinensia Fekal', 'definisi' => '', 'kategori' => 'Fisiologis Sub kategori : Eliminasi Definisi :', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0046', 'label_diagnosa' => 'Inkontinensia Urin Sters', 'definisi' => 'Kebocoran urin mendadak dan tidak dapat dikendalikan karena aktivitas yang meningkatkan tekanan intraabdominal.', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0048', 'label_diagnosa' => 'Kesiapan Peningkatan Eliminasi Urin', 'definisi' => 'Pola fungsi sistem perkemihan yang cukup untuk memenuhi kebutuhan eliminasi yang dapat ditingkatkan.', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0049', 'label_diagnosa' => 'KONSTIPASI', 'definisi' => 'Penurunan defekasi normal yang disertai pengeluaran feses sulit dan tidak tuntas serta feses kering dan banyak Penyebab fisiologis : 1. Penurunan mobilitas gastrointestinal 2. Ketidakadekuatan Pertumbuhan gigi 3. Ketidak cukupan diet 4. Ketidakcukupan asupan serat 5. Ketidakcukupan asupan cairan 6. Aganglionik (mis. penyakit Hirscprung) 1. Konfusi 2. Depresi 3. Gangguan emosional 1. Perubahan kebiasaan makan (mis. jenis makanan, jadwal makan) 2. Ketidakadekuatan toileting 3. Aktivitas fisik harian kurang dari yang dianjurkan 4. Penyalahgunaan laksatif 5. Efek agen farmakologis 6. Ketidak teraturan kebiasaan defekasi 7. Kebiasaan menahan dorongan defekasi 8. Perubahan lingkungan', 'kategori' => 'Fisiologi', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0050', 'label_diagnosa' => 'Retensi Urine', 'definisi' => 'Pengosongan kandung kemih yang tidak lengkap', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0051', 'label_diagnosa' => 'Risiko Inkontinensia Urine Urgensi', 'definisi' => 'Berisiko mengalami pengeluaran urin yang tidak terkendali Faktor Risiko 1. Efek samping obat, kopi dan alkohol 2. Hiperrefleks destrussor 3. Gangguan sistem saraf pusat 4. Kerusakan kontraksi kandung kemih: relaksasi spingter tidak terkendali 5. Ketidakefektifan kebiasaan berkemih 6. Kapasitas kandung kemih kecil', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0052', 'label_diagnosa' => 'Risiko Konstipasi', 'definisi' => '', 'kategori' => 'Fisiologi Sub kategori : Eliminasi Definisi :', 'subkategori' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0003', 'label_diagnosa' => 'Gangguan Pertukaran Gas', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0004', 'label_diagnosa' => 'Gangguan Ventilasi Spontan', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0005', 'label_diagnosa' => 'Pola Napas Tidak Efektif', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Respirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0007', 'label_diagnosa' => 'Gangguan Sirkulasi Spontan', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0008', 'label_diagnosa' => 'Penurunan Curah Jantung', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0009', 'label_diagnosa' => 'Perfusi Perifer Tidak Efektif', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Sirkulasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0029', 'label_diagnosa' => 'Menyusui Tidak Efektif', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan Cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0036', 'label_diagnosa' => 'Risiko Ketidakseimbangan Cairan', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Nutrisi dan Cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0040', 'label_diagnosa' => 'Gangguan Eliminasi Urin', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0042', 'label_diagnosa' => 'Inkontinensia Urin Berlanjut', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0043', 'label_diagnosa' => 'Inkontinensia Urin Berlebih', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0044', 'label_diagnosa' => 'Inkontinensia Urin Fungsional', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0045', 'label_diagnosa' => 'Inkontinensia Urin Refleks', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_diagnosa' => 'D.0047', 'label_diagnosa' => 'Inkontinensia Urine Urgensi', 'definisi' => '', 'kategori' => 'Fisiologis', 'subkategori' => 'Eliminasi', 'created_at' => $now, 'updated_at' => $now],
        ]);

        // SLKI
        DB::table('luaran_slki')->insert([
            ['kode_luaran' => 'L.01001', 'label_luaran' => 'Bersihan Jalan Nafas', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.01002', 'label_luaran' => 'Penyapihan ventilator', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.01003', 'label_luaran' => 'Pertukaran Gas', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02015', 'label_luaran' => 'Sirkulasi Spontan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.01004', 'label_luaran' => 'Pola Napas', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.01006', 'label_luaran' => 'Tingkat Aspirasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02008', 'label_luaran' => 'Curah Jantung', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02017', 'label_luaran' => 'Tingkat Perdarahan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02010', 'label_luaran' => 'Perfusi Gastrointestinal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02011', 'label_luaran' => 'Perfusi Perifer', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02013', 'label_luaran' => 'Perfusi Renal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.02014', 'label_luaran' => 'Perfusi Serebral', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03018', 'label_luaran' => 'Berat Badan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.04033', 'label_luaran' => 'Eliminasi fekal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03033', 'label_luaran' => 'Tingkat Nyeri', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03020', 'label_luaran' => 'Keseimbangan Cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.14125', 'label_luaran' => 'Integritas Kulit dan Jaringan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03030', 'label_luaran' => 'Status Nutrisi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03022', 'label_luaran' => 'Ketidakstabilan glukosa kadar darah', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03029', 'label_luaran' => 'Status Menyusui', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03023', 'label_luaran' => 'Motilitas Gastrointestinal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03028', 'label_luaran' => 'Status Cairan Membaik', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.03021', 'label_luaran' => 'Keseimbangan Elektrolit', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.04034', 'label_luaran' => 'Eliminasi Urine', 'created_at' => $now, 'updated_at' => $now],
            ['kode_luaran' => 'L.04036', 'label_luaran' => 'Kontinensia Urine', 'created_at' => $now, 'updated_at' => $now],
        ]);

        // SIKI
        DB::table('intervensi_siki')->insert([
            ['kode_intervensi' => 'I.01001', 'label_intervensi' => 'Latihan Batuk Efektif', 'definisi' => 'Melatih pasien yang tidak memiliki kemampuan batuk secara efektif untuk membersihkan laring, trakea dan bronkiolus dari sekret atau benda asing di jalan napas', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01011', 'label_intervensi' => 'Manajemen Jalan Napas', 'definisi' => 'Mengidentifikasi dan mengelola kepatenan jalan napas', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01014', 'label_intervensi' => 'Pemantauan Respirasi', 'definisi' => 'Mengumpulkan dan menganalisis data untuk memastikan kepatenan jalan napas dan keefektifan pertukaran gas.', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01021', 'label_intervensi' => 'Mekanik', 'definisi' => 'Memfasilitasi pasien bernapas tanpa bantuan ventilasi mekanis Tindakan Observasi 1. Periksa kemampuan untuk disapih (meliputi hemodinamik stabil,kondisi optimal,bebas infeksi) 2. Monitor prediktor kemampuan untuk mentolerir penyapihan (mis.tingkat kemampuan bernapas,kapasistas vital,Vd/Vt,MVV,kekuat an inspirasi ,FEV1,tekanan inspirasi negatif) 3. Monitor tanda tanda kelelahan otot pernapasan (mis. Kenaikan PaCO2 mendadak,napas cepat dan dangkal,gerakan dinding abdomen paradoks),hipoksemia, dan hipoksia jaringan saat penyapihan 4. Monitor status cairan dan elektrolit', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01026', 'label_intervensi' => 'Terapi Oksigen', 'definisi' => 'Memberikan tambahan oksigen untuk mencegah dan mengatasi kondisi kekurangan oksigen jaringan Tindakan Observasi 1. Monitor kecepatan aliran oksigen 2. Monitor posisi alat terapi oksigen 3. Monitor aliran oksigen secaa periodik dan pastikan fraksi yang diberikan cukup 4. Monitor efektifitas terapi oksigen (mis. Oksimetri, analisa gas darah), jika perlu 5. Monitor kemampuan melepaskan oksigen saat makan 6. Monitor tanda-tanda hipoventilasi 7. Monitor tanda dan gejala toksikasi oksigen dan atelektasis 8. Monitor tingkat kecemasan akibat terapi oksigen 9. Monitor integritas mukosa hidung akibat pemasangan oksigen', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02038', 'label_intervensi' => 'Manajemen Defibrilasi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03139', 'label_intervensi' => 'Resisutasi Cairan', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02083', 'label_intervensi' => 'Resusitasi Jantung Paru', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01018', 'label_intervensi' => 'Pencegaha Aspirasi', 'definisi' => 'Mengidentifikasi dan mengurangi risiko masuknya partikel makanan/cairan ke dalam paru-paru', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02075', 'label_intervensi' => 'Perawatan jantung', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02080', 'label_intervensi' => 'Pertolongan Pertama', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02067', 'label_intervensi' => 'Pencegahan Perdarahan', 'definisi' => 'Mengidentifikasi dan menurunkan risiko atau komplikasi stimulus yang menyebabkan perdarahan atau risiko perdarahan Tindakan Observasi - Monitor tanda dan gejala perdarahan - Monitor hematokrit/hemoglobin sebelum dan setelah kehilangan darah', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02028', 'label_intervensi' => 'Balut tekan', 'definisi' => 'Membalut luka dengan tekanan untuk mencegah atau menghentikan perdarahan Tindakan Observasi - Monitor perban untuk memantau drainase luka Monitor jumlah dan warna cairan drainase dari luka - Periksa kecepatan dan denyut nadi distal - Periksa akral , kondisi kulit dan pengisian kapiler distal Terapeutik - Pasang sarung tangan - Tinggikan bagian tubuh yang cedera diatass level jantung, jika tidak ada fraktur - Tutup luka dengan kasa tebal - Tekan kasa dengan kuat diatass luka selama - Fiksasi kasa dengan plaster setelah perdarahan berhenti - Terkar arteri (pressure point) yang mengarah ke area perdarahan Memberikan informasi mengenai keamanan dan pencegahan cidera pada anak Tindakan Observasi - Identifikasi kesiapan dan kemampuan menerima informasi Terapeutik - Sediakan materi dan media pendidikan kesehatan - Jadwalkan pendidikan kesehatan sesuai kesepakatan - Berikan kesempatan untuk bertanya Edukasi - Anjurkan memantau anak saat berada di tempat yang beresiko(mis. Luar rumah, balkon, kolam renang) - Anjurkan menutup sumber listrik yang dapat dijangkau - Anjurkan mengatur perabotan rumah tangga - Anjurkan memilih mainan yang sesuai dengan usia anak dan tidak berbahaya - Anjurkan menyimpan benda berbahaya (mis. Pisau, benda tajam lainnya) dan cairan berbahaya(mis. Pembersih lantai, detergen) ditempat yang jauh dari jangkauan ) Anjurkan memberikan pembatas pada area dapur,kamar mandi, kolam Jelaskan kepada orang tua dan anak tentang bahaya lalulintas Anjurkan pengunaan sabuk pengaman saat berkendara Jelaskan keamanan bersepeda pada anak(mis. Mengguanakan helm, menggunakan sepeda sesuai usia) Anjurkan penggunaan stroller(kursi dorong anak), kursi khusus anak dengan aman Anjurkan tidak meletakan anak pada tempat tidur yang tinggi Ajarkan anak tindakan yang dilakuykan saat meraasa dirinya dalam bahaya(mis. Meminta bantuan orang dewasa, berteriak, segera berlari) Edukasi keamanan bayi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.12379', 'label_intervensi' => 'dilakuykan saat meraasa dirinya dalam bahaya(mis. Meminta bantuan orang dewasa, berteriak, segera berlari)', 'definisi' => 'Menyediakan informasi dan dukungan terhadap pencegahan cedera pada bayi Tindakan Observasi - Identifikasi kesiapan dan kemampuian menerima informasi Terapeutik - Sediakan materi dan media pendidikan kesehatan - Jadwalkan pendidikan kesehatan sesuai kesepakatan - Berikan kesempatan untuk bertanya Edukasi - Anjurkan selalu mengawasi bayi - Anjurkan tidak meninggalkan bayinya sendirian - Anjurkan menjauhkan benda yang beresiko membahayakan bayi(mis. Kantung p;llastik, karet , tali, kain, benda-benda keci, benda tajam, pembersih lantai) - Anjurkan memasang penghalang pada sisi tempat tidur - Anjurkan menutup sumber listrik yang terjangkau oleh bayi - Anjurkan mengatur perabotan rumah tanngga dirumah Anjurkan memberikan pembatas pada area beresiko(mis. Daour, kamar mandi, kolam) Anjurkan mengguanakan kursi dan sabuk pengaman khusus bayi saat berkendara Anjurkan penggunaan sabuk pengaman pada stroller (kursi dorong bayi), kursi khusus bayi dengan aman Anjurkan tidak meletakan bayi pada tempat tidur yang tinggi Manajemen pendarahan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.01004', 'label_intervensi' => 'Manajemen pendarahan', 'definisi' => 'Mengidentifikasi dan mengelola kehilangan darah saat terjadi perdarahan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03094', 'label_intervensi' => 'Konseling nutrisi', 'definisi' => 'Memberikan bimbingan dalam melakukan modifikasi asupan nutrisi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02068', 'label_intervensi' => 'Pencegahan Syok Definisi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.06194', 'label_intervensi' => 'Tekanan Intrakranial', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03101', 'label_intervensi' => 'Manajemen Diare', 'definisi' => 'Mengidentifikasi dan mengelola diare dan dampaknya', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.14551', 'label_intervensi' => 'Pengontrolan Infeksi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03121', 'label_intervensi' => 'Pemantauan Cairan', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.003116', 'label_intervensi' => 'Definisi :', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02045', 'label_intervensi' => 'Manejemen pendarahan pervaginam pascapersalinan', 'definisi' => 'Mengidentifikasi dan mengelola kehilangan jumlah darah pervaginam lebih dari 500 cc, dapat terjadi pada proses persalinan (24 jam) dan lebih dari (24 jam) setelah persalinan.', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.02042', 'label_intervensi' => 'antepartum dipertahankan', 'definisi' => 'Mengidentifikasi dan mengelola pendarahan pada kehamilan yang dapat dipertahankan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03091', 'label_intervensi' => 'Fototerapi Neonatus', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.10338', 'label_intervensi' => 'Perawatan Bayi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03098', 'label_intervensi' => 'Manajemen Cairan', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03115', 'label_intervensi' => 'Manajemen hiperglikemia', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03093', 'label_intervensi' => 'Konseling Laktasi', 'definisi' => 'Memberikan bimbingan teknik menyusui yang tepat dalam pemberian makanan bayi. Tindakan Observasi 1. Identifikasi keadaan emosional ibu saat akan dilakukan konseling menyusui 2. Identifikasi keinginan dan tujuan menyusui 3. Identifikasi permasalahan yang ibu alami selama proses menyusui', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03135', 'label_intervensi' => 'Promosi ASI Eksklusif', 'definisi' => 'Meningkatkan kemampuan ibu dalam memberikan ASI secara eksklusif (0-6 bulan). Tindakan Observasi 1. Identifikasi kebutuhan laktasi bagi ibu pada antenatal, intranatal, dan postnatal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03138', 'label_intervensi' => 'Promosi Laktasi', 'definisi' => 'Meningkatkan cakupan ASI eksklusif dan lanjutkan sampai 2 tahun', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.12393', 'label_intervensi' => 'Edukasi Menyusui Tindakan', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03130', 'label_intervensi' => 'Pendampingan Proses Menyusui', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.12397', 'label_intervensi' => 'Edukasi Nutrisi Bayi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03097', 'label_intervensi' => 'Manajemen berat badan', 'definisi' => 'Mengidentifikasi dan mengelola berat badan agar dalam rentang optimal', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.12365', 'label_intervensi' => '4. Anjurkan untuk melakukan pencatatan asupan makan, aktivitas fisik dan perubahan berat badan', 'definisi' => 'Memberikan informasi tentang berat dan presentase lemak tubuh yang optimal Tindakan Observasi 1. Identifikasi kesiapan dan kemampuan menerima informasi', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.12369', 'label_intervensi' => 'Edukasi Diet Definisi', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03119', 'label_intervensi' => 'Manajemen Nutrisi', 'definisi' => 'Mengidentifikasi dan mengelola asupan nutrisi Tindakan Observasi 1. Identifikasi status nutrisi 2. Identifikasi alergi dan intoleransi makanan 3. Identifikasi kebutuhan kalori dan nutrien 4. Monitor asupan makanan 5. Monitor berat badan Terapeutik 1. Lakukan oral hygiene sebelum makan, jika perlu 2. Berikan makanan tinggi serat untuk mencegah konstipasi 3. Berikan makanan tinggi kalori dan tinggi protein Edukasi 1. Anjurkan posisi duduk, jika mampu 2. Ajarkan diet yang diprogram', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03116', 'label_intervensi' => 'Manajemen Hipovolemia', 'definisi' => 'Manajemen hipovolemia adalah intervensi yang dilakukan oleh perawat untuk mengidentifikasi dan mengelola penurunan volume cairan intravaskuler. Tindakan Observasi 1. Periksa tanda dan gejala hipovolemia (mis: frekuensi nadi meningkat, nadi teraba lemah, tekanan darah menurun, tekanan nadi menyempit, turgor kulit menurun, membran mukosa kering, volume urin menurun, hematokrit meningkat, haus, lemah) 2. Monitor intake dan output cairan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.03132', 'label_intervensi' => '1. Perawatan Neonatus', 'definisi' => 'Mengidentifikasi dan merawat bayi setelah lahir sampai usia 28 hari', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.04148', 'label_intervensi' => 'Kateterisasi Urine', 'definisi' => 'Masukan selang kateter urine ke dalam kandung kemih Tindakan Observasi 1. Memeriksa kondisi pasien (mis. Kesadaran, tanda - tanda vital daerah perineal, distensi kandung kemih, inkontinensia urine, refleks berkemih) Terapeutik 6. Menyiapkan peralatan, bahan-bahan dan ruangan tindakan 7. Menyiapkan pasien: membebaskan pakaian bawah dan memposisikan dorsal rekumben (untuk wanita) dan supine (untuk laki-laki) 8. Memasang sarung tangan 9. Membersikan daerah perineal atau preposium dengan cairan NaCl atau aquades 10. Melakukan insersi keteter urine dengan menerapkan prinsip aseptik 11. Menyambungkan kateter urin dengan urine bag 12. Mengisi balon dengan NaCl 0,9% sesuai anjuran pabrik 13. Memfiksasikan selang kateter diatas simpisis atau paha 14. Memastikan kantung urine ditempatkan lebih rendah dari kandung kemih 15. Memberikan label waktu pemasangan', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.04163', 'label_intervensi' => 'Perawatan inkontinensia urin.', 'definisi' => 'Mengidentifikasi dan merawat pasien yang mengalami pengeluaran urine secara involunter (tidak disadari). Tindakan Observasi 1. Identifikasi penyebab inkontinensia urine (mis, disfungsi neurologis, gangguan medula spinalis, gangguan refleks destrusor, obat-obatan, usia, riwayat operasi, gangguan fungsi kognitif) 2. Identifikasi perasaan dan persepsi pasien terhadap inkontinensia urine yang dialaminya 3. Monitor keefektifan obat, pembedahan dan terapi modalitas berkemih 4. Monitor kebiasaan BAK', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.04149', 'label_intervensi' => 'Latihan Berkemih', 'definisi' => '', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.07215', 'label_intervensi' => 'Latihan Otot Panggul', 'definisi' => 'Mengajarkan kemampuan meningkatkan otot-otot elevator ani dan urogenitas melalui kontraksi berulang untuk menurunkan inkontinesia urin dan ejakulasi dini. Tindakan Observasi 1. Monitor pengeluaran urine Terapeutik 1. Berikan reinforcement positif selama melakukan latihan dengan benar', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.04152', 'label_intervensi' => 'Manajemen Eliminasi Urine', 'definisi' => 'Mengidentifikasi dan mengelola gangguan pola eliminasi urine. Tindakan Obserfasi 1. Identifikasi tanda dan gejala inkontinensia urine. 2. Identifikasi faktor yang menyebabkan retensi atau inkontinensia urine 3. Monitor eliminasi urine (mis. frekuensi, konsistensi, aroma, volume, dan wama)', 'created_at' => $now, 'updated_at' => $now],
            ['kode_intervensi' => 'I.04151', 'label_intervensi' => 'Manajemen eliminasi fekal', 'definisi' => 'Megidentifikasi dan mengelola gangguan pola eliminasi fekal Tindakan Observasi 1. Identifikasi masalah usus dan penggunaan obat pencahar 2. Identifikasi pengobatan yang berefek pada kondisi gastrointestinal 3. Monitor buang air besar (mis. warna, frekuensi, konsistensi, volume) 4. Monitor tanda dan gejala diare, konstipasi, atau impaks', 'created_at' => $now, 'updated_at' => $now],
        ]);

        $sdkiIds = DB::table('diagnosa_sdki')->pluck('id', 'kode_diagnosa');
        $slkiIds = DB::table('luaran_slki')->pluck('id', 'kode_luaran');
        $sikiIds = DB::table('intervensi_siki')->pluck('id', 'kode_intervensi');

        // SDKI Penyebab
        $rows = [];
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Spasme jalan napas']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Hipersekresi jalan napas']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Disfungsi neuromuskuler']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Benda asing dalam jalan napas']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Adanya jalan napas buatan']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Sekresi yang tertahan']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Hiperplasia dinding jalan napas']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Proses infeksi']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Respon alergi']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 10, 'deskripsi' => 'Efek agen farmakologis (mis. Anastesi)']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 11, 'deskripsi' => 'Merokok aktif']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 12, 'deskripsi' => 'Merokok pasif']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'kelompok' => 'Umum', 'urutan' => 13, 'deskripsi' => 'Terpajan polutan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Hipersekresi jalan napas']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Ketidakcukupan Energi']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Hambatan upaya napas (mis. Nyeri saat bernapas,kelemahan otot pernapasan,efek sedasi)']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Kecemasan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Perasaan tidak berdaya']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Kurang informasi tentang proses penyapihan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Penurunan motivasi']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Ketidakadekuatan dukungan sosial']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Ketidaktepatan kecepatan proses penyapihan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 10, 'deskripsi' => 'Riwayat kegagalan berulang dalam upaya penyapihan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'kelompok' => 'Umum', 'urutan' => 11, 'deskripsi' => 'Riwayat ketergantungan ventilator >4 hari']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'kurangnya asupan makanan']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Ketidakmampuan menelan makanan']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Ketidakmampuan mencerna makanan']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Ketidakmampuan mengabsorbsi nutrient']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Peningkatan kebutuhan metabolisme']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'faktor ekonomi (mis, financial tidak mencukupi)']; }
        if (isset($sdkiIds['D.0019'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0019'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Factor psikologis (mis. Stress, keengganan untuk makan)']; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Kehilangan cairan aktif']; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Kegagalan mekanisme regulasi']; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Peningkatan permeabilitas kapiler']; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Kekurangan intake cairan']; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Evaporasi']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Hiperglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Disfungsi pangkreas']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Resistensi insulin']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Gangguan toleransi glukosa darah']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Gangguan glukosa darah puasa Hipoglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Penggunaan insulin atau obat glikemik oral']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Hiperinsulinemia (mis. Insulinoma)']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Endokrinopati (mis. Kerusakan adrenal atau pituitari)']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Disfungsi hati']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 10, 'deskripsi' => 'Disfungsi ginjal kronis']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 11, 'deskripsi' => 'Efek agen farmakologis']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 12, 'deskripsi' => 'Tindakan pembedahan neoplasma']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 13, 'deskripsi' => 'Gangguan metabolik bawaan (mis. Gangguan penyimpanan lisosomal, galaktosemia, gangguan penyimpanan glikogen) Gejala dan tanda mayor:
Hipoglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 14, 'deskripsi' => 'Mengantuk']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 15, 'deskripsi' => 'Pusing Hiperglikemia :']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 16, 'deskripsi' => 'Lelah atau lesu Objektif : Hipoglikemia :']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 17, 'deskripsi' => 'Gangguan koordinasi']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 18, 'deskripsi' => 'Kadar glukosa dalam darah atau urine rendah Hiperglikemia :']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 19, 'deskripsi' => 'Kadar gluosa dalam darah atau urin tinggi Gejala dan tanda minor Subjektif: Hipoglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 20, 'deskripsi' => 'Palpitasi']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 21, 'deskripsi' => 'Mengeluh lapar Hiperglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 22, 'deskripsi' => 'Mulut kering']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 23, 'deskripsi' => 'Haus meningkat Objektif: Hipoglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 24, 'deskripsi' => 'Gemetar']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 25, 'deskripsi' => 'Kesadaran menurun']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 26, 'deskripsi' => 'Perilaku aneh']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 27, 'deskripsi' => 'Sulit bicara']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 28, 'deskripsi' => 'Berkeringat Hiperglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 29, 'deskripsi' => 'Jumlah urine meningkat Kondisi klinis terkait :']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 30, 'deskripsi' => 'Diabetes melitus']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 31, 'deskripsi' => 'Ketoasidosis diabetik']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 32, 'deskripsi' => 'Hipoglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 33, 'deskripsi' => 'Hiperglikemia']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 34, 'deskripsi' => 'Diabetes gestasional']; }
        if (isset($sdkiIds['D.0027'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0027'], 'kelompok' => 'Umum', 'urutan' => 35, 'deskripsi' => 'Penggunaan kortikostiroid Nutrisi parenteral total (TPN)']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Hormon oksitosin dan prolaktin adekuat']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Payudara membesar, alveoli mulai terisi ASI']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Tidak ada kelainan pada struktur payudara']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Puting menonjol']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Bayi Aterm']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Tidak ada kelainan bentuk pada mulut bayi']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Rawat gabung']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Dukungan keluarga dan tenaga kesehatan adekuat']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Faktor budaya']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Kurang aktivitas fisik harian']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Kelebihan konsumsi gula']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Gangguan kebiasaan makan']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Gangguan persepsi makan']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Kelebihan konsumsi alkohol']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Penggunaan energi kurang dari asupan']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Sering mengemil']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Sering memakan makanan berminyak/berlemak 9. Faktor keturunan (mis.distribusi jaringan adiposa, pengeluaran energi, aktivitas lipase lipoprotein, sintesis lipit, lipolisis)']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Penggunaan makanan formula atau makanan campuran pada bayi.']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 10, 'deskripsi' => 'Asupan kalsium rendah pada anakanak']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 11, 'deskripsi' => 'Berat badan bertambah cepat (selama masa anakanak, selama masa bayi, termasuk minggu pertama, 4 bulan pertama, dan tahun pertama)']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'kelompok' => 'Umum', 'urutan' => 12, 'deskripsi' => 'Makan padat sebagai sumber makanan utama pada usia <5 bulan']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Kerusakan susunan saraf motorik bawah']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Penurunan tonus otot']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Gangguan kognitif']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Penyalahgunaan laksatif']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Kehilangan fungsi pengendalian sfingter rectum']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Pascaoperasi pullthrough dan penutupan kolosomi']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Ketidakmampuan mencapai kamar kecil']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Diare kronis']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Stress berlebihan']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Kelemahan intrinsik spinkter uretra']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Perubahan degenerasi/non degenerasi otot pelvis']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Kekurangan estrogen']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Peningkatan tekanan intraabdomen']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Kelemahan otot pelvis']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 1, 'deskripsi' => 'Peningkatan tekanan uretra']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 2, 'deskripsi' => 'Kerusakan arkus refleks']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 3, 'deskripsi' => 'Blok spingter']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 4, 'deskripsi' => 'Disfungsi neurologis (mis. trauma, penyakit saraf)']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 5, 'deskripsi' => 'Efek agen farmakologis (mis. atropine, belladonna, psikotropik, antihistamin, opiate) Gejala danTandaMayor
Sensasi penuh pada kandung kemih']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 6, 'deskripsi' => 'Disuria / anuria']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 7, 'deskripsi' => 'Distensi kandung kemih GejaladanTandaMinor']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 8, 'deskripsi' => 'Dribbling']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 9, 'deskripsi' => 'Inkontinensia berlebih']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 10, 'deskripsi' => 'Residu urine 150 ml atau lebih KondisiKlinisTerkait']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 11, 'deskripsi' => 'Benigna prostat hiperplasia']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 12, 'deskripsi' => 'Pembengkakan perineal']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 13, 'deskripsi' => 'Cedera medula spinalis']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 14, 'deskripsi' => 'Rektokel']; }
        if (isset($sdkiIds['D.0050'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0050'], 'kelompok' => 'Umum', 'urutan' => 15, 'deskripsi' => 'Tumor disaluran kemih Risiko Inkontinensia Urine']; }
        foreach (array_chunk($rows, 100) as $chunk) { DB::table('sdki_penyebab')->insert($chunk); }

        // SDKI Gejala
        $rows = [];
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '-', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Batuk tidak efektif atau tidak mampu batuk', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Sputum berlebih / obstruksi di jalan napas / mekonium di jalan napas (pada neonatus)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Mengi, wheezing dan/atau ronkhi kering', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Gelisah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Sionosis', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Bunyi napas menurun', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 4, 'deskripsi' => 'Frekuensi napas berubah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 5, 'deskripsi' => 'Pola napas berubah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Frekuensi napas meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Penggunaan otot bantu napas', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Napas megap megap (gasping)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 4, 'deskripsi' => 'Upaya napas dan bantuan ventilator tidak sinkron', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 5, 'deskripsi' => 'Napas dangkal', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 6, 'deskripsi' => 'Agitasi', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 7, 'deskripsi' => 'Nilai gas darah arteri abnormal', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'IMT >25 kg/m2 (pada dewasa) atau berat dan Panjang badan lebih dari presentil 95 (pada anak >2tahun) atau IMT pada presentil ke 85-95 (pada anak 2-18 tahun)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Tebal lipatan kulit trisep >25mm', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Defekasi lebih dari tiga kali dalam 24 jam', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Feses lembek atau cair', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Frekuensi peristaltik meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Bising usus hiperaktif', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'merasa lemah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'mengeluh haus', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'pengisian vena menurun', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'status mental berubah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'suhu tubuh meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 4, 'deskripsi' => 'konsentrasi urin meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 5, 'deskripsi' => 'berat badan turun tiba-tiba Kondisi Klinis Terkait', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 6, 'deskripsi' => 'penyakit Addison', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 7, 'deskripsi' => 'trauma/pendarahan', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 8, 'deskripsi' => 'luka bakar', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 9, 'deskripsi' => 'AIDS', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 10, 'deskripsi' => 'Penyakit Crohn', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 11, 'deskripsi' => 'Muntah', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 12, 'deskripsi' => 'Diare', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 13, 'deskripsi' => 'Kolitis ulseratif', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0023'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0023'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 14, 'deskripsi' => 'Hipoalbuminemia', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Mengekspresiakan keinginan untuk meningkatkan keseimbangan cairan', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Membran mukosa lembab', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Asupan makanan dan cairan adekuat untuk kebutuhan harian', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Turgor jaringan baik', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 4, 'deskripsi' => 'Tidak ada tanda edema atau dehidrasi', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '(tidak tersedia)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Urin berwarna kuning bening dengan berat jenis dalam rentang norma', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Haluaran urin sesuai dengan asupan', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Berat badan stabil', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Mengekspresikan keinginan untuk meningkatkan nutrisi', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Makan teratur dan adekuat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Mengekspresikan pengetahuan tentang pilihan makanan dan cairan yang sehat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Mengikuti standar asupan nutrisi asupan yang tepat (mis. Piramida makanan, pedoman American Diabetic Association atau pedoman lainnya)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Penyiapan dan penyimpanan makanan dan minuman yang aman', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Sikap terhadap makanan dan minuman sesuai dengan tujuan kesehatan', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Ibu merasa percaya diri selama proses menyusui', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Bayi melekat pada payudara ibu dengan benar', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Ibu mampu memposisikan bayi dengan benar', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 3, 'deskripsi' => 'Miksi bayi lebih dari 8 kali dalam 24 jam', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 4, 'deskripsi' => 'Berat badan bayi meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 5, 'deskripsi' => 'ASI menetes/menancar', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 6, 'deskripsi' => 'Suplai ASI adekuat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 7, 'deskripsi' => 'Puting tidak lecet setelah minggu kedua', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '(tidak tersedia) Objektif', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Bayi tidur setelah menyusui', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 3, 'deskripsi' => 'Payudaya ibu kosong setelah menyusui', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 4, 'deskripsi' => 'Bayi tidak rewel dan menangis setelah menyusui', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'IMT >27 kg/m2 ( pada dewasa ) atau lebih dari presentil ke 95 untuk usia dan jenis kelamin ( pada anak)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '(tidak tersedia) Objektif', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Tebal lipatan kulit triset > 25 mm', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Tidak mampu mengontrol pengeluaran feses', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Tidak mampu menunda defekasi', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Feses keluar sedikit- sedikit dan sering', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '(tidak tersedia)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Bau feses', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Kulit perianal kemerahan', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Mengeluh keluar urin <50ml saat tekanan abdominal meningkat (mis. saat berdiri, bersin, tertawa, berlari atau mengangkat benda berat)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => '(tidak ada)', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Pengeluaran urin ridak tuntas', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Urgensi miksi', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 3, 'deskripsi' => 'Frekuensi berkemih meningkat', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'tipe' => 'Minor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Overdistensi abdomen', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'tipe' => 'Mayor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => 'Mengungkapkan keinginan untuk meningkatkan eliminasi urin', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 1, 'deskripsi' => 'Jumlah urin normal', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'tipe' => 'Mayor', 'jenis' => 'Objektif', 'urutan' => 2, 'deskripsi' => 'Karakteristik urin normal', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 1, 'deskripsi' => '(Tidak Tersedia) Objektif', 'tersedia' => 0]; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'tipe' => 'Minor', 'jenis' => 'Subjektif', 'urutan' => 2, 'deskripsi' => 'Asupan cairan cukup', 'tersedia' => 0]; }
        foreach (array_chunk($rows, 100) as $chunk) { DB::table('sdki_gejala')->insert($chunk); }

        // SDKI Kondisi Klinis
        $rows = [];
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 1, 'deskripsi' => 'Gullian barre syndrome']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 2, 'deskripsi' => 'Sklerosis multipel']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 3, 'deskripsi' => 'Myasthenia gravis']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 4, 'deskripsi' => 'Prosedur diagnostik (mis. Bronkoskopi, transesophageal echocardiograhphy']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 5, 'deskripsi' => 'Sklerosis multipel']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 6, 'deskripsi' => 'Myasthenia gravis']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 7, 'deskripsi' => 'Stroke']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 8, 'deskripsi' => 'Kuadrifplegia']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 9, 'deskripsi' => 'Sindrom aspirasi meconium']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 10, 'deskripsi' => 'Infeksi saluran napas']; }
        if (isset($sdkiIds['D.0001'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0001'], 'urutan' => 11, 'deskripsi' => 'Asma Gangguan Penyapihan']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 1, 'deskripsi' => 'Cedera kepala']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 2, 'deskripsi' => 'Coronary artery bypass graft (CABG)']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 3, 'deskripsi' => 'Gagal Napas']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 4, 'deskripsi' => 'Cardiac Arrest']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 5, 'deskripsi' => 'Transplantasi Jantung']; }
        if (isset($sdkiIds['D.0002'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0002'], 'urutan' => 6, 'deskripsi' => 'Displasia Bronkupulmonal Gangguan Pertukaran Gas']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 1, 'deskripsi' => 'Cedera kepala']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 2, 'deskripsi' => 'Stroke']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 3, 'deskripsi' => 'Cedera medulla spinalis']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 4, 'deskripsi' => 'Guillain barre syndrome']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 5, 'deskripsi' => 'Penyakit Parkinson']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 6, 'deskripsi' => 'Keracunan obat dan alcohol']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 7, 'deskripsi' => 'Pembesaran uterus']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 8, 'deskripsi' => 'Miestenia gravis']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 9, 'deskripsi' => 'Fistula trakeoesofagus']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 10, 'deskripsi' => 'Striktura esofagus']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 11, 'deskripsi' => 'Sclerosis multiple']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 12, 'deskripsi' => 'Labiopalatoskizis']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 13, 'deskripsi' => 'Atresia esofagus']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 14, 'deskripsi' => 'Laringomalasia']; }
        if (isset($sdkiIds['D.0006'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0006'], 'urutan' => 15, 'deskripsi' => 'Prematuritas Gangguan Sirkulasi Spontan']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 1, 'deskripsi' => 'Bradikardia']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 2, 'deskripsi' => 'Takikardia']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 3, 'deskripsi' => 'Sindrom jantung coroner akut']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 4, 'deskripsi' => 'Gagal jantung']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 5, 'deskripsi' => 'Kardiomiopati']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 6, 'deskripsi' => 'Miokarditis']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 7, 'deskripsi' => 'Disritmia 8. Trauma']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 8, 'deskripsi' => 'Perdarahan (mis. Perdarahan gastrointestinal, rupture aorta, perdarahan intracranial)']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 9, 'deskripsi' => 'Keracunan']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 10, 'deskripsi' => 'Overdosis']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 11, 'deskripsi' => 'Tenggelam']; }
        if (isset($sdkiIds['D.0010'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0010'], 'urutan' => 12, 'deskripsi' => 'Emboli paru Resiko Penurunan Curah']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 1, 'deskripsi' => 'Gagal jantung kongestif']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 2, 'deskripsi' => 'Sindrom koroner akut']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 3, 'deskripsi' => 'Gangguan katub jantung (stenosis/regurgitasi aorta, pulmonalis, trikuspidalis, atau mitralis)']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 4, 'deskripsi' => 'Atrial/venticular septal defect']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 5, 'deskripsi' => 'Aritmia']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 6, 'deskripsi' => 'Penyakit Paru Obstruktif Kronis (PPOK)']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 7, 'deskripsi' => 'Gangguan metabolik']; }
        if (isset($sdkiIds['D.0011'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0011'], 'urutan' => 8, 'deskripsi' => 'Gangguan muskuloskeletal']; }
        if (isset($sdkiIds['D.0012'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0012'], 'urutan' => 1, 'deskripsi' => '- Aneurisma
- Koagulopati intravaskuler diseminata
- Sirosis hepatis
- Ulkus lambung
- Varises
- Trombositopenia
- Ketuban pecah sebelum waktunya
- Plasenta previa/abrubsio
- Atonia uterus
- Retensi plasenta
- Tindakan pembedahan Kanker Trauma Resiko Perfusi Gastrointestinal']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 1, 'deskripsi' => 'Varises gastroesofagus']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 2, 'deskripsi' => 'Aneurisma aorta abdomen']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 3, 'deskripsi' => 'Diabetes melitus']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 4, 'deskripsi' => 'Sirosis hepatis']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 5, 'deskripsi' => 'Pendarahan graointestinal akut']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 6, 'deskripsi' => 'Gagal jantung kongestif']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 7, 'deskripsi' => 'koagulasi intravaskuler diseminata']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 8, 'deskripsi' => 'Ulkus duodenum atau ulkus lambung']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 9, 'deskripsi' => 'Kolitis iskemik']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 10, 'deskripsi' => 'Pankreatitis iskemik']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 11, 'deskripsi' => 'Ginjal polikistik']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 12, 'deskripsi' => 'Stenosis arteri ginjal']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 13, 'deskripsi' => 'Gagal ginjal']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 14, 'deskripsi' => 'Sindroma kompartemen abdomen']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 15, 'deskripsi' => 'Trauma abdomen']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 16, 'deskripsi' => 'Anemia']; }
        if (isset($sdkiIds['D.0013'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0013'], 'urutan' => 17, 'deskripsi' => 'Pembedahan jantung Resiko Perfusi Miokard Tidak']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 1, 'deskripsi' => 'Arterosklerosis']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 2, 'deskripsi' => 'Raynauud’s disease']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 3, 'deskripsi' => 'Trombosis arteri']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 4, 'deskripsi' => 'Atritis reumatoid']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 5, 'deskripsi' => 'Leriche’s syndrome']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 6, 'deskripsi' => 'Aneurisma']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 7, 'deskripsi' => 'Buerger’s disease']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 8, 'deskripsi' => 'Varises']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 9, 'deskripsi' => 'Diabetes melitus']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 10, 'deskripsi' => 'Hipotensi']; }
        if (isset($sdkiIds['D.0015'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0015'], 'urutan' => 11, 'deskripsi' => 'Kanker Risiko Perfusi Renal Tidak']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 1, 'deskripsi' => 'Diabetes melitus']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 2, 'deskripsi' => 'Hipertensi']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 3, 'deskripsi' => 'Aterosklorosis']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 4, 'deskripsi' => 'Syok']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 5, 'deskripsi' => 'Keganasan']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 6, 'deskripsi' => 'Luka bakar']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 7, 'deskripsi' => 'Pembedahan jantung']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 8, 'deskripsi' => 'Penyakit ginjal (mis. Ginjal polikistik, stenosis artesi ginjal, gagal ginjal, glumerulonefritis, nefritis intersisial, nekrosis kortokal bilateral, polinefritis)']; }
        if (isset($sdkiIds['D.0016'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0016'], 'urutan' => 9, 'deskripsi' => 'Trauma Risiko Perfusi Serebral Tidak']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 1, 'deskripsi' => 'Stroke']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 2, 'deskripsi' => 'Cedera kepala']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 3, 'deskripsi' => 'Aterosklerotik aortik']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 4, 'deskripsi' => 'Infark miokard akut']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 5, 'deskripsi' => 'Diseksi arteri']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 6, 'deskripsi' => 'Embolisme']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 7, 'deskripsi' => 'Endokarditis infektif']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 8, 'deskripsi' => 'Fibrilasi atrium']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 9, 'deskripsi' => 'Hiperkolesterolemia']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 10, 'deskripsi' => 'Hipertensi']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 11, 'deskripsi' => 'Dilatasi kardiomiopati']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 12, 'deskripsi' => 'Koagulasi intravaskular diseminata']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 13, 'deskripsi' => 'Miksoma atrium']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 14, 'deskripsi' => 'Neoplasma otak']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 15, 'deskripsi' => 'Segmen ventrikel kiri akinetik']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 16, 'deskripsi' => 'Sindrom sick sinus']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 17, 'deskripsi' => 'Stenosis karotid']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 18, 'deskripsi' => 'Stenosis mitral']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 19, 'deskripsi' => 'Hidrosefalus']; }
        if (isset($sdkiIds['D.0017'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0017'], 'urutan' => 20, 'deskripsi' => 'Infeksi otak (mis. meningtis, ensefalitis, abses serebri)']; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'urutan' => 1, 'deskripsi' => 'Gangguan Genetik']; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'urutan' => 2, 'deskripsi' => 'Faktor keturunan']; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'urutan' => 3, 'deskripsi' => 'Hipotiroid']; }
        if (isset($sdkiIds['D.0018'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0018'], 'urutan' => 4, 'deskripsi' => 'Diabetes melitus maternal']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 1, 'deskripsi' => 'Kanker kolon']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 2, 'deskripsi' => 'Diverticulitis']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 3, 'deskripsi' => 'Iritasi usus']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 4, 'deskripsi' => 'Crohn’s disease']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 5, 'deskripsi' => 'Ulkus peptikum']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 6, 'deskripsi' => 'Gastritis']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 7, 'deskripsi' => 'Spasme kolon']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 8, 'deskripsi' => 'Kolitis ulseratif']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 9, 'deskripsi' => 'Hipertiroidisme']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 10, 'deskripsi' => 'Demam typoid']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 11, 'deskripsi' => 'Malaria']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 12, 'deskripsi' => 'Sigelosis']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 13, 'deskripsi' => 'Kolera']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 14, 'deskripsi' => 'Disentri']; }
        if (isset($sdkiIds['D.0020'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0020'], 'urutan' => 15, 'deskripsi' => 'Hepatitis']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 1, 'deskripsi' => 'Pembedahan abdomen atau usus']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 2, 'deskripsi' => 'Malnutrisi']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 3, 'deskripsi' => 'Kecemasan']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 4, 'deskripsi' => 'Kanker empedu']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 5, 'deskripsi' => 'Kolesistektomi']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 6, 'deskripsi' => 'Infeksi pencernaan']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 7, 'deskripsi' => 'Gastroesophageal reflux disease (GERD)']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 8, 'deskripsi' => 'Dialisis Paritoneal']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 9, 'deskripsi' => 'Terapi Radiasi']; }
        if (isset($sdkiIds['D.0021'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0021'], 'urutan' => 10, 'deskripsi' => 'Multiple organ disfunction syndrome']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 1, 'deskripsi' => 'Penyakit ginjal : gagal ginjak akut/kronis, sindrom nefrotik']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 2, 'deskripsi' => 'Hipoalbuminemia']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 3, 'deskripsi' => 'Gagal jantung kongestive']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 4, 'deskripsi' => 'Kelainan hormone']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 5, 'deskripsi' => 'Penyakit hati (mis serosis, asites, kanker hati)']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 6, 'deskripsi' => 'Pnyakit vena perifer (varises vena, thrombus vena, flebitis']; }
        if (isset($sdkiIds['D.0022'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0022'], 'urutan' => 7, 'deskripsi' => 'Imobilitas']; }
        if (isset($sdkiIds['D.0024'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0024'], 'urutan' => 1, 'deskripsi' => 'Neonatus']; }
        if (isset($sdkiIds['D.0024'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0024'], 'urutan' => 2, 'deskripsi' => 'Bayi prematur Kesiapan Peningkatan']; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'urutan' => 1, 'deskripsi' => 'Gagal jantung']; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'urutan' => 2, 'deskripsi' => 'Sindrom iritasi usus']; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'urutan' => 3, 'deskripsi' => 'Penyakit addison']; }
        if (isset($sdkiIds['D.0025'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0025'], 'urutan' => 4, 'deskripsi' => 'Makanan enternal atau parenteral']; }
        if (isset($sdkiIds['D.0026'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0026'], 'urutan' => 1, 'deskripsi' => 'Perilaku upaya peningkatan kesehatan Ketidakstabilan Kadar Glukosa']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'urutan' => 1, 'deskripsi' => 'Status kesehatan ibu baik']; }
        if (isset($sdkiIds['D.0028'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0028'], 'urutan' => 2, 'deskripsi' => 'Status kesehatan bayi baik Menyusui Tidak Efektif']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'urutan' => 1, 'deskripsi' => 'Gangguan genetik']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'urutan' => 2, 'deskripsi' => 'Faktor keturunan']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'urutan' => 3, 'deskripsi' => 'hipotiroid']; }
        if (isset($sdkiIds['D.0030'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0030'], 'urutan' => 4, 'deskripsi' => 'diabetes melitus maternal']; }
        if (isset($sdkiIds['D.0031'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0031'], 'urutan' => 1, 'deskripsi' => 'Gangguan genetik']; }
        if (isset($sdkiIds['D.0031'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0031'], 'urutan' => 2, 'deskripsi' => 'Hipotiroid']; }
        if (isset($sdkiIds['D.0031'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0031'], 'urutan' => 3, 'deskripsi' => 'Diabetes melitus gestasional']; }
        if (isset($sdkiIds['D.0031'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0031'], 'urutan' => 4, 'deskripsi' => 'Pola hidup kurang aktivitas']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 1, 'deskripsi' => 'Stroke']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 2, 'deskripsi' => 'Parkinson']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 3, 'deskripsi' => 'Mobius syndrome']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 4, 'deskripsi' => 'Cerebral palsy']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 5, 'deskripsi' => 'Cleft lip']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 6, 'deskripsi' => 'Cleft palate']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 7, 'deskripsi' => 'Amyotropic lateral sclerosis']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 8, 'deskripsi' => 'Kerusakan neuromuskular']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 9, 'deskripsi' => 'Luka bakar']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 10, 'deskripsi' => 'Kanker']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 11, 'deskripsi' => 'Infeksi']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 12, 'deskripsi' => 'AIDS']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 13, 'deskripsi' => 'Penyakit Crohn’s']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 14, 'deskripsi' => 'Enterokolitis']; }
        if (isset($sdkiIds['D.0032'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0032'], 'urutan' => 15, 'deskripsi' => 'Fibrosis kistik']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 1, 'deskripsi' => 'Pembedahan abdomen atau usus']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 2, 'deskripsi' => 'Malnutrisi']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 3, 'deskripsi' => 'Anemia']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 4, 'deskripsi' => 'Kecemasan']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 5, 'deskripsi' => 'Kanker empedu']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 6, 'deskripsi' => 'Kolesistektomi']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 7, 'deskripsi' => 'Infeksi pencernaan 8. Gastroesophageal Reflux Disease (GERD)']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 8, 'deskripsi' => 'Dialisis peritoneal']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 9, 'deskripsi' => 'Terapi radiasi']; }
        if (isset($sdkiIds['D.0033'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0033'], 'urutan' => 10, 'deskripsi' => 'Multiple organ dysfunction syndrome']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 1, 'deskripsi' => 'Penyakit Addison']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 2, 'deskripsi' => 'Trauma/pendarahan']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 3, 'deskripsi' => 'Luka bakar']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 4, 'deskripsi' => 'AIDS']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 5, 'deskripsi' => 'Penyakit Crohn']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 6, 'deskripsi' => 'Muntah']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 7, 'deskripsi' => 'Diare']; }
        if (isset($sdkiIds['D.0034'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0034'], 'urutan' => 8, 'deskripsi' => 'Kolitis ulseratif']; }
        if (isset($sdkiIds['D.0035'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0035'], 'urutan' => 1, 'deskripsi' => 'Neonatus']; }
        if (isset($sdkiIds['D.0035'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0035'], 'urutan' => 2, 'deskripsi' => 'Bayi prematur']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 1, 'deskripsi' => 'Gagal ginjal']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 2, 'deskripsi' => 'Anoreksia nervosa']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 3, 'deskripsi' => 'Diabetes melitus']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 4, 'deskripsi' => 'Penyakit Chron']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 5, 'deskripsi' => 'Gastrointeritis']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 6, 'deskripsi' => 'Pankreatiti']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 7, 'deskripsi' => 'Cedera kepala']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 8, 'deskripsi' => 'Kanker']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 9, 'deskripsi' => 'Trauma multipel']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 10, 'deskripsi' => 'Luka bakar']; }
        if (isset($sdkiIds['D.0037'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0037'], 'urutan' => 11, 'deskripsi' => 'Anemia sel sabit Resiko Keidakstabilan Glukosa']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 1, 'deskripsi' => '1.Diabetes 2.Ketoasidosis diabetic 3.Hipoglikemia 4.Diabetes gestasional 5.Penggunaan kortikosteroid 6.Nutrisi parenteral total (TPN) Nutrisi/Cairan mengalami darah ke yang dapat seluler . volume Respons sistemik inflamatory syndrome [SIRS])']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 2, 'deskripsi' => 'Perdarahan']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 3, 'deskripsi' => 'Trauma Multipel']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 4, 'deskripsi' => 'Pneumothoraks']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 5, 'deskripsi' => 'Infark miokard']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 6, 'deskripsi' => 'Kardiomiopati']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 7, 'deskripsi' => 'Cedera Medula spinalis']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 8, 'deskripsi' => 'Anafilaksis']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 9, 'deskripsi' => 'Sepsis']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 10, 'deskripsi' => 'Koagulasi intravaskuler diseminata']; }
        if (isset($sdkiIds['D.0038'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0038'], 'urutan' => 11, 'deskripsi' => 'Sindrom Respons inflamasi sistemik (Systemic inflamatory response syndrome [SIRS]) Keterangan Diagnosis ini ditegakkan pada kondisi gawat darurat yang dapat mengancam jiwa dan intervensi diarahkan untuk penyelamatan jiwa. Gangguan Eliminasi Urin']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'urutan' => 1, 'deskripsi' => 'Spina bifida']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'urutan' => 2, 'deskripsi' => 'Atresia ani']; }
        if (isset($sdkiIds['D.0041'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0041'], 'urutan' => 3, 'deskripsi' => 'Penyakit Hirschsprung Inkontinensia Urin Berlanjut']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 1, 'deskripsi' => 'Obesitas']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 2, 'deskripsi' => 'Kehamilan/melahirkan']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 3, 'deskripsi' => 'Monopose']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 4, 'deskripsi' => 'Infeksi saluran kemih']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 5, 'deskripsi' => 'Operasi abdomen']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 6, 'deskripsi' => 'Operasi prostat']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 7, 'deskripsi' => 'Penyakit alzheimer']; }
        if (isset($sdkiIds['D.0046'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0046'], 'urutan' => 8, 'deskripsi' => 'Cedera medula spinalis Inkontinensia Urine Urgensi']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 1, 'deskripsi' => 'Cedera medula spinalis']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 2, 'deskripsi' => 'Sklerosis multipel']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 3, 'deskripsi' => 'Kehamilan']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 4, 'deskripsi' => 'Trauma pelvis']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 5, 'deskripsi' => 'Pembedahan abdomen']; }
        if (isset($sdkiIds['D.0048'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0048'], 'urutan' => 6, 'deskripsi' => 'Penyakit prostat']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 1, 'deskripsi' => 'Lesi/cedera pada medula spinalis']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 2, 'deskripsi' => 'Spina bifida']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 3, 'deskripsi' => 'Stroke']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 4, 'deskripsi' => 'Sklerosis multipel']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 5, 'deskripsi' => 'Penyakit parkinson']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 6, 'deskripsi' => 'Demensia']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 7, 'deskripsi' => 'Hiperparatiroidisme']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 8, 'deskripsi' => 'Hipoparatiroidisme']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 9, 'deskripsi' => 'Ketidakseimbangan elektrolit']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 10, 'deskripsi' => 'Hemoroid']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 11, 'deskripsi' => 'Obesitas']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 12, 'deskripsi' => 'Pasca operasi obstruksi bowel']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 13, 'deskripsi' => 'Kehamilan']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 14, 'deskripsi' => 'Pembesaran prostat']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 15, 'deskripsi' => 'Abses rektal']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 16, 'deskripsi' => 'Fisura anorektal']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 17, 'deskripsi' => 'Striktura anorektal']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 18, 'deskripsi' => 'Prolaps rektal']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 19, 'deskripsi' => 'Ulkus rektal']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 20, 'deskripsi' => 'Rektokel']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 21, 'deskripsi' => 'Tumor']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 22, 'deskripsi' => 'Penyakit hirscprung']; }
        if (isset($sdkiIds['D.0049'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0049'], 'urutan' => 23, 'deskripsi' => 'Impaksi feses']; }
        if (isset($sdkiIds['D.0051'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0051'], 'urutan' => 1, 'deskripsi' => 'Infeksi/tumor/batu saluran kemih dan/atau ginjal']; }
        if (isset($sdkiIds['D.0051'])) { $rows[] = ['sdki_id' => $sdkiIds['D.0051'], 'urutan' => 2, 'deskripsi' => 'Gangguan sistem saraf pusat']; }
        foreach (array_chunk($rows, 100) as $chunk) { DB::table('sdki_kondisi_klinis')->insert($chunk); }

        // SDKI-SLKI relations
        $rows = [];
        if (isset($sdkiIds['D.0001'], $slkiIds['L.01001'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0001'], 'luaran_id' => $slkiIds['L.01001']]; }
        if (isset($sdkiIds['D.0002'], $slkiIds['L.01002'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0002'], 'luaran_id' => $slkiIds['L.01002']]; }
        if (isset($sdkiIds['D.0003'], $slkiIds['L.01003'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0003'], 'luaran_id' => $slkiIds['L.01003']]; }
        if (isset($sdkiIds['D.0004'], $slkiIds['L.02015'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0004'], 'luaran_id' => $slkiIds['L.02015']]; }
        if (isset($sdkiIds['D.0005'], $slkiIds['L.01004'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0005'], 'luaran_id' => $slkiIds['L.01004']]; }
        if (isset($sdkiIds['D.0006'], $slkiIds['L.01006'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0006'], 'luaran_id' => $slkiIds['L.01006']]; }
        if (isset($sdkiIds['D.0007'], $slkiIds['L.02015'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0007'], 'luaran_id' => $slkiIds['L.02015']]; }
        if (isset($sdkiIds['D.0008'], $slkiIds['L.02008'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0008'], 'luaran_id' => $slkiIds['L.02008']]; }
        if (isset($sdkiIds['D.0009'], $slkiIds['L.02015'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0009'], 'luaran_id' => $slkiIds['L.02015']]; }
        if (isset($sdkiIds['D.0010'], $slkiIds['L.02015'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0010'], 'luaran_id' => $slkiIds['L.02015']]; }
        if (isset($sdkiIds['D.0011'], $slkiIds['L.02008'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0011'], 'luaran_id' => $slkiIds['L.02008']]; }
        if (isset($sdkiIds['D.0012'], $slkiIds['L.02017'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0012'], 'luaran_id' => $slkiIds['L.02017']]; }
        if (isset($sdkiIds['D.0013'], $slkiIds['L.02010'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0013'], 'luaran_id' => $slkiIds['L.02010']]; }
        if (isset($sdkiIds['D.0014'], $slkiIds['L.02011'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0014'], 'luaran_id' => $slkiIds['L.02011']]; }
        if (isset($sdkiIds['D.0015'], $slkiIds['L.02011'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0015'], 'luaran_id' => $slkiIds['L.02011']]; }
        if (isset($sdkiIds['D.0016'], $slkiIds['L.02013'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0016'], 'luaran_id' => $slkiIds['L.02013']]; }
        if (isset($sdkiIds['D.0017'], $slkiIds['L.02014'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0017'], 'luaran_id' => $slkiIds['L.02014']]; }
        if (isset($sdkiIds['D.0018'], $slkiIds['L.03018'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0018'], 'luaran_id' => $slkiIds['L.03018']]; }
        if (isset($sdkiIds['D.0020'], $slkiIds['L.04033'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0020'], 'luaran_id' => $slkiIds['L.04033']]; }
        if (isset($sdkiIds['D.0021'], $slkiIds['L.03033'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0021'], 'luaran_id' => $slkiIds['L.03033']]; }
        if (isset($sdkiIds['D.0022'], $slkiIds['L.03020'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0022'], 'luaran_id' => $slkiIds['L.03020']]; }
        if (isset($sdkiIds['D.0024'], $slkiIds['L.14125'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0024'], 'luaran_id' => $slkiIds['L.14125']]; }
        if (isset($sdkiIds['D.0025'], $slkiIds['L.03020'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0025'], 'luaran_id' => $slkiIds['L.03020']]; }
        if (isset($sdkiIds['D.0026'], $slkiIds['L.03030'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0026'], 'luaran_id' => $slkiIds['L.03030']]; }
        if (isset($sdkiIds['D.0027'], $slkiIds['L.03022'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0027'], 'luaran_id' => $slkiIds['L.03022']]; }
        if (isset($sdkiIds['D.0028'], $slkiIds['L.03029'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0028'], 'luaran_id' => $slkiIds['L.03029']]; }
        if (isset($sdkiIds['D.0029'], $slkiIds['L.03029'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0029'], 'luaran_id' => $slkiIds['L.03029']]; }
        if (isset($sdkiIds['D.0030'], $slkiIds['L.03018'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0030'], 'luaran_id' => $slkiIds['L.03018']]; }
        if (isset($sdkiIds['D.0031'], $slkiIds['L.03018'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0031'], 'luaran_id' => $slkiIds['L.03018']]; }
        if (isset($sdkiIds['D.0032'], $slkiIds['L.03030'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0032'], 'luaran_id' => $slkiIds['L.03030']]; }
        if (isset($sdkiIds['D.0033'], $slkiIds['L.03023'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0033'], 'luaran_id' => $slkiIds['L.03023']]; }
        if (isset($sdkiIds['D.0034'], $slkiIds['L.03028'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0034'], 'luaran_id' => $slkiIds['L.03028']]; }
        if (isset($sdkiIds['D.0035'], $slkiIds['L.14125'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0035'], 'luaran_id' => $slkiIds['L.14125']]; }
        if (isset($sdkiIds['D.0036'], $slkiIds['L.03020'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0036'], 'luaran_id' => $slkiIds['L.03020']]; }
        if (isset($sdkiIds['D.0037'], $slkiIds['L.03021'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0037'], 'luaran_id' => $slkiIds['L.03021']]; }
        if (isset($sdkiIds['D.0038'], $slkiIds['L.03022'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0038'], 'luaran_id' => $slkiIds['L.03022']]; }
        if (isset($sdkiIds['D.0040'], $slkiIds['L.04034'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0040'], 'luaran_id' => $slkiIds['L.04034']]; }
        if (isset($sdkiIds['D.0042'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0042'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0043'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0043'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0044'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0044'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0045'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0045'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0046'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0046'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0047'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0047'], 'luaran_id' => $slkiIds['L.04036']]; }
        if (isset($sdkiIds['D.0049'], $slkiIds['L.04033'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0049'], 'luaran_id' => $slkiIds['L.04033']]; }
        if (isset($sdkiIds['D.0050'], $slkiIds['L.04034'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0050'], 'luaran_id' => $slkiIds['L.04034']]; }
        if (isset($sdkiIds['D.0051'], $slkiIds['L.04036'])) { $rows[] = ['diagnosa_id' => $sdkiIds['D.0051'], 'luaran_id' => $slkiIds['L.04036']]; }
        if ($rows) { DB::table('sdki_slki_relations')->insert($rows); }

        // SLKI-SIKI relations
        $rows = [];
        if (isset($slkiIds['L.01001'], $sikiIds['I.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'intervensi_id' => $sikiIds['I.01001']]; }
        if (isset($slkiIds['L.01001'], $sikiIds['I.01011'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'intervensi_id' => $sikiIds['I.01011']]; }
        if (isset($slkiIds['L.01001'], $sikiIds['I.01014'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'intervensi_id' => $sikiIds['I.01014']]; }
        if (isset($slkiIds['L.01002'], $sikiIds['I.01014'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'intervensi_id' => $sikiIds['I.01014']]; }
        if (isset($slkiIds['L.01002'], $sikiIds['I.01021'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'intervensi_id' => $sikiIds['I.01021']]; }
        if (isset($slkiIds['L.01003'], $sikiIds['I.01014'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'intervensi_id' => $sikiIds['I.01014']]; }
        if (isset($slkiIds['L.01003'], $sikiIds['I.01026'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'intervensi_id' => $sikiIds['I.01026']]; }
        if (isset($slkiIds['L.02015'], $sikiIds['I.02038'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'intervensi_id' => $sikiIds['I.02038']]; }
        if (isset($slkiIds['L.02015'], $sikiIds['I.02075'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'intervensi_id' => $sikiIds['I.02075']]; }
        if (isset($slkiIds['L.02015'], $sikiIds['I.02080'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'intervensi_id' => $sikiIds['I.02080']]; }
        if (isset($slkiIds['L.02015'], $sikiIds['I.02083'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'intervensi_id' => $sikiIds['I.02083']]; }
        if (isset($slkiIds['L.02015'], $sikiIds['I.03139'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'intervensi_id' => $sikiIds['I.03139']]; }
        if (isset($slkiIds['L.01004'], $sikiIds['I.01011'])) { $rows[] = ['luaran_id' => $slkiIds['L.01004'], 'intervensi_id' => $sikiIds['I.01011']]; }
        if (isset($slkiIds['L.01006'], $sikiIds['I.01011'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'intervensi_id' => $sikiIds['I.01011']]; }
        if (isset($slkiIds['L.01006'], $sikiIds['I.01018'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'intervensi_id' => $sikiIds['I.01018']]; }
        if (isset($slkiIds['L.01006'], $sikiIds['I.02038'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'intervensi_id' => $sikiIds['I.02038']]; }
        if (isset($slkiIds['L.02008'], $sikiIds['I.02075'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'intervensi_id' => $sikiIds['I.02075']]; }
        if (isset($slkiIds['L.02017'], $sikiIds['I.02028'])) { $rows[] = ['luaran_id' => $slkiIds['L.02017'], 'intervensi_id' => $sikiIds['I.02028']]; }
        if (isset($slkiIds['L.02017'], $sikiIds['I.02067'])) { $rows[] = ['luaran_id' => $slkiIds['L.02017'], 'intervensi_id' => $sikiIds['I.02067']]; }
        if (isset($slkiIds['L.02017'], $sikiIds['I.12379'])) { $rows[] = ['luaran_id' => $slkiIds['L.02017'], 'intervensi_id' => $sikiIds['I.12379']]; }
        if (isset($slkiIds['L.02010'], $sikiIds['I.01004'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'intervensi_id' => $sikiIds['I.01004']]; }
        if (isset($slkiIds['L.02010'], $sikiIds['I.02075'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'intervensi_id' => $sikiIds['I.02075']]; }
        if (isset($slkiIds['L.02010'], $sikiIds['I.03094'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'intervensi_id' => $sikiIds['I.03094']]; }
        if (isset($slkiIds['L.02011'], $sikiIds['I.02068'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'intervensi_id' => $sikiIds['I.02068']]; }
        if (isset($slkiIds['L.02011'], $sikiIds['I.02075'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'intervensi_id' => $sikiIds['I.02075']]; }
        if (isset($slkiIds['L.02013'], $sikiIds['I.02068'])) { $rows[] = ['luaran_id' => $slkiIds['L.02013'], 'intervensi_id' => $sikiIds['I.02068']]; }
        if (isset($slkiIds['L.02014'], $sikiIds['I.06194'])) { $rows[] = ['luaran_id' => $slkiIds['L.02014'], 'intervensi_id' => $sikiIds['I.06194']]; }
        if (isset($slkiIds['L.04033'], $sikiIds['I.03101'])) { $rows[] = ['luaran_id' => $slkiIds['L.04033'], 'intervensi_id' => $sikiIds['I.03101']]; }
        if (isset($slkiIds['L.04033'], $sikiIds['I.04151'])) { $rows[] = ['luaran_id' => $slkiIds['L.04033'], 'intervensi_id' => $sikiIds['I.04151']]; }
        if (isset($slkiIds['L.03033'], $sikiIds['I.14551'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'intervensi_id' => $sikiIds['I.14551']]; }
        if (isset($slkiIds['L.03020'], $sikiIds['I.03098'])) { $rows[] = ['luaran_id' => $slkiIds['L.03020'], 'intervensi_id' => $sikiIds['I.03098']]; }
        if (isset($slkiIds['L.03020'], $sikiIds['I.03121'])) { $rows[] = ['luaran_id' => $slkiIds['L.03020'], 'intervensi_id' => $sikiIds['I.03121']]; }
        if (isset($slkiIds['L.14125'], $sikiIds['I.03091'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'intervensi_id' => $sikiIds['I.03091']]; }
        if (isset($slkiIds['L.14125'], $sikiIds['I.03098'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'intervensi_id' => $sikiIds['I.03098']]; }
        if (isset($slkiIds['L.14125'], $sikiIds['I.03132'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'intervensi_id' => $sikiIds['I.03132']]; }
        if (isset($slkiIds['L.14125'], $sikiIds['I.10338'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'intervensi_id' => $sikiIds['I.10338']]; }
        if (isset($slkiIds['L.03030'], $sikiIds['I.03094'])) { $rows[] = ['luaran_id' => $slkiIds['L.03030'], 'intervensi_id' => $sikiIds['I.03094']]; }
        if (isset($slkiIds['L.03030'], $sikiIds['I.03115'])) { $rows[] = ['luaran_id' => $slkiIds['L.03030'], 'intervensi_id' => $sikiIds['I.03115']]; }
        if (isset($slkiIds['L.03030'], $sikiIds['I.03119'])) { $rows[] = ['luaran_id' => $slkiIds['L.03030'], 'intervensi_id' => $sikiIds['I.03119']]; }
        if (isset($slkiIds['L.03022'], $sikiIds['I.03115'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'intervensi_id' => $sikiIds['I.03115']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.03093'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.03093']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.03130'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.03130']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.03135'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.03135']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.03138'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.03138']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.12393'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.12393']]; }
        if (isset($slkiIds['L.03029'], $sikiIds['I.12397'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'intervensi_id' => $sikiIds['I.12397']]; }
        if (isset($slkiIds['L.03018'], $sikiIds['I.03094'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'intervensi_id' => $sikiIds['I.03094']]; }
        if (isset($slkiIds['L.03018'], $sikiIds['I.03097'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'intervensi_id' => $sikiIds['I.03097']]; }
        if (isset($slkiIds['L.03018'], $sikiIds['I.12365'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'intervensi_id' => $sikiIds['I.12365']]; }
        if (isset($slkiIds['L.03018'], $sikiIds['I.12369'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'intervensi_id' => $sikiIds['I.12369']]; }
        if (isset($slkiIds['L.03023'], $sikiIds['I.12369'])) { $rows[] = ['luaran_id' => $slkiIds['L.03023'], 'intervensi_id' => $sikiIds['I.12369']]; }
        if (isset($slkiIds['L.03023'], $sikiIds['I.14551'])) { $rows[] = ['luaran_id' => $slkiIds['L.03023'], 'intervensi_id' => $sikiIds['I.14551']]; }
        if (isset($slkiIds['L.03028'], $sikiIds['I.03116'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'intervensi_id' => $sikiIds['I.03116']]; }
        if (isset($slkiIds['L.04036'], $sikiIds['I.04148'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'intervensi_id' => $sikiIds['I.04148']]; }
        if (isset($slkiIds['L.04036'], $sikiIds['I.04149'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'intervensi_id' => $sikiIds['I.04149']]; }
        if (isset($slkiIds['L.04036'], $sikiIds['I.04152'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'intervensi_id' => $sikiIds['I.04152']]; }
        if (isset($slkiIds['L.04036'], $sikiIds['I.04163'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'intervensi_id' => $sikiIds['I.04163']]; }
        if (isset($slkiIds['L.04036'], $sikiIds['I.07215'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'intervensi_id' => $sikiIds['I.07215']]; }
        if (isset($slkiIds['L.04034'], $sikiIds['I.04148'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'intervensi_id' => $sikiIds['I.04148']]; }
        if ($rows) { DB::table('slki_siki_relations')->insert($rows); }

        // SLKI Kriteria Hasil
        $rows = [];
        if (isset($slkiIds['L.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'deskripsi' => 'Batuk efektif', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'deskripsi' => 'Produksi sputum', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'deskripsi' => 'Mengi', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'deskripsi' => 'Wheezing', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.01001'])) { $rows[] = ['luaran_id' => $slkiIds['L.01001'], 'deskripsi' => 'Mekonium (pada neonatus)', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Kesinkronan bantuan ventilator', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Penggunaan otot bantu napas', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Napas megap megap (gasping)', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Napas dangkal', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Agitasi', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.01002'])) { $rows[] = ['luaran_id' => $slkiIds['L.01002'], 'deskripsi' => 'Frekuensi napas nilai gas darah arteri', 'arah' => 'Membaik', 'urutan' => 6]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'Dispnea', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'Bunyi napas tambahan', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'Takikardi', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'PCO₂', 'arah' => 'Membaik', 'urutan' => 4]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'PO₂', 'arah' => 'Membaik', 'urutan' => 5]; }
        if (isset($slkiIds['L.01003'])) { $rows[] = ['luaran_id' => $slkiIds['L.01003'], 'deskripsi' => 'pH arteri', 'arah' => 'Membaik', 'urutan' => 6]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Tingkat kesadaran (5)', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Frekuensi nadi (4)', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Tekanan darah (3)', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Frekuensi napas (3)', 'arah' => 'Membaik', 'urutan' => 4]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Suhu tubuh (3)', 'arah' => 'Membaik', 'urutan' => 5]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Saturasi oksigen (3)', 'arah' => 'Membaik', 'urutan' => 6]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Gambaran EKG aritmia -3', 'arah' => 'Membaik', 'urutan' => 7]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'ETCO2 (3)', 'arah' => 'Membaik', 'urutan' => 8]; }
        if (isset($slkiIds['L.02015'])) { $rows[] = ['luaran_id' => $slkiIds['L.02015'], 'deskripsi' => 'Produksi urine (3) Curah Jantung (L.02008)', 'arah' => 'Membaik', 'urutan' => 9]; }
        if (isset($slkiIds['L.01004'])) { $rows[] = ['luaran_id' => $slkiIds['L.01004'], 'deskripsi' => 'Dispnea', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.01004'])) { $rows[] = ['luaran_id' => $slkiIds['L.01004'], 'deskripsi' => 'Penggunaan otot bantu napas', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.01004'])) { $rows[] = ['luaran_id' => $slkiIds['L.01004'], 'deskripsi' => 'Frekuensi napas dari 1 memburuk menjadi skala 5 membaik', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Tingkat kesadaran (5)', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Kemampuan menelan (5)', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Kebersihan mulut (5)', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Dispnea (4)', 'arah' => 'Membaik', 'urutan' => 4]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Kelemahan otot (4)', 'arah' => 'Membaik', 'urutan' => 5]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Akumulasi secret (4)', 'arah' => 'Membaik', 'urutan' => 6]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Wheezing (4)', 'arah' => 'Membaik', 'urutan' => 7]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Batuk (4)', 'arah' => 'Membaik', 'urutan' => 8]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Penggunaan otot aksesoris -4', 'arah' => 'Membaik', 'urutan' => 9]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Sianosis (4)', 'arah' => 'Membaik', 'urutan' => 10]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Gelisah (4)', 'arah' => 'Membaik', 'urutan' => 11]; }
        if (isset($slkiIds['L.01006'])) { $rows[] = ['luaran_id' => $slkiIds['L.01006'], 'deskripsi' => 'Frekuensi napas (4) Sirkulasi Spontan (L.02015)', 'arah' => 'Membaik', 'urutan' => 12]; }
        if (isset($slkiIds['L.02008'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'deskripsi' => 'Kekuatan nadi perifer dar skala 5 meningkat menjadi skala 1 menurun', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.02008'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'deskripsi' => 'Bradikardi', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.02008'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'deskripsi' => 'Takikardi', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.02008'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'deskripsi' => 'Ortopnea', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.02008'])) { $rows[] = ['luaran_id' => $slkiIds['L.02008'], 'deskripsi' => 'Suara jantung S3 dan S4', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Mual', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Muntah', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Nyeri dari abdomen skala 1 meningkat menjadi skala 5 menurun', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Asites', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Konstipasi', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Bising usus', 'arah' => 'Membaik', 'urutan' => 6]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Nafsu makan', 'arah' => 'Membaik', 'urutan' => 7]; }
        if (isset($slkiIds['L.02010'])) { $rows[] = ['luaran_id' => $slkiIds['L.02010'], 'deskripsi' => 'Frekuensi BAB', 'arah' => 'Membaik', 'urutan' => 8]; }
        if (isset($slkiIds['L.02011'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'deskripsi' => 'kekuatan nadi prefier', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.02011'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'deskripsi' => 'warna kulit pucat', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.02011'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'deskripsi' => 'pengisian kapiler', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.02011'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'deskripsi' => 'akral skala 1 memburuk menjadi skala 5 membaik', 'arah' => 'Membaik', 'urutan' => 4]; }
        if (isset($slkiIds['L.02011'])) { $rows[] = ['luaran_id' => $slkiIds['L.02011'], 'deskripsi' => 'turgor kulit', 'arah' => 'Membaik', 'urutan' => 5]; }
        if (isset($slkiIds['L.02013'])) { $rows[] = ['luaran_id' => $slkiIds['L.02013'], 'deskripsi' => 'Jumlah urine', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.02013'])) { $rows[] = ['luaran_id' => $slkiIds['L.02013'], 'deskripsi' => 'Tekanan arteri rata-rata', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.02013'])) { $rows[] = ['luaran_id' => $slkiIds['L.02013'], 'deskripsi' => 'Kadar urine nitrogen darah', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.02013'])) { $rows[] = ['luaran_id' => $slkiIds['L.02013'], 'deskripsi' => 'Kadar kreatinin plasma', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.03018'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'deskripsi' => 'Berat badan', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.03018'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'deskripsi' => 'Tebal lipatan kulit', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.03018'])) { $rows[] = ['luaran_id' => $slkiIds['L.03018'], 'deskripsi' => 'Indeks massa tubuh', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.04033'])) { $rows[] = ['luaran_id' => $slkiIds['L.04033'], 'deskripsi' => 'Frekuensi BAB', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.04033'])) { $rows[] = ['luaran_id' => $slkiIds['L.04033'], 'deskripsi' => 'Peristaltik usus', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Nyeri menurun', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Kram abdomen menurun', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Mual menurun', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Muntah menurun', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Regurgitasi menurun', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Distensi abdomen menurun', 'arah' => 'Meningkat', 'urutan' => 6]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Diare menurun', 'arah' => 'Meningkat', 'urutan' => 7]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Suara peristaltic menurun', 'arah' => 'Meningkat', 'urutan' => 8]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Pengosongan lambung', 'arah' => 'Meningkat', 'urutan' => 9]; }
        if (isset($slkiIds['L.03033'])) { $rows[] = ['luaran_id' => $slkiIds['L.03033'], 'deskripsi' => 'Flatus', 'arah' => 'Meningkat', 'urutan' => 10]; }
        if (isset($slkiIds['L.03020'])) { $rows[] = ['luaran_id' => $slkiIds['L.03020'], 'deskripsi' => 'Membran mukosa lembap skala 1 meningkat menjadi skala 5.', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.03020'])) { $rows[] = ['luaran_id' => $slkiIds['L.03020'], 'deskripsi' => 'Asupan makanan skala 1 meningkat menjadi skala', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03020'])) { $rows[] = ['luaran_id' => $slkiIds['L.03020'], 'deskripsi' => 'Tekanan darah', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.14125'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'deskripsi' => 'Kerusakan jaringan', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.14125'])) { $rows[] = ['luaran_id' => $slkiIds['L.14125'], 'deskripsi' => 'Kerusakan kulit', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03030'])) { $rows[] = ['luaran_id' => $slkiIds['L.03030'], 'deskripsi' => 'Porsi makan yang dihabiskan', 'arah' => 'Menurun', 'urutan' => 1]; }
        if (isset($slkiIds['L.03030'])) { $rows[] = ['luaran_id' => $slkiIds['L.03030'], 'deskripsi' => 'Berat badan', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Kadar glukosa dalam darah', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Tingkat Syok', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Kekuatan nadi menurun dimana yang awalnya skala 4 (meningkat) menjadi skala 2 (cukup menurun).', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Tingkat kesadaran Meningkat yang awalnya skala 1 (menurun) menjadi skala 3 (sedang).', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Saturasi oksigen Meningkat dengan skala awal 1 (menurun) menjadi skala 4 (cukup meningkat) Akral dingin menurun', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Pucat menurun dengan skala awal 1 (meningkat) menjadi skala 4 (cukup menurun). Eliminasi Urine (L. 04034) Setelah dilakukan intervensi keperawatan 3x 24 jam masalah terhadap eliminasi urin dapat diatasi dengan indicator :', 'arah' => 'Meningkat', 'urutan' => 6]; }
        if (isset($slkiIds['L.03022'])) { $rows[] = ['luaran_id' => $slkiIds['L.03022'], 'deskripsi' => 'Desakan berkemih (3)', 'arah' => 'Membaik', 'urutan' => 7]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Perlekatan bayi pada payudara ibu meningkat', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Kemampuan ibu memposisikan bayi dengan benar meningkat', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Tetesan/pancaran ASI meningkat', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Supai ASI adekuat meningkat', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Kepercayaan diri ibu meningkat', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Intake bayi meningkat', 'arah' => 'Meningkat', 'urutan' => 6]; }
        if (isset($slkiIds['L.03029'])) { $rows[] = ['luaran_id' => $slkiIds['L.03029'], 'deskripsi' => 'Hisapan bayi meningkat', 'arah' => 'Meningkat', 'urutan' => 7]; }
        if (isset($slkiIds['L.03023'])) { $rows[] = ['luaran_id' => $slkiIds['L.03023'], 'deskripsi' => 'Nyeri', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.03023'])) { $rows[] = ['luaran_id' => $slkiIds['L.03023'], 'deskripsi' => 'Penggunaan otot bantu napas', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03023'])) { $rows[] = ['luaran_id' => $slkiIds['L.03023'], 'deskripsi' => 'Suara Peristaltik dari 1 memburuk menjadi skala 5 membaik', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Kekuatan nadi meningkat', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Output urin meningkat', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Membran mukosa lembab meningkat', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Ortopnea menurun', 'arah' => 'Menurun', 'urutan' => 4]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Dispnea menurun', 'arah' => 'Menurun', 'urutan' => 5]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Paroxysmal nocturnal dyspnea (PND) menurun', 'arah' => 'Menurun', 'urutan' => 6]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Edema anasarka menurun', 'arah' => 'Menurun', 'urutan' => 7]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Edema perifer menurun', 'arah' => 'Menurun', 'urutan' => 8]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Frekuensi nadi membaik', 'arah' => 'Membaik', 'urutan' => 9]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Tekanan darah membaik', 'arah' => 'Membaik', 'urutan' => 10]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Turgor kulit membaik', 'arah' => 'Membaik', 'urutan' => 11]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Jugular venous pressure (JVP) membaik', 'arah' => 'Membaik', 'urutan' => 12]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Hemoglobin membaik', 'arah' => 'Membaik', 'urutan' => 13]; }
        if (isset($slkiIds['L.03028'])) { $rows[] = ['luaran_id' => $slkiIds['L.03028'], 'deskripsi' => 'Hematokrit membaik', 'arah' => 'Membaik', 'urutan' => 14]; }
        if (isset($slkiIds['L.03021'])) { $rows[] = ['luaran_id' => $slkiIds['L.03021'], 'deskripsi' => 'Serum natrium', 'arah' => 'Membaik', 'urutan' => 1]; }
        if (isset($slkiIds['L.03021'])) { $rows[] = ['luaran_id' => $slkiIds['L.03021'], 'deskripsi' => 'Serum kalium', 'arah' => 'Membaik', 'urutan' => 2]; }
        if (isset($slkiIds['L.03021'])) { $rows[] = ['luaran_id' => $slkiIds['L.03021'], 'deskripsi' => 'Serum klorida', 'arah' => 'Membaik', 'urutan' => 3]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Sensasi berkemih', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Desakan berkemih (urgensi)', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Distensi kandung kemih', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Berkemih tidak tuntas (hesitancy)', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Volume residu urine', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Urine menetes (dribbling)', 'arah' => 'Meningkat', 'urutan' => 6]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Nokturia', 'arah' => 'Meningkat', 'urutan' => 7]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Mengompol', 'arah' => 'Meningkat', 'urutan' => 8]; }
        if (isset($slkiIds['L.04034'])) { $rows[] = ['luaran_id' => $slkiIds['L.04034'], 'deskripsi' => 'Enuresis', 'arah' => 'Meningkat', 'urutan' => 9]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Kemampuan mengontrol pengeluaran urine', 'arah' => 'Meningkat', 'urutan' => 1]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Nokturia', 'arah' => 'Meningkat', 'urutan' => 2]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Residu volume urine setelah BAK', 'arah' => 'Meningkat', 'urutan' => 3]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Distensi kandung kemih', 'arah' => 'Meningkat', 'urutan' => 4]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Dribbling', 'arah' => 'Meningkat', 'urutan' => 5]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Hesitancy', 'arah' => 'Meningkat', 'urutan' => 6]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Enuresis', 'arah' => 'Meningkat', 'urutan' => 7]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Kemampuan menunda pengeluaran urine', 'arah' => 'Membaik', 'urutan' => 8]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Frekuensi BAK', 'arah' => 'Membaik', 'urutan' => 9]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Sensasi BAK', 'arah' => 'Membaik', 'urutan' => 10]; }
        if (isset($slkiIds['L.04036'])) { $rows[] = ['luaran_id' => $slkiIds['L.04036'], 'deskripsi' => 'Eliminsi Fekal Definisi :', 'arah' => 'Membaik', 'urutan' => 11]; }
        foreach (array_chunk($rows, 100) as $chunk) { DB::table('slki_kriteria_hasil')->insert($chunk); }

        // SIKI Tindakan
        $rows = [];
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kemampuan batuk']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor adanya retensi skutum']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor adanya gejala infeksi saluran nafas']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor input dan output cairan (mis. Jumlah dan karakteristik)']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Atur posisi semi-Fowler atau fowler']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Pasang perlak dan bengkok di pangkuan pasien']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Buang sekret pada tempat sputum']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan tujuan dan prosedur batuk efektif']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan tarik napas dalam melalui hidung selama 4 detik di tahan sampai 2 detik, kemudian keluarkan dari mulut dengan bibir mencucu (dibulatkan) selama 8 detik']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan mengulangi tarik napas dalam hingga 3 detik']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Anjurkan batuk dengan kuat langsung setelah tarik napas dalam yang ke-3']; }
        if (isset($sikiIds['I.01001'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01001'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian mukolitik atau ekspektoran, jika perlu Manajemen Jalan Napas']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor pola napas (frekuensi, kedalaman, usaha napas)']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor bunyi napas tambahan (mis.gurgling, mengi,wheezing, ronkhi kering)']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor sputum (jumlah, warna, aroma)']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Pertahankan kepatenan jalan napas dengan head-tilt dan chin-lift (jaw-thrust jika curiga trauma survikal)']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Posisikan semi-fowler atau fowler']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan minuman hangat']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Lakukan fisioterapi dada, jika perlu']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Berikan oksigen, jika perlu']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkn asupan cairan 2000 ml/hari, jika tidak kontraindikasi']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Ajarkan teknik batuk efektif']; }
        if (isset($sikiIds['I.01011'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01011'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian bronkodilator , ekspektoran, mukolitik, jika perlu']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor frekuensi, irama, kedalaman dan upaya napas']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor pola napas (seperti bradypnea, takipnea, hiperventilasi, kussmaul, Cheyne-stokes, biot, ataksik)']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor kemampuan batuk efektif']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor adanya produksi sputum']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Monitor adanya sumbatan jalan napas']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Palpasi kesimetrisan ekspansi paru']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Auskultasi bunyi napas']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Monitor saturasi oksigen']; }
        if (isset($sikiIds['I.01014'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01014'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Monitor nilai AGD Penyapihan Ventilasi']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Posisikan pasien semi fowler (30-45 derajat)']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Lakukan pengisapan jalan napas,jika perlu']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan fisioterapi dada,jika perlu']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Lakukan uji coba penyapihan (30-120 menit dengan napas spontan yang dibantu ventilator)']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Gunakan teknik relaksasi,jika perlu']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Hindari pemberian sedasi farmakologis selama percobaan penyapihan']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Berikan dukungan psikologis']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'I. Ajarkan cara pengontrolan napas saat penyapihan']; }
        if (isset($sikiIds['I.01021'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01021'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian obat yang meningkatkan kepatenan jalan napas dan pertukaran gas Pemantauan Respirasi']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Bersihkan sekret pada mulut, hidung dan trakea, jika perlu']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Pertahankan kepatenan jalan napas']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Siapkan dan atur peralatan pemberian oksigen']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Berikan oksigen tambahan, jika perlu']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Tetap berikan oksigen saat pasien ditransportasi']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Gunakan perangkat oksigen yang sesuai dengan tingkat mobilitas pasien']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Ajarkan pasien dan keluarga cara menggunakan oksigen di rumah']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi penentuan dosis oksigen']; }
        if (isset($sikiIds['I.01026'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01026'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Kolaborasi penggunaan oksigen saat aktivitas dan/atau tidur Manajemen Defibrilasi']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Memeriksa irama pada monitor setelah RJP 2 menit']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Melakukan resusitasi jantung paru (RJP) hingga mesin defibrillator siap']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Menyiapkan dan menghidupkan mesin defibrilator']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Memasang monitor EKG']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Memastikan irama EKG henti jantung (VF atau VT tanpa nadi)']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Mengatur jumlah energi dengan mode Asynchronized (360 joule untuk monopasi dan 120- 200 joule untu bifasik)']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Mengangkat paddle dari mesin dan oleskan jelli pada paddle']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Menempelkan paddle sternum (kanan) pada sisi kanan sternum dibawah klavikula dan paddle apeks (kiri) pada garis midaksilaris setinggi elektroda V6']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Mengisi energi dengan menekan tombol charger pada paddle atau tombol charger pada mesin defibrilator dan menunggu hingga energi yang diinginkan tercapai']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Menghentikan RJP saat defibrillator siap']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 10, 'deskripsi' => 'Meneriakkan bahwa defibrilator telah siap (mis. ”I’m clear, you’re clear, everybody’s clear”)']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 11, 'deskripsi' => 'Memberikan shock dengan menekan tombol pada kedua paddle bersamaan']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 12, 'deskripsi' => 'Angkat paddle dan langsung lanjutkan RJP tanpa menunggu hasil irama yang muncul pada monitor setelah pemberian defibrilasi']; }
        if (isset($sikiIds['I.02038'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02038'], 'jenis' => 'Terapeutik', 'urutan' => 13, 'deskripsi' => 'Melanjutkan RJP sampai 2 menit']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Mengidentifikasi kelas syok untuk estimasi kehilangan darah']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Memonitor status hemodinamik']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Memonitor status oksigen']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Memonitor kelebihan cairan']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Memonitor output cairan tubuh (mis. Urine, cairan nasogastrik, cairan selang dada)']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Memonitor nilai BUN, kreatinin, protein total, dan albumin, jika perlu']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Memonitor tanda dan gejala edema paru Teraputik']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Memasang jalur IV berukuran besar (mis. Nomor 14-16)']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Memberikan infus cairan kristaloid 1-2 liter pada dewasa']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Memberikan infus cairan kristaloid 20mL/kgBB pada anak']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Observasi', 'urutan' => 11, 'deskripsi' => 'Melakukan kross matching produk darah']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Berkolaborasi dalam menentukan jenis dan jumlah cairan (mis. Kristaloid, koloid)']; }
        if (isset($sikiIds['I.03139'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03139'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Berkolaborasi dalam memberikan produk darah Resusitasi Jantung Paru']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Mengidentifikasi keamanan penolong, lingkungan dan pasien']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Mengidentifikasi respon pasien (mis. Memanggil pasien, menepuk bahu pasien)']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Memonitor nadi karotis dan napas setiap 2 menit atau 5 siklus RJP']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Memakai alat pelindung diri']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Mengaktifkan emergency medical system atau berteriak meminta tolong']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Memposisikan pasien terlentang di tempat datar dan keras']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Mengatur posisi penolong berlutut di samping korban']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Meraba nadi karotis dalam waktu <10 detik']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Memberikan rescue breathing jika di temukan ada nadi tetapi tidak ada nafas']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Mengkompres dada 30 kali di kombinasikan dengan bantuan napas (ventilasi) 2 kali jika ditemukan tidak ada nadi dan tidak ada napas']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Mengkompres dengan tumit telapak tangan menepuk diatas telapak tangan yang lain tegak lurus pada pertengahan dada (seperdua bawah sternum)']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Mengkompres dengan kedalaman kompres 5-6 cm dengan kecepatan 100-120 kali per menit']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 10, 'deskripsi' => 'Membersihkan dan membuka jalan nafas dengan head tilt-chin lift atau jaw thurst (jika curiga cedera servikal)']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 11, 'deskripsi' => 'Memberikan bantuan nafas dengan menggunakan Bag Valve mask dengan teknik EC-Clamp']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 12, 'deskripsi' => 'Mengkombinasikan kompresi dan ventilasi selama 2 menit atau sebanyak 5 siklus']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Terapeutik', 'urutan' => 13, 'deskripsi' => 'Menghentikan RJP jika ditemukan adanya tandatanda kehidupan, penolong yang lebih mahir datang, ditemukan adanya tandatanda kematian biologis, Do Not Resusitation (DNR)']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Menjelaskan tujuan dan prosedur tindakan kepada keluarga atau pengantar pasien']; }
        if (isset($sikiIds['I.02083'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02083'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Mengkolaborasikan tim medis untuk bantuan hidup lanjut. Manajemen Jalan Napas']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor tingkat kesadaran, batuk, muntah dan kemampuan menelan']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor status pernapasan']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor bunyi napas terutama setelah makan/minum']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Periksa residu gaster sebelum memberi asupan oral']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Periksa kepatenan selang nasogastric sebelum memberi asupan oral']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Posisikan semi fowler (30- 45 derajat) 30 menit sebelum memberi asupan oral']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Pertahankan posisi semi fowler pada pasien']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Pertahankan kepatenan jalan napas (mis. Teknik head tilt chin lift, jaw thrust, in line)']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Perhatikan pengembangan balon endotracheal tube (ETT)']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Lakukan penghisapan jalan napas, jika produksi secret meningkat']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Sediakan suction di ruangan']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Hindari memberi makan melalui selang gastrointestinal, jika residu banyak']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Berikan makanan dengan ukuran kecil atau lunak']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Berikan obat oral dalam bentuk cair']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkan makan secara perlahan']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Ajarkan strategi mencegah aspirasi']; }
        if (isset($sikiIds['I.01018'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01018'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Ajarkan Teknik mengunyah atau menelan, jika perlu']; }
        if (isset($sikiIds['I.02067'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02067'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => '- Pertahankan bed rest selama perdarahan
- Batasi tindakan invasive, jika perlu
- Hindari pengukuran suhu rektal']; }
        if (isset($sikiIds['I.02067'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02067'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => '- Jelaskan tanda dan gejala perdarahan
- Anjurkan meningkatkan asupan cairan untuk menghindari konstipasi
- Anjurkan menghindari aspirin atau antikoagulan
- Anjurkan meningkatkan asupan makanan dan vitamin K
- Anjurkan segera melapor jika terjadi perdarahan Kolaborasi
- Kolaborasi pemberian obat pengontrol perdarahan, jika perlu
- Kolaborasi pemberian produk darah, jika perlu']; }
        if (isset($sikiIds['I.02028'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02028'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => '- Jelaskan tujuan dan prosedur balut tekan
- Anjurkan membatasi gerak pada area cidera Edukasi keamanan anak (I. 12378)']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi penyebab pendarahan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Periksa adanya darah pada muntah, sputum, feses, urine, pengeluaran NGT dan drainase luka, jika perlu']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Periksa ukuran dan karakteristik, jika ada']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor terjadinya perdarahan (sifat dan jumlah)']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Monitor nilai hemoglobin dan hematokrit sebelum dan setelah kehilangan darah']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Monitor tekanan darah dan parameter hemodinamik (tekanan vena sentral dan tekanan baji kapiler atau arteri pulmonal), jika ada']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Monitor intake dan output cairan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Monitor koagulasi darah (protrombin time(PT), partial thromboplastin time (PTT),fibrinogen,degradasi fibrin,dan jumlah trombosit), jika ada']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Monitor deliveri oksigen jaringan (mis. PaO2, SaO2, hemoglobin, dan curah jantung)']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Monitor tanda dan gejala perdarahan masif']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Istirahatkan area yang mengalami perdarahan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Berikan kompres dingin, jika perlu']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Lakukan penekanan atau balut tekan, jika perlu']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Tinggikan ekstremitas yang mengalami perdarahan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Pertahankan akses IV']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan tanda-tanda perdarahan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan melapor jika menemukan tanda-tanda perdarahan']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan membatasi aktivitas']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian cairan, jika perlu']; }
        if (isset($sikiIds['I.01004'])) { $rows[] = ['intervensi_id' => $sikiIds['I.01004'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Kolaborasi pemberian transfusi darah, jika perlu']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kebiasaan makan dan perilaku makan yang akan diubah']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Identifikasi kemajuan modifikasi diet secara regular']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor intake dan output cairan, nilai hemoglobin, tekanan darah, kenaikan berat badan, dan kebiasaan membeli makanan']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Bina hubungan terapeutik']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Sepakati lama waktu pemberian konseling']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Tetapkan tujuan jangka pendek dan jangka Panjang yang realistis']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Gunakan standar nutrisi sesuai program diet dalam mengevaluasi kecukupan asupan makanan']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Pertimbangkan faktor-faktor yang mempengaruhi pemenuhan kebutuhan gizi (mis. Usia, tahap pertumbuhan dan perkembangan, penyakit)']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Informasikan perlunya modifikasi diet (misal: penurunan atau penambahan berat badan, pembatasan natrium atau cairan, pengurangan kolesterol']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Jelaskan program gizi dan persepsi pasien terhadap diet yang diprogramkan']; }
        if (isset($sikiIds['I.03094'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03094'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Rujuk pada ahli gizi, jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => '1.Identifikasi penyebab peningkatan TIK (mis. lesi, gangguan metabolisme, edema serebral) 2.Monitor tanda/gejala peningkatan TIK (mis. tekanan darah meningkat, tekanan nadi melebar, bradirkardia, pola napas iregular, kesadaran menurun) 3.Monitor MAP (Mean Arterial Pressure) 4.Monitor CVP (Central Venous Pressure), jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor PAWP, jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor PAP, jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor ICP (Intra Cranial Pressure), jika tersedia']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Monitor CCP (Cerebral Perfusion Pressure)']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Monitor gelombang ICP']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Monitor status pernapasan']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Monitor intake dan output cairan']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Monitor cairan serebrospinalis (mis. warna, konsistensi)']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Minimalkan stimulus dengan menyediakan lingkungan yang tenang']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Berikan posisi semi Fowler']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Hindari manuver Valsava']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Cegah terjadinya kejang']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Hindari penggunaan PEEP']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Hindari penggunaan cairan IV hipotonik 7.Atur ventilator agar PaCO2 optimal 8.Pertahankan suhu tubuh normal']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian sedasi dan anti konvulsan, jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Kolaborasi pemberian diuretik osmosis, jika perlu']; }
        if (isset($sikiIds['I.06194'])) { $rows[] = ['intervensi_id' => $sikiIds['I.06194'], 'jenis' => 'Kolaborasi', 'urutan' => 3, 'deskripsi' => 'Kolaborasi pemberian pelunak tinja, jika perlu']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi penyebab diare (mis. Inflamasi gastrointestinal, iritasi gastrointestinal, proses infeksi, malabsorpsi, ansietas, stress, efek obatobatan, pemberian botol susu)']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Identifikasi riwayat pemberian makanan']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Identifikasi gejala invaginasi (mis.tangisan keras, kepucatan pada bayi)']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor warna,volume,frekuen si,dan konsistensi tinja']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Monitor tanda dan gejala hypovolemia (mis. takikardia, nadi teraba lemah, tekanan darah turun, turgor kulit turun, mukosa mulut kering, CRT melambat, BB menurun).']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Monitor iritasi dan ulserasi kulit di daerah perianal']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Monitor jumlah pengeluaran diare']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Monitor keamanan dan penyiapan makanan']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Berikan asupan cairan oral (mis.larutan garam gula, oralit, Pedialyte, renalyte']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Pasang jalur intravena']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan cairan intravena (mis. ringer asetat, ringer laktat), jika perlu']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Ambil sampel darah untuk pemeriksaan darah lengkap dan elektrolit']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Ambil sampel feses untuk kultur,jika perlu']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkan makanan porsi kecil dan sering secara bertahap']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan menghindari makanan pembentuk gas, pedas dan mengandung laktosa']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan melanjutkan pemberian asi']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian obat antimotilitas (mis. loperamide,difenoksilat)']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Kolaborasi pemberian obat anti spasmodic / spasmolitis (mis papaverine ekstak belladonna mebeverine)']; }
        if (isset($sikiIds['I.03101'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03101'], 'jenis' => 'Kolaborasi', 'urutan' => 3, 'deskripsi' => 'Kolaborasi pemberian obat pengeras feses (mis. atapulgit, smektif, kaolin-pektin']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi pasien-pasien yang mengalami penyakit infeksi menular']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Terapikan kewaspadaan universal misalnya cuci tangan aseptic, gunakan alat pelindung diri seperti masker, sarung tangan, pelindung wajah, pelindung mata, aspron, sepatu bot sesuai model transmisi mikroorganisme']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Tempatkan pada ruang isolasi bertekanan positif untuk pasien yang mengalami penurunan imunitas']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Tempatkan pada ruang isolasi bertekan negative untuk pasien dengan resiko penyebaran inveksi via droplet atau udara']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Streriliasai dan desinfeksi alat-alat, furniture, lantai, sesuai kebutuhan']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Gunakan hepafilter pada area khusus misalnya kamar operasi']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Berika tanda khusus untuk pasien dengan penyakit menular Edukasi :']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Ajarkan cara mencuci tangan dengan benar']; }
        if (isset($sikiIds['I.14551'])) { $rows[] = ['intervensi_id' => $sikiIds['I.14551'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Ajarkan etika batuk/bersin Manajemen Hipervolemia l.03114)']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor frekuensi dan kekuatan nadi']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor frekuensi napas']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Monitor tekanan darah']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Monitor berat badan']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Monitor waktu pengisian kapiler']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Monitor elastisistas atau turgor kulit']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Monitor jumlah, warna, dan berat jenis urine']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Monitor kadar albumin dan protein total']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Monitor hasil periksaan serum mis osmolaritas serum, hemtokrit, natrium, kalium, BUN']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Monitor intake dan output cairan']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 11, 'deskripsi' => 'Identifikasi tanda-tanda hypovolemia mis. frekuensi nadi meningkat, nadi etraba lemah, tekanan darah menurun, tekanan nadi menyempit, turgor kulit mrnurun, membrane mukosa kering, volume urine menurun, hematokrtit meningkat, haus, lemah, konsentrasi urine meningkat, BB menurun dalam waktu singkat']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 12, 'deskripsi' => 'Identifikais tanda-tanda hypervolemia mis. dispnea, edema perifer, edema anasarca, JPV CPV meningkat, reflex hepatojugular positif, BB menurun dalam aktu singkat']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Observasi', 'urutan' => 13, 'deskripsi' => 'Identifikasi factor resiko ketidakseimbangan cairan mis. prosedur pembedahan mayor, trauma pendarahan, luka bakar, apheresis, obstruksi intestinal, peradangan pancreas, penyakit ginjal dan kelenjar, disfungsi intestinal']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Atur interval waktu pemantauan sesuai dengan kondisi pasien']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Dokumentasikan hasil pemantauan Edukasi :']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Jelaskan tujuan dan prosedur pemantauan']; }
        if (isset($sikiIds['I.03121'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03121'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Informasikan hasil pemantauan jika perlu']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Periksa tanda dan gejala hipovolemia (mis. Frekuensi nadi meningkat, nadi teraba lemah, tekanan darah menurun, tekanan nadi menyempit, turgor kulit menurun, membran mukosa kering, volume urin menurun, hematokrit meningkatkan, haus, lemah)']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor intake dan ouput cairan Terapeutik :']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Hitung kebutuhan cairan']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Berikan posisi modified trendelenbung Edukasi :']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Anjurkan memperbanyak asupan cairan oral']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan menghindari perubahan posisi mendadak Kolaborasi :']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Kolaborasi pemberian cairan IV isotonis (mis. NaCl, RL)']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Kolaborasi pemberian produk darah haluaran,turgor kulit, CRT) Terapeutik :']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Lakukan penekanan langsung pada pendarahan eksternal']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Berikan posisi syok']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 11, 'deskripsi' => 'Ambil sampel darah untuk pemeriksaan darah lengkap dan elektrolit Kolaborasi :']; }
        if (isset($sikiIds['I.003116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.003116'], 'jenis' => 'Observasi', 'urutan' => 12, 'deskripsi' => 'Kolaborasi pemberian transfusi darah, jika perlu Manejemen pendarahan pervaginam pascapersalinan']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'identifikasi penyebab kehilangan darah (mis. Atonima uteri atau robekan jalan lahir)']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'identifikasi keluhan ibu (mis. Keluar banyak darah, pusing, pandangan kabur)']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'monitor resiko terjadinya perdarahan']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'monitor jumlah kehilangan darah Terapeutik :']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'lakukan penekana pada area perdarahan, jika perlu Kolaborasi :']; }
        if (isset($sikiIds['I.02045'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02045'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Kolaborasi pemberian transfusi darah, jika perlu Manejemen pendarahan antepartum dipertahankan']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi riwayat kehilangan darah (mis. Jumlah, nyeri, dan adanya bekuan darah)']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Identifikasi penyebab perdarahan']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Identifikasi riwayat yang berhubungan dengan perdarahan kehamilan awal']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Periksa vagina untuk menilai jumlah, konsisten, dan bau perdarahan']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Periksa kontraksi uterus atau peningkatan kekuatan tonus otot uterus']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Monitor tanda vital ibu berdasarkan kehilangan darah']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Monitor intake dan output cairan Terapeutik :']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Posisikan ekstremitas bawah lebih tinggi Edukasi :']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Anjurkan tirah baring hingga perdarahan berhenti']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Anjurkan menurunkan resiko perdarahan (mis.pembatasan merokok, tidak berhubungan seksual, tirah baring, manajemen konstipasi)']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 11, 'deskripsi' => 'Ajarkan cara mengendali pendarahan lama dan baru Kolaborasi :']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 12, 'deskripsi' => 'Kolaborasi pemberian cairan, jika perlu']; }
        if (isset($sikiIds['I.02042'])) { $rows[] = ['intervensi_id' => $sikiIds['I.02042'], 'jenis' => 'Observasi', 'urutan' => 13, 'deskripsi' => 'Kolaborasi pemberian transfusi darah, jika perlu']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor TTV bayi (terutama suhu 36,5 – 37,5 derajat Celcius']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Mandikan bayi denga suhu ruangan 21-24 derajat celcius']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Mandikan bayi dalam waktu 5-10 menit dan 2 kali dalam sehari']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Rawat tali pusat secara terbuka tali pusat tidak dibungkus apapun']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Bersihkan pangkal tali pusat lidi kapas yang telah diberi air matang']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Kenakan popok bayi di bawah umbilicus jika tali pusat belum terlepas']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Lakukan pemijatan bayi']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Ganti popok bayi jika basah']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Kenakan pakaian bayi dari bahan katun Edukasi :']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Anjurkan ibu menyusui sesuai kebutuhan bayi']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 10, 'deskripsi' => 'Ajarkan ibu cara merawat bayi dirumah']; }
        if (isset($sikiIds['I.10338'])) { $rows[] = ['intervensi_id' => $sikiIds['I.10338'], 'jenis' => 'Terapeutik', 'urutan' => 11, 'deskripsi' => 'Ajarkan cara pemberian makanana pendamping ASI pada bayi >6 bulan']; }
        if (isset($sikiIds['I.03093'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03093'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Gunakan teknik mendengar aktif (mis. duduk sama tinggi, dengarkan permasalahan ibu)']; }
        if (isset($sikiIds['I.03093'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03093'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Berikan pujian terhadap perilaku ibu yang benar']; }
        if (isset($sikiIds['I.03093'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03093'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Ajarkan teknik menyusui yang tepat sesuai kebutuhan ibu Promosi ASI Eksklusif']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Fasilitasi ibu melakukan IMD (inisiasi menyusu dini)']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Fasilitasi ibu untuk rawat gabung atau rooming in']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Gunakan sendok dan cangkir jika bayi belum bisa menyusu']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Dukung ibu menyusui dengan mendampingi ibu selama kegiatan menyusui berlangsung']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Diskusikan dengan keluarga tentang ASI eksklusif']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Siapkan kelas menyusui pada masa prenatal minimal 2 kali dan periode pascapartum minimal 4 kali']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan manfaat menyusui bagi ibu dan bayi']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Jelaskan pentingnya menyusui di malam hari untuk mempertahankan dan meningkatkan produksi ASI']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Jelaskan tanda-tanda bayi cukup ASI (Mis. berat badan meningkat, BAK lebih dari 10 kali/hari, warna urine tidak pekat)']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Jelaskan manfaat rawat gabung (rooming in)']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Anjurkan ibu menyusui sesegera mungkin setelah melahirkan']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan ibu memberikan nutrisi kepada bayi hanya dengan ASI']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 7, 'deskripsi' => 'Anjurkan ibu menyusui sesering mungkin setelah lahir sesuai kebutuhan bayi']; }
        if (isset($sikiIds['I.03135'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03135'], 'jenis' => 'Edukasi', 'urutan' => 8, 'deskripsi' => 'Anjurkan ibu menjaga produksi ASI dengan memerah, walaupun kondisi ibu atau bayi terpisah Promosi Laktasi']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kebutuhan laktasi bagi ibu dan bayi']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Fasilitasi ibu saat melakukan IMD']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Fasilitasi ibu untuk rawat gabung atau rooming in']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Gunakan sendok dan cangkir saat bayi belum bisa menyusu']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Dampingi ibu selama kegiatan menyusui berlangsung, jika perlu']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan pentingnya menyusui sampai 2 tahun']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Jelaskan manfaat rawat gabung rooming in']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan menyusui minimal 2 kali selama hamil dan setelah melahirkan 3-4 kali']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Adakan kelas edukasi tentang manfaat dan posisi menyusui pada masa prenatal dan periode postpartum']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Anjurkan ibu menjaga produksi ASI dengan memerah ASI']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan ibu untuk memeberikan nutrisi kepada bayi hanya dengan ASI eksklusif selama 6 bulan dan dianjurkan sampai 2 tahun']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 7, 'deskripsi' => 'Anjurkan ibu memberi makanan pendamping ASI setelah 6 bulan']; }
        if (isset($sikiIds['I.03138'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03138'], 'jenis' => 'Edukasi', 'urutan' => 8, 'deskripsi' => 'Anjurkan ibu menyusui sesering mungkin segera setelah lahir sesuai kebutuhan bayi']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Monitor kemampuan ibu menyusui']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor kemampuan bayi menyusu']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Damping ibu selama kegiatan menyusui berlangsung']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Dukung ibu meningkatkan kepercayaan diri untuk menyusui dengan menggunakan boneka saat membantu ibu memposisikan bayinya']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan ibu pujian, informasi dan saran terhadap perilaku positif dalam menyusui']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Diskusikan masalah selama menyusui (mis. nyeri, bengkak payudara, lecet pada putting dan mencari solusinya) Edukasi :']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Ajarkan ibu mengenali tanda- tanda bayi siap menyusu (mis. bayi mencari putting, keluar saliva, memasukan jari ke dalam mulutnya dan bayi menangis)']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Ajarkan ibu mengeluarkan ASI untuk diolesi pada putting sebelum dan sesudah menyusui, agar kelenturan putting tetap terjaga']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Ajarkan ibu mengarahkan mulut bayi dari arah bawah kearah putting ibu']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Ajarkan posisi menyusui (mis. cross cradle, cradle, foot ball dan posisi berbaring yang diikuti dengan perlekatan yang benar']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Ajarkan perlekatan yang benar : perut ibu dan bayi berhadapan, tangan-kaki bayi satu garis lurus, mulut bayi terbuka lebar dan dagu bayi menempel pada payudara ibu untuk menghindari lecet pada putting bayudara']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 10, 'deskripsi' => 'Ajarkan memerah ASI dengan posisi jari jam 12-6 dan jam 9- 3']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 11, 'deskripsi' => 'Informasikan ibu untuk menyusui pada saat payudara sampai bayi melepas sendiri putting ibu']; }
        if (isset($sikiIds['I.03130'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03130'], 'jenis' => 'Terapeutik', 'urutan' => 12, 'deskripsi' => 'Informasikan ibu untuk selalu mengosongkan payudara pada payudara yang belum disusui dengan memerah ASI']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kesiapan dan kemampuan ibu atau pengasuh menerima informasi']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Identifikasi kemampuan ibu atau pengasuh menyediakan nutrisi']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Sediakan materi dan media pendidikan kesehatan']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Jadwalkan pendidikan kesehatan sesuai kesepakatan']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan kesempatan kepada ibu atau pengasuh untuk bertanya']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan tanda-tanda awal rasa lapar (mis. bayi gelisah, membuka mulut dan menggeleng-gelengkan kepala, menjulur-julur lidah, mengisap jari atau tangan)']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan menghindari pemberian pemanis buatan']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Ajarkan perilaku hidup bersih dan sehat (PHBS) (mis. cuci tangan sebelum dan sesudah makan, cuci tangan dengan sabun setelah ke toilet)']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Ajarkan cara memilih makanan sesuai dengan usia bayi']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Ajarkan cara mengatur frekuensi makan sesuai usia bayi']; }
        if (isset($sikiIds['I.12397'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12397'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan tetap memberikan ASI saat bayi sakit']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kondisi kesehatan pasien yang dapat mempengaruhi berat badan Terapeutik']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Hitung berat badan ideal pasien']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Hitung presentase lemak dan otot pasien']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Fasilitasi menentukan target berat badan yang realistis']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan hubungan antara asupan makanan, aktivitas fisik, penambahan berat badan dan penurunan berat badan']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Jelaskan faktor resiko berat badan lebih dan berat badan kurang']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan mencatat berat badan setiap minggu, jika perlu']; }
        if (isset($sikiIds['I.03097'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03097'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Anjurkan untuk melakukan pencatatan asupan makan, aktivitas fisik dan perubahan berat badan Edukasi Berat Badan Efektif']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Sediakan materi dan media edukasi']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Jadwalkan pendidikan kesehatan sesuai kesepakatan']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Beri kesempatan pada keluarga untuk bertanya']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan hubungan asupan makanan, latihan, peningkatan dan penurunan berat badan']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Jelaskan kondisi medis yang dapat mempengaruhi berat badan']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Jelaskan risiko kondisi kegemukan (overweight) dan kurus (underweight)']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Jelaskan kebiasaan, tradisi, dan budaya, serta faktor genetik yang mempengaruhi berat badan']; }
        if (isset($sikiIds['I.12365'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12365'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Ajarkan cara mengelola berat badan secara efektif']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Mengidentifikasi kemampuan pasien dan keluarga menerima informasi']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Mengidentifikasi tingkat pengetahuan saat ini']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Mengidentifikasi kebiasaan pola makan saat ini dan masa lalu']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Mengidentifikasi persepsi pasien dan keluarga tentang diet yang diprogramkan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Mengidentifikasi keterbatasan finansial untuk menyediakan makanan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Mempersiapkan materi,media dan alat peraga']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Menjadwalkan waktu yang tepat umtuk memberikan pendidikan kesehatan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Memberikan kesempatan pasien dan keluarga bertanya']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Menyediakan rencana makan tertulis,jika perlu']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Menjelaskan tujuan kepatuhan diet terhadap kesehatan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Menginformasikan makanan yang diperbolehkan dan dilarang']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Menginformasikan kemungkinan interaksi obat dan makanan, jika perlu']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Menganjurkan mempertahankan posisi semi fowler (30 – 45 derajat) 20-30 menit setelah makan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Menganjurkan mengganti bahan makanan sesuai dengan diet yang diprogramkan']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Menganjurkan melakukan olahraga sesuai toleransi']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 7, 'deskripsi' => 'Mengajarkan cara membaca label dan memilih makanan yang sesuai program']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Edukasi', 'urutan' => 8, 'deskripsi' => 'Merekomendasikan resep makanan yang sesuai dengan diet, jika perlu']; }
        if (isset($sikiIds['I.12369'])) { $rows[] = ['intervensi_id' => $sikiIds['I.12369'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Merujuk ke ahli gizi dan sertaakan keluarga, jika perlu']; }
        if (isset($sikiIds['I.03119'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03119'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi dengan ahli gizi, untuk menentukan jumlah kalori dan jeni nutrien yang dibutuhkan, jika perlu']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Hitung kebutuhan cairan']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Berikan posisi modified Trendelenburg']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Berikan asupan cairan oral']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkan memperbanyak asupan cairan oral']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan menghindari perubahan posisi mendadak']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian cairan IV isotonis (mis. NaCl, RL)']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Kolaborasi', 'urutan' => 2, 'deskripsi' => 'Kolaborasi pemberian cairan IV hipotonis (mis. Glukosa 2,5%, NaCl 0,4%)']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Kolaborasi', 'urutan' => 3, 'deskripsi' => 'Kolaborasi pemberian cairan koloid (albumin, plasmanate)']; }
        if (isset($sikiIds['I.03116'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03116'], 'jenis' => 'Kolaborasi', 'urutan' => 4, 'deskripsi' => 'Kolaborasi pemberian produk darah']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 1, 'deskripsi' => 'Identifikasi kondisi awal bayi setelah lahir (mis. Kecukupan bulan,air ketuban jernih atau bercampur mekonium,menangis spontan,tonus otot)']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 2, 'deskripsi' => 'Monitor tanda vital bayi (terutama suhu) Terapeutik']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 3, 'deskripsi' => 'Lakukan inisiasi menyusui dini (IMD) segera setelah bayi lahir']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 4, 'deskripsi' => 'Berikan vitamin K 1 mg intramuskuler untuk mencegah pendarahan']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 5, 'deskripsi' => 'Mandikan selama 5-10 menit, minimal sehari sekali']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 6, 'deskripsi' => 'Mandikan dengan air hangat (36-37°c)']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 7, 'deskripsi' => 'Gunakan sabun yang mengandung provitamin B5']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 8, 'deskripsi' => 'Oleskan beby oil untuk mempertahankan kelembaban kulit']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 9, 'deskripsi' => 'Rawat tali pusat secara terbuka (tidak dibungkus)']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 10, 'deskripsi' => 'Bersihkan tali pusat dengan air steril atau air matang']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 11, 'deskripsi' => 'Kenakan pakaian dari bahan katun']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 12, 'deskripsi' => 'Selimut untuk mempertahankan kehangatan dan mencegah hipotermia']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Observasi', 'urutan' => 13, 'deskripsi' => 'Ganti popok segera jika basah']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkan tidak membubuhi apapun pada tali pusat']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Ajarkan ibu menyusui bayi setiap 2 jam']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjuran menyendawakan bayi setelah disusui']; }
        if (isset($sikiIds['I.03132'])) { $rows[] = ['intervensi_id' => $sikiIds['I.03132'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Anjurkan ibu mencuci tangan sebelum menyentuh bayi']; }
        if (isset($sikiIds['I.04148'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04148'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Menjelaskan tujuan dan prosedur pemasangan kateter urin']; }
        if (isset($sikiIds['I.04148'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04148'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Menganjurkan menarik napas saat insersi selang kateter Perawatan inkontinensia urine']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Bersihkan genital dan kulit sekitar secara rutin']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Berikan pujian atas keberhasilan mencegah inkontinensia']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Buat jadwal konsumsi obatobatan diuretic']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 4, 'deskripsi' => 'Ambil sampel urine untuk pemeriksaan urine lengkap atau kultur Edukasi']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 5, 'deskripsi' => 'Jelaskan Definisi, jenis inkontinensia, penyebab inkontinensia urine']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 6, 'deskripsi' => 'Jelaskan program penanganan inkontinensia urine']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 7, 'deskripsi' => 'Jelaskan jenis pakaian dan lingkungan yang mendukung proes berkemih']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 8, 'deskripsi' => 'Anjurkan membatasi mengonsumsi cairan 2-3 jam menjelang tidur']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 9, 'deskripsi' => 'Ajarkan memantau cairan keluar dan masuk serta pola eliminasi urine']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 10, 'deskripsi' => 'Anjurkan minum minimal 1500 cc/hari, jika tidak kontraindikasi']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 11, 'deskripsi' => 'Anjurkan menghindari kopi, minuman bersoda, the dan coklat']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Terapeutik', 'urutan' => 12, 'deskripsi' => 'Anjurkan konsumsi buah dan sayur untuk menghindari konstipasi']; }
        if (isset($sikiIds['I.04163'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04163'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Rujuk ke ahli inkontinensia, jika perlu.']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Anjurkan berbaring']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan tidak mengkontraksikan perut, kaki dan bokong saat melakukan latihan otot panggul']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan menambah durasi kontraksi-relaksasi 10 detik dengan siklus 10-12 kali, dilakukan 3-4 kali sehari']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Ajarkan mengkontraksikan sekitar ototuretra dan anus seperti menahan BAB/BAK selama 5 detik kemudian dikendurkan dan direlaksasikan dengan siklus 10 kali']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Ajarkan mengevaluasi latihan yang dilakukan dengan cara menghentikan urin sesaat saat BAK, seminggu sekali']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan latihan selama 6-12 minggu']; }
        if (isset($sikiIds['I.07215'])) { $rows[] = ['intervensi_id' => $sikiIds['I.07215'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi rehabilitas medik untuk mengukur kekuatan kontraksi otot dasar panggul, jika perlu Perawatan Inkontinensia']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Catat waktu-waktu dan haluaran berkemih']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Batasi asupan cairan, jika perlu']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Ambil sampel urine tengah (midstream) atau kultur']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Ambil sampel urine tengah (midstream) atau kultur']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Ajarkan mengukur asupan cairan dan haluaran urine']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Ajarkan mengambil spesimen urine midstream']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Ajarkan mengenali tanda berkemih dan waktu yang tepat untuk berkemih']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Ajarkan terapi modalitas penguatan otot-otot panggul/berkemihan']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan minum yang cukup, jika tidak ada kontraindikasi']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Edukasi', 'urutan' => 7, 'deskripsi' => 'Anjurkan mengurangi minum menjelang tidur']; }
        if (isset($sikiIds['I.04152'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04152'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Pemberian obat supositoria uretra, jika perlu']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Terapeutik', 'urutan' => 1, 'deskripsi' => 'Berikan air hangat setelah makan']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Terapeutik', 'urutan' => 2, 'deskripsi' => 'Jadwalkan waktu defekasi bersama pasien']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Terapeutik', 'urutan' => 3, 'deskripsi' => 'Sediakan makanan tinggi serat']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 1, 'deskripsi' => 'Jelaskan jenis makanan yang membantu meningkatkan keteraturan peristaltik usus']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 2, 'deskripsi' => 'Anjurkan mencatat warna, frekuensi, konsistensi, volume feses']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 3, 'deskripsi' => 'Anjurkan meningkatkan aktivitas fisik, sesuai toleransi']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 4, 'deskripsi' => 'Anjurkan pengurangan asupan makanan yang meningkatkan pembentukkan gas']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 5, 'deskripsi' => 'Anjurkan mengkonsumsi makanan yang mengandung tinggi serat']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Edukasi', 'urutan' => 6, 'deskripsi' => 'Anjurkan meningkatkan asupan cairan, jika tidak ada kontraindikasi']; }
        if (isset($sikiIds['I.04151'])) { $rows[] = ['intervensi_id' => $sikiIds['I.04151'], 'jenis' => 'Kolaborasi', 'urutan' => 1, 'deskripsi' => 'Kolaborasi pemberian obat suppositoria anal, jika perlu']; }
        foreach (array_chunk($rows, 100) as $chunk) { DB::table('siki_tindakan')->insert($chunk); }
    }
}
