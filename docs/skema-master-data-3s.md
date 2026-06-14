# Skema Database Master Data 3S — DigiKep

## SDKI (Standar Diagnosa Keperawatan Indonesia)

### `diagnosa_sdki`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK AUTO_INCREMENT | |
| `kode_diagnosa` | varchar(10) UNIQUE NOT NULL | Contoh: D.0001 |
| `label_diagnosa` | varchar(255) NOT NULL | |
| `kategori` | varchar(255) nullable | |
| `subkategori` | varchar(255) nullable | |
| `tipe_diagnosa` | enum nullable | `Aktual` / `Risiko` / `Promosi Kesehatan` |
| `definisi` | text nullable | |
| `deleted_at` | timestamp nullable | Soft delete |

### `sdki_penyebab`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `sdki_id` | bigint FK → `diagnosa_sdki.id` CASCADE | |
| `kelompok` | enum NOT NULL default `Umum` | `Fisiologis` / `Psikologis` / `Situasional` / `Umum` |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |

### `sdki_gejala`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `sdki_id` | bigint FK → `diagnosa_sdki.id` CASCADE | |
| `tipe` | enum NOT NULL | `Mayor` / `Minor` |
| `jenis` | enum NOT NULL | `Subjektif` / `Objektif` |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |
| `tersedia` | boolean default 1 | `false` = tidak tersedia di buku |

### `sdki_kondisi_klinis`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `sdki_id` | bigint FK → `diagnosa_sdki.id` CASCADE | |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |

### `sdki_faktor_risiko`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `sdki_id` | bigint FK → `diagnosa_sdki.id` CASCADE | |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |

---

## SLKI (Standar Luaran Keperawatan Indonesia)

### `luaran_slki`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK AUTO_INCREMENT | |
| `kode_luaran` | varchar(10) UNIQUE NOT NULL | |
| `label_luaran` | varchar(255) NOT NULL | |
| `kategori` | varchar(255) nullable | |
| `subkategori` | varchar(255) nullable | |
| `definisi` | text nullable | |
| `kriteria_hasil` | text nullable | ⚠️ Kolom lama (teks mentah), digantikan tabel `slki_kriteria_hasil` |
| `deleted_at` | timestamp nullable | Soft delete |

### `slki_kriteria_hasil`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `luaran_id` | bigint FK → `luaran_slki.id` CASCADE | |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |
| `arah` | enum NOT NULL | `Meningkat` / `Menurun` / `Membaik` |

---

## SIKI (Standar Intervensi Keperawatan Indonesia)

### `intervensi_siki`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK AUTO_INCREMENT | |
| `kode_intervensi` | varchar(10) UNIQUE nullable | |
| `label_intervensi` | varchar(255) NOT NULL | |
| `kategori` | varchar(255) nullable | |
| `subkategori` | varchar(255) nullable | |
| `definisi` | text nullable | |
| `tindakan` | text nullable | ⚠️ Kolom lama (teks mentah), digantikan tabel `siki_tindakan` |
| `deleted_at` | timestamp nullable | Soft delete |

### `siki_tindakan`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `intervensi_id` | bigint FK → `intervensi_siki.id` CASCADE | |
| `jenis` | enum NOT NULL | `Observasi` / `Terapeutik` / `Edukasi` / `Kolaborasi` |
| `urutan` | tinyint unsigned default 1 | |
| `deskripsi` | text NOT NULL | |

---

## Tabel Relasi

### `sdki_slki_relations`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `diagnosa_id` | bigint FK → `diagnosa_sdki.id` CASCADE | |
| `luaran_id` | bigint FK → `luaran_slki.id` CASCADE | |
| — | UNIQUE `(diagnosa_id, luaran_id)` | Cegah duplikasi |

### `slki_siki_relations`
| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | bigint PK | |
| `luaran_id` | bigint FK → `luaran_slki.id` CASCADE | |
| `intervensi_id` | bigint FK → `intervensi_siki.id` CASCADE | |
| — | UNIQUE `(luaran_id, intervensi_id)` | Cegah duplikasi |

---

## Diagram Relasi

```
diagnosa_sdki (SDKI)
├── sdki_penyebab        (1 SDKI → banyak penyebab)
├── sdki_gejala          (1 SDKI → banyak gejala Mayor/Minor)
├── sdki_kondisi_klinis  (1 SDKI → banyak kondisi klinis)
├── sdki_faktor_risiko   (1 SDKI → banyak faktor risiko)
└── sdki_slki_relations ──→ luaran_slki (SLKI)
                              ├── slki_kriteria_hasil  (1 SLKI → banyak kriteria)
                              └── slki_siki_relations ──→ intervensi_siki (SIKI)
                                                           └── siki_tindakan (1 SIKI → banyak tindakan)
```
