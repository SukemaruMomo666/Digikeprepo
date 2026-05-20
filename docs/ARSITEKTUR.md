# Arsitektur Sistem — DIGIKEP

Dokumen ini merangkum keputusan arsitektur (ADR) dan desain sistem untuk DIGIKEP.

---

## Gambaran Umum

DIGIKEP adalah aplikasi **Laravel monolith** dengan antarmuka reaktif berbasis **Livewire 4**. Tidak ada API terpisah — semua state dikelola server-side dan dirender ulang via Livewire wire protocol.

```
Browser
  │  HTTP / Livewire WebSocket-like
  ▼
Laravel 13 (Routing → Middleware → Livewire Component)
  │
  ├── Fortify (Auth)
  ├── Eloquent ORM
  └── MySQL Database
```

---

## ADR-001: Alur Multi-Step Askep

**Keputusan:** State setiap langkah Askep disimpan ke **database secara langsung**, bukan ditahan di memori Livewire component.

**Alasan:**
- Data tidak hilang jika halaman di-refresh atau browser ditutup
- Setiap URL langkah bookmarkable: `/pasien/{id}/diagnosa`
- Fitur "Simpan Draft" bekerja secara alami

**Konsekuensi:**
- Setiap langkah punya Livewire component full-page tersendiri
- Model `Pasien` menyimpan `status_askep` (`draft` / `selesai`)
- Helper `nextAskepStep()` pada model `Pasien` menentukan ke mana tombol "Lanjutkan Askep" mengarah

```php
// Contoh: app/Models/Pasien.php
public function nextAskepStep(): string
{
    if (! $this->pengkajian()->exists()) {
        return route('pasien.pengkajian', $this);
    }
    if (! $this->diagnosaPasien()->exists()) {
        return route('pasien.diagnosa', $this);
    }
    if (! $this->luaranPasien()->exists()) {
        return route('pasien.luaran', $this);
    }
    if (! $this->intervensiPasien()->exists()) {
        return route('pasien.intervensi', $this);
    }

    return route('pasien.askep', $this);
}
```

---

## ADR-002: Role-Based Access Control

**Keputusan:** Custom middleware `EnsureRole` + kolom `role` enum pada tabel `users`. Tidak menggunakan package Spatie Permission (overkill untuk 2 role statis).

**Implementasi:**

```php
// app/Http/Middleware/EnsureRole.php
public function handle(Request $request, Closure $next, string $role): Response
{
    if (! $request->user() || $request->user()->role !== $role) {
        abort(403);
    }

    return $next($request);
}
```

```php
// routes/web.php
Route::middleware(['auth', 'role:mahasiswa'])->group(function () {
    Route::get('/dashboard', Dashboard::class)->name('dashboard');
    // ...
});

Route::prefix('admin')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/dashboard', AdminDashboard::class)->name('admin.dashboard');
    // ...
});
```

**Login redirect by role:**

```php
// app/Providers/FortifyServiceProvider.php
Fortify::authenticateUsing(function (Request $request) {
    $user = User::where('nim_nip', $request->nim_nip)->first();
    if ($user && Hash::check($request->password, $user->password)) {
        return $user;
    }
});
```

---

## ADR-003: Activity Logging via Eloquent Observer

**Keputusan:** Catat aktivitas secara **sinkron** menggunakan Eloquent Observer. Tidak menggunakan queue untuk MVP karena logging ringan dan harus segera tampil di timeline.

**Observer terdaftar:**

| Model | Event | Log yang ditulis |
|-------|-------|-----------------|
| `Pasien` | `created` | "Pasien ditambahkan" |
| `DiagnosaPasien` | `created` | "Diagnosa \"{label}\" ditambahkan" |
| `LuaranPasien` | `created` | "Luaran \"{label}\" dipilih" |
| `IntervensiPasien` | `created` | "Intervensi \"{label}\" dipilih" |
| `Pasien` | `updated` (status→selesai) | "Askep selesai" |

