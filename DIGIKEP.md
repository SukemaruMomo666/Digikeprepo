# DIGIKEP — Digital Asuhan Keperawatan

> Platform dokumentasi keperawatan berbasis standar **SDKI · SLKI · SIKI** untuk mahasiswa keperawatan Politeknik Negeri Subang.

---

## Daftar Isi

1. [Gambaran Umum](#gambaran-umum)
2. [Stack Teknologi](#stack-teknologi)
3. [Fitur yang Sudah Selesai](#fitur-yang-sudah-selesai)
4. [Alur Asuhan Keperawatan](#alur-asuhan-keperawatan)
5. [Master Data](#master-data)
6. [Arsitektur Database](#arsitektur-database)
7. [Struktur Direktori](#struktur-direktori)
8. [Roadmap](#roadmap)

---

## Gambaran Umum

DIGIKEP adalah sistem informasi dokumentasi asuhan keperawatan digital yang dirancang untuk mahasiswa keperawatan Politeknik Negeri Subang. Sistem ini mengacu pada standar nasional keperawatan Indonesia:

- **SDKI** — Standar Diagnosis Keperawatan Indonesia (149 diagnosa)
- **SLKI** — Standar Luaran Keperawatan Indonesia (110 luaran)
- **SIKI** — Standar Intervensi Keperawatan Indonesia (73 intervensi)

---

## Stack Teknologi

| Layer | Teknologi | Versi |
|---|---|---|
| Backend | Laravel | v13 |
| Runtime | PHP | 8.5 |
| Frontend Reaktif | Livewire (SFC) | v4 |
| Client-side | Alpine.js | v3 |
| UI Component | Flux UI Free | v2 |
| CSS | Tailwind CSS | v4 |
| Database | MySQL | — |
| Autentikasi | Laravel Fortify | v1 |
| Testing | Pest PHP | v4 |

---

## Fitur yang Sudah Selesai

### Autentikasi & Role

- Login menggunakan NIM (mahasiswa) atau NIP (admin) — hanya angka
- Dua role: **Admin** dan **Mahasiswa** dengan layout & akses terpisah
- Password default = NIM/NIP pengguna

### Panel Admin

- Dashboard dengan statistik pengguna dan data
- Manajemen user: tambah, edit, hapus akun mahasiswa dan admin

### Panel Mahasiswa

- Dashboard dengan stat cards bergradient dan tabel daftar pasien
- Manajemen data pasien
- Alur asuhan keperawatan 5 langkah (lihat bagian berikut)

### UI/UX

- Landing page multi-section (hero, statistik, fitur, alur kerja, tentang, CTA, footer)
- Login page split-panel: branding Polsub orange (kiri) + form (kanan)
- Stepper 5 langkah dengan badge merah indikator abnormal
- Dark mode support
- Design system: **Polsub Orange** (`#f39c12 → #e67e22`)

---

## Alur Asuhan Keperawatan

Mahasiswa mengisi asuhan keperawatan pasien melalui 5 langkah berurutan:

```
[1] Pengkajian → [2] Diagnosa SDKI → [3] Luaran SLKI → [4] Intervensi SIKI → [5] Evaluasi
```

### Langkah 1 — Pengkajian

Form 32 section sesuai **Format Keperawatan Dasar**, dibagi 4 tab:

| Tab | Section | Jumlah |
|---|---|---|
| Riwayat Penyakit | Sekarang, Masa Lalu, Keluarga | 3 |
| Pengkajian Biologis | Nyaman, Aktivitas, Istirahat, Tidur, Cairan, Nutrisi, Eliminasi ×2, Oksigenasi, Kardiovaskuler, Hygiene, Seksualitas | 12 |
| Psikososial & Spiritual | Status Emosi, Konsep Diri, Hubungan Sosial, Spiritual | 4 |
| Pemeriksaan Fisik | 13 sistem tubuh dengan checkbox/radio terstruktur | 13 |

Pemeriksaan fisik mencakup: Penglihatan · Pendengaran · Wicara · Pernafasan · Kardiovaskuler · Hematologi · Saraf Pusat · Pencernaan · Endokrin · Urogenital · Integumen · Muskuloskeletal · Kekebalan Tubuh.

Data terstruktur (checkbox/radio) disimpan sebagai **JSON** di kolom `data`. Narasi bebas disimpan di kolom `observasi`.

### Langkah 2 — Diagnosa SDKI

- Pilih satu atau lebih diagnosa dari 149 diagnosa SDKI resmi
- Diagnosa dikelompokkan per **kategori** (Fisiologis, Psikologis, dll.) dan **subkategori**

### Langkah 3 — Luaran SLKI

- Tetapkan luaran keperawatan untuk setiap diagnosa
- Pilih dari 110 luaran SLKI resmi

### Langkah 4 — Intervensi SIKI

- Tetapkan intervensi untuk setiap luaran
- Pilih dari 73 intervensi SIKI resmi

### Langkah 5 — Evaluasi

- Nilai pencapaian tiap luaran setelah intervensi dilakukan
- Pilihan hasil: **Tercapai** · **Tercapai Sebagian** · **Belum Tercapai**
- Kolom catatan opsional per luaran
- Setelah evaluasi disimpan, status askep otomatis menjadi `selesai`

---

## Master Data

| Tabel | Jumlah | Kolom Utama |
|---|---|---|
| `diagnosa_sdki` | **149** | `kode_diagnosa`, `label_diagnosa`, `kategori`, `subkategori`, `definisi` |
| `luaran_slki` | **110** | `kode_luaran`, `label_luaran`, `kriteria_hasil`, `definisi` |
| `intervensi_siki` | **73** | `kode_intervensi`, `label_intervensi`, `tindakan`, `definisi` |

### Distribusi SDKI per Kategori

| Kategori | Jumlah |
|---|---|
| Fisiologis | 72 |
| Psikologis | 36 |
| Lingkungan | 26 |
| Relasional | 8 |
| Perilaku | 6 |

> Master data bersumber dari file Excel resmi SDKI/SLKI/SIKI dan di-seed via `SdkiSlkiSikiSeeder`.

---

## Arsitektur Database

```
users
  └── pasien
        ├── pengkajian          (32 section; kolom data JSON untuk pemeriksaan fisik)
        ├── riwayat_pasien      (log aktivitas / catatan)
        └── diagnosa_pasien ──→ diagnosa_sdki
              └── luaran_pasien ──→ luaran_slki
                    ├── intervensi_pasien ──→ intervensi_siki
                    └── evaluasi_pasien   (hasil: tercapai | sebagian | belum_tercapai)

Master:
  diagnosa_sdki ←──(pivot: sdki_slki_relations)──→ luaran_slki
  luaran_slki   ←──(pivot: slki_siki_relations)──→ intervensi_siki
```

---

## Struktur Direktori

```
digikep-project/
├── app/
│   └── Models/
│       ├── Pasien.php
│       ├── Pengkajian.php
│       ├── DiagnosaSdki.php
│       ├── DiagnosaPasien.php
│       ├── LuaranSlki.php
│       ├── LuaranPasien.php
│       ├── IntervensiSiki.php
│       ├── IntervensiPasien.php
│       └── EvaluasiPasien.php
│
├── database/
│   ├── migrations/
│   └── seeders/
│       ├── DatabaseSeeder.php
│       ├── SdkiSlkiSikiSeeder.php   ← master data dari Excel resmi
│       ├── DataMasterSeeder.php     ← relasi sample + data lengkap
│       ├── AdminSeeder.php
│       └── MahasiswaSeeder.php
│
├── resources/views/
│   ├── layouts/
│   │   ├── mahasiswa.blade.php
│   │   └── auth.blade.php
│   ├── pages/
│   │   ├── auth/
│   │   │   └── ⚡login.blade.php
│   │   ├── admin/
│   │   │   ├── ⚡dashboard.blade.php
│   │   │   └── users/
│   │   └── mahasiswa/
│   │       ├── ⚡dashboard.blade.php
│   │       └── askep/
│   │           ├── ⚡pengkajian.blade.php
│   │           ├── ⚡diagnosa.blade.php
│   │           ├── ⚡luaran.blade.php
│   │           ├── ⚡intervensi.blade.php
│   │           └── ⚡evaluasi.blade.php
│   └── partials/
│       ├── askep-stepper.blade.php
│       ├── pengkajian-text-card.blade.php
│       └── pengkajian-fisik.blade.php
│
├── routes/
│   └── web.php
│
├── tests/Feature/
│   └── AskepStepTest.php
│
└── CLAUDE.md
```

---

## Roadmap

### Prioritas Tinggi

- [ ] **Export PDF** — cetak dokumen asuhan keperawatan per pasien
- [ ] **Relasi mapping SDKI↔SLKI↔SIKI lengkap** — saat ini baru 10 relasi sample

### Prioritas Menengah

- [ ] **Halaman riwayat askep selesai** — daftar askep yang sudah dievaluasi
- [ ] **Fitur dosen/pembimbing** — review dan feedback askep mahasiswa
- [ ] **Filter & pencarian** diagnosa/luaran/intervensi saat pengisian

### Prioritas Rendah

- [ ] Notifikasi & reminder pengisian askep
- [ ] Statistik per mahasiswa (jumlah pasien, diagnosa terbanyak, dll.)
- [ ] Export data ke Excel

---

## Testing

```bash
# Jalankan semua test
php artisan test --compact

# Filter test tertentu
php artisan test --compact --filter=AskepStep
```

Test utama: `AskepStepTest` — memverifikasi alur navigasi 5 langkah askep (9 test cases).

---

## Development

```bash
# Install dependencies
composer install
npm install

# Setup environment
cp .env.example .env
php artisan key:generate

# Migrasi & seed master data
php artisan migrate
php artisan db:seed

# Jalankan dev server
composer run dev
```

---

*Dikembangkan untuk Politeknik Negeri Subang · Program Studi Keperawatan*
