<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Asuhan Keperawatan - {{ $askep->pasien->nama_pasien }}</title>
    <style>
        @page {
            margin: 1cm;
        }
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            font-size: 11pt;
            line-height: 1.4;
            color: #333;
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #1B4F72;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 16pt;
            color: #1B4F72;
            margin: 0;
            text-transform: uppercase;
        }
        .header p {
            font-size: 10pt;
            margin: 5px 0 0;
            color: #555;
        }
        .section {
            margin-bottom: 20px;
        }
        .section-title {
            background-color: #F8FBFE;
            border-left: 4px solid #1B4F72;
            padding: 5px 10px;
            font-weight: bold;
            color: #1B4F72;
            margin-bottom: 10px;
            text-transform: uppercase;
            font-size: 12pt;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        th, td {
            border: 1px solid #D0DCE8;
            padding: 8px;
            text-align: left;
            vertical-align: top;
        }
        th {
            background-color: #F4F8FB;
            font-weight: bold;
            font-size: 10pt;
        }
        .info-grid {
            width: 100%;
            margin-bottom: 15px;
        }
        .info-grid td {
            border: none;
            padding: 3px 0;
        }
        .label {
            width: 150px;
            color: #7A8FA6;
            font-size: 10pt;
            font-weight: bold;
        }
        .value {
            font-weight: normal;
        }
        .badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 9pt;
            font-weight: bold;
            color: white;
        }
        .badge-blue { background-color: #2E86C1; }
        .badge-green { background-color: #1A9B72; }
        .badge-amber { background-color: #f39c12; }
        .badge-red { background-color: #e74c3c; }
        
        .footer {
            margin-top: 50px;
            text-align: right;
            font-size: 10pt;
        }
        .signature-box {
            display: inline-block;
            width: 250px;
            text-align: center;
        }
        .signature-line {
            margin-top: 60px;
            border-top: 1px solid #333;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Laporan Asuhan Keperawatan</h1>
        <p>Politeknik Negeri Subang - Program Studi Keperawatan</p>
    </div>

    <div class="section">
        <div class="section-title">Identitas Pasien & Askep</div>
        <table class="info-grid">
            <tr>
                <td class="label">Nama Pasien</td>
                <td class="value">: {{ $askep->pasien->nama_pasien }}</td>
                <td class="label">No. RM</td>
                <td class="value">: {{ $askep->pasien->no_rm }}</td>
            </tr>
            <tr>
                <td class="label">Jenis Kelamin</td>
                <td class="value">: {{ $askep->pasien->jenis_kelamin === 'L' ? 'Laki-laki' : 'Perempuan' }}</td>
                <td class="label">Tanggal Lahir</td>
                <td class="value">: {{ $askep->pasien->tanggal_lahir?->format('d/m/Y') ?: '-' }}</td>
            </tr>
            <tr>
                <td class="label">Ruang Rawat</td>
                <td class="value">: {{ $askep->pasien->ruang_rawat ?? '-' }}</td>
                <td class="label">Tgl Masuk RS</td>
                <td class="value">: {{ $askep->pasien->tanggal_masuk?->format('d/m/Y') ?: '-' }}</td>
            </tr>
            <tr>
                <td class="label">Diagnosa Medis</td>
                <td class="value" colspan="3">: {{ $askep->pasien->diagnosa_medis ?? '-' }}</td>
            </tr>
            <tr>
                <td class="label">Mahasiswa</td>
                <td class="value">: {{ $askep->user->name }}</td>
                <td class="label">NIM</td>
                <td class="value">: {{ $askep->user->username }}</td>
            </tr>
        </table>
    </div>

    <div class="section">
        <div class="section-title">1. Pengkajian (Data Fokus)</div>
        @if($askep->pengkajian)
            @php $p = $askep->pengkajian; @endphp
            <p><strong>Tanda-Tanda Vital (EWS):</strong></p>
            <table>
                <tr>
                    <th>Tekanan Darah</th>
                    <th>Nadi</th>
                    <th>RR</th>
                    <th>Suhu</th>
                    <th>SpO2</th>
                    <th>Skor EWS</th>
                </tr>
                <tr>
                    <td>{{ $p->ews_td ?: '-' }} mmHg</td>
                    <td>{{ $p->ews_nadi ?: '-' }} x/mnt</td>
                    <td>{{ $p->ews_rr ?: '-' }} x/mnt</td>
                    <td>{{ $p->ews_suhu ?: '-' }} °C</td>
                    <td>{{ $p->ews_spo2 ?: '-' }} %</td>
                    <td>{{ $p->ews_skor ?: '0' }}</td>
                </tr>
            </table>

            <p><strong>Keluhan Utama:</strong> {{ is_array($p->riwayat_sekarang) ? ($p->riwayat_sekarang['keluhan_utama'] ?? '-') : '-' }}</p>
            
            <p><strong>Ringkasan Masalah Biologis:</strong></p>
            <table>
                <tr>
                    <th>Pola</th>
                    <th>Keterangan / Temuan</th>
                </tr>
                @foreach(['biologis_nyeri' => 'Nyeri', 'biologis_nutrisi' => 'Nutrisi', 'biologis_eliminasi_feses' => 'Eliminasi Feses', 'biologis_oksigenasi' => 'Oksigenasi'] as $field => $label)
                    <tr>
                        <td>{{ $label }}</td>
                        <td>{{ is_array($p->$field) ? ($p->$field['keterangan'] ?? 'Normal') : 'Normal' }}</td>
                    </tr>
                @endforeach
            </table>
        @else
            <p>Data pengkajian belum diisi.</p>
        @endif
    </div>

    <div class="section">
        <div class="section-title">2 & 3. Diagnosa & Perencanaan</div>
        @foreach($askep->diagnosa->sortBy('prioritas') as $d)
            <div style="margin-bottom: 15px; border: 1px solid #D0DCE8; padding: 10px; border-radius: 5px;">
                <p style="margin-top: 0;"><strong>Prioritas {{ $d->prioritas }}: {{ $d->sdki?->kode_diagnosa }} - {{ $d->sdki?->label_diagnosa }}</strong></p>
                <p style="font-size: 9pt; color: #555;">Berhubungan dengan: {{ !empty($d->etiologi_dipilih) ? implode(', ', $d->etiologi_dipilih) : '-' }}</p>
                
                <p style="font-size: 10pt; margin-bottom: 5px;"><strong>Perencanaan (SLKI):</strong></p>
                <table>
                    <tr>
                        <th>Luaran (SLKI)</th>
                        <th>Kriteria Hasil</th>
                        <th>Target</th>
                        <th>Target Waktu</th>
                    </tr>
                    @foreach($d->luaran as $l)
                        @php $skorPlan = is_array($l->skor_indikator) ? $l->skor_indikator : json_decode($l->skor_indikator ?? '{}', true); @endphp
                        @foreach($l->slki?->kriteriaHasil ?? [] as $k)
                            @if(isset($skorPlan[$k->id]))
                                <tr>
                                    @if($loop->first)
                                        <td rowspan="{{ count($skorPlan) }}">{{ $l->slki?->label_luaran }}</td>
                                    @endif
                                    <td>{{ $k->deskripsi }}</td>
                                    <td>Skor: {{ $skorPlan[$k->id]['target'] }}</td>
                                    @if($loop->first)
                                        <td rowspan="{{ count($skorPlan) }}">{{ $l->target_waktu }}</td>
                                    @endif
                                </tr>
                            @endif
                        @endforeach
                    @endforeach
                </table>

                <p style="font-size: 10pt; margin-bottom: 5px;"><strong>Intervensi (SIKI):</strong></p>
                <ul>
                    @foreach($d->intervensi as $int)
                        <li>{{ $int->siki?->label_intervensi ?: $int->nama_manual }} ({{ $int->frekuensi }})</li>
                    @endforeach
                </ul>
            </div>
        @endforeach
    </div>

    <div class="section" style="page-break-before: always;">
        <div class="section-title">4. Implementasi Keperawatan</div>
        <table>
            <thead>
                <tr>
                    <th width="120">Tgl / Waktu</th>
                    <th width="80">Shift</th>
                    <th>Tindakan & Catatan</th>
                    <th width="100">Respons</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $semuaLog = $askep->diagnosa->flatMap->intervensi->flatMap->implementasi->sortBy('tanggal');
                @endphp
                @forelse($semuaLog as $log)
                    <tr>
                        <td>{{ $log->tanggal->format('d/m/Y') }}<br>{{ $log->waktu }}</td>
                        <td>{{ $log->shift }}</td>
                        <td>{{ $log->catatan }}</td>
                        <td>{{ $log->respons_pasien ?: '-' }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4" style="text-align: center;">Belum ada implementasi.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="section">
        <div class="section-title">5. Evaluasi Keperawatan (SOAP)</div>
        @foreach($askep->diagnosa->sortBy('prioritas') as $d)
            @php $ev = $d->evaluasi->first(); @endphp
            <div style="margin-bottom: 15px; border-bottom: 1px dashed #D0DCE8; padding-bottom: 10px;">
                <p><strong>Diagnosa {{ $d->prioritas }}: {{ $d->sdki?->label_diagnosa }}</strong></p>
                @if($ev)
                    <table style="border: none;">
                        <tr style="border: none;">
                            <td style="border: none; width: 40px; font-weight: bold;">S-O:</td>
                            <td style="border: none;">{{ $ev->catatan_soap }}</td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none; font-weight: bold;">A:</td>
                            <td style="border: none;">
                                <strong>{{ $ev->analisisLabel() }}</strong>.
                                {{ $ev->analisis_narasi }}
                            </td>
                        </tr>
                        <tr style="border: none;">
                            <td style="border: none; font-weight: bold;">P:</td>
                            <td style="border: none;">{{ $ev->tindak_lanjut }}</td>
                        </tr>
                    </table>
                    <p style="font-size: 9pt; color: #555;">TTV saat evaluasi: TD {{ $ev->tv_td ?: '-' }}, Nadi {{ $ev->tv_nadi ?: '-' }}, RR {{ $ev->tv_rr ?: '-' }}, Suhu {{ $ev->tv_suhu ?: '-' }}, SpO2 {{ $ev->tv_spo2 ?: '-' }}%</p>
                @else
                    <p><em>Evaluasi belum dilakukan.</em></p>
                @endif
            </div>
        @endforeach
    </div>

    <div class="footer">
        <p>Dicetak pada: {{ date('d/m/Y H:i:s') }}</p>
        <div class="signature-box">
            <p>Mahasiswa,</p>
            <div class="signature-line">
                <strong>{{ $askep->user->name }}</strong><br>
                NIM. {{ $askep->user->username }}
            </div>
        </div>
    </div>
</body>
</html>
