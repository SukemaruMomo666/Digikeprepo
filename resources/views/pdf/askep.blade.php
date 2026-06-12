<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Asuhan Keperawatan - {{ $askep->pasien->nama_pasien }}</title>
    <style>
        @page { margin: 1.5cm 1.5cm 1.5cm 2cm; }
        * { box-sizing: border-box; }
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            font-size: 10pt;
            line-height: 1.4;
            color: #222;
        }
        .page-break { page-break-before: always; }

        /* ── Header ── */
        .header {
            text-align: center;
            border-bottom: 3px double #1B4F72;
            padding-bottom: 10px;
            margin-bottom: 18px;
        }
        .header h1 {
            font-size: 15pt;
            color: #1B4F72;
            margin: 0 0 4px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .header p { font-size: 9.5pt; margin: 2px 0; color: #555; }

        /* ── Section ── */
        .section { margin-bottom: 18px; }
        .section-title {
            background-color: #1B4F72;
            color: #fff;
            padding: 5px 10px;
            font-weight: bold;
            font-size: 10.5pt;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }
        .sub-title {
            background-color: #D6EAF8;
            border-left: 3px solid #2E86C1;
            padding: 3px 8px;
            font-weight: bold;
            font-size: 9.5pt;
            color: #1B4F72;
            margin: 8px 0 5px;
        }
        .sub-sub-title {
            font-weight: bold;
            font-size: 9pt;
            color: #1B4F72;
            border-bottom: 1px solid #D0DCE8;
            padding-bottom: 2px;
            margin: 6px 0 4px;
        }

        /* ── Tables ── */
        table { width: 100%; border-collapse: collapse; margin-bottom: 8px; }
        th, td { border: 1px solid #C8D6E5; padding: 5px 7px; text-align: left; vertical-align: top; font-size: 9.5pt; }
        th { background-color: #EBF5FB; font-weight: bold; color: #1B4F72; }
        td.label { width: 160px; color: #555; font-weight: bold; background-color: #F8FBFE; }

        /* ── Info Grid (no border) ── */
        .info-table { width: 100%; border-collapse: collapse; margin-bottom: 6px; }
        .info-table td { border: none; padding: 2px 4px; font-size: 9.5pt; }
        .info-table .lbl { width: 150px; color: #666; font-weight: bold; }
        .info-table .colon { width: 10px; }
        .info-table .val { color: #111; }

        /* ── Diagnosa Card ── */
        .diagnosa-card {
            border: 1px solid #2E86C1;
            border-radius: 4px;
            margin-bottom: 14px;
            page-break-inside: avoid;
        }
        .diagnosa-header {
            background-color: #1B4F72;
            color: #fff;
            padding: 5px 10px;
            font-weight: bold;
            font-size: 9.5pt;
        }
        .diagnosa-body { padding: 8px 10px; }

        /* ── Evaluasi Card ── */
        .eval-card {
            border: 1px solid #D0DCE8;
            border-radius: 4px;
            margin-bottom: 12px;
            page-break-inside: avoid;
        }
        .eval-header {
            background-color: #EBF5FB;
            padding: 4px 10px;
            font-weight: bold;
            color: #1B4F72;
            font-size: 9pt;
            border-bottom: 1px solid #D0DCE8;
        }
        .eval-body { padding: 8px 10px; }

        /* ── SOAP ── */
        .soap-row { display: table; width: 100%; }
        .soap-label { display: table-cell; width: 30px; font-weight: bold; color: #1B4F72; font-size: 9.5pt; vertical-align: top; padding: 2px 0; }
        .soap-content { display: table-cell; font-size: 9.5pt; vertical-align: top; padding: 2px 4px; }

        /* ── Fisik ── */
        .fisik-normal { color: #1A9B72; font-weight: bold; font-size: 8.5pt; }
        .fisik-abnormal { color: #e74c3c; font-weight: bold; font-size: 8.5pt; }

        /* ── Badge ── */
        .badge { display: inline-block; padding: 1px 6px; border-radius: 3px; font-size: 8pt; font-weight: bold; color: #fff; }
        .badge-blue { background-color: #2E86C1; }
        .badge-green { background-color: #1A9B72; }
        .badge-amber { background-color: #f39c12; }
        .badge-red { background-color: #e74c3c; }

        /* ── Footer / TTD ── */
        .footer { margin-top: 40px; }
        .ttd-table { width: 100%; border-collapse: collapse; }
        .ttd-table td { border: none; text-align: center; padding: 5px 10px; vertical-align: top; }
        .ttd-line { margin-top: 55px; border-top: 1px solid #333; padding-top: 4px; font-size: 9.5pt; }

        .two-col { display: table; width: 100%; }
        .col-half { display: table-cell; width: 50%; vertical-align: top; padding-right: 6px; }
        .col-half:last-child { padding-right: 0; padding-left: 6px; }
    </style>
</head>
<body>

{{-- ═══════════════════════════════════════════
     HEADER
═══════════════════════════════════════════ --}}
<div class="header">
    <h1>Laporan Asuhan Keperawatan</h1>
    <p>Politeknik Negeri Subang &mdash; Program Studi Keperawatan</p>
    <p style="font-size:8.5pt;color:#888;">Dicetak: {{ now()->translatedFormat('d F Y, H:i') }}</p>
</div>

{{-- ═══════════════════════════════════════════
     A. IDENTITAS PASIEN
═══════════════════════════════════════════ --}}
@php $pas = $askep->pasien; @endphp
<div class="section">
    <div class="section-title">A. Identitas Pasien</div>
    <table class="info-table">
        <tr>
            <td class="lbl">Nama Pasien</td><td class="colon">:</td>
            <td class="val" style="width:35%"><strong>{{ $pas->nama_pasien }}</strong></td>
            <td class="lbl">No. Rekam Medis</td><td class="colon">:</td>
            <td class="val"><strong>{{ $pas->no_rm }}</strong></td>
        </tr>
        <tr>
            <td class="lbl">Jenis Kelamin</td><td class="colon">:</td>
            <td class="val">{{ $pas->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</td>
            <td class="lbl">Tanggal Lahir</td><td class="colon">:</td>
            <td class="val">{{ $pas->tanggal_lahir?->translatedFormat('d F Y') ?: '-' }}</td>
        </tr>
        <tr>
            <td class="lbl">Umur</td><td class="colon">:</td>
            <td class="val">{{ $pas->umur ?? '-' }} tahun</td>
            <td class="lbl">Agama</td><td class="colon">:</td>
            <td class="val">{{ $pas->agama ?? '-' }}</td>
        </tr>
        <tr>
            <td class="lbl">Status Perkawinan</td><td class="colon">:</td>
            <td class="val">{{ $pas->status_perkawinan ?? '-' }}</td>
            <td class="lbl">Pekerjaan</td><td class="colon">:</td>
            <td class="val">{{ $pas->pekerjaan ?? '-' }}</td>
        </tr>
        <tr>
            <td class="lbl">Pendidikan</td><td class="colon">:</td>
            <td class="val">{{ $pas->pendidikan ?? '-' }}</td>
            <td class="lbl">BB / TB</td><td class="colon">:</td>
            <td class="val">{{ $pas->bb ?? '-' }} kg / {{ $pas->tb ?? '-' }} cm</td>
        </tr>
        <tr>
            <td class="lbl">Ruang Rawat</td><td class="colon">:</td>
            <td class="val">{{ $pas->ruang_rawat ?? '-' }}</td>
            <td class="lbl">Tanggal Masuk</td><td class="colon">:</td>
            <td class="val">{{ $pas->tanggal_masuk?->translatedFormat('d F Y') ?: '-' }}</td>
        </tr>
        <tr>
            <td class="lbl">Diagnosa Medis</td><td class="colon">:</td>
            <td class="val" colspan="3"><strong style="color:#B03A2E">{{ $pas->diagnosa_medis ?? '-' }}</strong></td>
        </tr>
        <tr>
            <td class="lbl">Alamat</td><td class="colon">:</td>
            <td class="val" colspan="3">{{ $pas->alamat ?? '-' }}</td>
        </tr>
    </table>
</div>

{{-- ═══════════════════════════════════════════
     B. IDENTITAS MAHASISWA
═══════════════════════════════════════════ --}}
@php
    $mhs = $askep->user;
    $penugasan = \App\Models\Penugasan::where('mahasiswa_id', $mhs->id)->latest()->first();
    $dosenPembimbing = $penugasan ? \App\Models\User::find($penugasan->dosen_id) : null;
@endphp
<div class="section">
    <div class="section-title">B. Identitas Mahasiswa</div>
    <table class="info-table">
        <tr>
            <td class="lbl">Nama Mahasiswa</td><td class="colon">:</td>
            <td class="val" style="width:35%"><strong>{{ $mhs->name }}</strong></td>
            <td class="lbl">NIM</td><td class="colon">:</td>
            <td class="val"><strong>{{ $mhs->nim_nip }}</strong></td>
        </tr>
        <tr>
            <td class="lbl">Dosen Pembimbing</td><td class="colon">:</td>
            <td class="val">{{ $dosenPembimbing?->name ?? '-' }}</td>
            <td class="lbl">NIP Pembimbing</td><td class="colon">:</td>
            <td class="val">{{ $dosenPembimbing?->nim_nip ?? '-' }}</td>
        </tr>
        @if($penugasan)
        <tr>
            <td class="lbl">Stase / RS</td><td class="colon">:</td>
            <td class="val">{{ $penugasan->stase ?? '-' }} / {{ $penugasan->rs ?? '-' }}</td>
            <td class="lbl">Bangsal</td><td class="colon">:</td>
            <td class="val">{{ $penugasan->bangsal ?? '-' }}</td>
        </tr>
        @endif
    </table>
</div>

{{-- ═══════════════════════════════════════════
     1. PENGKAJIAN
═══════════════════════════════════════════ --}}
<div class="section">
    <div class="section-title">1. Pengkajian Keperawatan</div>

    @if($askep->pengkajian)
        @php $p = $askep->pengkajian; @endphp

        {{-- ── Identitas Penanggung Jawab ── --}}
        <div class="sub-title">1.1 Identitas Penanggung Jawab</div>
        <table class="info-table">
            <tr>
                <td class="lbl">Nama PJ</td><td class="colon">:</td>
                <td class="val" style="width:35%">{{ $p->pj_nama ?? '-' }}</td>
                <td class="lbl">Umur</td><td class="colon">:</td>
                <td class="val">{{ $p->pj_umur ? $p->pj_umur . ' tahun' : '-' }}</td>
            </tr>
            <tr>
                <td class="lbl">Pendidikan</td><td class="colon">:</td>
                <td class="val">{{ $p->pj_pendidikan ?? '-' }}</td>
                <td class="lbl">Pekerjaan</td><td class="colon">:</td>
                <td class="val">{{ $p->pj_pekerjaan ?? '-' }}</td>
            </tr>
            <tr>
                <td class="lbl">Alamat</td><td class="colon">:</td>
                <td class="val" colspan="3">{{ $p->pj_alamat ?? '-' }}</td>
            </tr>
        </table>

        {{-- ── EWS & TTV ── --}}
        <div class="sub-title">1.2 Tanda-Tanda Vital & Early Warning Score (EWS)</div>
        <table>
            <tr>
                <th>Tekanan Darah</th>
                <th>Nadi</th>
                <th>RR</th>
                <th>Suhu</th>
                <th>SpO2</th>
                <th>Tingkat Kesadaran</th>
                <th style="background:#D4E6F1">Skor EWS</th>
            </tr>
            <tr>
                <td>{{ $p->ews_td ?: '-' }} mmHg</td>
                <td>{{ $p->ews_nadi ?: '-' }} x/mnt</td>
                <td>{{ $p->ews_rr ?: '-' }} x/mnt</td>
                <td>{{ $p->ews_suhu ?: '-' }} °C</td>
                <td>{{ $p->ews_spo2 ?: '-' }} %</td>
                <td style="text-transform:capitalize">{{ $p->ews_kesadaran ?: '-' }}</td>
                <td style="font-weight:bold;font-size:11pt;text-align:center">
                    @php $skor = $p->ews_skor ?? 0; @endphp
                    <span class="badge {{ $skor >= 7 ? 'badge-red' : ($skor >= 5 ? 'badge-amber' : ($skor >= 3 ? 'badge-blue' : 'badge-green')) }}">{{ $skor }}</span>
                </td>
            </tr>
        </table>
        @if($p->bb || $p->tb)
        <p style="margin:4px 0;font-size:9pt;"><strong>Antropometri:</strong> BB {{ $p->bb ?? '-' }} kg &nbsp;/&nbsp; TB {{ $p->tb ?? '-' }} cm</p>
        @endif

        {{-- ── Riwayat Penyakit Sekarang ── --}}
        <div class="sub-title">1.3 Riwayat Penyakit Sekarang</div>
        @php $rs = is_array($p->riwayat_sekarang) ? $p->riwayat_sekarang : []; @endphp
        <table>
            <tr><td class="label">Keluhan Utama</td><td>{{ $rs['keluhan_utama'] ?? '-' }}</td></tr>
            <tr><td class="label">Kronologi / Perjalanan Penyakit</td><td>{{ $rs['kronologi'] ?? '-' }}</td></tr>
            <tr><td class="label">Harapan Pasien</td><td>{{ $rs['harapan'] ?? '-' }}</td></tr>
        </table>

        {{-- ── Riwayat Penyakit Lalu ── --}}
        <div class="sub-title">1.4 Riwayat Penyakit Lalu</div>
        @php $rl = is_array($p->riwayat_lalu) ? $p->riwayat_lalu : []; @endphp
        <table>
            <tr><td class="label">Penyakit Masa Anak</td><td>{{ $rl['penyakit_anak'] ?? '-' }}</td></tr>
            <tr><td class="label">Alergi (obat/makanan)</td><td>{{ $rl['alergi'] ?? '-' }}</td></tr>
            <tr><td class="label">Pengalaman Dirawat</td><td>{{ $rl['pengalaman_dirawat'] ?? '-' }}</td></tr>
            <tr><td class="label">Pengobatan / Obat Terakhir</td><td>{{ $rl['pengobatan_terakhir'] ?? '-' }}</td></tr>
        </table>

        {{-- ── Riwayat Penyakit Keluarga ── --}}
        <div class="sub-title">1.5 Riwayat Penyakit Keluarga</div>
        @php $rk = is_array($p->riwayat_keluarga) ? $p->riwayat_keluarga : []; @endphp
        <table>
            <tr><td class="label">Jumlah Anggota Keluarga</td><td>{{ $rk['jumlah_anggota'] ?? '-' }}</td></tr>
            <tr><td class="label">Penyakit Serupa dalam Keluarga</td><td>{{ $rk['penyakit_serupa'] ?? '-' }}</td></tr>
            <tr><td class="label">Penyakit Menurun (DM, HT, dll.)</td><td>{{ $rk['penyakit_menurun'] ?? '-' }}</td></tr>
            <tr><td class="label">Efek Sakit terhadap Keluarga</td><td>{{ $rk['efek_sakit'] ?? '-' }}</td></tr>
        </table>

        {{-- ── Pola Biologis ── --}}
        <div class="sub-title">1.6 Pola Kebutuhan Biologis</div>
        @php
            $biologisList = [
                'biologis_nyeri' => ['label' => 'Nyeri', 'fields' => [
                    'lokasi' => 'Lokasi', 'p' => 'P (Pemicu)', 'q' => 'Q (Kualitas)',
                    'r' => 'R (Radiasi)', 's' => 'S (Skala)', 't' => 'T (Waktu)',
                    'ganggu_aktivitas' => 'Mengganggu Aktivitas', 'cara_atasi' => 'Cara Mengatasi',
                    'efektif' => 'Efektifitas', 'riwayat_bedah' => 'Riwayat Bedah',
                ]],
                'biologis_aktivitas' => ['label' => 'Aktivitas & Latihan', 'fields' => [
                    'saat_sakit' => 'Aktivitas Saat Sakit', 'alat_bantu' => 'Alat Bantu Gerak',
                    'olahraga' => 'Olahraga', 'gangguan' => 'Gangguan',
                    'durasi_hari' => 'Durasi/Hari', 'jam_kerja' => 'Jam Kerja',
                    'keterampilan' => 'Keterampilan',
                ]],
                'biologis_istirahat' => ['label' => 'Istirahat', 'fields' => [
                    'kapan' => 'Waktu Istirahat', 'durasi' => 'Durasi',
                    'kegiatan_luang' => 'Kegiatan Luang', 'waktu_khusus' => 'Waktu Khusus',
                    'saat_sakit' => 'Saat Sakit',
                ]],
                'biologis_tidur' => ['label' => 'Tidur', 'fields' => [
                    'pola' => 'Pola Tidur', 'obat_penenang' => 'Obat Penenang',
                    'kegiatan_menjelang' => 'Kegiatan Menjelang Tidur',
                    'sering_terjaga' => 'Sering Terjaga', 'gangguan' => 'Gangguan Tidur',
                ]],
                'biologis_cairan' => ['label' => 'Cairan & Elektrolit', 'fields' => [
                    'jumlah_minum' => 'Jumlah Minum/Hari', 'jenis_minuman' => 'Jenis Minuman',
                    'alkohol' => 'Alkohol', 'pembatasan' => 'Pembatasan Cairan',
                ]],
                'biologis_nutrisi' => ['label' => 'Nutrisi & Metabolisme', 'fields' => [
                    'pola_makan' => 'Pola Makan', 'alergi' => 'Alergi Makanan',
                    'kesulitan_menelan' => 'Kesulitan Menelan', 'kondisi_gigi' => 'Kondisi Gigi',
                    'riwayat_bedah' => 'Riwayat Bedah',
                ]],
                'biologis_eliminasi_feses' => ['label' => 'Eliminasi Feses (BAB)', 'fields' => [
                    'pola_defekasi' => 'Pola Defekasi', 'karakteristik' => 'Karakteristik',
                    'obat_pencahar' => 'Obat Pencahar', 'kesulitan' => 'Kesulitan',
                    'alat_bantu' => 'Alat Bantu',
                ]],
                'biologis_eliminasi_urine' => ['label' => 'Eliminasi Urine (BAK)', 'fields' => [
                    'pola_miksi' => 'Pola Miksi', 'karakteristik' => 'Karakteristik',
                    'perubahan' => 'Perubahan', 'alat_bantu' => 'Alat Bantu',
                ]],
                'biologis_oksigenasi' => ['label' => 'Oksigenasi & Pernapasan', 'fields' => [
                    'kesulitan_napas' => 'Kesulitan Bernapas', 'alat_bantu' => 'Alat Bantu O₂',
                    'posisi_nyaman' => 'Posisi Nyaman', 'merokok' => 'Merokok',
                    'riwayat_sakit' => 'Riwayat Penyakit Paru',
                ]],
                'biologis_kardiovaskuler' => ['label' => 'Kardiovaskuler', 'fields' => [
                    'cepat_lelah' => 'Cepat Lelah', 'nyeri_dada' => 'Nyeri Dada',
                    'alat_pacu' => 'Alat Pacu Jantung', 'obat' => 'Obat Jantung',
                ]],
                'biologis_hygiene' => ['label' => 'Hygiene & Kebersihan Diri', 'fields' => [
                    'pola_mandi' => 'Pola Mandi', 'gosok_gigi' => 'Gosok Gigi',
                    'cuci_rambut' => 'Cuci Rambut', 'bantuan' => 'Bantuan',
                ]],
                'biologis_seksualitas' => ['label' => 'Seksualitas & Reproduksi', 'fields' => [
                    'kesulitan' => 'Kesulitan', 'pengaruh_sakit' => 'Pengaruh Sakit',
                ]],
            ];
        @endphp

        <table>
            <tr>
                <th style="width:180px">Pola Kebutuhan</th>
                <th>Data Pengkajian</th>
            </tr>
            @foreach($biologisList as $field => $meta)
                @php $data = is_array($p->$field) ? $p->$field : []; @endphp
                <tr>
                    <td style="font-weight:bold;color:#1B4F72;vertical-align:top">{{ $meta['label'] }}</td>
                    <td>
                        @if(empty($data))
                            <em style="color:#999">Belum diisi</em>
                        @else
                            @foreach($meta['fields'] as $key => $lbl)
                                @if(!empty($data[$key]))
                                    <span style="color:#666;font-size:8.5pt">{{ $lbl }}:</span>
                                    <span style="margin-right:10px">{{ $data[$key] }}</span>
                                @endif
                            @endforeach
                        @endif
                    </td>
                </tr>
            @endforeach
        </table>

        {{-- ── Psikososial ── --}}
        <div class="sub-title">1.7 Psikososial & Spiritual</div>
        <table>
            <tr>
                <th style="width:180px">Aspek</th>
                <th>Temuan</th>
            </tr>
            @php
                $psikoList = [
                    'psiko_emosi' => ['label' => 'Emosi', 'fields' => [
                        'ekspresi' => 'Ekspresi Wajah', 'suasana_hati' => 'Suasana Hati',
                        'saat_marah_sedih' => 'Saat Marah/Sedih',
                    ]],
                    'psiko_konsep_diri' => ['label' => 'Konsep Diri', 'fields' => [
                        'pandangan_diri' => 'Pandangan Diri', 'hal_disukai' => 'Hal Disukai',
                        'kekuatan_kelemahan' => 'Kekuatan & Kelemahan',
                    ]],
                    'psiko_sosial' => ['label' => 'Sosial', 'fields' => [
                        'teman_dekat' => 'Teman Dekat', 'kegiatan_masyarakat' => 'Kegiatan Masyarakat',
                        'pekerjaan_sesuai' => 'Pekerjaan Sesuai',
                    ]],
                    'psiko_spiritual' => ['label' => 'Spiritual', 'fields' => [
                        'agama' => 'Agama', 'hambatan_ibadah' => 'Hambatan Ibadah',
                        'hubungan_tuhan' => 'Hubungan dengan Tuhan',
                    ]],
                ];
            @endphp
            @foreach($psikoList as $field => $meta)
                @php $data = is_array($p->$field) ? $p->$field : []; @endphp
                <tr>
                    <td style="font-weight:bold;color:#1B4F72">{{ $meta['label'] }}</td>
                    <td>
                        @if(empty($data))
                            <em style="color:#999">Belum diisi</em>
                        @else
                            @foreach($meta['fields'] as $key => $lbl)
                                @if(!empty($data[$key]))
                                    <span style="color:#666;font-size:8.5pt">{{ $lbl }}:</span>
                                    <span style="margin-right:10px">{{ $data[$key] }}</span>
                                @endif
                            @endforeach
                        @endif
                    </td>
                </tr>
            @endforeach
        </table>

        {{-- ── Pemeriksaan Fisik ── --}}
        <div class="sub-title">1.8 Pemeriksaan Fisik Sistem</div>
        @if($p->fisik_umum)
            <p style="margin:0 0 5px;font-size:9.5pt;"><strong>Keadaan Umum:</strong> {{ $p->fisik_umum }}</p>
        @endif
        @php
            $fisikSistem = [
                'fisik_penglihatan'   => 'Penglihatan (Mata)',
                'fisik_pendengaran'   => 'Pendengaran (Telinga)',
                'fisik_wicara'        => 'Wicara',
                'fisik_pernapasan'    => 'Pernapasan (Paru)',
                'fisik_kardiovaskuler'=> 'Kardiovaskuler (Jantung)',
                'fisik_hematologi'    => 'Hematologi',
                'fisik_saraf'         => 'Saraf (Neurologis)',
                'fisik_pencernaan'    => 'Pencernaan (Abdomen)',
                'fisik_endokrin'      => 'Endokrin',
                'fisik_urogenital'    => 'Urogenital',
                'fisik_integumen'     => 'Integumen (Kulit)',
                'fisik_muskuloskeletal'=> 'Muskuloskeletal',
                'fisik_imun'          => 'Imun & Alergi',
            ];
        @endphp
        <table>
            <tr>
                <th style="width:180px">Sistem</th>
                <th style="width:80px;text-align:center">Status</th>
                <th>Temuan / Observasi</th>
            </tr>
            @foreach($fisikSistem as $field => $nama)
                @php
                    $fData = is_array($p->$field) ? $p->$field : [];
                    $isAbn = $fData['is_abnormal'] ?? false;
                    $subData = $fData['data'] ?? [];
                    $observasi = is_string($subData) ? $subData : '';
                    if (is_array($subData)) {
                        $parts = [];
                        foreach ($subData as $sk => $sv) {
                            if (!empty($sv)) {
                                if (is_array($sv)) $sv = implode(', ', $sv);
                                $parts[] = ucfirst(str_replace('_', ' ', $sk)) . ': ' . $sv;
                            }
                        }
                        $observasi = implode('; ', $parts);
                    }
                @endphp
                <tr>
                    <td style="font-weight:bold;color:#1B4F72">{{ $nama }}</td>
                    <td style="text-align:center">
                        @if(empty($fData))
                            <span style="color:#999;font-size:8.5pt">—</span>
                        @elseif($isAbn)
                            <span class="fisik-abnormal">&#x26A0; Abnormal</span>
                        @else
                            <span class="fisik-normal">&#x2713; Normal</span>
                        @endif
                    </td>
                    <td style="font-size:9pt">{{ $observasi ?: '-' }}</td>
                </tr>
            @endforeach
        </table>

    @else
        <p><em>Data pengkajian belum diisi.</em></p>
    @endif
</div>

{{-- ═══════════════════════════════════════════
     2 & 3. DIAGNOSA, LUARAN (SLKI), INTERVENSI (SIKI)
═══════════════════════════════════════════ --}}
<div class="section page-break">
    <div class="section-title">2 &amp; 3. Diagnosa, Luaran &amp; Perencanaan Intervensi</div>

    @foreach($askep->diagnosa->sortBy('prioritas') as $d)
        <div class="diagnosa-card">
            <div class="diagnosa-header">
                Prioritas {{ $d->prioritas }}: {{ $d->sdki?->kode_diagnosa }} &mdash; {{ $d->sdki?->label_diagnosa }}
            </div>
            <div class="diagnosa-body">

                {{-- Etiologi --}}
                <p style="margin:0 0 4px;font-size:9pt;">
                    <strong>Berhubungan dengan (Etiologi):</strong>
                    {{ !empty($d->etiologi_dipilih) ? implode(', ', $d->etiologi_dipilih) : '-' }}
                </p>

                {{-- Gejala / Tanda Mayor & Minor --}}
                @if(!empty($d->gejala_dipilih))
                    <p style="margin:0 0 6px;font-size:9pt;">
                        <strong>Ditandai dengan (Gejala):</strong>
                        {{ implode(', ', $d->gejala_dipilih) }}
                    </p>
                @endif

                {{-- SLKI: Luaran & Kriteria Hasil --}}
                <div class="sub-sub-title">Luaran Keperawatan (SLKI)</div>
                @if($d->luaran->isEmpty())
                    <p style="font-size:9pt;color:#999"><em>Luaran belum direncanakan.</em></p>
                @else
                    @foreach($d->luaran as $l)
                        @php
                            $skorPlan = is_array($l->skor_indikator) ? $l->skor_indikator
                                       : json_decode($l->skor_indikator ?? '{}', true);
                            $kriteriaHasil = $l->slki?->kriteriaHasil ?? collect();
                            $kriteriaYangDipakai = $kriteriaHasil->filter(fn($k) => isset($skorPlan[$k->id]));
                        @endphp
                        <p style="margin:4px 0 2px;font-size:9pt;font-weight:bold;color:#1A5276;">
                            {{ $l->slki?->label_luaran ?? '(Luaran tidak ditemukan)' }}
                            @if($l->target_waktu)
                                <span style="font-weight:normal;color:#555;">&mdash; Target: {{ $l->target_waktu }}</span>
                            @endif
                        </p>
                        @if($kriteriaYangDipakai->isNotEmpty())
                            <table style="margin-bottom:6px">
                                <tr>
                                    <th style="width:55%">Kriteria Hasil</th>
                                    <th style="width:22%;text-align:center">Skor Awal</th>
                                    <th style="width:23%;text-align:center">Skor Target</th>
                                </tr>
                                @foreach($kriteriaYangDipakai as $k)
                                    <tr>
                                        <td>{{ $k->deskripsi }}</td>
                                        <td style="text-align:center">{{ $skorPlan[$k->id]['awal'] ?? '-' }}</td>
                                        <td style="text-align:center;font-weight:bold;color:#1A9B72">{{ $skorPlan[$k->id]['target'] ?? '-' }}</td>
                                    </tr>
                                @endforeach
                            </table>
                        @endif
                    @endforeach
                @endif

                {{-- SIKI: Intervensi --}}
                <div class="sub-sub-title">Intervensi Keperawatan (SIKI)</div>
                @if($d->intervensi->isEmpty())
                    <p style="font-size:9pt;color:#999"><em>Intervensi belum direncanakan.</em></p>
                @else
                    @foreach($d->intervensi as $int)
                        <p style="margin:4px 0 2px;font-size:9pt;font-weight:bold;color:#1A5276;">
                            {{ $int->siki?->label_intervensi ?: ($int->nama_manual ?? 'Intervensi Manual') }}
                            @if($int->frekuensi)
                                <span style="font-weight:normal;color:#555;">&mdash; {{ $int->frekuensi }}</span>
                            @endif
                        </p>
                        @if(!empty($int->tindakan_dipilih) && is_array($int->tindakan_dipilih))
                            <ul style="margin:2px 0 4px 18px;padding:0;font-size:9pt;">
                                @foreach($int->tindakan_dipilih as $tindakan)
                                    <li>{{ $tindakan }}</li>
                                @endforeach
                            </ul>
                        @endif
                    @endforeach
                @endif

            </div>
        </div>
    @endforeach
</div>

{{-- ═══════════════════════════════════════════
     4. IMPLEMENTASI
═══════════════════════════════════════════ --}}
<div class="section page-break">
    <div class="section-title">4. Implementasi Keperawatan</div>
    @php
        $semuaLog = collect();
        foreach ($askep->diagnosa->sortBy('prioritas') as $d) {
            foreach ($d->intervensi as $int) {
                foreach ($int->implementasi->sortBy('tanggal') as $log) {
                    $semuaLog->push([
                        'log'       => $log,
                        'diagnosa'  => $d->sdki?->label_diagnosa,
                        'intervensi'=> $int->siki?->label_intervensi ?? $int->nama_manual ?? '-',
                    ]);
                }
            }
        }
        $semuaLog = $semuaLog->sortBy(fn($item) => $item['log']->tanggal);
    @endphp
    <table>
        <thead>
            <tr>
                <th style="width:80px">Tanggal</th>
                <th style="width:50px">Waktu</th>
                <th style="width:55px">Shift</th>
                <th style="width:22%">Diagnosa</th>
                <th>Tindakan & Catatan</th>
                <th style="width:14%">Respons Pasien</th>
            </tr>
        </thead>
        <tbody>
            @forelse($semuaLog as $item)
                @php $log = $item['log']; @endphp
                <tr>
                    <td>{{ $log->tanggal->format('d/m/Y') }}</td>
                    <td>{{ $log->waktu ?? '-' }}</td>
                    <td>{{ $log->shift ?? '-' }}</td>
                    <td style="font-size:8.5pt;color:#1B4F72">{{ $item['diagnosa'] ?? '-' }}</td>
                    <td>{{ $log->catatan }}</td>
                    <td>{{ $log->respons_pasien ?: '-' }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align:center;color:#999;padding:12px">Belum ada implementasi yang dicatat.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>

{{-- ═══════════════════════════════════════════
     5. EVALUASI (SOAP + SLKI)
═══════════════════════════════════════════ --}}
<div class="section page-break">
    <div class="section-title">5. Evaluasi Keperawatan</div>

    @foreach($askep->diagnosa->sortBy('prioritas') as $d)
        @php $ev = $d->evaluasi->first(); @endphp
        <div class="eval-card">
            <div class="eval-header">
                Diagnosa Prioritas {{ $d->prioritas }}: {{ $d->sdki?->label_diagnosa }}
            </div>
            <div class="eval-body">
                @if($ev)
                    {{-- TTV Saat Evaluasi --}}
                    <p style="margin:0 0 6px;font-size:8.5pt;color:#555;">
                        <strong>TTV Evaluasi:</strong>
                        TD {{ $ev->tv_td ?: '-' }}&nbsp; | &nbsp;
                        Nadi {{ $ev->tv_nadi ?: '-' }}&nbsp; | &nbsp;
                        RR {{ $ev->tv_rr ?: '-' }}&nbsp; | &nbsp;
                        Suhu {{ $ev->tv_suhu ?: '-' }}&nbsp; | &nbsp;
                        SpO2 {{ $ev->tv_spo2 ?: '-' }}%
                        @if($ev->hari_ke) &nbsp;| &nbsp; Hari ke-{{ $ev->hari_ke }} @endif
                    </p>

                    {{-- SOAP --}}
                    <div style="margin-bottom:6px">
                        <div class="soap-row" style="margin-bottom:3px">
                            <span class="soap-label">S-O&nbsp;:</span>
                            <span class="soap-content">{{ $ev->catatan_soap ?: '-' }}</span>
                        </div>
                        <div class="soap-row" style="margin-bottom:3px">
                            <span class="soap-label">A&nbsp;:</span>
                            <span class="soap-content">
                                <strong>{{ $ev->analisisLabel() }}</strong>
                                @if($ev->analisis_narasi) &mdash; {{ $ev->analisis_narasi }} @endif
                            </span>
                        </div>
                        <div class="soap-row">
                            <span class="soap-label">P&nbsp;:</span>
                            <span class="soap-content">{{ $ev->tindak_lanjut ?: '-' }}</span>
                        </div>
                    </div>

                    {{-- Skor Indikator SLKI ── --}}
                    @if(!empty($ev->skor_indikator) && is_array($ev->skor_indikator))
                        @php
                            $luaranDiagnosa = $d->luaran->first();
                            $kriteriaEval = $luaranDiagnosa?->slki?->kriteriaHasil ?? collect();
                            $skorPlanEval = is_array($luaranDiagnosa?->skor_indikator)
                                ? $luaranDiagnosa->skor_indikator
                                : json_decode($luaranDiagnosa?->skor_indikator ?? '{}', true);
                        @endphp
                        <div class="sub-sub-title" style="margin-top:6px">Pencapaian Kriteria Hasil (SLKI)</div>
                        <table>
                            <tr>
                                <th style="width:55%">Kriteria Hasil</th>
                                <th style="width:15%;text-align:center">Awal</th>
                                <th style="width:15%;text-align:center">Target</th>
                                <th style="width:15%;text-align:center">Evaluasi</th>
                            </tr>
                            @foreach($kriteriaEval as $k)
                                @if(isset($ev->skor_indikator[$k->id]))
                                    @php
                                        $awal = $skorPlanEval[$k->id]['awal'] ?? '-';
                                        $target = $skorPlanEval[$k->id]['target'] ?? '-';
                                        $hasil = $ev->skor_indikator[$k->id];
                                        $tercapai = is_numeric($hasil) && is_numeric($target) && $hasil >= $target;
                                    @endphp
                                    <tr>
                                        <td>{{ $k->deskripsi }}</td>
                                        <td style="text-align:center">{{ $awal }}</td>
                                        <td style="text-align:center">{{ $target }}</td>
                                        <td style="text-align:center;font-weight:bold;color:{{ $tercapai ? '#1A9B72' : '#e74c3c' }}">
                                            {{ $hasil }}
                                        </td>
                                    </tr>
                                @endif
                            @endforeach
                        </table>
                    @endif

                    @if($ev->penanggung_jawab)
                        <p style="margin:4px 0 0;font-size:8.5pt;color:#555;">
                            <strong>Penanggung Jawab Evaluasi:</strong> {{ $ev->penanggung_jawab }}
                        </p>
                    @endif
                    @if($ev->komplikasi)
                        <p style="margin:4px 0 0;font-size:8.5pt;color:#B03A2E;">
                            <strong>Komplikasi / Catatan Khusus:</strong> {{ $ev->komplikasi }}
                        </p>
                    @endif
                @else
                    <p style="color:#999;font-style:italic;font-size:9pt">Evaluasi belum dilakukan untuk diagnosa ini.</p>
                @endif
            </div>
        </div>
    @endforeach
</div>

{{-- ═══════════════════════════════════════════
     CATATAN DOSEN (jika ada)
═══════════════════════════════════════════ --}}
@if($askep->catatan_dosen)
<div class="section">
    <div class="section-title">Catatan / Feedback Dosen Pembimbing</div>
    <div style="border:1px solid #f39c12;border-radius:4px;background:#FEFAF0;padding:10px;">
        <p style="margin:0;font-size:9.5pt;color:#7D6608;">{{ $askep->catatan_dosen }}</p>
    </div>
</div>
@endif

{{-- ═══════════════════════════════════════════
     TANDA TANGAN
═══════════════════════════════════════════ --}}
<div class="footer">
    <p style="font-size:8.5pt;color:#888;margin-bottom:15px">
        Dokumen ini dicetak secara otomatis oleh Sistem DIGIKEP pada {{ now()->translatedFormat('d F Y, H:i') }} WIB.
    </p>
    <table class="ttd-table">
        <tr>
            <td style="width:50%">
                <div style="text-align:center">
                    <p style="margin:0 0 3px;font-size:9.5pt">Mengetahui, Dosen Pembimbing</p>
                    <p style="margin:0 0 3px;font-size:9pt;color:#555">{{ $penugasan?->rs ?? 'Politeknik Negeri Subang' }}</p>
                    <div class="ttd-line">
                        <strong>{{ $dosenPembimbing?->name ?? '.........................................' }}</strong><br>
                        <span style="font-size:8.5pt">NIP. {{ $dosenPembimbing?->nim_nip ?? '.........................................' }}</span>
                    </div>
                </div>
            </td>
            <td style="width:50%">
                <div style="text-align:center">
                    <p style="margin:0 0 3px;font-size:9.5pt">Mahasiswa,</p>
                    <p style="margin:0 0 3px;font-size:9pt;color:#555">{{ $penugasan?->rs ?? 'Politeknik Negeri Subang' }}</p>
                    <div class="ttd-line">
                        <strong>{{ $mhs->name }}</strong><br>
                        <span style="font-size:8.5pt">NIM. {{ $mhs->nim_nip }}</span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

</body>
</html>
