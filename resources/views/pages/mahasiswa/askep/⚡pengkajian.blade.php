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

    // ── Riwayat Penyakit ───────────────────────────────────────────────────
    public string $riwayat_sekarang = '';
    public string $riwayat_lalu = '';
    public string $riwayat_keluarga = '';

    // ── Biologis (JSON per section) ────────────────────────────────────────
    /** @var array<string, mixed> */
    public array $biologis_nyeri = ['ada' => false, 'lokasi' => '', 'skala' => '', 'sifat' => '', 'frekuensi' => '', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_aktivitas = ['ada' => false, 'kemampuan' => 'mandiri', 'bantu_alat' => false, 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_nutrisi = ['ada' => false, 'frekuensi' => '3x/hari', 'porsi' => '1 porsi habis', 'jenis' => 'biasa', 'bb_normal' => true, 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_cairan = ['ada' => false, 'minum_per_hari' => '2000 ml', 'infus' => false, 'jenis_infus' => '', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_eliminasi_feses = ['ada' => false, 'frekuensi' => '1x/hari', 'konsistensi' => 'lembek', 'warna' => 'coklat', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_eliminasi_urine = ['ada' => false, 'frekuensi' => '4-6x/hari', 'warna' => 'kuning jernih', 'jumlah' => '1500 ml', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_istirahat = ['ada' => false, 'jam_per_hari' => '7-8 jam', 'kualitas' => 'baik', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_oksigenasi = ['ada' => false, 'pola_napas' => 'teratur', 'suara_napas' => 'vesikuler', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_kardiovaskuler = ['ada' => false, 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_hygiene = ['ada' => false, 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $biologis_seksualitas = ['ada' => false, 'keterangan' => ''];

    // ── Psikososial & Spiritual ──────────────────────────────────────────
    /** @var array<string, mixed> */
    public array $psiko_emosi = ['suasana_hati' => 'stabil', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $psiko_konsep_diri = ['gambaran_diri' => 'positif', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $psiko_sosial = ['hubungan' => 'baik', 'keterangan' => ''];
    /** @var array<string, mixed> */
    public array $psiko_spiritual = ['ibadah' => 'taat', 'keterangan' => ''];

    // ── Pemeriksaan Fisik (JSON per system) ──────────────────────────────
    public string $fisik_umum = '';
    public array $pengkajianData = [];

    public function mount(Askep $askep): void
    {
        abort_unless($askep->user_id === auth()->id(), 403);

        $this->askep = $askep->load('pasien', 'pengkajian');

        // Inisialisasi pengkajianData untuk sistem fisik
        foreach ([
            'fisik_penglihatan', 'fisik_pendengaran', 'fisik_wicara', 'fisik_pernafasan',
            'fisik_kardiovaskuler', 'fisik_hematologi', 'fisik_saraf', 'fisik_pencernaan',
            'fisik_endokrin', 'fisik_urogenital', 'fisik_integumen', 'fisik_muskuloskeletal', 'fisik_imun'
        ] as $sys) {
            $this->pengkajianData[$sys] = ['is_abnormal' => false, 'data' => []];
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
        $this->riwayat_sekarang = $p->riwayat_sekarang['narasi'] ?? '';
        $this->riwayat_lalu     = $p->riwayat_lalu['narasi'] ?? '';
        $this->riwayat_keluarga = $p->riwayat_keluarga['narasi'] ?? '';

        // Biologis
        foreach ([
            'biologis_nyeri', 'biologis_aktivitas', 'biologis_nutrisi', 'biologis_cairan',
            'biologis_eliminasi_feses', 'biologis_eliminasi_urine', 'biologis_istirahat',
            'biologis_oksigenasi', 'biologis_kardiovaskuler', 'biologis_hygiene', 'biologis_seksualitas'
        ] as $field) {
            if (! empty($p->$field)) {
                $this->$field = array_merge($this->$field, $p->$field);
            }
        }

        // Psikososial
        foreach (['psiko_emosi', 'psiko_konsep_diri', 'psiko_sosial', 'psiko_spiritual'] as $field) {
            if (! empty($p->$field)) {
                $this->$field = array_merge($this->$field, $p->$field);
            }
        }

        // Fisik
        foreach ($this->pengkajianData as $sys => $val) {
            $dbField = str_replace('pernafasan', 'pernapasan', $sys);
            if (! empty($p->$dbField)) {
                $this->pengkajianData[$sys] = array_merge($this->pengkajianData[$sys], $p->$dbField);
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
            $this->biologis_nyeri            = ['ada' => false, 'lokasi' => '', 'skala' => '', 'sifat' => '', 'frekuensi' => '', 'keterangan' => 'Tidak ada nyeri'];
            $this->biologis_aktivitas        = ['ada' => false, 'kemampuan' => 'mandiri', 'bantu_alat' => false, 'keterangan' => 'Aktivitas mandiri, tidak ada keterbatasan'];
            $this->biologis_nutrisi          = ['ada' => false, 'frekuensi' => '3x/hari', 'porsi' => '1 porsi habis', 'jenis' => 'biasa', 'bb_normal' => true, 'keterangan' => 'Nafsu makan baik'];
            $this->biologis_cairan           = ['ada' => false, 'minum_per_hari' => '2000 ml', 'infus' => false, 'jenis_infus' => '', 'keterangan' => 'Intake cairan cukup'];
            $this->biologis_eliminasi_feses  = ['ada' => false, 'frekuensi' => '1x/hari', 'konsistensi' => 'lembek', 'warna' => 'coklat', 'keterangan' => 'BAB normal'];
            $this->biologis_eliminasi_urine  = ['ada' => false, 'frekuensi' => '4-6x/hari', 'warna' => 'kuning jernih', 'jumlah' => '1500 ml', 'keterangan' => 'BAK normal'];
            $this->biologis_istirahat        = ['ada' => false, 'jam_per_hari' => '1-2 jam/hari', 'kualitas' => 'baik', 'keterangan' => 'Istirahat siang cukup'];
            $this->biologis_tidur            = ['ada' => false, 'jam_per_hari' => '7-8 jam/hari', 'kualitas' => 'nyenyak', 'keterangan' => 'Tidur malam cukup, tidak sering terjaga'];
            $this->biologis_oksigenasi       = ['ada' => false, 'pola_napas' => 'teratur', 'suara_napas' => 'vesikuler', 'keterangan' => 'Tidak ada gangguan pernapasan'];
            $this->biologis_kardiovaskuler   = ['ada' => false, 'keterangan' => 'Sirkulasi stabil, tidak ada nyeri dada atau palpitasi'];
            $this->biologis_hygiene          = ['ada' => false, 'keterangan' => 'Kebersihan diri terjaga, mandi dan gosok gigi rutin'];
            $this->biologis_seksualitas      = ['ada' => false, 'keterangan' => 'Tidak ada gangguan fungsi seksual'];
        }

        if ($section === 'all' || $section === 'psikososial') {
            $this->psiko_emosi       = ['suasana_hati' => 'stabil', 'keterangan' => 'Dapat mengekspresikan perasaan dengan baik'];
            $this->psiko_konsep_diri = ['gambaran_diri' => 'positif', 'keterangan' => 'Memiliki pandangan positif terhadap diri sendiri'];
            $this->psiko_sosial      = ['hubungan' => 'baik', 'keterangan' => 'Hubungan sosial dengan keluarga dan lingkungan baik'];
            $this->psiko_spiritual   = ['ibadah' => 'taat', 'keterangan' => 'Tetap menjalankan ibadah sesuai keyakinan'];
        }

        if ($section === 'all' || $section === 'fisik') {
            foreach ($this->pengkajianData as $key => $val) {
                $this->pengkajianData[$key]['is_abnormal'] = false;
                $this->pengkajianData[$key]['data'] = []; // Implementasi partial akan menangani visual
            }
            // Secara khusus isi beberapa data normal di partial if needed
            $this->pengkajianData['fisik_penglihatan']['data'] = ['posisi' => 'simetris', 'kelopak' => 'normal', 'gerakan' => 'normal', 'bola' => 'normal', 'konjungtiva' => 'normal', 'kornea' => 'normal', 'sklera' => 'anikterik', 'pupil' => 'isokor', 'fungsi' => 'baik'];
            $this->pengkajianData['fisik_pernafasan']['data'] = ['jalan' => 'bersih', 'pernafasan' => 'tidak sesak', 'otot_bantu' => 'tidak', 'irama' => 'teratur', 'kedalaman' => 'normal', 'suara' => 'normal'];
        }

        Flux::toast(variant: 'success', text: "Preset " . ($section === 'all' ? 'lengkap' : $section) . " diterapkan.");
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

        // Hitung EWS otomatis jika lengkap
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
                'riwayat_sekarang' => $this->riwayat_sekarang ? ['narasi' => $this->riwayat_sekarang] : null,
                'riwayat_lalu'     => $this->riwayat_lalu ? ['narasi' => $this->riwayat_lalu] : null,
                'riwayat_keluarga' => $this->riwayat_keluarga ? ['narasi' => $this->riwayat_keluarga] : null,
                'biologis_nyeri'           => $this->biologis_nyeri,
                'biologis_aktivitas'       => $this->biologis_aktivitas,
                'biologis_nutrisi'         => $this->biologis_nutrisi,
                'biologis_cairan'          => $this->biologis_cairan,
                'biologis_eliminasi_feses' => $this->biologis_eliminasi_feses,
                'biologis_eliminasi_urine' => $this->biologis_eliminasi_urine,
                'biologis_istirahat'       => $this->biologis_istirahat,
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

        // Update step_terakhir jika baru sampai sini
        if ($this->askep->step_terakhir < 1) {
            $this->askep->update(['step_terakhir' => 1]);
        }

        $this->askep->pasien->catatRiwayat('Pengkajian disimpan.');

        Flux::toast(variant: 'success', text: 'Pengkajian tersimpan.');
    }

    public function simpanLanjut(): void
    {
        $this->simpan();
        $this->redirectRoute('askep.diagnosa', $this->askep, navigate: true);
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Stepper --}}
    @include('partials.askep-stepper', ['askep' => $askep, 'step' => 1])

    <div class="mb-5 overflow-hidden rounded-2xl border border-[#E0EBF5] bg-white">
        <div class="flex flex-col gap-4 border-b border-[#E0EBF5] p-5 md:flex-row md:items-center md:justify-between">
            <div>
                <div class="mb-2 flex items-center gap-2">
                    <span class="flex size-8 items-center justify-center rounded-lg bg-[#E1F5EE] text-[#0F6E56]">
                        <flux:icon.clipboard-document-list class="size-4" />
                    </span>
                    <h2 class="text-xl font-bold text-[#1B4F72]">Tahap 1: Pengkajian Dasar</h2>
                </div>
                <p class="text-sm text-[#7A8FA6]">Pengkajian disusun bertahap mengikuti format identitas, riwayat, biologis, psikososial, dan pemeriksaan fisik.</p>
            </div>
            <button
                wire:click="presetNormal"
                class="inline-flex items-center gap-2 rounded-lg border border-[#85B7EB] bg-[#EBF5FB] px-3 py-2 text-xs font-semibold text-[#2E86C1] hover:bg-[#D7EAFB] transition"
            >
                <flux:icon.check-circle class="size-3.5" />
                Preset Normal
            </button>
        </div>
        <div class="grid gap-3 p-5 sm:grid-cols-3">
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
                <p class="mt-2 text-sm font-bold text-[#1B4F72]">Riwayat, TTV, biologis, fisik</p>
                <p class="mt-1 text-xs text-[#7A8FA6]">Biar cepat, tapi tetap klinis.</p>
            </div>
        </div>
    </div>

    {{-- Tab Navigation --}}
    <div class="mb-5 flex gap-1 overflow-x-auto rounded-xl bg-[#F4F8FB] p-1">
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

    {{-- ── Tab: Identitas Penanggung Jawab ── --}}
    @if ($tab === 'identitas')
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
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

            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
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
        </div>
    @endif

    {{-- ── Tab: TTV & EWS ── --}}
    @if ($tab === 'ttv')
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <div class="mb-4 flex items-center justify-between">
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
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Antropometri</h3>
                <div class="grid gap-4 sm:grid-cols-2">
                    <flux:input wire:model="bb" label="Berat Badan (kg)" type="number" step="0.1" placeholder="60.0" />
                    <flux:input wire:model="tb" label="Tinggi Badan (cm)" type="number" placeholder="165" />
                </div>
            </div>
        </div>
    @endif

    {{-- ── Tab: Riwayat ── --}}
    @if ($tab === 'riwayat')
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Penyakit Sekarang</h3>
                <flux:textarea wire:model="riwayat_sekarang" label="Keluhan utama / kronologi / harapan pasien" rows="5"
                    placeholder="Keluhan utama, perjalanan penyakit saat ini, dan harapan dari pelayanan kesehatan..." />
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Riwayat Penyakit Dahulu dan Keluarga</h3>
                <div class="space-y-4">
                    <flux:textarea wire:model="riwayat_lalu" label="Riwayat penyakit masa lalu" rows="4"
                        placeholder="Riwayat penyakit masa anak, alergi, pengalaman dirawat, pengobatan terakhir..." />
                    <flux:textarea wire:model="riwayat_keluarga" label="Riwayat kesehatan keluarga / genogram" rows="4"
                        placeholder="Komposisi keluarga, penyakit serupa, penyakit menular/menurun, respons keluarga..." />
                </div>
            </div>
        </div>
    @endif

    {{-- ── Tab: Biologis ── --}}
    @if ($tab === 'biologis')
        <div class="mb-4 flex items-center justify-between">
            <flux:heading size="lg">Pengkajian Biologis</flux:heading>
            <flux:button wire:click="setNormal('biologis')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-3">
            @foreach ([
                ['field' => 'biologis_nyeri', 'label' => 'Nyeri (Rasa Nyaman)', 'icon' => 'bolt'],
                ['field' => 'biologis_aktivitas', 'label' => 'Aktivitas & Latihan', 'icon' => 'arrow-trending-up'],
                ['field' => 'biologis_istirahat', 'label' => 'Istirahat', 'icon' => 'moon'],
                ['field' => 'biologis_tidur', 'label' => 'Tidur', 'icon' => 'moon'],
                ['field' => 'biologis_cairan', 'label' => 'Kebutuhan Cairan', 'icon' => 'beaker'],
                ['field' => 'biologis_nutrisi', 'label' => 'Nutrisi & Metabolisme', 'icon' => 'beaker'],
                ['field' => 'biologis_eliminasi_feses', 'label' => 'Eliminasi Feses (BAB)', 'icon' => 'arrow-path'],
                ['field' => 'biologis_eliminasi_urine', 'label' => 'Eliminasi Urine (BAK)', 'icon' => 'arrow-path'],
                ['field' => 'biologis_oksigenasi', 'label' => 'Oksigenasi & Pernapasan', 'icon' => 'cloud'],
                ['field' => 'biologis_kardiovaskuler', 'label' => 'Kardiovaskuler', 'icon' => 'heart'],
                ['field' => 'biologis_hygiene', 'label' => 'Personal Hygiene', 'icon' => 'user'],
                ['field' => 'biologis_seksualitas', 'label' => 'Seksualitas', 'icon' => 'user-group'],
            ] as $section)
                @php $field = $section['field']; @endphp
                <div class="rounded-2xl border border-[#E0EBF5] bg-white overflow-hidden">
                    <div class="flex items-center justify-between px-5 py-3">
                        <div class="flex items-center gap-2">
                            <flux:icon :icon="$section['icon']" class="size-4 text-[#2E86C1]" />
                            <span class="font-medium text-[#1B4F72]">{{ $section['label'] }}</span>
                        </div>
                        <div class="flex items-center gap-3">
                            <button
                                wire:click="$set('{{ $field }}', {{ json_encode(['ada' => false, 'keterangan' => 'Tidak ada keluhan/normal']) }})"
                                class="text-[10px] uppercase tracking-wider font-bold text-[#2E86C1] hover:underline"
                            >
                                Set Normal
                            </button>
                            <div class="h-4 w-px bg-gray-200"></div>
                            @if (!($this->$field['ada'] ?? false))
                                <span class="text-xs text-[#1A9B72] font-medium">✓ Normal</span>
                            @else
                                <span class="text-xs text-[#D95C3A] font-medium">⚠ Ada Kelainan</span>
                            @endif
                            <flux:switch wire:model.live="{{ $field }}.ada" />
                        </div>
                    </div>
                    @if ($this->$field['ada'] ?? false)
                        <div class="border-t border-[#E0EBF5] px-5 py-4">
                            <flux:textarea
                                wire:model="{{ $field }}.keterangan"
                                label="Keterangan / Temuan"
                                placeholder="Deskripsikan kondisi yang ditemukan secara rinci..."
                                rows="2"
                            />
                        </div>
                    @endif
                </div>
            @endforeach
        </div>
    @endif

    {{-- ── Tab: Psikososial ── --}}
    @if ($tab === 'psikososial')
        <div class="mb-4 flex items-center justify-between">
            <flux:heading size="lg">Psikososial & Spiritual</flux:heading>
            <flux:button wire:click="setNormal('psikososial')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-4">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Psikologi & Status Emosi</h3>
                <flux:textarea wire:model="psiko_emosi.keterangan" label="Ekspresi perasaan, suasana hati, dll." rows="3" />
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Konsep Diri</h3>
                <flux:textarea wire:model="psiko_konsep_diri.keterangan" label="Gambaran diri, identitas, harga diri, dll." rows="3" />
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Hubungan Sosial</h3>
                <flux:textarea wire:model="psiko_sosial.keterangan" label="Hubungan dengan keluarga, teman, masyarakat, dll." rows="3" />
            </div>
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Spiritual</h3>
                <flux:textarea wire:model="psiko_spiritual.keterangan" label="Keyakinan, ibadah, hambatan spiritual, dll." rows="3" />
            </div>
        </div>
    @endif

    {{-- ── Tab: Fisik ── --}}
    @if ($tab === 'fisik')
        <div class="mb-4 flex items-center justify-between">
            <flux:heading size="lg">Pemeriksaan Fisik (Head to Toe)</flux:heading>
            <flux:button wire:click="setNormal('fisik')" size="xs" variant="ghost" icon="check-circle">Set Semua Normal</flux:button>
        </div>
        <div class="space-y-5 pb-8">
            <div class="rounded-2xl border border-[#E0EBF5] bg-white p-6">
                <h3 class="mb-4 font-semibold text-[#1B4F72]">Keadaan Umum</h3>
                <flux:textarea wire:model="fisik_umum" label="Deskripsi umum pasien (tampak sakit, pucat, dll.)" rows="2" />
            </div>

            @include('partials.pengkajian-fisik')
        </div>
    @endif

    {{-- ── Navigation Buttons ── --}}
    <div class="mt-6 flex items-center justify-between border-t border-[#E0EBF5] pt-4">
        <flux:button
            :href="route('pasien.show', $askep->pasien_id)"
            variant="ghost"
            icon="arrow-left"
            wire:navigate
        >
            Kembali
        </flux:button>

        <div class="flex items-center gap-3">
            <button
                wire:click="simpan"
                wire:loading.attr="disabled"
                class="rounded-xl border border-[#85B7EB] px-4 py-2 text-sm font-semibold text-[#2E86C1] hover:bg-[#EBF5FB] transition"
            >
                <span wire:loading.remove wire:target="simpan">Simpan</span>
                <span wire:loading wire:target="simpan">Menyimpan...</span>
            </button>

            <button
                wire:click="simpanLanjut"
                wire:loading.attr="disabled"
                class="inline-flex items-center gap-2 rounded-xl px-5 py-2 text-sm font-bold text-white transition hover:opacity-90 disabled:opacity-50"
                style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
            >
                <span wire:loading.remove wire:target="simpanLanjut">Simpan & Lanjut</span>
                <span wire:loading wire:target="simpanLanjut">Menyimpan...</span>
                <flux:icon.arrow-right class="size-4" wire:loading.remove wire:target="simpanLanjut" />
            </button>
        </div>
    </div>
</div>
