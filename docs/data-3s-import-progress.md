# Progress Import Data 3S (SDKI / SLKI / SIKI)

Dokumen ini mencatat status, bug yang ditemukan, dan pekerjaan yang tersisa terkait import data master 3S ke database DigiKep dari folder `database/seeders/data/data-3s/`.

---

## Status Database Saat Ini

| Tabel | Jumlah | Target | Status |
|---|---|---|---|
| `diagnosa_sdki` | 149 | 149 | ✅ Lengkap |
| `luaran_slki` | 149 | 110+ | ✅ Lengkap |
| `intervensi_siki` | 182 | 73+ | ✅ Lengkap |
| `sdki_penyebab` | 236 | ~400+ | ⚠️ Sebagian |
| `sdki_gejala` | 2 | ~100+ | ❌ Hampir kosong |
| `sdki_faktor_risiko` | 95 | ~200+ | ⚠️ Sebagian |
| `sdki_kondisi_klinis` | 0 | ~100+ | ❌ Kosong |
| `slki_kriteria_hasil` | 327 | ~800+ | ⚠️ Sebagian |
| `siki_tindakan` | 451 | ~1000+ | ⚠️ Sebagian |
| `sdki_slki_relations` | 160 | 149 | ✅ Lengkap |
| `slki_siki_relations` | 101 | ~300+ | ⚠️ Tersedia (via HasilMdRelationsSeeder) |

---

## Struktur File Sumber

- **14 file batch** di `database/seeders/data/data-3s/`
- `batch1_d0001_d0010.sql` s/d `batch14_d0141_d0149.sql`
- File diproses alphabetically (batch10 jalan duluan sebelum batch1)
- Setiap file mencakup: SLKI data, SLKI kriteria, SIKI data, SIKI tindakan, SDKI data, SDKI penyebab/gejala/faktor risiko, SDKI↔SLKI mapping

---

## Perbedaan Schema: File SQL vs Database Aktual

File SQL ditulis untuk schema versi lama. `DataMaster3SSeeder.php` melakukan transformasi on-the-fly sebelum eksekusi.

| Legacy (file SQL) | Aktual (database) |
|---|---|
| `slki` | `luaran_slki` |
| `siki` | `intervensi_siki` |
| `sdki` | `diagnosa_sdki` |
| `sdki_slki` | `sdki_slki_relations` |
| `slki_siki` | `slki_siki_relations` |
| `nama_luaran` | `label_luaran` |
| `nama_intervensi` | `label_intervensi` |
| `nama_diagnosa` | `label_diagnosa` |
| `slki_kriteria_hasil.kode_luaran` | `slki_kriteria_hasil.luaran_id` (FK integer) |
| `siki_tindakan.siki_id` | `siki_tindakan.intervensi_id` |
| `sdki_slki.(sdki_id, slki_id)` | `sdki_slki_relations.(diagnosa_id, luaran_id)` |
| kolom `tipe_intervensi` di siki | tidak ada di schema — harus distrip |

---

## Bug yang Sudah Diperbaiki di DataMaster3SSeeder.php

### Bug 1 — Replacement `kode_luaran` terlalu global (kritikal)
**Masalah:** Step 4 regex `\('(L\.\d+)',` mengganti nilai `kode_luaran` di INSERT `luaran_slki` juga, bukan hanya di `slki_kriteria_hasil`. Akibatnya INSERT `luaran_slki` memasukkan subquery sebagai nilai string, menghasilkan row dengan `kode_luaran` berisi angka ID, bukan kode seperti `L.01001`.

**Fix:** Gunakan `preg_replace_callback` yang hanya scope ke blok `INSERT INTO slki_kriteria_hasil`.

### Bug 2 — Statement yang diawali komentar `--` dilewati
**Masalah:** Banyak INSERT (`slki_kriteria_hasil`, `siki_tindakan`, `sdki_penyebab`, relasi) berada dalam chunk yang diawali komentar SQL seperti `-- L.01001 Bersihan Jalan Napas`. Karena split dilakukan per `;\n`, chunk tersebut dimulai dengan `--` dan diskip oleh cek `str_starts_with(ltrim($statement), '--')`.

**Fix:** Stripping komentar dulu untuk cek kekosongan, tapi tetap kirim statement asli (termasuk komentar) ke MySQL karena MySQL bisa handle komentar secara native.

### Bug 3 — `tipe_intervensi` tidak ada di schema
**Masalah:** File SQL menyertakan kolom `tipe_intervensi` (nilai: `'Utama'`/`'Pendukung'`) di INSERT `siki`, tapi kolom ini tidak ada di tabel `intervensi_siki`.

**Fix:** Strip kolom dari header dan nilai dari setiap row dengan `str_replace` + `preg_replace_callback`.

### Bug 4 — Typo `descripsi` di 6 batch file
**Masalah:** File batch8, batch9, batch11–14 menggunakan `descripsi` bukan `deskripsi`.

**Fix:** `str_replace('descripsi', 'deskripsi', $sql)` di Step 0.

