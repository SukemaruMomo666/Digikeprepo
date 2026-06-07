# DigiKep — Rencana Pengembangan

> Dokumen ini adalah acuan teknis pengerjaan DigiKep ke depan.
> Berdasarkan: review dosen, `spesifikasi_alur_askep_digikep.md`, `DIGIKEP-RANCANGAN.md`, dan kondisi database aktual per Juni 2026.

---

## Daftar Isi

1. [Keputusan Arsitektur](#1-keputusan-arsitektur)
2. [Fase 0 — Refactor Database](#2-fase-0--refactor-database)
3. [Fase 1 — Revisi Dosen](#3-fase-1--revisi-dosen)
4. [Fase 2 — Rebuild Modul Askep](#4-fase-2--rebuild-modul-askep)
5. [Fase 3 — Role Dosen & Feedback](#5-fase-3--role-dosen--feedback)
6. [Fase 4 — Fitur Tambahan](#6-fase-4--fitur-tambahan)
7. [Kelengkapan Data 3S](#7-kelengkapan-data-3s)
8. [Yang Perlu Disediakan](#8-yang-perlu-disediakan)
9. [Urutan Eksekusi](#9-urutan-eksekusi)

---

## 1. Keputusan Arsitektur

| # | Keputusan | Detail |
|---|---|---|
| 1 | **Full refactor** | Semua tabel askep lama dihapus, dibangun ulang |
| 2 | **Tabel `pasien` diperluas** | Tambah 8 kolom baru, hapus `status_askep` |
| 3 | **Nama tabel 3S tetap** | `diagnosa_sdki`, `luaran_slki`, `intervensi_siki` — tidak di-rename |
| 4 | **SLKI di step 3** | Step 3 = Perencanaan (SLKI + SIKI), bukan di step 2 |
| 5 | **Rekomendasi diagnosa = MVP** | Filter + search saja, tidak ada rule engine / AI |
| 6 | **Pengkajian biologis terstruktur** | JSON per section dalam satu baris `askep_pengkajian` |

---

## 2. Fase 0 — Refactor Database

> Dikerjakan pertama sebelum apapun. Semua data seed lama boleh dihapus.

### 2.1 Tabel yang Dihapus

| Tabel Lama | Digantikan Oleh |
|---|---|
| `pengkajian` | `askep_pengkajian` |
| `diagnosa_pasien` | `askep_diagnosa` |
| `luaran_pasien` | `askep_diagnosa_luaran` |
| `intervensi_pasien` | `askep_intervensi` |
| `evaluasi_pasien` | `askep_evaluasi` |

### 2.2 Tabel `pasien` — Perubahan

**Hapus kolom:**
- `status_askep` — dipindah ke tabel `askep`

**Tambah kolom:**
```
tanggal_lahir       DATE                          ← tambah (umur tetap ada, auto-hitung)
agama               VARCHAR(50) NULLABLE
status_perkawinan   VARCHAR(30) NULLABLE
pekerjaan           VARCHAR(100) NULLABLE
pendidikan          VARCHAR(50) NULLABLE
alamat              TEXT NULLABLE
diagnosa_medis      VARCHAR(255) NULLABLE
bb                  DECIMAL(5,2) NULLABLE         ← berat badan (kg)
tb                  SMALLINT UNSIGNED NULLABLE    ← tinggi badan (cm)
```

### 2.3 Tabel Baru — `askep`

Entity utama askep. Satu pasien bisa punya lebih dari satu askep.

```sql
CREATE TABLE askep (
    id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pasien_id       BIGINT UNSIGNED NOT NULL,
    user_id         BIGINT UNSIGNED NOT NULL,       -- mahasiswa pemilik
    status          ENUM(
                        'draft',
                        'menunggu_review',
                        'perlu_revisi',
                        'disetujui',
                        'selesai'
                    ) DEFAULT 'draft',
    step_terakhir   TINYINT UNSIGNED DEFAULT 1,     -- untuk resume
    catatan_dosen   TEXT NULLABLE,                  -- feedback umum dari dosen
    submitted_at    TIMESTAMP NULLABLE,
    reviewed_at     TIMESTAMP NULLABLE,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,
    FOREIGN KEY (pasien_id) REFERENCES pasien(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### 2.4 Tabel Baru — `askep_pengkajian`

Satu baris per askep. Semua data pengkajian dalam satu record.

```sql
CREATE TABLE askep_pengkajian (
    id                      BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_id                BIGINT UNSIGNED NOT NULL UNIQUE,

    -- Identitas penanggung jawab
    pj_nama                 VARCHAR(255) NULLABLE,
    pj_umur                 TINYINT UNSIGNED NULLABLE,
    pj_pendidikan           VARCHAR(100) NULLABLE,
    pj_pekerjaan            VARCHAR(100) NULLABLE,
    pj_alamat               TEXT NULLABLE,

    -- EWS / Tanda Vital
    ews_td                  VARCHAR(20) NULLABLE,       -- "120/80"
    ews_nadi                TINYINT UNSIGNED NULLABLE,
    ews_rr                  TINYINT UNSIGNED NULLABLE,
    ews_suhu                DECIMAL(4,1) NULLABLE,
    ews_spo2                TINYINT UNSIGNED NULLABLE,
    ews_kesadaran           VARCHAR(20) NULLABLE,       -- AVPU
    ews_skor                TINYINT UNSIGNED NULLABLE,  -- auto-hitung

    -- Anthropometri
    bb                      DECIMAL(5,2) NULLABLE,
    tb                      SMALLINT UNSIGNED NULLABLE,

    -- Riwayat Penyakit (JSON per sub-section)
    riwayat_sekarang        JSON NULLABLE,
    riwayat_lalu            JSON NULLABLE,
    riwayat_keluarga        JSON NULLABLE,

    -- Pengkajian Biologis (JSON per section)
    biologis_nyeri          JSON NULLABLE,
    biologis_aktivitas      JSON NULLABLE,
    biologis_istirahat      JSON NULLABLE,
    biologis_tidur          JSON NULLABLE,
    biologis_cairan         JSON NULLABLE,
    biologis_nutrisi        JSON NULLABLE,
    biologis_eliminasi_feses JSON NULLABLE,
    biologis_eliminasi_urine JSON NULLABLE,
    biologis_oksigenasi     JSON NULLABLE,
    biologis_kardiovaskuler JSON NULLABLE,
    biologis_hygiene        JSON NULLABLE,
    biologis_seksualitas    JSON NULLABLE,

    -- Psikososial & Spiritual
    psiko_emosi             JSON NULLABLE,
    psiko_konsep_diri       JSON NULLABLE,
    psiko_sosial            JSON NULLABLE,
    psiko_spiritual         JSON NULLABLE,

    -- Pemeriksaan Fisik
    fisik_umum              TEXT NULLABLE,
    fisik_penglihatan       JSON NULLABLE,
    fisik_pendengaran       JSON NULLABLE,
    fisik_wicara            JSON NULLABLE,
    fisik_pernapasan        JSON NULLABLE,
    fisik_kardiovaskuler    JSON NULLABLE,
    fisik_hematologi        JSON NULLABLE,
    fisik_saraf             JSON NULLABLE,
    fisik_pencernaan        JSON NULLABLE,
    fisik_endokrin          JSON NULLABLE,
    fisik_urogenital        JSON NULLABLE,
    fisik_integumen         JSON NULLABLE,
    fisik_muskuloskeletal   JSON NULLABLE,
    fisik_imun              JSON NULLABLE,

    created_at              TIMESTAMP,
    updated_at              TIMESTAMP,
    FOREIGN KEY (askep_id) REFERENCES askep(id) ON DELETE CASCADE
);
```

### 2.5 Tabel Baru — `askep_diagnosa`

```sql
CREATE TABLE askep_diagnosa (
    id                  BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_id            BIGINT UNSIGNED NOT NULL,
    sdki_id             BIGINT UNSIGNED NOT NULL,   -- FK ke diagnosa_sdki
    prioritas           TINYINT UNSIGNED DEFAULT 1,
    etiologi_dipilih    JSON NULLABLE,  -- array sdki_penyebab.id yang dicentang
    gejala_dipilih      JSON NULLABLE,  -- array sdki_gejala.id yang dicentang
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    FOREIGN KEY (askep_id) REFERENCES askep(id) ON DELETE CASCADE,
    FOREIGN KEY (sdki_id) REFERENCES diagnosa_sdki(id)
);
```

### 2.6 Tabel Baru — `askep_diagnosa_luaran` (Step 3 — SLKI)

```sql
CREATE TABLE askep_diagnosa_luaran (
    id                  BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_diagnosa_id   BIGINT UNSIGNED NOT NULL,
    slki_id             BIGINT UNSIGNED NOT NULL,   -- FK ke luaran_slki
    target_waktu        VARCHAR(50) NULLABLE,       -- mis. "3 hari", "1 minggu"
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    FOREIGN KEY (askep_diagnosa_id) REFERENCES askep_diagnosa(id) ON DELETE CASCADE,
    FOREIGN KEY (slki_id) REFERENCES luaran_slki(id)
);
```

### 2.7 Tabel Baru — `askep_intervensi` (Step 3 — SIKI)

```sql
CREATE TABLE askep_intervensi (
    id                  BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_diagnosa_id   BIGINT UNSIGNED NOT NULL,
    siki_id             BIGINT UNSIGNED NULLABLE,       -- NULL jika intervensi manual
    nama_manual         VARCHAR(255) NULLABLE,          -- isi jika manual
    frekuensi           VARCHAR(50) NULLABLE,
    tindakan_dipilih    JSON NULLABLE,  -- array id tindakan yang dicentang
    is_included         TINYINT(1) DEFAULT 1,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    FOREIGN KEY (askep_diagnosa_id) REFERENCES askep_diagnosa(id) ON DELETE CASCADE,
    FOREIGN KEY (siki_id) REFERENCES intervensi_siki(id)
);
```

### 2.8 Tabel Baru — `askep_implementasi` (Step 4)

```sql
CREATE TABLE askep_implementasi (
    id                      BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_intervensi_id     BIGINT UNSIGNED NOT NULL,
    tanggal                 DATE NOT NULL,
    waktu                   TIME NOT NULL,
    shift                   ENUM('Pagi','Siang','Malam') NOT NULL,
    durasi_menit            SMALLINT UNSIGNED NULLABLE,
    tindakan_dilakukan      JSON NULLABLE,      -- array tindakan yang dilakukan
    spo2_sebelum            TINYINT UNSIGNED NULLABLE,
    spo2_setelah            TINYINT UNSIGNED NULLABLE,
    catatan                 TEXT NULLABLE,
    respons_pasien          ENUM('Positif','Netral','Negatif') NULLABLE,
    FOREIGN KEY (askep_intervensi_id) REFERENCES askep_intervensi(id) ON DELETE CASCADE
);
-- Note: tidak pakai timestamps, pakai tanggal+waktu eksplisit
```

### 2.9 Tabel Baru — `askep_evaluasi` (Step 5)

```sql
CREATE TABLE askep_evaluasi (
    id                  BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_diagnosa_id   BIGINT UNSIGNED NOT NULL,
    tanggal             DATE NOT NULL,
    jam                 TIME NOT NULL,
    hari_ke             TINYINT UNSIGNED NULLABLE,  -- auto-hitung dari tanggal_masuk
    komplikasi          TEXT NULLABLE,
    catatan_soap        TEXT NULLABLE,
    -- Monitoring TTV
    tv_td               VARCHAR(20) NULLABLE,
    tv_rr               TINYINT UNSIGNED NULLABLE,
    tv_nadi             TINYINT UNSIGNED NULLABLE,
    tv_spo2             TINYINT UNSIGNED NULLABLE,
    tv_suhu             DECIMAL(4,1) NULLABLE,
    -- Penilaian luaran
    skor_indikator      JSON NULLABLE,  -- {slki_indikator_id: skor 1-5}
    -- Analisis
    analisis            ENUM('Tercapai','Membaik','Belum Tercapai') NULLABLE,
    analisis_narasi     TEXT NULLABLE,
    tindak_lanjut       ENUM('Lanjutkan','Hentikan','Modifikasi','Rujuk') NULLABLE,
    penanggung_jawab    VARCHAR(255) NULLABLE,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    FOREIGN KEY (askep_diagnosa_id) REFERENCES askep_diagnosa(id) ON DELETE CASCADE
);
```

### 2.10 Tabel Tetap (Tidak Diubah)

```
diagnosa_sdki        ← tetap, sudah ada 149 data
luaran_slki          ← tetap, sudah ada 112 data (konten perlu dilengkapi)
intervensi_siki      ← tetap, sudah ada 77 data (konten perlu dilengkapi)
sdki_penyebab        ← tetap, 487 rows
sdki_gejala          ← tetap, 786 rows
sdki_faktor_risiko   ← tetap, 285 rows
sdki_kondisi_klinis  ← tetap, 710 rows
sdki_slki_relations  ← tetap (hanya 10, perlu dilengkapi)
slki_siki_relations  ← tetap (hanya 10, perlu dilengkapi)
users                ← tetap (+ tambah role 'dosen' nanti di Fase 3)
pasien               ← tetap + perubahan di atas
```

### 2.11 Model & File yang Perlu Diperbarui/Dibuat

| File | Aksi |
|---|---|
| `app/Models/Pasien.php` | Update fillable, hapus relasi lama, tambah relasi ke `askep` |
| `app/Models/Askep.php` | **Baru** — model utama askep |
| `app/Models/AskepPengkajian.php` | **Baru** |
| `app/Models/AskepDiagnosa.php` | **Baru** |
| `app/Models/AskepDiagnosaLuaran.php` | **Baru** |
| `app/Models/AskepIntervensi.php` | **Baru** |
| `app/Models/AskepImplementasi.php` | **Baru** |
| `app/Models/AskepEvaluasi.php` | **Baru** |
| Model lama (`DiagnosaPasien`, `LuaranPasien`, `IntervensiPasien`, `EvaluasiPasien`) | **Hapus** |

---

## 3. Fase 1 — Revisi Dosen

> Bisa dikerjakan paralel dengan atau sesudah Fase 0.

### 3.1 Logo Polsub

- Pasang di: sidebar header, auth layout kiri, mobile header
- **Butuh:** file logo PNG/SVG dari kampus

### 3.2 Sidebar Menu

Struktur menu baru:
```
── Utama ───────────────────
  Beranda
  Pasien
  Semua Askep
  Arsip Pengkajian

── Bantuan ─────────────────
  Panduan
  Video Tutorial
  FAQ
```
Panduan / Video Tutorial / FAQ → halaman statis Livewire, konten placeholder dulu.

### 3.3 Tombol Navigasi Antar-Step

- Tombol **"Simpan & Lanjut →"** di bawah setiap step
- Aktif setelah data step tersimpan
- Step terakhir → "Selesai & Kembali ke Pasien"
- `step_terakhir` di tabel `askep` untuk auto-resume

### 3.4 Opsi "Normal" di Pengkajian

Tombol preset per section — klik → isi otomatis textarea/field dengan teks standar.

Contoh preset:

| Section | Teks/Nilai Normal |
|---|---|
| Riwayat Penyakit Sekarang | "Tidak ada keluhan utama saat ini" |
| Rasa Aman & Nyaman | Nyeri: tidak, skala 0/10 |
| Istirahat | "Tidak ada gangguan istirahat" |
| Tidur | Pola normal, tidak ada gangguan |
| Eliminasi Feses | BAB normal, tidak ada keluhan |
| Eliminasi Urine | BAK normal, terkontrol |
| Oksigenasi | Tidak ada kesulitan bernapas |
| Kardiovaskuler | Tidak ada keluhan |
| Pemeriksaan Fisik | Auto-isi semua field ke nilai normal per sistem |

### 3.5 Export PDF Askep

- Tombol "Export PDF" muncul jika semua 5 step sudah diisi
- Library: `barryvdh/laravel-dompdf`
- Isi: cover → pengkajian → diagnosa → perencanaan → implementasi → evaluasi

---

## 4. Fase 2 — Rebuild Modul Askep

> Inti dari semua pengerjaan. Dikerjakan setelah Fase 0 selesai.

### 4.1 Step 1 — Pengkajian (Tulis Ulang)

**Form dibagi 5 tab:**

| Tab | Konten |
|---|---|
| Identitas & TTV | Data pasien (auto-fill) + penanggung jawab + EWS + Anthropometri |
| Riwayat Penyakit | Sekarang, masa lalu, keluarga (textarea per sub-field) |
| Pengkajian Biologis | 12 section: nyeri (PQRST), aktivitas, istirahat, tidur, cairan, nutrisi, eliminasi feses, eliminasi urine, oksigenasi, kardiovaskuler, hygiene, seksualitas |
| Psikososial & Spiritual | Emosi, konsep diri, hubungan sosial, spiritual |
| Pemeriksaan Fisik | B1–B6 + Pencernaan + Endokrin + Urogenital + Integumen + Muskuloskeletal + Imun |

**Fitur otomatis:**
- IMT = BB / (TB/100)² → label: kurus/normal/gemuk/obesitas
- EWS Score = jumlah skor TTV → badge warna (hijau/kuning/merah)
- GCS Total = E + M + V

**Opsi "Normal":** tombol preset per section (lihat 3.4)

**Aksi:** Simpan Draft | Simpan & Lanjut ke Diagnosa

---

### 4.2 Step 2 — Diagnosa (Tulis Ulang)

**Tampilan:**
- Search by kode/nama SDKI
- Filter by kategori & subkategori
- Per diagnosa: kode, nama, tipe, definisi, etiologi, gejala mayor/minor, faktor risiko

**MVP (tidak ada AI):**
- Tidak ada rekomendasi otomatis
- User cari/filter sendiri
- Badge "Aktual / Risiko / Promosi Kesehatan" per diagnosa

**Konfigurasi per diagnosa dipilih:**
- Centang etiologi yang relevan (dari `sdki_penyebab`)
- Centang gejala yang ditemukan (dari `sdki_gejala`)
- Atur prioritas (1, 2, 3, …)

**Aksi:** Simpan Draft | Simpan & Lanjut ke Perencanaan | Tinjau Ulang

---

### 4.3 Step 3 — Perencanaan (Tulis Ulang)

Per diagnosa yang dipilih di step 2:

**SLKI — Pilih Luaran:**
- Tampil SLKI yang terkait (dari `sdki_slki_relations`)
- Pilih satu atau lebih luaran
- Set target waktu (mis. "3 hari")

**SIKI — Pilih Intervensi:**
- Tampil SIKI yang terkait (dari `slki_siki_relations` via luaran yang dipilih)
- Label: Intervensi Utama / Pendukung
- Per intervensi: set frekuensi, centang tindakan per kategori (Observasi/Terapeutik/Edukasi/Kolaborasi)
- Tombol "Tambah Intervensi Manual" (nama bebas, tanpa FK ke SIKI)

**Aksi:** Setujui Rencana | Simpan & Lanjut ke Implementasi | Tinjau Ulang

---

### 4.4 Step 4 — Implementasi (Baru)

**Form per sesi:**
- Tanggal + waktu + shift (Pagi/Siang/Malam)
- Durasi (menit)
- Checklist tindakan per kategori (dari rencana step 3)
- SpO2 sebelum & setelah (opsional)
- Catatan
- Respons pasien: Positif / Netral / Negatif

**Tampilan:**
- Riwayat sesi sebelumnya (collapsible)
- Progress: X dari Y tindakan selesai hari ini
- Bisa tambah sesi baru kapan saja

**Aksi:** Simpan Sesi | Sesi Baru | Lanjut ke Evaluasi

---

### 4.5 Step 5 — Evaluasi (Tulis Ulang)

Per diagnosa:

**Tahap 1 — Catatan klinis:**
- Tanggal, jam, hari ke- (auto-hitung)
- Data subjektif & objektif (SOAP)
- Monitoring TTV: TD, RR, nadi, SpO2, suhu

**Tahap 2 — Scoring indikator SLKI:**
- Per indikator luaran: slider/input 1–5
- Label arah: Meningkat / Menurun / Membaik

**Tahap 3 — Analisis:**
- Tercapai / Membaik / Belum Tercapai
- Narasi analisis
- Tindak lanjut: Lanjutkan / Hentikan / Modifikasi / Rujuk

**Aksi Final:** Simpan Draft | Finalisasi → status askep → `menunggu_review` (Submit ke Dosen)

---

## 5. Fase 3 — Role Dosen & Feedback

### 5.1 Perubahan Database

```sql
-- Tambah 'dosen' ke ENUM role di users
ALTER TABLE users MODIFY COLUMN role ENUM('mahasiswa','dosen','admin');

-- Tabel penugasan mahasiswa ke dosen
CREATE TABLE penugasan (
    id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id    BIGINT UNSIGNED NOT NULL,
    dosen_id        BIGINT UNSIGNED NOT NULL,
    angkatan        YEAR NULLABLE,
    kelas           VARCHAR(10) NULLABLE,
    stase           VARCHAR(100) NULLABLE,
    rs              VARCHAR(255) NULLABLE,
    bangsal         VARCHAR(100) NULLABLE,
    periode_mulai   DATE NULLABLE,
    periode_selesai DATE NULLABLE,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES users(id),
    FOREIGN KEY (dosen_id) REFERENCES users(id)
);

-- Tabel feedback dari dosen
CREATE TABLE askep_feedback (
    id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    askep_id        BIGINT UNSIGNED NOT NULL,
    dosen_id        BIGINT UNSIGNED NOT NULL,
    catatan_umum    TEXT NULLABLE,
    catatan_detail  JSON NULLABLE,  -- {step: catatan} per langkah
    status          ENUM('disetujui','perlu_revisi') NOT NULL,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,
    FOREIGN KEY (askep_id) REFERENCES askep(id),
    FOREIGN KEY (dosen_id) REFERENCES users(id)
);
```

### 5.2 Layout & Modul Dosen

- Layout sidebar terpisah: `layouts.dosen`
- Middleware: `role:dosen`
- Modul yang dibutuhkan:

| Modul | Deskripsi |
|---|---|
| Dashboard | Stat cards + daftar askep menunggu review |
| Daftar Mahasiswa | Filter angkatan/kelas, klik → lihat history |
| Review Askep | Baca isi lengkap askep, isi catatan, Setujui/Minta Revisi |
| Riwayat Review | Filter disetujui/diminta revisi/semua |
| Monitoring | Progress per mahasiswa |

### 5.3 Alur Submit & Feedback

```
Mahasiswa: klik "Finalisasi & Submit" di step 5
    → askep.status = 'menunggu_review'
    → Mahasiswa tidak bisa edit

Dosen: menerima askep di dashboard
    → Baca isi askep (read-only view per step)
    → Isi catatan umum + catatan per step (opsional)
    → Pilih: Setujui / Minta Revisi

Jika Setujui:
    → askep.status = 'disetujui'
    → Mahasiswa dapat notifikasi

Jika Minta Revisi:
    → askep.status = 'perlu_revisi'
    → askep terbuka untuk diedit kembali
    → Mahasiswa bisa edit + submit ulang
```

### 5.4 Log Pembelajaran & Refleksi (Gibbs Cycle)

```sql
CREATE TABLE log_pembelajaran (
    id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id         BIGINT UNSIGNED NOT NULL,
    tanggal_shift   DATE NOT NULL,
    shift           ENUM('Pagi','Siang','Malam') NOT NULL,
    ruang           VARCHAR(100) NULLABLE,
    konteks_kasus   TEXT NULLABLE,
    description     TEXT NULLABLE,
    feelings        TEXT NULLABLE,
    evaluation      TEXT NULLABLE,
    analysis        TEXT NULLABLE,
    conclusion      TEXT NULLABLE,
    action_plan     TEXT NULLABLE,
    created_at      TIMESTAMP,
    updated_at      TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

---

## 6. Fase 4 — Fitur Tambahan

| Fitur | Role | Keterangan |
|---|---|---|
| Halaman Master Data SDKI/SLKI/SIKI (read-only) | Mahasiswa | Search, filter, lihat detail + relasi terhubung |
| Penugasan mahasiswa → dosen | Admin | Manajemen tabel `penugasan` |
| Import user massal CSV/Excel | Admin | Upload daftar mahasiswa sekaligus |
| Pengaturan institusi | Admin | Kelola RS, bangsal, periode stase |
| Statistik & audit log | Admin | Grafik aktivitas, monitoring sistem |
| Notifikasi sistem | Semua | Status askep berubah, feedback masuk |

---

## 7. Kelengkapan Data 3S

Data yang perlu dilengkapi agar step Perencanaan & Evaluasi bisa berjalan penuh:

| Data | Status | Butuh File |
|---|---|---|
| SDKI D.0074–D.0149 (detail gejala/etiologi) | ❌ Kosong | SQL/Excel |
| SLKI konten (indikator + arah skala 1–5) | ❌ Kosong | SQL/Excel |
| SIKI konten (tindakan obs/terapi/edukasi/kol) | ❌ Hampir semua kosong | SQL/Excel |
| Relasi SDKI↔SLKI (hanya 10 dari 149) | ❌ Sangat kurang | SQL/Excel |
| Relasi SLKI↔SIKI (hanya 10 dari 112) | ❌ Sangat kurang | SQL/Excel |

> Tanpa data relasi, fitur "tampil SLKI otomatis saat pilih diagnosa" dan
> "tampil SIKI otomatis saat pilih luaran" tidak bisa berfungsi di step Perencanaan.

---

## 8. Yang Perlu Disediakan

| Kebutuhan | Untuk | Status |
|---|---|---|
| File logo Polsub (PNG/SVG) | Fase 1 — Logo di UI | ⏳ |
| Konfirmasi konten Panduan/FAQ | Fase 1 — Menu bantuan | ⏳ |
| Link/screenshot referensi website askep | Fase 1 — Teks preset "Normal" | ⏳ |
| File SQL/Excel SDKI D.0074–D.0149 | Fase 0/7 — Detail diagnosa | ⏳ |
| File SQL/Excel SLKI (indikator + skala) | Fase 7 — Step evaluasi | ⏳ |
| File SQL/Excel SIKI (tindakan detail) | Fase 7 — Step perencanaan | ⏳ |
| File mapping relasi SDKI↔SLKI↔SIKI | Fase 7 — Rekomendasi otomatis | ⏳ |
| Approval dependency `barryvdh/laravel-dompdf` | Fase 1 — Export PDF | ⏳ |

---

## 9. Urutan Eksekusi

```
[Fase 0]  Refactor database
          ├── Migrasi: hapus tabel lama, buat tabel baru
          ├── Migrasi: update tabel pasien
          ├── Buat 8 Model baru
          ├── Update Model Pasien
          ├── Hapus Model lama
          └── Update Seeder & Factory

     ↓

[Fase 1]  Revisi dosen (bisa paralel dengan Fase 2)
          ├── Logo Polsub
          ├── Sidebar menu baru + halaman Panduan/FAQ
          ├── Tombol navigasi antar-step
          ├── Opsi "Normal" di pengkajian
          └── Export PDF

     ↓

[Fase 2]  Rebuild modul askep
          ├── Step 1 — Pengkajian (tulis ulang)
          ├── Step 2 — Diagnosa (tulis ulang)
          ├── Step 3 — Perencanaan (tulis ulang)
          ├── Step 4 — Implementasi (baru)
          └── Step 5 — Evaluasi (tulis ulang)

     ↓

[Fase 3]  Role Dosen & Feedback
          ├── Layout + middleware dosen
          ├── Dashboard dosen
          ├── Modul review askep
          ├── Sistem submit & feedback
          └── Log Pembelajaran (Gibbs Cycle)

     ↓

[Fase 4]  Fitur tambahan
          ├── Master Data read-only
          ├── Penugasan mahasiswa → dosen
          ├── Import user massal
          └── Monitoring & statistik

     ↓

[Data 3S] Lengkapi data SDKI/SLKI/SIKI
          (bisa dikerjakan kapan saja setelah file tersedia)
```

---

*Terakhir diperbarui: Juni 2026*
*Referensi: `spesifikasi_alur_askep_digikep.md`, `DIGIKEP-RANCANGAN.md`, kondisi database aktual*
