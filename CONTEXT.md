# DigiKep — Konteks Proyek untuk AI Agent

> Copy-paste file ini ke AI agent lain sebagai konteks awal.
> Terakhir diperbarui: 2026-06-07

---

## 1. Gambaran Umum

**DigiKep** adalah aplikasi web untuk mahasiswa keperawatan Politeknik Negeri Subang (Polsub) dalam menyusun **Asuhan Keperawatan (Askep)** digital. Alur utama: mahasiswa mendaftarkan pasien → mengisi 5 langkah askep → dosen mereview.

**Stack teknologi:**
- PHP 8.5, Laravel 13, Livewire 4, Flux UI Free v2, Tailwind CSS v4
- Database: SQLite (test), MySQL (production via Laragon)
- Testing: Pest v4 (`php artisan test --compact`)
- Format: `vendor/bin/pint --dirty --format agent` setelah setiap perubahan PHP

---

## 2. Role & Autentikasi

| Role | Middleware | Prefix Route |
|------|-----------|--------------|
| `mahasiswa` | `auth, role:mahasiswa` | `/` |
| `admin` | `auth, role:admin` | `/admin` |

Login via Laravel Fortify. Field login: `nim_nip` (bukan email).  
`users` table: `id, nim_nip, name, email, role, is_first_login, password, ...`

User baru wajib ganti password saat `is_first_login = true` → redirect ke `password.change`.

---

## 3. Struktur Database

### Master Tables (diisi admin)

```
diagnosa_sdki
  id, kode_diagnosa, label_diagnosa, kategori, subkategori, tipe_diagnosa, definisi, deleted_at

luaran_slki
  id, kode_luaran, label_luaran, kategori, subkategori, definisi, kriteria_hasil, deleted_at

intervensi_siki
  id, kode_intervensi, label_intervensi, kategori, subkategori, definisi, tindakan (JSON), deleted_at

sdki_slki_relations      → diagnosa_id FK diagnosa_sdki, luaran_id FK luaran_slki
slki_siki_relations      → luaran_id FK luaran_slki, intervensi_id FK intervensi_siki
```

### Pasien & Askep Tables

```
pasien
  id, user_id (FK users), no_rm, nama_pasien, umur, tanggal_lahir, agama,
  status_perkawinan, pekerjaan, pendidikan, alamat, diagnosa_medis, bb, tb,
  jenis_kelamin, ruang_rawat, tanggal_masuk

riwayat_pasien
  id, pasien_id, aktivitas, created_at

askep
  id, pasien_id, user_id, status (enum), step_terakhir (0-5),
  catatan_dosen, submitted_at, reviewed_at

  -- status enum: draft | menunggu_review | perlu_revisi | disetujui | selesai
  -- step_terakhir: 0=belum mulai, 1=pengkajian, 2=diagnosa, 3=perencanaan, 4=implementasi, 5=evaluasi

askep_pengkajian
  id, askep_id,
  -- Penanggung jawab: pj_nama, pj_umur, pj_pendidikan, pj_pekerjaan, pj_alamat
  -- TTV/EWS: ews_td, ews_nadi, ews_rr, ews_suhu, ews_spo2, ews_kesadaran, ews_skor
  -- Antropometri: bb, tb
  -- Riwayat (JSON): riwayat_sekarang, riwayat_lalu, riwayat_keluarga
  -- Biologis (JSON): biologis_nyeri, biologis_aktivitas, biologis_istirahat, biologis_tidur,
     biologis_cairan, biologis_nutrisi, biologis_eliminasi_feses, biologis_eliminasi_urine,
     biologis_oksigenasi, biologis_kardiovaskuler, biologis_hygiene, biologis_seksualitas
  -- Psikologis (JSON): psiko_emosi, psiko_konsep_diri, psiko_sosial, psiko_spiritual
  -- Fisik (JSON): fisik_umum, fisik_penglihatan, fisik_pendengaran, fisik_wicara,
     fisik_pernapasan, fisik_kardiovaskuler, fisik_hematologi, fisik_saraf,
     fisik_pencernaan, fisik_endokrin, fisik_urogenital, fisik_integumen,
     fisik_muskuloskeletal, fisik_imun

askep_diagnosa
  id, askep_id, sdki_id (FK diagnosa_sdki), prioritas, etiologi_dipilih (JSON), gejala_dipilih (JSON)

askep_diagnosa_luaran
  id, askep_diagnosa_id, slki_id (FK luaran_slki), target_waktu

askep_intervensi
  id, askep_diagnosa_id, siki_id (FK intervensi_siki, nullable), nama_manual,
  frekuensi, tindakan_dipilih (JSON), is_included (bool)

askep_implementasi
  id, askep_intervensi_id, tanggal, waktu, shift (pagi|siang|malam),
  durasi_menit, tindakan_dilakukan (JSON), spo2_sebelum, spo2_setelah,
  catatan, respons_pasien
  -- TIDAK ada timestamps (public $timestamps = false)

askep_evaluasi
  id, askep_diagnosa_id, tanggal, jam, hari_ke, komplikasi, catatan_soap,
  tv_td, tv_rr, tv_nadi, tv_spo2, tv_suhu, skor_indikator (JSON),
  analisis (teratasi|teratasi_sebagian|belum_teratasi), analisis_narasi,
  tindak_lanjut, penanggung_jawab
```