### Bug 5 — Detail tables tidak ada unique constraint → duplikasi
**Masalah:** `slki_kriteria_hasil`, `siki_tindakan`, `sdki_penyebab`, dll tidak punya unique constraint. Menjalankan seeder berulang kali akan membuat duplikat.

**Fix:** Truncate semua detail table di awal `run()` sebelum memproses file batch (dengan `FOREIGN_KEY_CHECKS=0`).

### Bug 6 — Wrapped dalam `DB::transaction()` dengan DDL
**Masalah:** Jika ada DDL (`CREATE TABLE`) di dalam transaction MySQL, terjadi implicit commit yang bisa menyebabkan inconsistency.

**Fix:** Hapus wrapper `DB::transaction()`, eksekusi langsung per statement. Error individual di-catch dan dilaporkan tanpa menghentikan proses.

### Bug 7 — `INSERT IGNORE` pada detail tables terlewat
**Masalah:** Beberapa batch menggunakan `INSERT IGNORE INTO slki_kriteria_hasil`, regex Step 4 hanya mencari `INSERT INTO`.

**Fix:** Tambahkan `str_replace('INSERT IGNORE INTO slki_kriteria_hasil', 'INSERT INTO slki_kriteria_hasil', $sql)` agar diproses oleh regex transformasi nilai.

### Bug 8 — Rename tabel kurang fleksibel
**Masalah:** `str_replace` dengan spasi di akhir (misal `'sdki_slki '`) gagal jika diikuti karakter lain atau newline.

**Fix:** Gunakan `preg_replace` dengan word boundaries `\b` untuk semua rename tabel.

---

## Bug yang Masih Tersisa (Belum Selesai)

### Isu 1 — Batch2: Row 4 nilai di INSERT `luaran_slki` (SELESAI)
**Fix:** Ditambahkan transformasi khusus di seeder untuk `L.04033` agar menyertakan `NULL` pada kolom definisi yang kurang.

### Isu 2 — `slki_siki_relations` masih minim
**Status:** Sekarang terisi 101 baris melalui `HasilMdRelationsSeeder` yang membaca `hasil.md`. Data di SQL batch tetap kosong.
25 SIKI yang dilewati (kode ada di hasil.md tapi belum ada di `intervensi_siki`): I.03139, I.02083, I.03135, I.03138, I.03130, I.12397, I.14551, I.10338, I.05186, I.12411, I.07216, I.14525, I.10341, I.13496, I.09322, I.12441, I.12461, I.12403, I.14538, I.14513, I.07228, I.12414, I.12457, I.14578.
38 baris hasil.md tidak ter-parse (kode D./L. tidak ditemukan dalam format `(D.XXXX)`) — kemungkinan format berbeda di beberapa row.

### Isu 3 — `sdki_kondisi_klinis` masih kosong
**Masalah:** Belum ada batch file yang mengisi tabel ini. Perlu dicek apakah data tersebut ada di file lain.

### Isu 4 — `sdki_gejala` hampir kosong (2 baris dari batch3 saja)
**Masalah:** Hanya batch3 yang berisi INSERT ke `sdki_gejala`. Batches lain tidak menyertakan data gejala.

### Isu 5 — Counts masih di bawah target
Data yang masuk masih parsial karena beberapa batch mengalami error. Setelah isu-isu di atas diperbaiki perlu dijalankan ulang dan dihitung ulang.

---

## Cara Menjalankan Ulang Seeder

```bash
# Hanya import data 3S (tidak mereset user/penugasan)
php artisan db:seed --class=DataMaster3SSeeder

# Import relasi dari hasil.md (harus setelah DataMaster3SSeeder)
php artisan db:seed --class=HasilMdRelationsSeeder

# Reset total + seed dari awal (semua seeder berjalan urut)
php artisan migrate:fresh --seed
```

`DataMaster3SSeeder` bersifat idempotent untuk tabel utama (via `INSERT IGNORE`). Detail tables selalu di-truncate di awal setiap run.

`HasilMdRelationsSeeder` hanya truncate `slki_siki_relations`, dan additive untuk `sdki_slki_relations`. Butuh file `hasil.md` di `database/seeders/data/hasil.md` atau `C:/Users/kur/Downloads/hasil.md`.

---

## File Terkait

| File | Keterangan |
|---|---|
| `database/seeders/DataMaster3SSeeder.php` | Seeder utama, melakukan transformasi SQL dari batch files |
| `database/seeders/HasilMdRelationsSeeder.php` | Seeder relasi SDKI↔SLKI dan SLKI↔SIKI dari hasil.md |
| `database/seeders/data/relations_dari_hasil_md.sql` | SQL INSERT tersimpan (dokumentasi, bisa dijalankan manual) |
| `database/seeders/data/data-3s/batch*.sql` | 14 file SQL sumber |
| `database/seeders/SdkiSlkiSikiSeeder.php` | Seeder lama (data minimal, tanpa detail) |
| `database/seeders/DatabaseSeeder.php` | Entry point, memanggil semua seeder |
