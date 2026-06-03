<?php

use App\Models\Pasien;
use App\Models\Pengkajian;
use Flux\Flux;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Pengkajian')] class extends Component
{
    public Pasien $pasien;

    public string $tab = 'riwayat';

    /**
     * @var array<string, array{observasi: string, is_abnormal: bool, tipe_data: string, data: array<string, mixed>}>
     */
    public array $pengkajianData = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);

        $this->pasien = $pasien;

        // Inisialisasi semua section dengan nilai default
        $this->pengkajianData = $this->sectionDefaults();

        // Muat data yang sudah tersimpan dari DB
        $pasien->pengkajian()->get()->each(function (Pengkajian $row): void {
            if (! isset($this->pengkajianData[$row->pola_kesehatan])) {
                return;
            }

            $this->pengkajianData[$row->pola_kesehatan]['observasi']   = $row->observasi ?? '';
            $this->pengkajianData[$row->pola_kesehatan]['is_abnormal'] = $row->is_abnormal;
            $this->pengkajianData[$row->pola_kesehatan]['tipe_data']   = $row->tipe_data ?? 'DS';

            if (is_array($row->data) && ! empty($row->data)) {
                $this->pengkajianData[$row->pola_kesehatan]['data'] = array_merge(
                    $this->pengkajianData[$row->pola_kesehatan]['data'],
                    $row->data
                );
            }
        });
    }

    public function save(): void
    {
        foreach ($this->pengkajianData as $pola => $section) {
            Pengkajian::updateOrCreate(
                ['pasien_id' => $this->pasien->id, 'pola_kesehatan' => $pola],
                [
                    'observasi'   => $section['observasi'] ?: null,
                    'data'        => ! empty($section['data']) ? $section['data'] : null,
                    'is_abnormal' => $section['is_abnormal'],
                    'tipe_data'   => $section['tipe_data'] ?? 'DS',
                ]
            );
        }

        $this->pasien->catatRiwayat('Pengkajian disimpan.');

        Flux::toast(variant: 'success', text: 'Pengkajian berhasil disimpan.');

        $this->redirectRoute('pasien.diagnosa', $this->pasien, navigate: true);
    }

    /** Default structure untuk semua 32 section pengkajian. */
    private function sectionDefaults(): array
    {
        $text = fn (string $tipe = 'DS'): array => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => $tipe, 'data' => []];

        return [
            // ── Riwayat Penyakit ──────────────────────────────────────────
            'riwayat_sekarang'      => $text(),
            'riwayat_lalu'          => $text(),
            'riwayat_keluarga'      => $text(),
            // ── Biologis ──────────────────────────────────────────────────
            'bio_nyaman'            => $text(),
            'bio_aktivitas'         => $text(),
            'bio_istirahat'         => $text(),
            'bio_tidur'             => $text(),
            'bio_cairan'            => $text(),
            'bio_nutrisi'           => $text(),
            'bio_eliminasi_feses'   => $text(),
            'bio_eliminasi_urine'   => $text(),
            'bio_oksigenasi'        => $text(),
            'bio_kardiovaskuler'    => $text(),
            'bio_hygiene'           => $text(),
            'bio_seks'              => $text(),
            // ── Psikososial ───────────────────────────────────────────────
            'psiko_emosi'           => $text(),
            'psiko_konsep_diri'     => $text(),
            'psiko_sosial'          => $text(),
            'psiko_spiritual'       => $text(),
            // ── Pemeriksaan Fisik ─────────────────────────────────────────
            'fisik_penglihatan'     => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'posisi_mata' => '', 'kelopak_mata' => '', 'gerakan' => '', 'pergerakan_bola_mata' => '',
                'konjungtiva' => '', 'kornea' => '', 'sklera' => '',
                'pupil' => [], 'otot_mata' => [], 'fungsi_penglihatan' => [],
                'tanda_radang' => '', 'kacamata' => '', 'lensa_kontak' => '',
            ]],
            'fisik_pendengaran'     => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'daun_telinga' => '', 'kondisi_telinga' => [], 'cairan_telinga' => '',
                'tinnitus' => '', 'fungsi_pendengaran' => '', 'alat_bantu' => '', 'perasaan_penuh' => '',
            ]],
            'fisik_wicara'          => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'gangguan' => [],
            ]],
            'fisik_pernafasan'      => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'frekuensi' => '', 'jalan_nafas' => [], 'sesak' => '', 'otot_bantu' => '',
                'irama' => '', 'kedalaman' => '', 'batuk' => '', 'batuk_jenis' => '',
                'sputum_warna' => [], 'sputum_konsistensi' => '', 'sputum_darah' => '',
                'suara_nafas' => [],
            ]],
            'fisik_kardiovaskuler'  => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'nadi' => '', 'irama_nadi' => '', 'denyut' => '', 'tekanan_darah' => '',
                'distensi_vena_kanan' => '', 'distensi_vena_kiri' => '',
                'temperatur_kulit' => '', 'warna_kulit' => [], 'pengisian_kapiler' => '',
                'edema' => '', 'edema_lokasi' => [],
                'irama_jantung' => '', 'bunyi_jantung' => [],
                'nyeri_dada' => '', 'nyeri_timbul' => '', 'nyeri_karakter' => [],
            ]],
            'fisik_hematologi'      => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'hb' => '', 'ht' => '', 'leukosit' => '', 'eritrosit' => '', 'trombosit' => '',
            ]],
            'fisik_saraf'           => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'kesadaran' => '', 'pupil' => '',
                'reaksi_cahaya_kanan' => '', 'reaksi_cahaya_kiri' => '',
                'peningkatan_tik' => '', 'kelainan' => [],
                'gcs_e' => '', 'gcs_m' => '', 'gcs_v' => '',
            ]],
            'fisik_pencernaan'      => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'gigi_caries' => '', 'gigi_palsu' => '', 'stomatitis' => '',
                'lidah_kotor' => '', 'saliva' => '',
                'muntah' => '', 'isi_muntah' => [], 'warna_muntah' => [],
                'mual' => '', 'nafsu_makan' => '',
                'nyeri_perut' => '', 'nyeri_karakter' => [],
                'bab_kebiasaan' => '', 'bising_usus' => '',
                'warna_feces' => [], 'konsistensi_feces' => [],
                'hepar' => '', 'abdomen' => [],
            ]],
            'fisik_endokrin'        => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'nafas_bau_keton' => '', 'kelainan' => [],
                'gangren' => '', 'gangren_warna' => '', 'gangren_bau' => '',
                'exopthalmus' => '', 'tremor' => '', 'kelenjar_tiroid' => '',
            ]],
            'fisik_urogenital'      => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'perubahan_pola' => [], 'bak_frekuensi' => '',
                'bak_kontrol' => '', 'bak_jumlah' => '', 'bak_warna' => '',
                'distensi_kandung_kemih' => '', 'nyeri_pinggang' => '',
                'pembesaran_prostat' => '', 'keadaan_genitalia' => '',
            ]],
            'fisik_integumen'       => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'turgor' => '', 'warna_kulit' => [], 'keadaan_kulit' => [],
                'tekstur_rambut' => '', 'kebersihan_rambut' => '',
            ]],
            'fisik_muskuloskeletal' => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'kesulitan_pergerakan' => '', 'nyeri_tulang' => '',
                'fraktur' => '', 'lokasi_fraktur' => '', 'jenis_fraktur' => '',
                'kelainan_bentuk' => [], 'tonus_otot' => '',
            ]],
            'fisik_imun'            => ['observasi' => '', 'is_abnormal' => false, 'tipe_data' => 'DO', 'data' => [
                'suhu' => '', 'bb_sebelum' => '', 'bb_sesudah' => '', 'pembesaran_kelenjar' => '',
            ]],
        ];
    }
};
?>