---

## 4. Models & Relasi Penting

> **PENTING:** Semua model dengan nama singular Indonesia WAJIB punya `protected $table = '...'`  
> (Laravel akan pluralkan salah, contoh: `Askep` → `askeps` bukan `askep`)

```php
// Askep.php
protected $table = 'askep';
const STATUS_DRAFT            = 'draft';
const STATUS_MENUNGGU_REVIEW  = 'menunggu_review';
const STATUS_PERLU_REVISI     = 'perlu_revisi';
const STATUS_DISETUJUI        = 'disetujui';
const STATUS_SELESAI          = 'selesai';

// Relasi:
pasien()       → BelongsTo(Pasien)
user()         → BelongsTo(User)
pengkajian()   → HasOne(AskepPengkajian)
diagnosa()     → HasMany(AskepDiagnosa)->orderBy('prioritas')

// Helper methods:
nextStepUrl(): string   // URL langkah berikutnya yang belum selesai
statusLabel(): string   // label Indonesia dari status
isDraft(): bool
isSelesai(): bool
```

```php
// Pasien.php
protected $table = 'pasien';

// Relasi:
askep()        → HasMany(Askep)
riwayat()      → HasMany(RiwayatPasien)
askepAktif()   → ?Askep (latest non-selesai)

// Helper methods:
catatRiwayat(string $aktivitas): void
isDraft(): bool        // ada askep yang belum selesai
isSelesai(): bool      // semua askep selesai
nextAskepStep(): string  // URL langkah berikutnya
```

```php
// AskepDiagnosa.php
protected $table = 'askep_diagnosa';
// Relasi: askep(), sdki(), luaran() HasMany(AskepDiagnosaLuaran), intervensi() HasMany(AskepIntervensi), evaluasi() HasMany(AskepEvaluasi)

// AskepPengkajian.php
protected $table = 'askep_pengkajian';
// Static method: hitungEws(td, nadi, rr, suhu, spo2, kesadaran): int

// DiagnosaSdki.php — luaranSlki() BelongsToMany(LuaranSlki, 'sdki_slki_relations')
// LuaranSlki.php   — intervensiSiki() BelongsToMany(IntervensiSiki, 'slki_siki_relations')
```

---

## 5. Routes

### Mahasiswa

| Route Name | URL | Livewire Component |
|-----------|-----|-------------------|
| `dashboard` | `/dashboard` | `pages::mahasiswa.dashboard` |
| `pasien.index` | `/pasien` | `pages::mahasiswa.pasien.index` |
| `pasien.create` | `/pasien/create` | `pages::mahasiswa.pasien.create` |
| `pasien.show` | `/pasien/{pasien}` | `pages::mahasiswa.pasien.show` |
| `pasien.edit` | `/pasien/{pasien}/edit` | `pages::mahasiswa.pasien.edit` |
| `pasien.askep.create` | `/pasien/{pasien}/askep/baru` | `pages::mahasiswa.askep.create` |
| `askep.show` | `/askep/{askep}` | `pages::mahasiswa.askep.detail` |
| `askep.pengkajian` | `/askep/{askep}/pengkajian` | `pages::mahasiswa.askep.pengkajian` |
| `askep.diagnosa` | `/askep/{askep}/diagnosa` | `pages::mahasiswa.askep.diagnosa` |
| `askep.perencanaan` | `/askep/{askep}/perencanaan` | `pages::mahasiswa.askep.perencanaan` |
| `askep.implementasi` | `/askep/{askep}/implementasi` | `pages::mahasiswa.askep.implementasi` |
| `askep.evaluasi` | `/askep/{askep}/evaluasi` | `pages::mahasiswa.askep.evaluasi` |
| `panduan.index` | `/panduan` | `pages::mahasiswa.panduan.index` |
| `video.index` | `/video` | `pages::mahasiswa.video.index` |
| `faq.index` | `/faq` | `pages::mahasiswa.faq.index` |
| `askep.download` | `/askep/{askep}/download` | `AskepPdfController@download` |
| `riwayat.index` | `/riwayat` | `pages::mahasiswa.riwayat.index` |
| `askep.index` | `/askep` | `pages::mahasiswa.askep.index` |

