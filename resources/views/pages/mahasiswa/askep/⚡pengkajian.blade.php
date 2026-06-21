<?php

use App\Models\Askep;
use App\Models\AskepPengkajian;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Pengkajian')] class extends Component
{
    public Askep $askep;

    public string $tab = 'identitas';

    // ── Identitas Penanggung Jawab ─────────────────────────────────────────
    public string $pj_nama = '';
    public string $pj_umur = '';
    public string $pj_pendidikan = '';
    public string $pj_pekerjaan = '';
    public string $pj_alamat = '';

    // ── EWS / Tanda Vital ──────────────────────────────────────────────────
    public string $ews_td = '';
    public string $ews_nadi = '';
    public string $ews_rr = '';
    public string $ews_suhu = '';
    public string $ews_spo2 = '';
    public string $ews_kesadaran = 'composmentis';
    public int $ews_skor = 0;

    // ── Anthropometri ──────────────────────────────────────────────────────
    public string $bb = '';
    public string $tb = '';

    // ── Riwayat Penyakit (Granular) ────────────────────────────────────────
    public array $riwayat_sekarang = [
        'keluhan_utama' => '',
        'kronologi' => '',
        'harapan' => '',
    ];
    public array $riwayat_lalu = [
        'penyakit_anak' => '',
        'alergi' => '',
        'pengalaman_dirawat' => '',
        'pengobatan_terakhir' => '',
    ];
    public array $riwayat_keluarga = [
        'jumlah_anggota' => '',
        'penyakit_serupa' => '',
        'penyakit_menurun' => '',
        'efek_sakit' => '',
    ];

    // ── Biologis (Granular JSON per section) ──────────────────────────────
    public array $biologis_nyeri = [
        'lokasi' => '', 'p' => '', 'q' => '', 'r' => '', 's' => '', 't' => '',
        'ganggu_aktivitas' => '', 'cara_atasi' => '', 'efektif' => '', 'riwayat_bedah' => ''
    ];
    public array $biologis_aktivitas = [
        'olahraga' => '', 'alat_bantu' => '', 'gangguan' => '', 'durasi_hari' => '',
        'jam_kerja' => '', 'keterampilan' => '', 'saat_sakit' => ''
    ];
    public array $biologis_istirahat = [
        'kapan' => '', 'durasi' => '', 'kegiatan_luang' => '', 'waktu_khusus' => '', 'saat_sakit' => ''
    ];
    public array $biologis_tidur = [
        'pola' => '', 'obat_penenang' => '', 'kegiatan_menjelang' => '', 'sering_terjaga' => '', 'gangguan' => ''
    ];
    public array $biologis_cairan = [
        'jumlah_minum' => '', 'jenis_minuman' => '', 'alkohol' => '', 'pembatasan' => ''
    ];
    public array $biologis_nutrisi = [
        'pola_makan' => '', 'alergi' => '', 'kesulitan_menelan' => '', 'kondisi_gigi' => '', 'riwayat_bedah' => ''
    ];
    public array $biologis_eliminasi_feses = [
        'pola_defekasi' => '', 'karakteristik' => '', 'obat_pencahar' => '', 'kesulitan' => '', 'alat_bantu' => ''
    ];
    public array $biologis_eliminasi_urine = [
        'pola_miksi' => '', 'karakteristik' => '', 'perubahan' => '', 'alat_bantu' => ''
    ];
    public array $biologis_oksigenasi = [
        'kesulitan_napas' => '', 'alat_bantu' => '', 'posisi_nyaman' => '', 'merokok' => '', 'riwayat_sakit' => ''
    ];
    public array $biologis_kardiovaskuler = [
        'cepat_lelah' => '', 'nyeri_dada' => '', 'alat_pacu' => '', 'obat' => ''
    ];
    public array $biologis_hygiene = [
        'pola_mandi' => '', 'gosok_gigi' => '', 'cuci_rambut' => '', 'bantuan' => ''
    ];
    public array $biologis_seksualitas = [
        'kesulitan' => '', 'pengaruh_sakit' => ''
    ];

    // ── Psikososial & Spiritual ──────────────────────────────────────────
    public array $psiko_emosi = [
        'ekspresi' => '', 'suasana_hati' => '', 'saat_marah_sedih' => ''
    ];
    public array $psiko_konsep_diri = [
        'pandangan_diri' => '', 'hal_disukai' => '', 'kekuatan_kelemahan' => ''
    ];
    public array $psiko_sosial = [
        'teman_dekat' => '', 'kegiatan_masyarakat' => '', 'pekerjaan_sesuai' => ''
    ];
    public array $psiko_spiritual = [
        'agama' => '', 'hambatan_ibadah' => '', 'hubungan_tuhan' => ''
    ];

    // ── Pemeriksaan Fisik (JSON per system) ──────────────────────────────
    public string $fisik_umum = '';
    public array $pengkajianData = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load('pasien', 'pengkajian');

        $arrayFields = [
            'fisik_penglihatan' => ['pupil', 'otot_mata', 'fungsi_penglihatan'],
            'fisik_pendengaran' => ['kondisi_telinga'],
            'fisik_wicara' => ['gangguan'],
            'fisik_pernafasan' => ['jalan_nafas', 'sputum_warna', 'suara_nafas'],
            'fisik_kardiovaskuler' => ['warna_kulit', 'edema_lokasi', 'bunyi_jantung', 'nyeri_karakter'],
            'fisik_saraf' => ['kelainan'],
            'fisik_pencernaan' => ['isi_muntah', 'warna_muntah', 'nyeri_karakter', 'warna_feces', 'konsistensi_feces', 'abdomen'],
            'fisik_endokrin' => ['kelainan'],
            'fisik_urogenital' => ['perubahan_pola'],
            'fisik_integumen' => ['warna_kulit', 'keadaan_kulit'],
            'fisik_muskuloskeletal' => ['kelainan_bentuk'],
        ];

        // Inisialisasi pengkajianData untuk sistem fisik
        foreach ([
            'fisik_penglihatan', 'fisik_pendengaran', 'fisik_wicara', 'fisik_pernafasan',
            'fisik_kardiovaskuler', 'fisik_hematologi', 'fisik_saraf', 'fisik_pencernaan',
            'fisik_endokrin', 'fisik_urogenital', 'fisik_integumen', 'fisik_muskuloskeletal', 'fisik_imun'
        ] as $sys) {
            $this->pengkajianData[$sys] = ['is_abnormal' => false, 'data' => []];
            if (isset($arrayFields[$sys])) {
                foreach ($arrayFields[$sys] as $field) {
                    $this->pengkajianData[$sys]['data'][$field] = [];
                }
            }
        }

        $p = $askep->pengkajian;
        if (! $p) {
            return;
        }

        // Identitas PJ
        $this->pj_nama       = $p->pj_nama ?? '';
        $this->pj_umur       = (string) ($p->pj_umur ?? '');
        $this->pj_pendidikan = $p->pj_pendidikan ?? '';
        $this->pj_pekerjaan  = $p->pj_pekerjaan ?? '';
        $this->pj_alamat     = $p->pj_alamat ?? '';

        // EWS
        $this->ews_td        = $p->ews_td ?? '';
        $this->ews_nadi      = (string) ($p->ews_nadi ?? '');
        $this->ews_rr        = (string) ($p->ews_rr ?? '');
        $this->ews_suhu      = (string) ($p->ews_suhu ?? '');
        $this->ews_spo2      = (string) ($p->ews_spo2 ?? '');
        $this->ews_kesadaran = $p->ews_kesadaran ?? 'composmentis';
        $this->ews_skor      = $p->ews_skor ?? 0;

        // Anthropometri
        $this->bb = (string) ($p->bb ?? '');
        $this->tb = (string) ($p->tb ?? '');

        $this->fisik_umum = $p->fisik_umum ?? '';

        // Riwayat
        if ($p->riwayat_sekarang) $this->riwayat_sekarang = array_merge($this->riwayat_sekarang, $p->riwayat_sekarang);
        if ($p->riwayat_lalu)     $this->riwayat_lalu     = array_merge($this->riwayat_lalu, $p->riwayat_lalu);
        if ($p->riwayat_keluarga) $this->riwayat_keluarga = array_merge($this->riwayat_keluarga, $p->riwayat_keluarga);

        // Biologis & Psiko
        $sections = [
            'biologis_nyeri', 'biologis_aktivitas', 'biologis_istirahat', 'biologis_tidur',
            'biologis_cairan', 'biologis_nutrisi', 'biologis_eliminasi_feses', 'biologis_eliminasi_urine',
            'biologis_oksigenasi', 'biologis_kardiovaskuler', 'biologis_hygiene', 'biologis_seksualitas',
            'psiko_emosi', 'psiko_konsep_diri', 'psiko_sosial', 'psiko_spiritual'
        ];

        foreach ($sections as $sec) {
            if (! empty($p->$sec)) {
                $this->$sec = array_merge($this->$sec, (array) $p->$sec);
            }
        }

        // Fisik
        foreach ($this->pengkajianData as $sys => $val) {
            $dbField = str_replace('pernafasan', 'pernapasan', $sys);
            if (! empty($p->$dbField)) {
                $dbData = (array) $p->$dbField;
                $this->pengkajianData[$sys]['is_abnormal'] = $dbData['is_abnormal'] ?? false;
                if (isset($dbData['data']) && is_array($dbData['data'])) {
                    $this->pengkajianData[$sys]['data'] = array_merge($this->pengkajianData[$sys]['data'], $dbData['data']);
                }
            }
        }
    }

    public function hitungEws(): void
    {
        if ($this->ews_td && $this->ews_nadi && $this->ews_rr && $this->ews_suhu && $this->ews_spo2) {
            $this->ews_skor = AskepPengkajian::hitungEws(
                $this->ews_td,
                (int) $this->ews_nadi,
                (int) $this->ews_rr,
                (float) $this->ews_suhu,
                (int) $this->ews_spo2,
                $this->ews_kesadaran
            );
        }
    }

    /** Isi preset "Normal" untuk section tertentu atau semua. */
    public function setNormal(string $section = 'all'): void
    {
        if ($section === 'all' || $section === 'biologis') {
            $this->biologis_nyeri            = ['lokasi' => 'Tidak ada', 'p' => '-', 'q' => '-', 'r' => '-', 's' => '0', 't' => '-', 'ganggu_aktivitas' => 'Tidak', 'cara_atasi' => '-', 'efektif' => '-', 'riwayat_bedah' => 'Tidak ada'];
            $this->biologis_aktivitas        = ['olahraga' => 'Rutin', 'alat_bantu' => 'Tidak ada', 'gangguan' => 'Tidak ada', 'durasi_hari' => '8 jam', 'jam_kerja' => '8 jam', 'keterampilan' => 'Baik', 'saat_sakit' => 'Mandiri'];
            $this->biologis_istirahat        = ['kapan' => 'Siang & Malam', 'durasi' => '8 jam', 'kegiatan_luang' => 'Santai', 'waktu_khusus' => 'Tidak ada', 'saat_sakit' => 'Cukup'];
            $this->biologis_tidur            = ['pola' => 'Teratur', 'obat_penenang' => 'Tidak', 'kegiatan_menjelang' => 'Berdoa', 'sering_terjaga' => 'Tidak', 'gangguan' => 'Tidak ada'];
            $this->biologis_cairan           = ['jumlah_minum' => '2000 ml', 'jenis_minuman' => 'Air putih', 'alkohol' => 'Tidak', 'pembatasan' => 'Tidak ada'];
            $this->biologis_nutrisi          = ['pola_makan' => '3x sehari', 'alergi' => 'Tidak ada', 'kesulitan_menelan' => 'Tidak ada', 'kondisi_gigi' => 'Baik', 'riwayat_bedah' => 'Tidak ada'];
            $this->biologis_eliminasi_feses  = ['pola_defekasi' => '1x sehari', 'karakteristik' => 'Lunak', 'obat_pencahar' => 'Tidak', 'kesulitan' => 'Tidak ada', 'alat_bantu' => 'Tidak ada'];
            $this->biologis_eliminasi_urine  = ['pola_miksi' => '4-6x sehari', 'karakteristik' => 'Kuning jernih', 'perubahan' => 'Tidak ada', 'alat_bantu' => 'Tidak ada'];
            $this->biologis_oksigenasi       = ['kesulitan_napas' => 'Tidak ada', 'alat_bantu' => 'Tidak ada', 'posisi_nyaman' => 'Bebas', 'merokok' => 'Tidak', 'riwayat_sakit' => 'Tidak ada'];
            $this->biologis_kardiovaskuler   = ['cepat_lelah' => 'Tidak', 'nyeri_dada' => 'Tidak ada', 'alat_pacu' => 'Tidak ada', 'obat' => 'Tidak ada'];
            $this->biologis_hygiene          = ['pola_mandi' => '2x sehari', 'gosok_gigi' => 'Rutin', 'cuci_rambut' => 'Rutin', 'bantuan' => 'Mandiri'];
            $this->biologis_seksualitas      = ['kesulitan' => 'Tidak ada', 'pengaruh_sakit' => 'Tidak ada'];
        }

        if ($section === 'all' || $section === 'psikososial') {
            $this->psiko_emosi       = ['ekspresi' => 'Wajar', 'suasana_hati' => 'Stabil', 'saat_marah_sedih' => 'Bercerita'];
            $this->psiko_konsep_diri = ['pandangan_diri' => 'Positif', 'hal_disukai' => 'Semua', 'kekuatan_kelemahan' => 'Wajar'];
            $this->psiko_sosial      = ['teman_dekat' => 'Ada', 'kegiatan_masyarakat' => 'Aktif', 'pekerjaan_sesuai' => 'Ya'];
            $this->psiko_spiritual   = ['agama' => 'Islam/Lainnya', 'hambatan_ibadah' => 'Tidak ada', 'hubungan_tuhan' => 'Baik'];
        }

        if ($section === 'all' || $section === 'fisik') {
            // Array fields (checkbox groups) harus di-init sebagai [] bukan null
            $arrayFields = [
                'fisik_penglihatan'    => ['pupil', 'otot_mata', 'fungsi_penglihatan'],
                'fisik_pendengaran'    => ['kondisi_telinga'],
                'fisik_wicara'         => ['gangguan'],
                'fisik_pernafasan'     => ['jalan_nafas', 'sputum_warna', 'suara_nafas'],
                'fisik_kardiovaskuler' => ['warna_kulit', 'edema_lokasi', 'bunyi_jantung', 'nyeri_karakter'],
                'fisik_saraf'          => ['kelainan'],
                'fisik_pencernaan'     => ['isi_muntah', 'warna_muntah', 'nyeri_karakter', 'warna_feces', 'konsistensi_feces', 'abdomen'],
                'fisik_endokrin'       => ['kelainan'],
                'fisik_urogenital'     => ['perubahan_pola'],
                'fisik_integumen'      => ['warna_kulit', 'keadaan_kulit'],
                'fisik_muskuloskeletal'=> ['kelainan_bentuk'],
            ];

            foreach ($this->pengkajianData as $key => $val) {
                $data = [];
                foreach ($arrayFields[$key] ?? [] as $f) {
                    $data[$f] = [];
                }
                $this->pengkajianData[$key] = ['is_abnormal' => false, 'data' => $data];
            }

            // Preset normal per sistem (field names sesuai partial)
            $this->pengkajianData['fisik_penglihatan']['data'] = array_merge(
                $this->pengkajianData['fisik_penglihatan']['data'],
                ['posisi_mata' => 'simetris', 'kelopak_mata' => 'normal', 'konjungtiva' => 'normal',
                 'sklera' => 'anikterik', 'kornea' => 'normal', 'kacamata' => 'tidak', 'lensa_kontak' => 'tidak',
                 'pupil' => ['isokor'], 'fungsi_penglihatan' => ['baik'], 'otot_mata' => ['tidak_ada_kelainan']]
            );
            $this->pengkajianData['fisik_pendengaran']['data'] = array_merge(
                $this->pengkajianData['fisik_pendengaran']['data'],
                ['daun_telinga' => 'normal', 'cairan_telinga' => 'tidak_ada', 'tinnitus' => 'tidak',
                 'fungsi_pendengaran' => 'normal', 'alat_bantu' => 'tidak', 'perasaan_penuh' => 'tidak',
                 'kondisi_telinga' => ['normal']]
            );
            $this->pengkajianData['fisik_wicara']['data'] = array_merge(
                $this->pengkajianData['fisik_wicara']['data'],
                ['gangguan' => ['tidak_ada']]
            );
            $this->pengkajianData['fisik_pernafasan']['data'] = array_merge(
                $this->pengkajianData['fisik_pernafasan']['data'],
                ['sesak' => 'tidak_sesak', 'otot_bantu' => 'tidak', 'irama' => 'teratur',
                 'kedalaman' => 'normal', 'batuk' => 'tidak', 'batuk_jenis' => 'tidak_ada',
                 'sputum_konsistensi' => 'tidak_ada', 'sputum_darah' => 'tidak',
                 'jalan_nafas' => ['bersih'], 'sputum_warna' => ['tidak_ada'], 'suara_nafas' => ['normal']]
            );
            $this->pengkajianData['fisik_kardiovaskuler']['data'] = array_merge(
                $this->pengkajianData['fisik_kardiovaskuler']['data'],
                ['irama_nadi' => 'teratur', 'denyut' => 'kuat', 'distensi_vena_kanan' => 'tidak',
                 'distensi_vena_kiri' => 'tidak', 'temperatur_kulit' => 'hangat', 'edema' => 'tidak',
                 'irama_jantung' => 'teratur', 'nyeri_dada' => 'tidak', 'nyeri_timbul' => 'tidak_ada',
                 'warna_kulit' => ['normal'], 'edema_lokasi' => ['tidak_ada'],
                 'bunyi_jantung' => ['normal'], 'nyeri_karakter' => ['tidak_ada']]
            );
            $this->pengkajianData['fisik_saraf']['data'] = array_merge(
                $this->pengkajianData['fisik_saraf']['data'],
                ['kesadaran' => 'compos_mentis', 'pupil' => 'isokor', 'reaksi_cahaya_kanan' => 'positif',
                 'reaksi_cahaya_kiri' => 'positif', 'peningkatan_tik' => 'tidak',
                 'gcs_e' => 4, 'gcs_m' => 6, 'gcs_v' => 5,
                 'kelainan' => ['tidak_ada']]
            );
            $this->pengkajianData['fisik_pencernaan']['data'] = array_merge(
                $this->pengkajianData['fisik_pencernaan']['data'],
                ['gigi_caries' => 'tidak', 'gigi_palsu' => 'tidak', 'stomatitis' => 'tidak',
                 'lidah_kotor' => 'tidak', 'saliva' => 'normal', 'muntah' => 'tidak',
                 'mual' => 'tidak', 'nafsu_makan' => 'baik', 'nyeri_perut' => 'tidak',
                 'hepar' => 'tidak_teraba',
                 'isi_muntah' => ['tidak_ada'], 'warna_muntah' => ['tidak_ada'],
                 'nyeri_karakter' => ['tidak_ada'], 'warna_feces' => ['coklat'],
                 'konsistensi_feces' => ['normal'], 'abdomen' => ['normal']]
            );
            $this->pengkajianData['fisik_endokrin']['data'] = array_merge(
                $this->pengkajianData['fisik_endokrin']['data'],
                ['nafas_bau_keton' => 'tidak', 'gangren' => 'tidak', 'gangren_warna' => 'tidak_ada',
                 'gangren_bau' => 'tidak', 'exopthalmus' => 'tidak', 'tremor' => 'tidak',
                 'kelenjar_tiroid' => 'tidak',
                 'kelainan' => ['tidak_ada']]
            );
            $this->pengkajianData['fisik_urogenital']['data'] = array_merge(
                $this->pengkajianData['fisik_urogenital']['data'],
                ['bak_kontrol' => 'terkontrol', 'bak_warna' => 'kuning_jernih',
                 'distensi_kandung_kemih' => 'tidak', 'nyeri_pinggang' => 'tidak', 'pembesaran_prostat' => 'tidak',
                 'perubahan_pola' => ['tidak_ada']]
            );
            $this->pengkajianData['fisik_integumen']['data'] = array_merge(
                $this->pengkajianData['fisik_integumen']['data'],
                ['turgor' => 'baik',
                 'warna_kulit' => ['normal'], 'keadaan_kulit' => ['baik']]
            );
            $this->pengkajianData['fisik_muskuloskeletal']['data'] = array_merge(
                $this->pengkajianData['fisik_muskuloskeletal']['data'] ?? [],
                ['kelainan_bentuk' => ['tidak_ada']]
            );
        }

        Flux::toast(variant: 'success', text: "Preset " . ($section === 'all' ? 'lengkap' : $section) . " diterapkan.");
    }

    public function lanjutkanTab(string $next): void
    {
        $this->tab = $next;
        $this->dispatch('scroll-to-top');
    }

    public function simpan(): void
    {
        $this->validate([
            'ews_td'    => ['nullable', 'string', 'max:20'],
            'ews_nadi'  => ['nullable', 'integer', 'min:0', 'max:300'],
            'ews_rr'    => ['nullable', 'integer', 'min:0', 'max:100'],
            'ews_suhu'  => ['nullable', 'numeric', 'min:30', 'max:45'],
            'ews_spo2'  => ['nullable', 'integer', 'min:0', 'max:100'],
            'bb'        => ['nullable', 'numeric', 'min:0', 'max:300'],
            'tb'        => ['nullable', 'integer', 'min:0', 'max:250'],
        ]);

        if ($this->ews_td && $this->ews_nadi && $this->ews_rr && $this->ews_suhu && $this->ews_spo2) {
            $this->hitungEws();
        }

        $dataFisik = [];
        foreach ($this->pengkajianData as $sys => $val) {
            $dbField = str_replace('pernafasan', 'pernapasan', $sys);
            $dataFisik[$dbField] = $val;
        }

        AskepPengkajian::updateOrCreate(
            ['askep_id' => $this->askep->id],
            array_merge([
                'pj_nama'       => $this->pj_nama ?: null,
                'pj_umur'       => $this->pj_umur ?: null,
                'pj_pendidikan' => $this->pj_pendidikan ?: null,
                'pj_pekerjaan'  => $this->pj_pekerjaan ?: null,
                'pj_alamat'     => $this->pj_alamat ?: null,
                'ews_td'        => $this->ews_td ?: null,
                'ews_nadi'      => $this->ews_nadi ?: null,
                'ews_rr'        => $this->ews_rr ?: null,
                'ews_suhu'      => $this->ews_suhu ?: null,
                'ews_spo2'      => $this->ews_spo2 ?: null,
                'ews_kesadaran' => $this->ews_kesadaran ?: null,
                'ews_skor'      => $this->ews_skor,
                'bb'            => $this->bb ?: null,
                'tb'            => $this->tb ?: null,
                'riwayat_sekarang' => $this->riwayat_sekarang,
                'riwayat_lalu'     => $this->riwayat_lalu,
                'riwayat_keluarga' => $this->riwayat_keluarga,
                'biologis_nyeri'           => $this->biologis_nyeri,
                'biologis_aktivitas'       => $this->biologis_aktivitas,
                'biologis_istirahat'       => $this->biologis_istirahat,
                'biologis_tidur'           => $this->biologis_tidur,
                'biologis_cairan'          => $this->biologis_cairan,
                'biologis_nutrisi'         => $this->biologis_nutrisi,
                'biologis_eliminasi_feses' => $this->biologis_eliminasi_feses,
                'biologis_eliminasi_urine' => $this->biologis_eliminasi_urine,
                'biologis_oksigenasi'      => $this->biologis_oksigenasi,
                'biologis_kardiovaskuler'  => $this->biologis_kardiovaskuler,
                'biologis_hygiene'         => $this->biologis_hygiene,
                'biologis_seksualitas'     => $this->biologis_seksualitas,
                'psiko_emosi'              => $this->psiko_emosi,
                'psiko_konsep_diri'        => $this->psiko_konsep_diri,
                'psiko_sosial'             => $this->psiko_sosial,
                'psiko_spiritual'          => $this->psiko_spiritual,
                'fisik_umum'               => $this->fisik_umum ?: null,
            ], $dataFisik)
        );

        if ($this->askep->step_terakhir < 1) {
            $this->askep->update(['step_terakhir' => 1]);
        }

        $this->askep->pasien->catatRiwayat('Pengkajian disimpan.');
        Flux::toast(variant: 'success', text: 'Pengkajian tersimpan.');
    }

    public function simpanLanjut(): void
    {
        $this->simpan();
        $this->redirectRoute('mahasiswa.askep.diagnosa', $this->askep, navigate: true);
    }
};
?>

