# Database Schema — DIGIKEP

Dokumentasi lengkap 12 tabel yang digunakan aplikasi DIGIKEP beserta relasi, constraint, dan indeks.

---

## Diagram Relasi (ERD)

```
users
  └──< pasien
         ├──< pengkajian
         ├──< diagnosa_pasien >── diagnosa_sdki
         │         └──< luaran_pasien >── luaran_slki
         │                   └──< intervensi_pasien >── intervensi_siki
         └──< riwayat_pasien

diagnosa_sdki >──< luaran_slki        (sdki_slki_relations)
luaran_slki   >──< intervensi_siki    (slki_siki_relations)
```

---

## Tabel Master Data

### `users`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | Auto increment |
| `nim_nip` | varchar(20) UNIQUE | Digunakan sebagai username login |
| `name` | varchar(255) | Nama lengkap |
| `email` | varchar(255) UNIQUE NULLABLE | Email (opsional) |
| `password` | varchar(255) | Bcrypt hash |
| `role` | enum('mahasiswa','admin') | Role akses |
| `is_first_login` | boolean DEFAULT true | Paksa ganti password saat pertama login |
| `remember_token` | varchar(100) NULLABLE | — |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Index: `nim_nip` (unique), `role`

---

### `diagnosa_sdki`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `kode_diagnosa` | varchar(10) UNIQUE | Contoh: `D.0077` |
| `label_diagnosa` | varchar(255) | Contoh: `Nyeri Akut` |
| `definisi` | text NULLABLE | Definisi klinis |
| `deleted_at` | timestamp NULLABLE | Soft delete |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Soft delete digunakan agar data Askep mahasiswa tidak rusak ketika diagnosa dihapus admin.

---

### `luaran_slki`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `kode_luaran` | varchar(10) UNIQUE | Contoh: `L.08066` |
| `label_luaran` | varchar(255) | Contoh: `Tingkat Nyeri` |
| `definisi` | text NULLABLE | — |
| `kriteria_hasil` | text NULLABLE | Daftar kriteria hasil (dapat disimpan sebagai JSON atau teks) |
| `deleted_at` | timestamp NULLABLE | Soft delete |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

---

### `intervensi_siki`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `kode_intervensi` | varchar(10) UNIQUE | Contoh: `I.08238` |
| `label_intervensi` | varchar(255) | Contoh: `Manajemen Nyeri` |
| `definisi` | text NULLABLE | — |
| `tindakan` | text NULLABLE | Langkah-langkah tindakan |
| `deleted_at` | timestamp NULLABLE | Soft delete |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

---

### `sdki_slki_relations` (Pivot)

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `diagnosa_id` | bigint FK → `diagnosa_sdki.id` | — |
| `luaran_id` | bigint FK → `luaran_slki.id` | — |

> Constraint: `UNIQUE(diagnosa_id, luaran_id)`

---

### `slki_siki_relations` (Pivot)

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `luaran_id` | bigint FK → `luaran_slki.id` | — |
| `intervensi_id` | bigint FK → `intervensi_siki.id` | — |

> Constraint: `UNIQUE(luaran_id, intervensi_id)`

---

## Tabel Data Mahasiswa

### `pasien`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `user_id` | bigint FK → `users.id` | Mahasiswa pemilik data |
| `no_rm` | varchar(20) | Nomor rekam medis |
| `nama_pasien` | varchar(255) | — |
| `umur` | tinyint unsigned | Tahun |
| `jenis_kelamin` | enum('L','P') | — |
| `ruang_rawat` | varchar(100) NULLABLE | — |
| `tanggal_masuk` | date | — |
| `status_askep` | enum('draft','selesai') DEFAULT 'draft' | — |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Constraint: `UNIQUE(user_id, no_rm)` — No. RM unik per mahasiswa

---

### `pengkajian`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `pasien_id` | bigint FK → `pasien.id` CASCADE DELETE | — |
| `pola_kesehatan` | enum (lihat di bawah) | 11 Pola Gordon |
| `observasi` | text NULLABLE | Hasil observasi mahasiswa |
| `is_abnormal` | boolean DEFAULT false | Ditandai abnormal |
| `tipe_data` | enum('DS','DO') NULLABLE | Hanya diisi jika `is_abnormal = true` |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Constraint: `UNIQUE(pasien_id, pola_kesehatan)`

