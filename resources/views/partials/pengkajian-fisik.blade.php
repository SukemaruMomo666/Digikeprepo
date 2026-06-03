{{-- Partial: pengkajian-fisik — 13 sistem pemeriksaan fisik --}}

@php
    /** Helper macro: render radio group */
    $radio = function (string $key, string $field, string $label, array $options) use (&$pengkajianData): string {
        $current = $pengkajianData[$key]['data'][$field] ?? '';
        $html = "<div class=\"space-y-1.5\"><p class=\"text-xs font-semibold text-gray-500 dark:text-zinc-400\">{$label}</p><div class=\"flex flex-wrap gap-x-4 gap-y-1.5\">";
        foreach ($options as $val => $lbl) {
            $checked = $current === $val ? 'checked' : '';
            $html .= "<label class=\"flex cursor-pointer items-center gap-1.5\">
                <input type=\"radio\" wire:model=\"pengkajianData.{$key}.data.{$field}\" value=\"{$val}\" {$checked}
                    class=\"size-3.5 text-orange-500 focus:ring-orange-400\">
                <span class=\"text-sm text-gray-700 dark:text-zinc-300\">{$lbl}</span>
            </label>";
        }
        $html .= '</div></div>';
        return $html;
    };

    /** Helper macro: render checkbox group (multi-select array) */
    $checkboxes = function (string $key, string $field, string $label, array $options) use (&$pengkajianData): string {
        $html = "<div class=\"space-y-1.5\"><p class=\"text-xs font-semibold text-gray-500 dark:text-zinc-400\">{$label}</p><div class=\"flex flex-wrap gap-x-4 gap-y-1.5\">";
        foreach ($options as $val => $lbl) {
            $html .= "<label class=\"flex cursor-pointer items-center gap-1.5\">
                <input type=\"checkbox\" wire:model=\"pengkajianData.{$key}.data.{$field}\" value=\"{$val}\"
                    class=\"size-3.5 rounded text-orange-500 focus:ring-orange-400\">
                <span class=\"text-sm text-gray-700 dark:text-zinc-300\">{$lbl}</span>
            </label>";
        }
        $html .= '</div></div>';
        return $html;
    };

    /** Helper: text input with unit */
    $textInput = function (string $key, string $field, string $label, string $unit = '', string $placeholder = '') use (&$pengkajianData): string {
        $html = "<div class=\"space-y-1.5\"><p class=\"text-xs font-semibold text-gray-500 dark:text-zinc-400\">{$label}</p>
            <div class=\"flex items-center gap-2\">
            <input type=\"text\" wire:model=\"pengkajianData.{$key}.data.{$field}\"
                placeholder=\"{$placeholder}\"
                class=\"w-32 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white\">";
        if ($unit) {
            $html .= "<span class=\"text-xs text-gray-500 dark:text-zinc-400\">{$unit}</span>";
        }
        $html .= '</div></div>';
        return $html;
    };

    /** Helper: textarea input */
    $textareaInput = function (string $key, string $field, string $label, string $placeholder = '') use (&$pengkajianData): string {
        return "<div class=\"space-y-1.5\"><p class=\"text-xs font-semibold text-gray-500 dark:text-zinc-400\">{$label}</p>
            <textarea wire:model=\"pengkajianData.{$key}.data.{$field}\"
                placeholder=\"{$placeholder}\" rows=\"2\"
                class=\"w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white\">
            </textarea></div>";
    };
@endphp

@php
    /** Card wrapper */
    $fisikSystems = [
        'fisik_penglihatan'     => ['num' => 1,  'title' => 'Sistem Penglihatan'],
        'fisik_pendengaran'     => ['num' => 2,  'title' => 'Sistem Pendengaran'],
        'fisik_wicara'          => ['num' => 3,  'title' => 'Sistem Wicara'],
        'fisik_pernafasan'      => ['num' => 4,  'title' => 'Sistem Pernafasan'],
        'fisik_kardiovaskuler'  => ['num' => 5,  'title' => 'Sistem Kardiovaskuler'],
        'fisik_hematologi'      => ['num' => 6,  'title' => 'Sistem Hematologi'],
        'fisik_saraf'           => ['num' => 7,  'title' => 'Sistem Saraf Pusat'],
        'fisik_pencernaan'      => ['num' => 8,  'title' => 'Sistem Pencernaan'],
        'fisik_endokrin'        => ['num' => 9,  'title' => 'Sistem Endokrin'],
        'fisik_urogenital'      => ['num' => 10, 'title' => 'Sistem Urogenital'],
        'fisik_integumen'       => ['num' => 11, 'title' => 'Sistem Integumen'],
        'fisik_muskuloskeletal' => ['num' => 12, 'title' => 'Sistem Muskuloskeletal'],
        'fisik_imun'            => ['num' => 13, 'title' => 'Sistem Kekebalan Tubuh'],
    ];