### Admin

| Route Name | URL |
|-----------|-----|
| `admin.dashboard` | `/admin/dashboard` |
| `admin.sdki.index` | `/admin/sdki` |
| `admin.slki.index` | `/admin/slki` |
| `admin.siki.index` | `/admin/siki` |
| `admin.relasi.index` | `/admin/relasi` |
| `admin.data-mahasiswa.index` | `/admin/data-mahasiswa` |

---

## 6. View Files

Lokasi: `resources/views/pages/`

```
mahasiswa/
  askep/
    ⚡create.blade.php         — buat askep baru (konfirmasi sebelum mulai)
    ⚡detail.blade.php         — ringkasan read-only seluruh askep
    ⚡pengkajian.blade.php     — Step 1: TTV, riwayat, biologis, psikologis
    ⚡diagnosa.blade.php       — Step 2: pilih & urutkan diagnosa SDKI
    ⚡perencanaan.blade.php    — Step 3: pilih SLKI dan SIKI per diagnosa
    ⚡implementasi.blade.php   — Step 4: log tindakan per intervensi
    ⚡evaluasi.blade.php       — Step 5: evaluasi SOAP, kirim untuk review
    ⚡index.blade.php          — daftar semua askep mahasiswa
    ⚡show.blade.php            — (lama, masih ada tapi sudah digantikan detail)
    ⚡luaran.blade.php          — (lama, belum dihapus)
    ⚡intervensi.blade.php      — (lama, belum dihapus)
  pasien/
    ⚡index.blade.php           — daftar pasien
    ⚡create.blade.php          — tambah pasien → redirect ke pasien.askep.create
    ⚡show.blade.php            — detail pasien + list semua askep
    ⚡edit.blade.php            — edit data pasien
  panduan/⚡index.blade.php
  video/⚡index.blade.php
  faq/⚡index.blade.php

admin/
  sdki/⚡index.blade.php       — CRUD diagnosa SDKI
  slki/⚡index.blade.php       — CRUD luaran SLKI
  siki/⚡index.blade.php       — CRUD intervensi SIKI
  relasi/⚡index.blade.php     — mapping SDKI↔SLKI↔SIKI
  users/⚡index.blade.php      — manajemen user mahasiswa
  log/⚡index.blade.php        — activity log
  data-mahasiswa/⚡index.blade.php

layouts/
  mahasiswa.blade.php           — sidebar navy #1B4F72, logo Polsub, menu utama
  admin.blade.php

partials/
  askep-stepper.blade.php       — stepper 5 langkah (props: $askep, $step)
```

---

## 7. Alur Askep (Business Logic)

```
Tambah Pasien (pasien.create)
  → Redirect ke pasien.askep.create
    → Buat record Askep (status=draft, step_terakhir=0)
    → Redirect ke askep.pengkajian

Step 1 Pengkajian (step_terakhir 0→1)
  → Simpan ke askep_pengkajian
  → Redirect ke askep.diagnosa

Step 2 Diagnosa (step_terakhir 1→2)
  → Simpan ke askep_diagnosa (dengan prioritas)
  → Redirect ke askep.perencanaan

Step 3 Perencanaan (step_terakhir 2→3)
  → Simpan ke askep_diagnosa_luaran (SLKI terpilih + target waktu)
  → Simpan ke askep_intervensi (SIKI terpilih + tindakan dipilih)
  → Redirect ke askep.implementasi

Step 4 Implementasi (step_terakhir 3→4)
  → Simpan log ke askep_implementasi
  → Bisa tambah banyak log per intervensi
  → Redirect ke askep.evaluasi

Step 5 Evaluasi (step_terakhir 4→5)
  → Simpan ke askep_evaluasi (SOAP, TTV, skor indikator, analisis)
  → "Selesai & Kirim" → status=menunggu_review, submitted_at=now()
  → Redirect ke askep.show (detail page)

Setelah review dosen:
  → status=disetujui atau perlu_revisi (+ catatan_dosen)
  → Jika disetujui → bisa diubah ke selesai
```

**`Askep::nextStepUrl()`** mengembalikan URL berdasarkan `step_terakhir`:
- `< 1` → `askep.pengkajian`
- `< 2` → `askep.diagnosa`
- `< 3` → `askep.perencanaan`
- `< 4` → `askep.implementasi`
- `< 5` → `askep.evaluasi`
- `default` → `askep.show`

---

## 8. Pola Kode (Konvensi)

### Livewire SFC (Single File Component)