**Nilai enum `pola_kesehatan`:**
```
persepsi_kesehatan, nutrisi_metabolik, eliminasi, aktivitas_latihan,
tidur_istirahat, kognitif_perseptual, persepsi_diri, peran_hubungan,
seksualitas_reproduksi, koping_toleransi_stres, nilai_kepercayaan
```

---

### `diagnosa_pasien`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `pasien_id` | bigint FK → `pasien.id` CASCADE DELETE | — |
| `diagnosa_id` | bigint FK → `diagnosa_sdki.id` | — |
| `data_subjektif` | text NULLABLE | DS yang diinput mahasiswa |
| `data_objektif` | text NULLABLE | DO yang diinput mahasiswa |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Constraint: `UNIQUE(pasien_id, diagnosa_id)`

---

### `luaran_pasien`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `diagnosa_pasien_id` | bigint FK → `diagnosa_pasien.id` CASCADE DELETE | — |
| `luaran_id` | bigint FK → `luaran_slki.id` | — |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Constraint: `UNIQUE(diagnosa_pasien_id, luaran_id)`

---

### `intervensi_pasien`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `luaran_pasien_id` | bigint FK → `luaran_pasien.id` CASCADE DELETE | — |
| `intervensi_id` | bigint FK → `intervensi_siki.id` | — |
| `created_at` | timestamp | — |
| `updated_at` | timestamp | — |

> Constraint: `UNIQUE(luaran_pasien_id, intervensi_id)`

---

### `riwayat_pasien`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | bigint PK | — |
| `pasien_id` | bigint FK → `pasien.id` CASCADE DELETE | — |
| `aktivitas` | text | Deskripsi aktivitas (misal: "Diagnosa Nyeri Akut ditambahkan") |
| `created_at` | timestamp | Waktu aktivitas |

> Tabel ini hanya append (tidak ada update/delete per baris). Di-query untuk timeline pasien dan log admin.

---

## Urutan Migrasi

Jalankan migrasi dalam urutan berikut agar foreign key tidak gagal:

1. `users`
2. `diagnosa_sdki`
3. `luaran_slki`
4. `intervensi_siki`
5. `sdki_slki_relations`
6. `slki_siki_relations`
7. `pasien`
8. `pengkajian`
9. `diagnosa_pasien`
10. `luaran_pasien`
11. `intervensi_pasien`
12. `riwayat_pasien`

---

## Query Penting

### Ambil luaran SLKI yang relevan untuk diagnosa tertentu

```sql
SELECT slki.*
FROM luaran_slki slki
JOIN sdki_slki_relations rel ON slki.id = rel.luaran_id
WHERE rel.diagnosa_id = ?
  AND slki.deleted_at IS NULL
ORDER BY slki.label_luaran;
```

### Ambil intervensi SIKI yang relevan untuk luaran tertentu

```sql
SELECT siki.*
FROM intervensi_siki siki
JOIN slki_siki_relations rel ON siki.id = rel.intervensi_id
WHERE rel.luaran_id = ?
  AND siki.deleted_at IS NULL
ORDER BY siki.label_intervensi;
```

### Cek progress Askep pasien

```sql
SELECT
  p.id,
  p.status_askep,
  COUNT(DISTINCT peng.id) > 0 AS has_pengkajian,
  COUNT(DISTINCT dp.id)   > 0 AS has_diagnosa,
  COUNT(DISTINCT lp.id)   > 0 AS has_luaran,
  COUNT(DISTINCT ip.id)   > 0 AS has_intervensi
FROM pasien p
LEFT JOIN pengkajian peng ON peng.pasien_id = p.id
LEFT JOIN diagnosa_pasien dp ON dp.pasien_id = p.id
LEFT JOIN luaran_pasien lp ON lp.diagnosa_pasien_id = dp.id
LEFT JOIN intervensi_pasien ip ON ip.luaran_pasien_id = lp.id
WHERE p.id = ?
GROUP BY p.id;
```