@endphp

@foreach ($fisikSystems as $key => $meta)
<div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-zinc-700 dark:bg-zinc-800"
     wire:key="{{ $key }}">

    {{-- Card header --}}
    <div class="mb-5 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <span class="flex size-7 shrink-0 items-center justify-center rounded-full bg-orange-100 text-xs font-bold text-polsub dark:bg-orange-900/30">
                {{ $meta['num'] }}
            </span>
            <h3 class="font-semibold text-gray-800 dark:text-white">{{ $meta['title'] }}</h3>
            @if (! empty($pengkajianData[$key]['is_abnormal']))
                <span class="rounded-full bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-600 dark:bg-red-900/20 dark:text-red-400">Abnormal</span>
            @endif
        </div>
        <label class="flex cursor-pointer items-center gap-1.5">
            <input
                type="checkbox"
                wire:model="pengkajianData.{{ $key }}.is_abnormal"
                class="size-4 rounded border-gray-300 text-red-500 focus:ring-red-400 dark:border-zinc-600"
            />
            <span class="text-xs font-medium text-gray-500 dark:text-zinc-400">Abnormal</span>
        </label>
    </div>

    {{-- ── System-specific fields ─────────────────────────────────────── --}}
    @if ($key === 'fisik_penglihatan')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_penglihatan', 'posisi_mata', 'Posisi Mata', ['simetris' => 'Simetris', 'asimetris' => 'Asimetris']) !!}
        {!! $radio('fisik_penglihatan', 'kelopak_mata', 'Kelopak Mata', ['normal' => 'Normal', 'ptosis' => 'Ptosis']) !!}
        {!! $radio('fisik_penglihatan', 'gerakan', 'Gerakan', ['normal' => 'Normal', 'abnormal' => 'Abnormal']) !!}
        {!! $radio('fisik_penglihatan', 'pergerakan_bola_mata', 'Pergerakan Bola Mata', ['normal' => 'Normal', 'abnormal' => 'Abnormal']) !!}
        {!! $radio('fisik_penglihatan', 'konjungtiva', 'Konjungtiva', ['normal' => 'Normal/Merah', 'sangat_merah' => 'Sangat Merah', 'anemis' => 'Anemis']) !!}
        {!! $radio('fisik_penglihatan', 'kornea', 'Kornea', ['normal' => 'Normal', 'keruh' => 'Keruh/Berkabut']) !!}
        {!! $radio('fisik_penglihatan', 'sklera', 'Sklera', ['ikterik' => 'Ikterik', 'anikterik' => 'Anikterik']) !!}
        {!! $checkboxes('fisik_penglihatan', 'pupil', 'Pupil', ['isokor' => 'Isokor', 'anisokor' => 'Anisokor', 'midriasis' => 'Midriasis', 'miosis' => 'Miosis']) !!}
        {!! $checkboxes('fisik_penglihatan', 'otot_mata', 'Otot-Otot Mata', ['tidak_ada_kelainan' => 'Tidak ada kelainan', 'juling_keluar' => 'Juling keluar', 'juling_dalam' => 'Juling ke dalam', 'berada_atas' => 'Berada di atas']) !!}
        {!! $checkboxes('fisik_penglihatan', 'fungsi_penglihatan', 'Fungsi Penglihatan', ['baik' => 'Baik', 'kabur' => 'Kabur', 'diplopia' => 'Diplopia']) !!}
        <div class="space-y-1.5">
            <p class="text-xs font-semibold text-gray-500 dark:text-zinc-400">Tanda-Tanda Radang</p>
            <input type="text" wire:model="pengkajianData.fisik_penglihatan.data.tanda_radang"
                placeholder="Deskripsi..."
                class="w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white" />
        </div>
        {!! $radio('fisik_penglihatan', 'kacamata', 'Pemakaian Kacamata', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_penglihatan', 'lensa_kontak', 'Pemakaian Lensa Kontak', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
    </div>

    @elseif ($key === 'fisik_pendengaran')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_pendengaran', 'daun_telinga', 'Daun Telinga', ['normal' => 'Normal / Tidak sakit', 'sakit' => 'Sakit saat digerakkan']) !!}
        {!! $checkboxes('fisik_pendengaran', 'kondisi_telinga', 'Kondisi Telinga', ['normal' => 'Normal', 'kemerahan' => 'Kemerahan', 'bengkak' => 'Bengkak', 'lesi' => 'Terdapat lesi']) !!}
        {!! $radio('fisik_pendengaran', 'cairan_telinga', 'Cairan dari Telinga', ['tidak_ada' => 'Tidak ada', 'darah' => 'Darah', 'nanah' => 'Nanah']) !!}
        {!! $radio('fisik_pendengaran', 'tinnitus', 'Tinitus', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pendengaran', 'fungsi_pendengaran', 'Fungsi Pendengaran', ['normal' => 'Normal', 'kurang' => 'Kurang', 'tuli' => 'Tuli']) !!}
        {!! $radio('fisik_pendengaran', 'alat_bantu', 'Alat Bantu Dengar', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pendengaran', 'perasaan_penuh', 'Perasaan Penuh pada Telinga', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
    </div>

    @elseif ($key === 'fisik_wicara')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $checkboxes('fisik_wicara', 'gangguan', 'Kesulitan / Gangguan Wicara', [
            'aphasia' => 'Aphasia', 'dysphasia' => 'Dysphasia',
            'aphonia' => 'Aphonia', 'anarthria' => 'Anarthria',
            'dysarthria' => 'Dysarthria', 'tidak_ada' => 'Tidak Ada',
        ]) !!}
    </div>

    @elseif ($key === 'fisik_pernafasan')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $textInput('fisik_pernafasan', 'frekuensi', 'Frekuensi', 'x/mnt', '0') !!}
        {!! $checkboxes('fisik_pernafasan', 'jalan_nafas', 'Jalan Nafas', ['bersih' => 'Bersih', 'sputum' => 'Sputum', 'lendir' => 'Lendir', 'darah' => 'Darah', 'sumbatan' => 'Sumbatan', 'lidah' => 'Lidah']) !!}
        {!! $radio('fisik_pernafasan', 'sesak', 'Pernafasan', ['sesak' => 'Sesak', 'tidak_sesak' => 'Tidak Sesak']) !!}
        {!! $radio('fisik_pernafasan', 'otot_bantu', 'Otot Bantu Pernafasan', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pernafasan', 'irama', 'Irama', ['teratur' => 'Teratur', 'tidak_teratur' => 'Tidak Teratur']) !!}
        {!! $radio('fisik_pernafasan', 'kedalaman', 'Kedalaman', ['dalam' => 'Dalam', 'dangkal' => 'Dangkal']) !!}
        {!! $radio('fisik_pernafasan', 'batuk', 'Batuk', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pernafasan', 'batuk_jenis', 'Jenis Batuk', ['produktif' => 'Produktif', 'non_produktif' => 'Non Produktif']) !!}
        {!! $checkboxes('fisik_pernafasan', 'sputum_warna', 'Warna Sputum', ['putih' => 'Putih', 'kuning' => 'Kuning', 'hijau' => 'Hijau']) !!}
        {!! $radio('fisik_pernafasan', 'sputum_konsistensi', 'Konsistensi Sputum', ['kental' => 'Kental', 'encer' => 'Encer']) !!}
        {!! $radio('fisik_pernafasan', 'sputum_darah', 'Terdapat Darah', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_pernafasan', 'suara_nafas', 'Suara Nafas', ['normal' => 'Normal', 'ronchi' => 'Ronchi', 'wheezing' => 'Wheezing', 'rales' => 'Rales']) !!}
    </div>

    @elseif ($key === 'fisik_kardiovaskuler')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $textInput('fisik_kardiovaskuler', 'nadi', 'Nadi', 'x/mnt') !!}
        {!! $radio('fisik_kardiovaskuler', 'irama_nadi', 'Irama Nadi', ['teratur' => 'Teratur', 'tidak_teratur' => 'Tidak Teratur']) !!}
        {!! $radio('fisik_kardiovaskuler', 'denyut', 'Denyut', ['lemah' => 'Lemah', 'kuat' => 'Kuat']) !!}
        {!! $textInput('fisik_kardiovaskuler', 'tekanan_darah', 'Tekanan Darah', 'mmHg', '120/80') !!}
        {!! $radio('fisik_kardiovaskuler', 'distensi_vena_kanan', 'Distensi Vena Jugularis Kanan', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_kardiovaskuler', 'distensi_vena_kiri', 'Distensi Vena Jugularis Kiri', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_kardiovaskuler', 'temperatur_kulit', 'Temperatur Kulit', ['hangat' => 'Hangat', 'dingin' => 'Dingin']) !!}
        {!! $checkboxes('fisik_kardiovaskuler', 'warna_kulit', 'Warna Kulit', ['pucat' => 'Pucat', 'sianosis' => 'Sianosis', 'kemerahan' => 'Kemerahan']) !!}
        {!! $textInput('fisik_kardiovaskuler', 'pengisian_kapiler', 'Pengisian Kapiler', 'detik') !!}
        {!! $radio('fisik_kardiovaskuler', 'edema', 'Edema', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_kardiovaskuler', 'edema_lokasi', 'Lokasi Edema', ['tungkai_atas' => 'Tungkai atas', 'tungkai_bawah' => 'Tungkai bawah', 'periorbital' => 'Periorbital', 'muka' => 'Muka']) !!}
        {!! $radio('fisik_kardiovaskuler', 'irama_jantung', 'Irama Jantung', ['teratur' => 'Teratur', 'tidak_teratur' => 'Tidak Teratur']) !!}
        {!! $checkboxes('fisik_kardiovaskuler', 'bunyi_jantung', 'Bunyi Jantung', ['normal' => 'Normal', 'murmur' => 'Murmur', 'gallop' => 'Gallop']) !!}
        {!! $radio('fisik_kardiovaskuler', 'nyeri_dada', 'Nyeri Dada', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_kardiovaskuler', 'nyeri_timbul', 'Timbulnya Nyeri', ['saat_aktivitas' => 'Saat Aktivitas', 'tanpa_aktivitas' => 'Tanpa Aktivitas']) !!}
        {!! $checkboxes('fisik_kardiovaskuler', 'nyeri_karakter', 'Karakter Nyeri', ['ditusuk' => 'Seperti ditusuk-tusuk', 'terbakar' => 'Seperti terbakar', 'tertimpa' => 'Seperti tertimpa benda berat']) !!}
    </div>

    @elseif ($key === 'fisik_hematologi')
    <div class="grid grid-cols-2 gap-4 sm:grid-cols-3">
        {!! $textInput('fisik_hematologi', 'hb', 'Hemoglobin (Hb)', 'gr/dl') !!}
        {!! $textInput('fisik_hematologi', 'ht', 'Hematokrit (Ht)', 'Vol%') !!}
        {!! $textInput('fisik_hematologi', 'leukosit', 'Leukosit', 'ribu/ul') !!}
        {!! $textInput('fisik_hematologi', 'eritrosit', 'Eritrosit', 'juta/ul') !!}
        {!! $textInput('fisik_hematologi', 'trombosit', 'Trombosit', 'ribu/ul') !!}
    </div>

    @elseif ($key === 'fisik_saraf')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_saraf', 'kesadaran', 'Tingkat Kesadaran', ['compos_mentis' => 'Compos Mentis', 'apatis' => 'Apatis', 'somnolen' => 'Somnolen', 'soporus' => 'Soporus', 'koma' => 'Koma']) !!}
        {!! $radio('fisik_saraf', 'pupil', 'Pupil', ['isokor' => 'Isokor', 'anisokor' => 'Anisokor']) !!}
        {!! $radio('fisik_saraf', 'reaksi_cahaya_kanan', 'Reaksi terhadap Cahaya — Kanan', ['positif' => 'Positif', 'negatif' => 'Negatif']) !!}
        {!! $radio('fisik_saraf', 'reaksi_cahaya_kiri', 'Reaksi terhadap Cahaya — Kiri', ['positif' => 'Positif', 'negatif' => 'Negatif']) !!}
        {!! $radio('fisik_saraf', 'peningkatan_tik', 'Peningkatan Tekanan Intra Kranial', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_saraf', 'kelainan', 'Kelainan', [
            'kejang' => 'Kejang',
            'lumpuh_kanan' => 'Kelumpuhan kanan',
            'lumpuh_kiri' => 'Kelumpuhan kiri',
            'pelo' => 'Pelo',
            'mulut_mencong' => 'Mulut mencong',
            'dysarthria' => 'Dysarthria',
            'disorientasi' => 'Disorientasi',
        ]) !!}
        <div class="space-y-1.5">
            <p class="text-xs font-semibold text-gray-500 dark:text-zinc-400">GCS</p>
            <div class="flex items-center gap-3">
                <div class="flex items-center gap-1">
                    <span class="text-xs text-gray-500">E</span>
                    <input type="number" wire:model="pengkajianData.fisik_saraf.data.gcs_e" min="1" max="4"
                        class="w-14 rounded-lg border border-gray-200 bg-white px-2 py-1.5 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white" />
                </div>
                <div class="flex items-center gap-1">
                    <span class="text-xs text-gray-500">M</span>
                    <input type="number" wire:model="pengkajianData.fisik_saraf.data.gcs_m" min="1" max="6"
                        class="w-14 rounded-lg border border-gray-200 bg-white px-2 py-1.5 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white" />
                </div>
                <div class="flex items-center gap-1">
                    <span class="text-xs text-gray-500">V</span>
                    <input type="number" wire:model="pengkajianData.fisik_saraf.data.gcs_v" min="1" max="5"
                        class="w-14 rounded-lg border border-gray-200 bg-white px-2 py-1.5 text-sm outline-none focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20 dark:border-zinc-600 dark:bg-zinc-700 dark:text-white" />
                </div>
            </div>
        </div>
    </div>

    @elseif ($key === 'fisik_pencernaan')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_pencernaan', 'gigi_caries', 'Gigi Caries', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pencernaan', 'gigi_palsu', 'Gigi Palsu', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pencernaan', 'stomatitis', 'Stomatitis', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pencernaan', 'lidah_kotor', 'Lidah Kotor', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pencernaan', 'saliva', 'Saliva', ['normal' => 'Normal', 'abnormal' => 'Abnormal']) !!}
        {!! $radio('fisik_pencernaan', 'muntah', 'Muntah', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_pencernaan', 'isi_muntah', 'Isi Muntah', ['makanan' => 'Makanan', 'cairan' => 'Cairan', 'darah' => 'Darah']) !!}
        {!! $checkboxes('fisik_pencernaan', 'warna_muntah', 'Warna Muntah', ['kehijauan' => 'Kehijauan', 'coklat' => 'Coklat', 'kuning' => 'Kuning', 'sesuai_makanan' => 'Sesuai warna makanan', 'hitam' => 'Hitam']) !!}
        {!! $radio('fisik_pencernaan', 'mual', 'Mual', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_pencernaan', 'nafsu_makan', 'Nafsu Makan', ['baik' => 'Baik', 'kurang' => 'Kurang', 'naik' => 'Naik']) !!}
        {!! $radio('fisik_pencernaan', 'nyeri_perut', 'Nyeri Daerah Perut', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_pencernaan', 'nyeri_karakter', 'Karakter Nyeri Perut', ['melilit' => 'Melilit-lilit', 'kram' => 'Kram', 'menyebar' => 'Menyebar', 'setempat' => 'Setempat', 'kanan_atas' => 'Kanan atas', 'kanan_bawah' => 'Kanan bawah', 'kiri_atas' => 'Kiri atas', 'kiri_bawah' => 'Kiri bawah', 'berpindah' => 'Berpindah-pindah', 'terbakar' => 'Seperti terbakar', 'ditusuk' => 'Seperti ditusuk']) !!}
        {!! $textInput('fisik_pencernaan', 'bab_kebiasaan', 'Kebiasaan BAB', 'x/hari') !!}
        {!! $textInput('fisik_pencernaan', 'bising_usus', 'Bising Usus', 'x/mnt') !!}
        {!! $checkboxes('fisik_pencernaan', 'warna_feces', 'Warna Feces', ['kuning' => 'Kuning', 'coklat' => 'Coklat', 'hitam' => 'Hitam', 'berdarah' => 'Berdarah']) !!}
        {!! $checkboxes('fisik_pencernaan', 'konsistensi_feces', 'Konsistensi Feces', ['normal' => 'Normal', 'lembek' => 'Lembek', 'ada_lendir' => 'Ada lendir']) !!}
        {!! $radio('fisik_pencernaan', 'hepar', 'Hepar', ['teraba' => 'Teraba', 'tidak_teraba' => 'Tidak Teraba']) !!}
        {!! $checkboxes('fisik_pencernaan', 'abdomen', 'Abdomen', ['normal' => 'Normal', 'kembung' => 'Kembung', 'asites' => 'Asites']) !!}
    </div>

    @elseif ($key === 'fisik_endokrin')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_endokrin', 'nafas_bau_keton', 'Nafas Berbau Keton', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $checkboxes('fisik_endokrin', 'kelainan', 'Kelainan Endokrin', [
            'keringat_banyak' => 'Keringat banyak',
            'urine_banyak' => 'Urine banyak',
            'urine_sedikit' => 'Urine sedikit',
            'hipokalemi' => 'Hipokalemi',
            'hiperkalemi' => 'Hiperkalemi',
            'poliphagia' => 'Poliphagia',
            'poliuri' => 'Poliuri',
            'polidipsi' => 'Polidipsi',
        ]) !!}
        {!! $radio('fisik_endokrin', 'gangren', 'Gangren', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_endokrin', 'gangren_warna', 'Warna Gangren', ['kehijauan' => 'Kehijauan', 'hitam' => 'Hitam']) !!}
        {!! $radio('fisik_endokrin', 'gangren_bau', 'Bau Khas Gangren', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_endokrin', 'exopthalmus', 'Exopthalmus', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_endokrin', 'tremor', 'Tremor', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_endokrin', 'kelenjar_tiroid', 'Kelenjar Tiroid', ['membesar' => 'Membesar', 'tidak' => 'Tidak Membesar']) !!}
    </div>

    @elseif ($key === 'fisik_urogenital')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $checkboxes('fisik_urogenital', 'perubahan_pola', 'Perubahan Pola Berkemih', [
            'retensi' => 'Retensi',
            'urgency' => 'Urgency',
            'resistensi' => 'Resistensi',
            'perubahan_frekuensi' => 'Perubahan frekuensi',
            'nokturia' => 'Nokturia',
            'tidak_lampias' => 'BAK tidak lampias',
        ]) !!}
        {!! $textInput('fisik_urogenital', 'bak_frekuensi', 'Frekuensi BAK', 'x/hari') !!}
        {!! $radio('fisik_urogenital', 'bak_kontrol', 'Kontrol BAK', ['terkontrol' => 'Terkontrol', 'tidak_terkontrol' => 'Tidak Terkontrol']) !!}
        {!! $textInput('fisik_urogenital', 'bak_jumlah', 'Jumlah BAK', 'cc/24 jam') !!}
        {!! $radio('fisik_urogenital', 'bak_warna', 'Warna BAK', ['kuning_jernih' => 'Kuning jernih', 'merah' => 'Merah', 'kuning_kental' => 'Kuning kental/cokelat', 'putih_bening' => 'Putih/bening']) !!}
        {!! $radio('fisik_urogenital', 'distensi_kandung_kemih', 'Distensi Kandung Kemih', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_urogenital', 'nyeri_pinggang', 'Keluhan Sakit Pinggang', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_urogenital', 'pembesaran_prostat', 'Pembesaran Kelenjar Prostat', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $textareaInput('fisik_urogenital', 'keadaan_genitalia', 'Keadaan Genitalia', 'Deskripsi keadaan genitalia...') !!}
    </div>

    @elseif ($key === 'fisik_integumen')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_integumen', 'turgor', 'Turgor Kulit', ['baik' => 'Baik / Elastis', 'sedang' => 'Sedang', 'buruk' => 'Buruk']) !!}
        {!! $checkboxes('fisik_integumen', 'warna_kulit', 'Warna Kulit', ['pucat' => 'Pucat', 'kemerahan' => 'Kemerahan', 'sianosis' => 'Sianosis']) !!}
        {!! $checkboxes('fisik_integumen', 'keadaan_kulit', 'Keadaan Kulit', [
            'baik' => 'Baik',
            'lesi' => 'Terdapat lesi',
            'ulkus' => 'Ulkus',
            'bercak_merah' => 'Bercak merah',
            'gatal' => 'Gatal-gatal',
            'memar' => 'Memar',
            'luka_bakar' => 'Luka bakar',
            'terdapat_luka' => 'Terdapat luka',
            'ptechie' => 'Ptechie',
            'nyeri_tekan' => 'Nyeri tekan',
            'insisi_operasi' => 'Insisi operasi',
            'dekubitus' => 'Dekubitus',
        ]) !!}
        {!! $radio('fisik_integumen', 'tekstur_rambut', 'Tekstur Rambut', ['baik' => 'Baik / Kuat', 'rapuh' => 'Rapuh / Rontok']) !!}
        {!! $radio('fisik_integumen', 'kebersihan_rambut', 'Kebersihan Rambut', ['bersih' => 'Bersih', 'kotor' => 'Kotor']) !!}
    </div>

    @elseif ($key === 'fisik_muskuloskeletal')
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {!! $radio('fisik_muskuloskeletal', 'kesulitan_pergerakan', 'Kesulitan dalam Pergerakan', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_muskuloskeletal', 'nyeri_tulang', 'Nyeri Tulang / Sendi / Kulit', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $radio('fisik_muskuloskeletal', 'fraktur', 'Fraktur', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
        {!! $textInput('fisik_muskuloskeletal', 'lokasi_fraktur', 'Lokasi Fraktur', '', 'Misal: femur kiri') !!}
        {!! $textInput('fisik_muskuloskeletal', 'jenis_fraktur', 'Jenis Fraktur', '', 'Misal: closed, open') !!}
        {!! $checkboxes('fisik_muskuloskeletal', 'kelainan_bentuk', 'Kelainan Bentuk', [
            'kontraktur' => 'Kontraktur',
            'skoliosis' => 'Skoliosis',
            'lordosis' => 'Lordosis',
            'kyphosis' => 'Kyphosis',
        ]) !!}
        {!! $radio('fisik_muskuloskeletal', 'tonus_otot', 'Keadaan Tonus Otot', ['hipotonia' => 'Hipotonia', 'hipertonia' => 'Hipertonia', 'atonia' => 'Atonia', 'normal' => 'Normal']) !!}
    </div>

    @elseif ($key === 'fisik_imun')
    <div class="grid grid-cols-2 gap-4 sm:grid-cols-4">
        {!! $textInput('fisik_imun', 'suhu', 'Suhu Tubuh', '°C') !!}
        {!! $textInput('fisik_imun', 'bb_sebelum', 'BB Sebelum Sakit', 'kg') !!}
        {!! $textInput('fisik_imun', 'bb_sesudah', 'BB Sesudah Sakit', 'kg') !!}
        {!! $radio('fisik_imun', 'pembesaran_kelenjar', 'Pembesaran Kel. Getah Bening', ['ya' => 'Ya', 'tidak' => 'Tidak']) !!}
    </div>
    @endif

    {{-- Notes per sistem --}}
    <div class="mt-4 border-t border-gray-100 pt-4 dark:border-zinc-700">
        <flux:textarea
            wire:model="pengkajianData.{{ $key }}.observasi"
            label="Catatan Tambahan (opsional)"
            placeholder="Temuan lain atau keterangan tambahan..."
            rows="2"
        />
    </div>
</div>
@endforeach
