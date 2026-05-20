# DIGIKEP — Digital Asuhan Keperawatan

Aplikasi web untuk membantu mahasiswa keperawatan menyusun **Asuhan Keperawatan (Askep)** secara digital dengan alur terstruktur: **Pengkajian → Diagnosa (SDKI) → Luaran (SLKI) → Intervensi (SIKI)**.

Dikembangkan untuk **Politeknik Negeri Subang**.

---

## Daftar Isi

- [Fitur Utama](#fitur-utama)
- [Tech Stack](#tech-stack)
- [Persyaratan Sistem](#persyaratan-sistem)
- [Instalasi & Setup](#instalasi--setup)
- [Akun Default](#akun-default)
- [Struktur Proyek](#struktur-proyek)
- [Alur Penggunaan](#alur-penggunaan)
- [Perintah Berguna](#perintah-berguna)
- [Testing](#testing)
- [Dokumentasi Lanjutan](#dokumentasi-lanjutan)

---

## Fitur Utama

### Mahasiswa
- Login dengan NIM, ganti password wajib saat pertama login
- Kelola data pasien sendiri (tambah, edit, hapus)
- Buat Askep lengkap 4 langkah: Pengkajian (11 Pola Gordon) → SDKI → SLKI → SIKI
- Simpan draft, lanjutkan kapan saja
- Lihat riwayat aktivitas per pasien (timeline)
- Cetak / ekspor Askep (Phase 2)

### Admin
- Kelola akun mahasiswa (CRUD, reset password)
- Kelola data master: Diagnosa SDKI, Luaran SLKI, Intervensi SIKI
- Mapping relasi SDKI↔SLKI dan SLKI↔SIKI
- Pantau log aktivitas seluruh mahasiswa
- Lihat data pasien & Askep mahasiswa (read-only)

---

## Tech Stack

| Layer | Teknologi | Versi |
|-------|-----------|-------|
| Backend | Laravel | 13.x |
| Auth | Laravel Fortify | 1.x |
| Frontend | Livewire | 4.x |
| UI Components | Flux UI | 2.x |
| CSS | Tailwind CSS | 4.x |
| Database | MySQL / SQLite | — |
| Testing | Pest | 4.x |
| PHP | PHP | 8.3+ |

---

## Persyaratan Sistem

- PHP >= 8.3 dengan ekstensi: `pdo`, `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`
- Composer >= 2.x
- Node.js >= 20.x & npm >= 10.x
- MySQL 8.x atau SQLite 3.x (development)

---

## Instalasi & Setup

### 1. Clone & install dependencies

```bash
git clone <repo-url> digikep-project
cd digikep-project

composer install
npm install
```

### 2. Konfigurasi environment

```bash
cp .env.example .env
php artisan key:generate
```

Edit `.env` sesuai konfigurasi lokal:

```env
APP_NAME="Digikep"
APP_URL=http://digikep-project.test

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=digikep
DB_USERNAME=root
DB_PASSWORD=
```

> Untuk development cepat bisa gunakan SQLite: `DB_CONNECTION=sqlite`

### 3. Migrasi & seeding database

```bash
php artisan migrate
php artisan db:seed
```

### 4. Build assets

```bash
npm run build
```

### 5. Jalankan aplikasi

```bash
# Semua service sekaligus (server + queue + vite)
composer run dev
```

Atau manual:

```bash
php artisan serve
npm run dev
```

Akses di: **http://localhost:8000**

---

## Akun Default

Setelah `db:seed`, akun berikut tersedia:

| Role | Username (NIM/NIP) | Password |
|------|---------------------|----------|
| Admin | `admin` | `password` |
| Mahasiswa (contoh) | `231010001` | `231010001` (akan diminta ganti saat login pertama) |

> Password mahasiswa default = NIM mereka. Sistem akan memaksa ganti password saat login pertama.

---

## Struktur Proyek

```
digikep-project/
├── app/
│   ├── Http/
│   │   └── Middleware/          # EnsureRole middleware
│   ├── Livewire/
│   │   ├── Mahasiswa/           # Komponen mahasiswa
│   │   │   ├── Dashboard.php
│   │   │   ├── Pasien/
│   │   │   └── Askep/           # Pengkajian, Diagnosa, Luaran, Intervensi
│   │   └── Admin/               # Komponen admin
│   │       ├── Dashboard.php
│   │       ├── Users/
│   │       ├── Sdki/
│   │       ├── Slki/
│   │       ├── Siki/
│   │       ├── Relasi/
│   │       └── Log/
│   ├── Models/
│   │   ├── User.php
│   │   ├── Pasien.php
│   │   ├── Pengkajian.php
│   │   ├── DiagnosaPasien.php
│   │   ├── LuaranPasien.php
│   │   ├── IntervensiPasien.php
│   │   ├── DiagnosaSdki.php
│   │   ├── LuaranSlki.php
│   │   ├── IntervensiSiki.php
│   │   └── RiwayatPasien.php
│   ├── Observers/               # Activity logging
│   └── Providers/
├── database/
│   ├── migrations/              # 12 tabel utama
│   ├── seeders/                 # Admin + 10 diagnosa SDKI populer
│   └── factories/
├── resources/views/
│   ├── layouts/
│   │   ├── app.blade.php        # Layout mahasiswa
│   │   └── admin.blade.php      # Layout admin
│   ├── components/
│   │   ├── askep-step-indicator.blade.php
│   │   ├── activity-timeline.blade.php
│   │   └── stat-card.blade.php
│   └── pages/
├── routes/
│   ├── web.php                  # Route mahasiswa
│   └── admin.php                # Route admin
├── tests/
│   ├── Feature/
│   │   ├── Auth/
│   │   ├── Pasien/
│   │   └── Askep/
│   └── Unit/
└── docs/
    ├── ARSITEKTUR.md
    └── DATABASE.md
```

---

## Alur Penggunaan

```
Login (NIM)
    │
    ├─► [First Login] → Ganti Password → Dashboard
    │
    └─► Dashboard
            │
            ▼
        Tambah Pasien
            │
            ▼
        Pengkajian (11 Pola Gordon)
            │
            ▼
        Pilih Diagnosa SDKI (search + autocomplete)
            │
            ▼
        Pilih Luaran SLKI (auto-filter by diagnosa)
            │
            ▼
        Pilih Intervensi SIKI (auto-filter by luaran)
            │
            ▼
        Askep Lengkap ✓
```

Setiap langkah **disimpan ke database** sehingga mahasiswa bisa keluar kapan saja dan melanjutkan dari langkah terakhir.

---

## Perintah Berguna

```bash
# Jalankan semua service development
composer run dev

# Migrasi ulang + seed (development)
php artisan migrate:fresh --seed

# Buat Livewire component baru
php artisan make:livewire Mahasiswa/Askep/Pengkajian

# Buat model + migration + factory + seeder sekaligus
php artisan make:model Pasien -mfs

# Format kode (Pint)
vendor/bin/pint --dirty

# Lihat semua route terdaftar
php artisan route:list --except-vendor

# Lihat log real-time
php artisan pail
```

---

## Testing

```bash
# Jalankan semua test
php artisan test --compact

# Filter test tertentu
php artisan test --compact --filter=PasienTest

# Jalankan test dengan coverage
php artisan test --coverage
```

Test ditulis menggunakan **Pest v4**. Setiap fitur baru wajib disertai feature test.

---

## Dokumentasi Lanjutan

| Dokumen | Isi |
|---------|-----|
| [docs/ARSITEKTUR.md](docs/ARSITEKTUR.md) | ADR, keputusan desain, diagram relasi |
| [docs/DATABASE.md](docs/DATABASE.md) | Schema lengkap 12 tabel, relasi, indeks |
| [docs/PENGEMBANGAN.md](docs/PENGEMBANGAN.md) | Konvensi kode, cara tambah fitur baru |

---

## Kontribusi

1. Buat branch dari `main`: `git checkout -b feat/nama-fitur`
2. Ikuti konvensi kode yang ada (lihat [docs/PENGEMBANGAN.md](docs/PENGEMBANGAN.md))
3. Jalankan `composer run test` sebelum commit
4. Buat pull request ke `main`

---

## Lisensi

Proyek ini dikembangkan untuk keperluan akademik **Politeknik Negeri Subang**.