<div>
    {{-- Header --}}
    <div class="mb-6">
        <flux:button :href="route('pasien.show', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali
        </flux:button>
        <flux:heading size="xl" level="1">Pengkajian — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Isi formulir pengkajian keperawatan dasar sesuai kondisi pasien.</flux:text>
    </div>

    @include('partials.askep-stepper', ['step' => 1, 'pasien' => $pasien])

    {{-- Tab Navigation --}}
    @php
        $tabs = [
            'riwayat'     => ['label' => 'Riwayat Penyakit',       'icon' => 'clock'],
            'biologis'    => ['label' => 'Biologis',               'icon' => 'heart'],
            'psikososial' => ['label' => 'Psikososial',            'icon' => 'user'],
            'fisik'       => ['label' => 'Pemeriksaan Fisik',      'icon' => 'clipboard-document-list'],
        ];

        // Hitung berapa section per tab yang abnormal (untuk badge)
        $sectionsByTab = App\Models\Pengkajian::sections();
        $abnormalCount = [];
        foreach ($sectionsByTab as $tabKey => $group) {
            $abnormalCount[$tabKey] = collect($group['keys'])
                ->filter(fn($k) => ! empty($pengkajianData[$k]['is_abnormal']))
                ->count();
        }
    @endphp

    <nav class="mt-6 flex items-center gap-1 overflow-x-auto rounded-xl bg-zinc-100 dark:bg-zinc-800 p-1.5">
        @foreach ($tabs as $key => $info)
            <button
                type="button"
                wire:click="$set('tab', '{{ $key }}')"
                class="relative flex flex-1 min-w-0 items-center justify-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium transition-colors
                    {{ $tab === $key
                        ? 'bg-white dark:bg-zinc-900 shadow-sm text-blue-600 dark:text-blue-400'
                        : 'text-zinc-500 dark:text-zinc-400 hover:bg-zinc-200 dark:hover:bg-zinc-700' }}"
            >
                <span class="truncate">{{ $info['label'] }}</span>
                @if ($abnormalCount[$key] > 0)
                    <span class="shrink-0 flex size-4 items-center justify-center rounded-full bg-red-500 text-[10px] font-bold text-white">
                        {{ $abnormalCount[$key] }}
                    </span>
                @endif
            </button>
        @endforeach
    </nav>

    <form wire:submit="save" class="mt-5 space-y-4">

        {{-- ═══════════════════════════════════════════════════════════════ --}}
        {{-- TAB 1 — RIWAYAT PENYAKIT                                       --}}
        {{-- ═══════════════════════════════════════════════════════════════ --}}
        @if ($tab === 'riwayat')
            @php
                $riwayatSections = [
                    'riwayat_sekarang' => [
                        'num'   => 1,
                        'title' => 'Riwayat Penyakit Sekarang',
                        'hints' => [
                            'Keluhan utama pasien',
                            'Kronologi penyakit saat ini (kapan mulai, faktor pencetus, perjalanan penyakit)',
                            'Apa yang diharapkan pasien dari pelayanan kesehatan',
                        ],
                    ],
                    'riwayat_lalu' => [
                        'num'   => 2,
                        'title' => 'Riwayat Penyakit Masa Lalu',
                        'hints' => [
                            'Penyakit masa anak-anak',
                            'Alergi (makanan, obat-obatan, lingkungan)',
                            'Pengalaman sakit / dirawat sebelumnya',
                            'Pengobatan terakhir yang pernah diterima',
                        ],
                    ],
                    'riwayat_keluarga' => [
                        'num'   => 3,
                        'title' => 'Riwayat Kesehatan Keluarga',
                        'hints' => [
                            'Dengan siapa klien tinggal dan jumlah anggota keluarga',
                            'Apakah ada anggota keluarga yang menderita penyakit serupa',
                            'Apakah ada keluarga dengan penyakit menular atau penyakit menurun',
                            'Bagaimana efek pada keluarga bila salah satu anggota sakit (genogram ≥ 3 generasi)',
                        ],
                    ],
                ];
            @endphp

            @foreach ($riwayatSections as $key => $meta)
                @include('partials.pengkajian-text-card', [
                    'key'   => $key,
                    'num'   => $meta['num'],
                    'title' => $meta['title'],
                    'hints' => $meta['hints'],
                ])
            @endforeach
        @endif

        {{-- ═══════════════════════════════════════════════════════════════ --}}
        {{-- TAB 2 — BIOLOGIS                                               --}}
        {{-- ═══════════════════════════════════════════════════════════════ --}}
        @if ($tab === 'biologis')
            @php
                $biologisSections = [
                    'bio_nyaman' => [
                        'num'   => 1,
                        'title' => 'Rasa Aman & Nyaman',
                        'hints' => [
                            'Apakah ada rasa nyeri? Di bagian mana? Jelaskan secara rinci: PQRST',
                            'Apakah nyeri mengganggu aktivitas?',
                            'Apa yang dilakukan untuk mengurangi / menghilangkan nyeri?',
                            'Apakah ada riwayat pembedahan?',
                        ],
                    ],
                    'bio_aktivitas' => [
                        'num'   => 2,
                        'title' => 'Aktivitas',
                        'hints' => [
                            'Apakah klien selalu berolahraga? Jenis olahraga?',
                            'Apakah klien menggunakan alat bantu dalam beraktivitas?',
                            'Berapa lama melakukan kegiatan per hari? Jam berapa mulai bekerja?',
                            'Bagaimana aktivitas klien saat sakit sekarang ini? Perlu bantuan?',
                        ],
                    ],
                    'bio_istirahat' => [
                        'num'   => 3,
                        'title' => 'Istirahat',
                        'hints' => [
                            'Kapan dan berapa lama klien beristirahat?',
                            'Apa kegiatan untuk mengisi waktu luang?',
                            'Apakah klien menyediakan waktu khusus untuk istirahat?',
                            'Bagaimana istirahat klien saat sakit sekarang?',
                        ],
                    ],
                    'bio_tidur' => [
                        'num'   => 4,
                        'title' => 'Tidur',
                        'hints' => [
                            'Bagaimana pola tidur klien? (jam, berapa lama, nyenyak/tidak?)',
                            'Apakah kondisi saat ini mengganggu klien?',
                            'Apakah klien terbiasa menggunakan obat penenang sebelum tidur?',
                            'Apakah klien sering terjaga saat tidur? Adakah gangguan tidur?',
                        ],
                    ],
                    'bio_cairan' => [
                        'num'   => 5,
                        'title' => 'Cairan',
                        'hints' => [
                            'Berapa banyak klien minum per hari? (gelas)',
                            'Minuman apa yang disukai dan yang dipantang klien?',
                            'Apakah klien terbiasa minum alkohol?',
                            'Bagaimana pola pemenuhan cairan per hari? Ada program pembatasan cairan?',
                        ],
                    ],
                    'bio_nutrisi' => [
                        'num'   => 6,
                        'title' => 'Nutrisi',
                        'hints' => [
                            'Apa yang biasa dimakan klien tiap hari? Berapa kali per hari?',
                            'Adakah makanan kesukaan / yang dipantang?',
                            'Adakah riwayat alergi terhadap makanan? Kesulitan menelan/mengunyah?',
                            'Adakah alat bantu dalam makan (sonde, infus)?',
                            'Bagaimana kondisi gigi geligi klien? Gigi palsu?',
                        ],
                    ],
                    'bio_eliminasi_feses' => [
                        'num'   => 7,
                        'title' => 'Eliminasi Feses',
                        'hints' => [
                            'Bagaimana pola defekasi klien? Kapan, frekuensi, karakteristik feses?',
                            'Apakah terbiasa menggunakan obat pencahar?',
                            'Adakah kesulitan dalam defekasi? Usaha yang dilakukan klien?',
                        ],
                    ],
                    'bio_eliminasi_urine' => [
                        'num'   => 8,
                        'title' => 'Eliminasi Urine',
                        'hints' => [
                            'Apakah BAK klien teratur?',
                            'Bagaimana pola, frekuensi, waktu, karakteristik, dan perubahan dalam miksi?',
                            'Adakah riwayat pembedahan? Apakah menggunakan alat bantu dalam miksi?',
                        ],
                    ],
                    'bio_oksigenasi' => [
                        'num'   => 9,
                        'title' => 'Oksigenasi',
                        'hints' => [
                            'Adakah kesulitan dalam bernafas? Bunyi nafas? Dispnea?',
                            'Apakah klien menggunakan alat bantu pernafasan? Jenis?',
                            'Apakah klien terbiasa merokok? Adakah alergi terhadap debu/obat-obatan?',
                            'Adakah riwayat gangguan pernafasan dan pengobatannya?',
                        ],
                    ],
                    'bio_kardiovaskuler' => [
                        'num'   => 10,
                        'title' => 'Kardiovaskuler',
                        'hints' => [
                            'Apakah klien cepat lelah?',
                            'Adakah keluhan berdebar-debar? Nyeri dada yang menyebar? Pusing?',
                            'Adakah rasa berat di dada? Apakah menggunakan alat pacu jantung?',
                            'Apakah mendapat obat untuk gangguan kardiovaskuler?',
                        ],
                    ],
                    'bio_hygiene' => [
                        'num'   => 11,
                        'title' => 'Personal Hygiene',
                        'hints' => [
                            'Bagaimana pola personal hygiene? Berapa kali mandi, gosok gigi?',
                            'Berapa hari klien terbiasa cuci rambut?',
                            'Apakah klien memerlukan bantuan dalam melakukan personal hygiene?',
                        ],
                    ],
                    'bio_seks' => [
                        'num'   => 12,
                        'title' => 'Seksualitas',
                        'hints' => [
                            'Adakah kesulitan dalam hubungan seksual?',
                            'Apakah penyakit sekarang mempengaruhi / mengganggu fungsi seksual?',
                            'Jumlah anak',
                        ],
                    ],
                ];
            @endphp

            @foreach ($biologisSections as $key => $meta)
                @include('partials.pengkajian-text-card', [
                    'key'   => $key,
                    'num'   => $meta['num'],
                    'title' => $meta['title'],
                    'hints' => $meta['hints'],
                ])
            @endforeach
        @endif

        {{-- ═══════════════════════════════════════════════════════════════ --}}
        {{-- TAB 3 — PSIKOSOSIAL & SPIRITUAL                                --}}
        {{-- ═══════════════════════════════════════════════════════════════ --}}
        @if ($tab === 'psikososial')
            @php
                $psikSections = [
                    'psiko_emosi' => [
                        'num'   => 1,
                        'title' => 'Status Emosi',
                        'hints' => [
                            'Apakah klien dapat mengekspresikan perasaannya?',
                            'Bagaimana suasana hati klien?',
                            'Apa yang dilakukan bila suasana hati sedih, marah, atau gembira?',
                        ],
                    ],
                    'psiko_konsep_diri' => [
                        'num'   => 2,
                        'title' => 'Konsep Diri',
                        'hints' => [
                            'Bagaimana klien memandang dirinya? Hal-hal apa yang disukai klien?',
                            'Apakah klien mampu mengidentifikasi kekuatan dan kelemahannya?',
                            'Hal-hal apa yang masih dapat dilakukan klien?',
                        ],
                    ],
                    'psiko_sosial' => [
                        'num'   => 3,
                        'title' => 'Hubungan Sosial',
                        'hints' => [
                            'Apakah klien mempunyai teman dekat? Siapa yang dipercaya klien?',
                            'Apakah klien ikut dalam kegiatan masyarakat?',
                            'Apakah pekerjaan klien saat ini sesuai kemampuan?',
                        ],
                    ],
                    'psiko_spiritual' => [
                        'num'   => 4,
                        'title' => 'Spiritual',
                        'hints' => [
                            'Apakah klien menganut satu agama?',
                            'Apakah klien mengalami gangguan dalam menjalankan ibadah?',
                            'Bagian mana hubungan antara manusia dan Tuhan dalam agama klien?',
                        ],
                    ],
                ];
            @endphp

            @foreach ($psikSections as $key => $meta)
                @include('partials.pengkajian-text-card', [
                    'key'   => $key,
                    'num'   => $meta['num'],
                    'title' => $meta['title'],
                    'hints' => $meta['hints'],
                ])
            @endforeach
        @endif

        {{-- ═══════════════════════════════════════════════════════════════ --}}
        {{-- TAB 4 — PEMERIKSAAN FISIK                                      --}}
        {{-- ═══════════════════════════════════════════════════════════════ --}}
        @if ($tab === 'fisik')
            @include('partials.pengkajian-fisik')
        @endif

        {{-- ── Action bar ──────────────────────────────────────────────── --}}
        <div class="flex items-center gap-3 pt-2 border-t border-gray-100 dark:border-zinc-700">
            <flux:button type="submit" variant="primary" icon-trailing="arrow-right" wire:loading.attr="disabled">
                <span wire:loading.remove wire:target="save">Simpan & Lanjut ke Diagnosa</span>
                <span wire:loading wire:target="save">Menyimpan…</span>
            </flux:button>
            <flux:button :href="route('pasien.show', $pasien)" variant="ghost" wire:navigate>
                Simpan Nanti
            </flux:button>
        </div>

    </form>
</div>