Log pengkajian ditulis manual setelah `Pengkajian::upsert()` selesai (bukan per-pola).

---

## ADR-004: Soft Delete pada Data Master

**Keputusan:** Tabel `diagnosa_sdki`, `luaran_slki`, `intervensi_siki` menggunakan **SoftDeletes**.

**Alasan:** Jika admin menghapus diagnosa yang sudah dipakai oleh Askep mahasiswa, data Askep tidak boleh rusak. Dengan soft delete, relasi tetap valid dan Askep yang sudah selesai tetap bisa ditampilkan utuh.

**Konsekuensi:** Query yang melibatkan join ke master data perlu sadar soft delete. Eloquent menangani ini otomatis ketika menggunakan relasi, tapi query raw SQL perlu tambahkan `AND deleted_at IS NULL`.

---

## Komponen Livewire

```
Livewire\Mahasiswa\
  Dashboard
  Pasien\
    Index          (daftar semua pasien)
    Create         (form tambah pasien)
    Show           (detail + riwayat timeline)
  Askep\
    Pengkajian     (form 11 Pola Gordon)
    Diagnosa       (search SDKI + input DS/DO)
    Luaran         (pilih SLKI per diagnosa)
    Intervensi     (pilih SIKI per luaran)
    Show           (view Askep lengkap)

Livewire\Admin\
  Dashboard
  Users\Index      (CRUD mahasiswa)
  Sdki\Index       (CRUD diagnosa SDKI)
  Slki\Index       (CRUD luaran SLKI)
  Siki\Index       (CRUD intervensi SIKI)
  Relasi\Index     (mapping SDKI↔SLKI dan SLKI↔SIKI)
  Log\Index        (log aktivitas + filter)
  DataMahasiswa\Index
```

---

## Blade Components (Reusable)

| Komponen | Kegunaan |
|----------|----------|
| `<x-askep-step-indicator>` | Progress bar 4 langkah di halaman Askep |
| `<x-activity-timeline>` | Timeline riwayat aktivitas pasien |
| `<x-stat-card>` | Card statistik di dashboard |
| `<x-patient-card>` | Ringkasan data pasien |

---

## Routing Structure

```
GET  /                          → Welcome page
GET  /login                     → Login (Fortify)
POST /login                     → Proses login
POST /logout                    → Logout

# Mahasiswa (middleware: auth, role:mahasiswa)
GET  /dashboard                 → Dashboard mahasiswa
GET  /pasien                    → Daftar pasien
GET  /pasien/create             → Form tambah pasien
POST /pasien                    → Simpan pasien baru
GET  /pasien/{pasien}           → Detail + riwayat
GET  /pasien/{pasien}/edit      → Edit data pasien
GET  /pasien/{pasien}/pengkajian → Form pengkajian
GET  /pasien/{pasien}/diagnosa  → Halaman diagnosa SDKI
GET  /pasien/{pasien}/luaran    → Halaman luaran SLKI
GET  /pasien/{pasien}/intervensi → Halaman intervensi SIKI
GET  /pasien/{pasien}/askep     → View Askep lengkap

# Admin (middleware: auth, role:admin, prefix: /admin)
GET  /admin/dashboard
GET  /admin/users
GET  /admin/sdki
GET  /admin/slki
GET  /admin/siki
GET  /admin/relasi
GET  /admin/log
GET  /admin/data-mahasiswa
```

---

## Keputusan yang Ditunda (Phase 2)

| Fitur | Paket yang Direncanakan | Alasan Ditunda |
|-------|------------------------|----------------|
| Export PDF | `barryvdh/laravel-dompdf` | Tidak kritis untuk MVP |
| Import Excel | `maatwebsite/excel` | Seeding manual cukup untuk 10 diagnosa awal |
| Dashboard chart | `chart.js` via Alpine | MVP fokus ke fungsionalitas inti |
| Email notifikasi | Laravel Mail | Mahasiswa mungkin tidak punya email institusi |