```php
<?php
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Judul Halaman')] class extends Component
{
    public ModelClass $model;

    public function mount(ModelClass $model): void
    {
        abort_unless($model->user_id === auth()->id(), 403);
        $this->model = $model->load(['relasi...']);
    }

    public function with(): array
    {
        return ['data' => SomeModel::query()->get()];
    }
};
?>

<div class="p-4 md:p-6">
    {{-- Template --}}
</div>
```

### Design System (warna)

```
Navy (primary):   #2E86C1, #1B4F72, #0A2D45
Teal (success):   #1A9B72, #0F6E56, #5DCAA5
Background:       #F4F8FB
Border:           #E0EBF5
Text muted:       #7A8FA6
Text subtle:      #C4D3DF
Error/Danger:     #D95C3A
Amber (warning):  amber-50/amber-700
```

Gradient button:
```html
style="background: linear-gradient(135deg, #2E86C1, #1B4F72)"
```

### Flash Toast
```php
use Flux\Flux;
Flux::toast(variant: 'success', text: 'Pesan berhasil.');
Flux::toast(variant: 'error', text: 'Ada kesalahan.');
Flux::toast(variant: 'warning', text: 'Perhatian.');
```

### Redirect dalam Livewire
```php
$this->redirectRoute('route.name', $model, navigate: true);
```

### JSON Columns — Pola Biologis
Field seperti `biologis_nyeri` di `askep_pengkajian` disimpan sebagai JSON:
```json
{"ada": true, "keterangan": "Nyeri tekan di area abdomen"}
```

---

## 9. Status Pekerjaan

### ✅ Selesai

- **Database refactor** — 7 tabel baru askep (migration `2026_06_07_131512_refactor_askep_tables.php`)
- **Models** — Askep, AskepPengkajian, AskepDiagnosa, AskepDiagnosaLuaran, AskepIntervensi, AskepImplementasi, AskepEvaluasi
- **Factories & Tests** — 70 test lulus
- **Sidebar** — logo Polsub, menu baru (Panduan, Video, FAQ)
- **Halaman pasien** — index, create, show, edit
- **Step 1 Pengkajian** — tabs: identitas PJ, TTV+EWS, riwayat, biologis+preset normal
- **Step 2 Diagnosa** — search & pilih SDKI, atur prioritas
- **Step 3 Perencanaan** — pilih SLKI per diagnosa + target waktu, pilih SIKI + tindakan spesifik
- **Step 4 Implementasi** — accordion per diagnosa/intervensi, log tindakan harian
- **Step 5 Evaluasi** — SOAP, TTV, skor indikator, analisis, kirim untuk review
- **Detail/Summary** — `askep.show` baca semua langkah
- **Panduan, Video, FAQ** — halaman statis mahasiswa

### ⚠️ Belum Dikerjakan / Perlu Perhatian

- **`askep.index`** (`/askep`) — komponen `pages::mahasiswa.askep.index` masih stub atau lama
- **`riwayat.index`** — tampilan riwayat aktivitas semua pasien
- **`arsip.index`** — halaman arsip askep selesai
- **Admin review flow** — dosen memberi catatan + mengubah status askep
- **Route lama** — `pasien/{pasien}/pengkajian`, `pasien/{pasien}/diagnosa`, dll (route lama sebelum refactor) masih ada tapi mengarah ke view lama yang belum diperbarui
- **File logo** — user perlu copy file ke `public/images/logo-polsub.png`
- **View lama** — `pages/mahasiswa/askep/⚡luaran.blade.php`, `⚡intervensi.blade.php`, `⚡show.blade.php` masih pakai model lama (`LuaranPasien`, `IntervensiPasien`) yang sudah dihapus dari migration; jangan pakai

---

## 10. Perintah Penting

```bash
# Jalankan dev server
composer run dev

# Test
php artisan test --compact
php artisan test --compact --filter=NamaTest

# Format PHP setelah edit
vendor/bin/pint --dirty --format agent

# Buat komponen Livewire
php artisan make:livewire "pages::mahasiswa.nama.komponen" --no-interaction

# Buat model + factory + migration sekaligus
php artisan make:model NamaModel -mf --no-interaction

# Cek routes
php artisan route:list 2>&1 | grep "kata-kunci"

# Query database (read-only)
php artisan tinker --execute 'Model::count();'
```

---

## 11. File Konfigurasi Penting

- `CLAUDE.md` — konvensi coding proyek (wajib dibaca AI agent)
- `routes/web.php` — semua route
- `resources/views/layouts/mahasiswa.blade.php` — layout utama + sidebar
- `resources/views/partials/askep-stepper.blade.php` — komponen stepper 5 langkah
- `app/Models/Askep.php` — model utama dengan konstanta status dan helper methods