<div class="p-2 md:p-4">
    {{-- Stepper --}}
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 1])

    <div class="mb-5 overflow-hidden rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white">
        <div class="flex flex-col gap-4 border-b border-[#E0EBF5] dark:border-zinc-700 p-3 sm:p-4 md:flex-row md:items-center md:justify-between">
            <div>
                <div class="mb-2 flex items-center gap-2">
                    <span class="flex size-8 items-center justify-center rounded-lg bg-[#E1F5EE] text-[#0F6E56]">
                        <flux:icon.clipboard-document-list class="size-4" />
                    </span>
                    <h2 class="text-xl font-bold text-[#1B4F72]">Tahap 1: Pengkajian Dasar</h2>
                </div>
                <p class="text-sm text-[#7A8FA6]">Isi pengkajian secara mendalam untuk mendapatkan rekomendasi diagnosa yang akurat.</p>
            </div>
            <button
                wire:click="setNormal('all')"
                class="inline-flex items-center gap-2 rounded-lg border border-[#85B7EB] bg-[#EBF5FB] px-3 py-2 text-xs font-semibold text-[#2E86C1] hover:bg-[#D7EAFB] transition"
            >
                <flux:icon.check-circle class="size-3.5" />
                Semua Normal
            </button>
        </div>
        <div class="grid gap-3 p-3 sm:p-5 sm:grid-cols-3">
            <div class="rounded-xl bg-[#F8FBFE] p-4">
                <p class="text-xs font-semibold uppercase tracking-wide text-[#7A8FA6]">Pasien</p>
                <p class="mt-2 text-sm font-bold text-[#1B4F72]">{{ $askep->pasien->nama_pasien }}</p>
                <p class="mt-1 text-xs text-[#7A8FA6]">No. RM {{ $askep->pasien->no_rm }}</p>
            </div>
            <div class="rounded-xl bg-[#F8FBFE] p-4">
                <p class="text-xs font-semibold uppercase tracking-wide text-[#7A8FA6]">Status Pengkajian</p>
                <p class="mt-2 text-sm font-bold text-[#1B4F72]">{{ $askep->pengkajian ? 'Tersimpan' : 'Belum diisi' }}</p>
                <p class="mt-1 text-xs text-[#7A8FA6]">Lengkapi sebelum lanjut ke diagnosa.</p>
            </div>
            <div class="rounded-xl bg-[#F8FBFE] p-4">
                <p class="text-xs font-semibold uppercase tracking-wide text-[#7A8FA6]">Fokus Data</p>
                <p class="mt-2 text-sm font-bold text-[#1B4F72]">Head to Toe & Biologis</p>
                <p class="mt-1 text-xs text-[#7A8FA6]">Ikuti setiap pertanyaan dengan teliti.</p>
            </div>
        </div>
    </div>

    {{-- Tab Navigation --}}
    <div class="mb-5 flex gap-1 overflow-x-auto no-scrollbar rounded-xl bg-[#F4F8FB] p-1">
        @foreach ([
            'identitas'   => 'Identitas',
            'ttv'         => 'TTV & EWS',
            'riwayat'     => 'Riwayat',
            'biologis'    => 'Biologis',
            'psikososial' => 'Psikososial',
            'fisik'       => 'Fisik',
        ] as $key => $label)
            <button
                wire:click="$set('tab', '{{ $key }}')"
                class="flex-1 rounded-lg px-3 py-2 text-sm font-medium whitespace-nowrap transition
                    {{ $tab === $key ? 'bg-white text-[#2E86C1] shadow-sm ring-1 ring-[#85B7EB]/40' : 'text-[#7A8FA6] hover:bg-white/60' }}"
            >
                {{ $label }}
            </button>
        @endforeach
    </div>

    {{-- ── Tab: Identitas ── --}}
    @if ($tab === 'identitas')
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Identitas Pasien</h3>
                <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                    <flux:input :value="$askep->pasien->nama_pasien" label="Nama" disabled />
                    <flux:input :value="$askep->pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan'" label="Jenis Kelamin" disabled />
                    <flux:input :value="$askep->pasien->tanggal_lahir?->format('d/m/Y') . ' / ' . ($askep->pasien->umur ?? '-') . ' th'" label="Tanggal Lahir / Umur" disabled />
                    <flux:input :value="$askep->pasien->agama ?? '-'" label="Agama" disabled />
                    <flux:input :value="$askep->pasien->status_perkawinan ?? '-'" label="Status Perkawinan" disabled />
                    <flux:input :value="$askep->pasien->pendidikan ?? '-'" label="Pendidikan" disabled />
                    <div class="sm:col-span-2 lg:col-span-3">
                        <flux:textarea :value="$askep->pasien->alamat ?? '-'" label="Alamat" rows="2" disabled />
                    </div>
                    <div class="sm:col-span-2 lg:col-span-3">
                        <flux:textarea :value="$askep->pasien->diagnosa_medis ?? '-'" label="Diagnosa Medis" rows="2" disabled />
                    </div>
                </div>
            </div>

            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Identitas Penanggung Jawab</h3>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="pj_nama" label="Nama Penanggung Jawab" placeholder="Nama lengkap" />
                    <flux:input wire:model="pj_umur" label="Umur" type="number" placeholder="Tahun" min="0" max="150" />
                    <flux:input wire:model="pj_pendidikan" label="Pendidikan Terakhir" placeholder="Contoh: S1, SMA" />
                    <flux:input wire:model="pj_pekerjaan" label="Pekerjaan" placeholder="Pekerjaan penanggung jawab" />
                    <div class="sm:col-span-2">
                        <flux:textarea wire:model="pj_alamat" label="Alamat" placeholder="Alamat lengkap penanggung jawab" rows="2" />
                    </div>
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <flux:button wire:click="lanjutkanTab('ttv')" variant="ghost" icon-trailing="arrow-right">Lanjut ke TTV & EWS</flux:button>
            </div>
        </div>
    @endif

    {{-- ── Tab: TTV & EWS ── --}}
    @if ($tab === 'ttv')
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <h3 class="font-semibold text-[#1B4F72]">Tanda-Tanda Vital</h3>
                    <button
                        wire:click="hitungEws"
                        class="flex items-center gap-1.5 rounded-lg bg-[#EBF5FB] px-3 py-1.5 text-xs font-semibold text-[#2E86C1] hover:bg-[#D7EAFB] transition"
                    >
                        <flux:icon.calculator class="size-3.5" />
                        Hitung EWS
                    </button>
                </div>
                <div class="grid gap-4 sm:grid-cols-3">
                    <flux:input wire:model.live.debounce.500ms="ews_td" label="Tekanan Darah (mmHg)" placeholder="120/80" />
                    <flux:input wire:model.live.debounce.500ms="ews_nadi" label="Nadi (x/menit)" type="number" placeholder="80" min="0" max="300" />
                    <flux:input wire:model.live.debounce.500ms="ews_rr" label="Pernapasan (x/menit)" type="number" placeholder="18" min="0" max="100" />
                    <flux:input wire:model.live.debounce.500ms="ews_suhu" label="Suhu (°C)" type="number" step="0.1" placeholder="36.5" min="30" max="45" />
                    <flux:input wire:model.live.debounce.500ms="ews_spo2" label="SpO2 (%)" type="number" placeholder="98" min="0" max="100" />
                    <flux:select wire:model.live="ews_kesadaran" label="Kesadaran">
                        <flux:select.option value="composmentis">Composmentis</flux:select.option>
                        <flux:select.option value="apatis">Apatis</flux:select.option>
                        <flux:select.option value="somnolen">Somnolen</flux:select.option>
                        <flux:select.option value="koma">Koma</flux:select.option>
                    </flux:select>
                </div>
            </div>

            {{-- EWS Score Card --}}
            <div class="rounded-2xl border p-5
                @if ($ews_skor <= 2) border-[#5DCAA5] bg-[#E1F5EE]
                @elseif ($ews_skor <= 5) border-yellow-300 bg-yellow-50
                @else border-[#D95C3A]/40 bg-[#FDE8E8]
                @endif">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm font-semibold text-[#1B4F72]">Early Warning Score (EWS)</p>
                        <p class="text-xs text-[#7A8FA6]">Semakin tinggi skor, semakin kritis kondisi pasien</p>
                    </div>
                    <div class="text-right">
                        <p class="text-4xl font-bold
                            @if ($ews_skor <= 2) text-[#0F6E56]
                            @elseif ($ews_skor <= 5) text-amber-600
                            @else text-[#D95C3A]
                            @endif">
                            {{ $ews_skor }}
                        </p>
                        <p class="text-xs font-medium
                            @if ($ews_skor <= 2) text-[#0F6E56]
                            @elseif ($ews_skor <= 5) text-amber-600
                            @else text-[#D95C3A]
                            @endif">
                            @if ($ews_skor <= 2) Rendah
                            @elseif ($ews_skor <= 5) Sedang
                            @else Tinggi / Kritis
                            @endif
                        </p>
                    </div>
                </div>
            </div>

            {{-- Anthropometri --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Antropometri</h3>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="bb" label="Berat Badan (kg)" type="number" step="0.1" placeholder="60.0" />
                    <flux:input wire:model="tb" label="Tinggi Badan (cm)" type="number" placeholder="165" />
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <flux:button wire:click="lanjutkanTab('riwayat')" variant="ghost" icon-trailing="arrow-right">Lanjut ke Riwayat Penyakit</flux:button>
            </div>
        </div>
    @endif

    {{-- ── Tab: Riwayat ── --}}
    @if ($tab === 'riwayat')
        <div class="space-y-6">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Penyakit Sekarang</h3>
                <div class="grid gap-4">
                    <flux:textarea wire:model="riwayat_sekarang.keluhan_utama" label="Keluhan Utama" placeholder="Apa yang dirasakan pasien saat ini?" rows="2" />
                    <flux:textarea wire:model="riwayat_sekarang.kronologi" label="Kronologi / Perjalanan Penyakit" placeholder="Ceritakan bagaimana penyakit ini bermula..." rows="3" />
                    <flux:textarea wire:model="riwayat_sekarang.harapan" label="Harapan Pasien" placeholder="Apa yang diharapkan pasien dari perawatan ini?" rows="2" />
                </div>
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Penyakit Masa Lalu</h3>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="riwayat_lalu.penyakit_anak" label="Penyakit Masa Anak" placeholder="Campak, cacar, dll." />
                    <flux:input wire:model="riwayat_lalu.alergi" label="Alergi" placeholder="Obat, makanan, debu, dll." />
                    <flux:input wire:model="riwayat_lalu.pengalaman_dirawat" label="Pengalaman Dirawat" placeholder="Pernah dirawat sebelumnya?" />
                    <flux:input wire:model="riwayat_lalu.pengobatan_terakhir" label="Pengobatan Terakhir" placeholder="Obat yang rutin dikonsumsi?" />
                </div>
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Keluarga</h3>
                <div class="grid gap-4">
                    <flux:input wire:model="riwayat_keluarga.jumlah_anggota" label="Jumlah Anggota Keluarga" placeholder="Berapa orang dalam satu rumah?" />
                    <flux:textarea wire:model="riwayat_keluarga.penyakit_serupa" label="Penyakit Serupa dalam Keluarga" rows="2" />
                    <flux:textarea wire:model="riwayat_keluarga.penyakit_menurun" label="Penyakit Menurun (DM, HT, dll.)" rows="2" />
                    <flux:textarea wire:model="riwayat_keluarga.efek_sakit" label="Efek Sakit terhadap Keluarga" rows="2" />
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <flux:button wire:click="lanjutkanTab('biologis')" variant="ghost" icon-trailing="arrow-right">Lanjut ke Pengkajian Biologis</flux:button>
            </div>
        </div>
    @endif

    {{-- ── Tab: Biologis ── --}}
    @if ($tab === 'biologis')
        <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
            <flux:heading size="lg">Pengkajian Biologis</flux:heading>
            <flux:button wire:click="setNormal('biologis')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-6 pb-8">
            {{-- Nyeri --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="bolt" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Rasa Aman & Nyaman (Nyeri)</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_nyeri', {{ json_encode(['lokasi' => 'Tidak ada', 'p' => '-', 'q' => '-', 'r' => '-', 's' => '0', 't' => '-', 'ganggu_aktivitas' => 'Tidak', 'cara_atasi' => '-', 'efektif' => '-', 'riwayat_bedah' => 'Tidak ada']) }})" size="xs" variant="ghost">Set Normal</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_nyeri.lokasi" label="Lokasi Nyeri" class="sm:col-span-2" />
                    <flux:input wire:model="biologis_nyeri.p" label="P (Pemicu/Provocative)" />
                    <flux:input wire:model="biologis_nyeri.q" label="Q (Kualitas/Quality)" />
                    <flux:input wire:model="biologis_nyeri.r" label="R (Radiasi/Region)" />
                    <flux:input wire:model="biologis_nyeri.t" label="T (Waktu/Time)" />
                    
                    <div class="sm:col-span-2"
                         x-data="{ skala: {{ !empty($biologis_nyeri['s']) ? (int)$biologis_nyeri['s'] : 0 }} }">
                        {{-- Header: label + angka + deskripsi sejajar --}}
                        <div class="mb-2 flex items-center justify-between">
                            <label class="text-sm font-bold text-[#1B4F72]">S (Skala Nyeri 0-10)</label>
                            <div class="flex items-center gap-2">
                                <span class="text-lg font-black transition-colors"
                                    :class="{
                                        'text-green-600': skala <= 3,
                                        'text-amber-500': skala >= 4 && skala <= 6,
                                        'text-red-600': skala >= 7
                                    }"
                                    x-text="skala"></span>
                                <span class="text-xs font-medium transition-colors"
                                    :class="{
                                        'text-green-600': skala <= 3,
                                        'text-amber-500': skala >= 4 && skala <= 6,
                                        'text-red-600': skala >= 7
                                    }">
                                    <span x-show="skala == 0">Tidak ada nyeri</span>
                                    <span x-show="skala >= 1 && skala <= 3">Nyeri ringan</span>
                                    <span x-show="skala >= 4 && skala <= 6">Nyeri sedang</span>
                                    <span x-show="skala >= 7 && skala <= 9">Nyeri hebat</span>
                                    <span x-show="skala == 10">Nyeri tak tertahankan</span>
                                </span>
                            </div>
                        </div>

                        {{-- Slider --}}
                        <input
                            type="range"
                            min="0" max="10" step="1"
                            wire:model="biologis_nyeri.s"
                            x-model.number="skala"
                            class="w-full cursor-pointer"
                            :style="`accent-color: ${ skala <= 3 ? '#22c55e' : skala <= 6 ? '#f59e0b' : '#ef4444' }`"
                        />

                        {{-- Tick angka + label --}}
                        <div class="mt-1 flex justify-between px-0.5">
                            @foreach (range(0, 10) as $n)
                                <span class="text-[9px] text-zinc-400">{{ $n }}</span>
                            @endforeach
                        </div>
                        <div class="mt-0.5 flex justify-between px-0.5 text-[9px] font-bold">
                            <span class="text-green-600">Tidak Nyeri</span>
                            <span class="text-amber-500">Nyeri Sedang</span>
                            <span class="text-red-600">Nyeri Hebat</span>
                        </div>
                    </div>

                    <flux:input wire:model="biologis_nyeri.ganggu_aktivitas" label="Mengganggu Aktivitas?" />
                    <flux:input wire:model="biologis_nyeri.cara_atasi" label="Cara Mengatasi" />
                </div>
            </div>

            {{-- Oksigenasi --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="cloud" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Oksigenasi & Pernapasan</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_oksigenasi', {{ json_encode(['kesulitan_napas' => 'Tidak ada', 'alat_bantu' => 'Tidak ada', 'posisi_nyaman' => 'Bebas', 'merokok' => 'Tidak', 'riwayat_sakit' => 'Tidak ada']) }})" size="xs" variant="ghost">Set Normal</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_oksigenasi.kesulitan_napas" label="Kesulitan Napas" />
                    <flux:input wire:model="biologis_oksigenasi.alat_bantu" label="Alat Bantu (O2, dll)" />
                    <flux:input wire:model="biologis_oksigenasi.posisi_nyaman" label="Posisi Nyaman" />
                    <flux:input wire:model="biologis_oksigenasi.merokok" label="Kebiasaan Merokok" />
                </div>
            </div>

            {{-- Nutrisi & Cairan --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="beaker" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Nutrisi & Cairan</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_nutrisi', {{ json_encode(['pola_makan' => '3x sehari', 'alergi' => 'Tidak ada', 'kesulitan_menelan' => 'Tidak ada', 'kondisi_gigi' => 'Baik', 'riwayat_bedah' => 'Tidak ada']) }})" size="xs" variant="ghost">Set Normal Nutrisi</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_nutrisi.pola_makan" label="Pola Makan" />
                    <flux:input wire:model="biologis_nutrisi.alergi" label="Alergi Makanan" />
                    <flux:input wire:model="biologis_nutrisi.kesulitan_menelan" label="Kesulitan Menelan" />
                    <flux:input wire:model="biologis_nutrisi.kondisi_gigi" label="Kondisi Gigi/Mengunyah" />
                    <flux:input wire:model="biologis_cairan.jumlah_minum" label="Jumlah Minum (ml/hari)" />
                    <flux:input wire:model="biologis_cairan.jenis_minuman" label="Jenis Minuman" />
                </div>
            </div>

            {{-- Eliminasi --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="arrow-path" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Eliminasi</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_eliminasi_feses', {{ json_encode(['pola_defekasi' => '1x sehari', 'karakteristik' => 'Lunak', 'obat_pencahar' => 'Tidak', 'kesulitan' => 'Tidak ada', 'alat_bantu' => 'Tidak ada']) }})" size="xs" variant="ghost">Set Normal</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_eliminasi_feses.pola_defekasi" label="Pola BAB" />
                    <flux:input wire:model="biologis_eliminasi_feses.karakteristik" label="Karakteristik Feses" />
                    <flux:input wire:model="biologis_eliminasi_urine.pola_miksi" label="Pola BAK" />
                    <flux:input wire:model="biologis_eliminasi_urine.karakteristik" label="Karakteristik Urine" />
                    <flux:input wire:model="biologis_eliminasi_feses.kesulitan" label="Kesulitan Eliminasi" />
                    <flux:input wire:model="biologis_eliminasi_urine.alat_bantu" label="Alat Bantu (Kateter, dll)" />
                </div>
            </div>

            {{-- Aktivitas & Istirahat --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="arrow-trending-up" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Aktivitas, Istirahat & Tidur</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_aktivitas', {{ json_encode(['olahraga' => 'Rutin', 'alat_bantu' => 'Tidak ada', 'gangguan' => 'Tidak ada', 'durasi_hari' => '8 jam', 'jam_kerja' => '8 jam', 'keterampilan' => 'Baik', 'saat_sakit' => 'Mandiri']) }})" size="xs" variant="ghost">Set Normal</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_aktivitas.saat_sakit" label="Aktivitas Saat Sakit (Mandiri/Dibantu)" />
                    <flux:input wire:model="biologis_aktivitas.alat_bantu" label="Alat Bantu Gerak" />
                    <flux:input wire:model="biologis_tidur.pola" label="Pola Tidur Malam" />
                    <flux:input wire:model="biologis_tidur.gangguan" label="Gangguan Tidur" />
                    <flux:input wire:model="biologis_istirahat.kapan" label="Waktu Istirahat (Siang)" />
                    <flux:input wire:model="biologis_istirahat.durasi" label="Durasi Istirahat" />
                </div>
            </div>

            {{-- Kardiovaskuler --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="heart" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Kardiovaskuler</h3>
                    </div>
                    <flux:button wire:click="$set('biologis_kardiovaskuler', {{ json_encode(['cepat_lelah' => 'Tidak', 'nyeri_dada' => 'Tidak ada', 'alat_pacu' => 'Tidak ada', 'obat' => 'Tidak ada']) }})" size="xs" variant="ghost">Set Normal</flux:button>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_kardiovaskuler.cepat_lelah" label="Mudah Lelah saat Aktivitas?" />
                    <flux:input wire:model="biologis_kardiovaskuler.nyeri_dada" label="Riwayat Nyeri Dada" />
                    <flux:input wire:model="biologis_kardiovaskuler.obat" label="Obat Jantung yang Dikonsumsi" />
                </div>
            </div>

            {{-- Personal Hygiene & Seksualitas --}}
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
                    <div class="flex items-center gap-2">
                        <flux:icon icon="user" class="size-4 text-[#2E86C1]" />
                        <h3 class="font-bold text-[#1B4F72]">Personal Hygiene & Seksualitas</h3>
                    </div>
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="biologis_hygiene.pola_mandi" label="Frekuensi Mandi" />
                    <flux:input wire:model="biologis_hygiene.bantuan" label="Bantuan Mandi Saat Sakit" />
                    <flux:input wire:model="biologis_seksualitas.kesulitan" label="Gangguan Fungsi Seksual" />
                    <flux:input wire:model="biologis_seksualitas.pengaruh_sakit" label="Pengaruh Penyakit" />
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <flux:button wire:click="lanjutkanTab('psikososial')" variant="ghost" icon-trailing="arrow-right">Lanjut ke Psikososial</flux:button>
            </div>
        </div>
    @endif

    {{-- ── Tab: Psikososial ── --}}
    @if ($tab === 'psikososial')
        <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
            <flux:heading size="lg">Psikososial & Spiritual</flux:heading>
            <flux:button wire:click="setNormal('psikososial')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-6">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Psikologi & Emosional</h3>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="psiko_emosi.ekspresi" label="Ekspresi Wajah" />
                    <flux:input wire:model="psiko_emosi.suasana_hati" label="Suasana Hati" />
                    <flux:textarea wire:model="psiko_emosi.saat_marah_sedih" label="Saat Marah/Sedih apa yang dilakukan?" rows="2" class="sm:col-span-2" />
                </div>
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Spiritual</h3>
                <div class="grid gap-4">
                    <flux:input wire:model="psiko_spiritual.agama" label="Agama / Keyakinan" />
                    <flux:input wire:model="psiko_spiritual.hambatan_ibadah" label="Hambatan Ibadah saat Sakit" />
                    <flux:input wire:model="psiko_spiritual.hubungan_tuhan" label="Hubungan dengan Tuhan" />
                </div>
            </div>

            <div class="mt-4 flex justify-end">
                <flux:button wire:click="lanjutkanTab('fisik')" variant="ghost" icon-trailing="arrow-right">Lanjut ke Pemeriksaan Fisik</flux:button>
            </div>
        </div>
    @endif

    {{-- ── Tab: Fisik ── --}}
    @if ($tab === 'fisik')
        <div class="mb-4 flex flex-wrap items-center justify-between gap-3">
            <flux:heading size="lg">Pemeriksaan Fisik (Head to Toe)</flux:heading>
            <flux:button wire:click="setNormal('fisik')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-5 pb-8">
            <div class="rounded-2xl border border-[#E0EBF5] dark:border-zinc-700 bg-white p-3 sm:p-4">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Keadaan Umum</h3>
                <flux:textarea wire:model="fisik_umum" label="Deskripsi umum pasien (tampak sakit, pucat, dll.)" rows="2" />
            </div>

            @include('partials.pengkajian-fisik')
        </div>
    @endif

    {{-- ── Navigation Buttons ── --}}
    <div class="mt-6 flex items-center justify-between gap-3 border-t border-[#E0EBF5] dark:border-zinc-700 pt-4">
        <flux:button
            :href="route('mahasiswa.pasien.show', $askep->pasien_id)"
            variant="ghost"
            icon="arrow-left"
            wire:navigate
        >
            Kembali
        </flux:button>

        <div class="flex items-center gap-2 sm:gap-3">
            <button
                wire:click="simpan"
                wire:loading.attr="disabled"
                class="hidden sm:block rounded-xl border border-[#85B7EB] px-4 py-2 text-sm font-semibold text-[#2E86C1] hover:bg-[#EBF5FB] transition"
            >
                <span wire:loading.remove wire:target="simpan">Simpan</span>
                <span wire:loading wire:target="simpan">Menyimpan...</span>
            </button>

            <button
                wire:click="simpanLanjut"
                wire:loading.attr="disabled"
                class="inline-flex items-center gap-2 rounded-xl px-4 sm:px-5 py-2 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <span wire:loading.remove wire:target="simpanLanjut">
                    <span class="sm:hidden">Simpan & Lanjut</span>
                    <span class="hidden sm:inline">Simpan & Lanjut ke Diagnosa</span>
                </span>
                <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
                <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
            </button>
        </div>
    </div>
</div>
