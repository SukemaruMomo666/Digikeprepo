# Panduan Pengembangan — DIGIKEP

Panduan ini ditujukan untuk developer yang bekerja di proyek DIGIKEP.

---

## Setup Environment

Pastikan sudah mengikuti langkah di [README.md](../README.md#instalasi--setup).

Untuk development, gunakan:

```bash
composer run dev
```

Perintah ini menjalankan `php artisan serve`, `php artisan queue:listen`, dan `npm run dev` secara bersamaan.

---

## Konvensi Kode

### PHP / Laravel

- Ikuti konvensi file yang sudah ada — cek sibling file sebelum membuat file baru
- Gunakan PHP 8 constructor property promotion
- Return type dan type hint wajib di semua method
- Komentar hanya untuk logika yang tidak jelas — jangan tulis komentar yang menjelaskan hal yang sudah jelas dari nama method/variabel

**Penamaan:**
| Hal | Konvensi | Contoh |
|-----|----------|--------|
| Model | `PascalCase` singular | `DiagnosaSdki` |
| Migration | `snake_case` timestamp | `create_diagnosa_sdki_table` |
| Livewire | `PascalCase` namespace | `Mahasiswa/Askep/Diagnosa` |
| Route name | `dot.notation` | `pasien.diagnosa`, `admin.sdki.index` |
| Blade variable | `camelCase` | `$diagnosaTerpilih` |

### Livewire

- Satu full-page component per halaman utama
- State yang perlu persist antar request → simpan ke database, bukan di `$this->property`
- Gunakan `wire:model.live.debounce.300ms` untuk field search/autocomplete
- Validasi di `rules()` atau inline di action method — jangan skip validasi

### Blade / Flux UI

- Gunakan komponen Flux (`<flux:button>`, `<flux:input>`, dll.) untuk semua elemen UI
- Cek komponen yang sudah ada di `resources/views/components/` sebelum buat yang baru
- Tailwind class langsung di template, tidak membuat CSS custom kecuali benar-benar perlu

---

## Membuat Fitur Baru

### 1. Buat migration

```bash
php artisan make:migration create_nama_tabel_table
```

Ikuti urutan dependency (lihat [DATABASE.md](DATABASE.md#urutan-migrasi)).

### 2. Buat model

```bash
php artisan make:model NamaModel -f
# -f = sekaligus buat factory
```

Tambahkan relasi, `$fillable`, cast, dan `SoftDeletes` jika diperlukan.

### 3. Buat Livewire component

```bash
php artisan make:livewire Mahasiswa/Askep/NamaLangkah
```

File yang dibuat:
- `app/Livewire/Mahasiswa/Askep/NamaLangkah.php`
- `resources/views/livewire/mahasiswa/askep/nama-langkah.blade.php`

### 4. Daftarkan route

```php
// routes/web.php
Route::get('/pasien/{pasien}/nama-langkah', NamaLangkah::class)
    ->name('pasien.nama-langkah');
```

### 5. Tulis test

```bash
php artisan make:test --pest NamaLangkahTest
```

Minimal test: happy path + validasi input kosong.

### 6. Format kode

```bash
vendor/bin/pint --dirty
```

---

## Menambah Data Master (SDKI/SLKI/SIKI)

Untuk menambah data master via seeder:

```php
// database/seeders/SdkiSeeder.php
DiagnosaSdki::insert([
    ['kode_diagnosa' => 'D.0077', 'label_diagnosa' => 'Nyeri Akut', 'definisi' => '...'],
    // ...
]);
```

Untuk mapping relasi:

```php
SdkiSlkiRelation::insert([
    ['diagnosa_id' => $diagnosa->id, 'luaran_id' => $luaran->id],
]);
```

---

## Testing

### Aturan

- Setiap fitur baru **wajib** disertai test
- Gunakan factory untuk buat data test — jangan hardcode ID
- Jalankan test yang relevan sebelum commit

### Contoh Test Mahasiswa

```php
// tests/Feature/Askep/DiagnosaTest.php
use App\Models\{User, Pasien, DiagnosaSdki};

test('mahasiswa dapat memilih diagnosa sdki', function () {
    $mahasiswa = User::factory()->mahasiswa()->create();
    $pasien = Pasien::factory()->for($mahasiswa)->withPengkajian()->create();
    $diagnosa = DiagnosaSdki::factory()->create();

    $this->actingAs($mahasiswa)
        ->livewire(Diagnosa::class, ['pasien' => $pasien])
        ->call('pilihDiagnosa', $diagnosa->id)
        ->assertSee($diagnosa->label_diagnosa);

    expect($pasien->diagnosaPasien)->toHaveCount(1);
});
```

### Contoh Test Admin

```php
test('admin tidak bisa akses halaman mahasiswa', function () {
    $admin = User::factory()->admin()->create();

    $this->actingAs($admin)
        ->get(route('dashboard'))
        ->assertForbidden();
});
```

### Jalankan test

```bash
# Semua test
php artisan test --compact

# Satu file
php artisan test --compact tests/Feature/Askep/DiagnosaTest.php

# Filter berdasarkan nama
php artisan test --compact --filter="mahasiswa dapat memilih"
```

---

## Debugging

### Lihat log real-time

```bash
php artisan pail
```

### Query database langsung

```bash
php artisan tinker --execute 'DiagnosaSdki::count();'
```

### Lihat route yang terdaftar

```bash
php artisan route:list --except-vendor
php artisan route:list --name=pasien
```

### Reset database development

```bash
php artisan migrate:fresh --seed
```

---

## Checklist Sebelum Commit

- [ ] Kode diformat: `vendor/bin/pint --dirty`
- [ ] Test lolos: `php artisan test --compact`
- [ ] Tidak ada `dd()`, `dump()`, atau `var_dump()` tertinggal
- [ ] Migration berjalan mulus dari awal: `php artisan migrate:fresh`
- [ ] Nama route, variable, dan method deskriptif
