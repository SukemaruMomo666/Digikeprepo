# DigiKep — Rencana Pengembangan

> Dokumen konteks pengerjaan selanjutnya berdasarkan review dosen, rancangan sistem lengkap (DIGIKEP-RANCANGAN.md), dan kondisi database aktual per Juni 2026.

---

## Daftar Isi

1. [Status Sistem Saat Ini](#1-status-sistem-saat-ini)
2. [Kondisi Database 3S](#2-kondisi-database-3s)
3. [Fase 1 — Revisi Dosen](#3-fase-1--revisi-dosen)
4. [Fase 2 — Core Askep](#4-fase-2--core-askep)
5. [Fase 3 — Kelengkapan Data 3S](#5-fase-3--kelengkapan-data-3s)
6. [Fase 4 — Fitur Tambahan](#6-fase-4--fitur-tambahan)
7. [Yang Perlu Disediakan](#7-yang-perlu-disediakan)

---

## 1. Status Sistem Saat Ini

### ✅ Sudah Selesai

| Fitur | Keterangan |
|---|---|
| Autentikasi (login/logout) | NIM/NIP + password, first-login redirect |
| Role Mahasiswa & Admin | Middleware, layout terpisah |
| Dashboard Mahasiswa | Stat cards, daftar pasien terakhir |
| Dashboard Admin | Belum diperbarui |
| Manajemen Pasien | CRUD pasien, filter status |
| Alur Askep 5 langkah | Pengkajian → Diagnosa → Luaran → Intervensi → Evaluasi |
| Pengkajian 32 section | 4 tab: Riwayat, Biologis, Psikososial, Pemeriksaan Fisik |
| Master Data SDKI (149) | Termasuk detail penyebab/gejala D.0001–D.0073 |
| Master Data SLKI (112) | Kode + label saja, konten kosong |
| Master Data SIKI (77) | Kode + label saja, konten hampir semua kosong |
| Admin: kelola user, SDKI/SLKI/SIKI, relasi, log | Ada tapi belum diperbarui |
| Design System | Navy Blue + Teal (DESIGN.md) — sudah diimplementasi |

### ❌ Belum Ada

- Role Dosen beserta seluruh modulnya
- Status askep lebih dari 2 (draft/selesai)
- Submit askep ke dosen
- Sistem feedback dosen → mahasiswa
- Langkah Implementasi (step ke-4)
- Log Pembelajaran & Refleksi (Gibbs Cycle)
- Export PDF askep
- Tombol navigasi antar-step
- Opsi "Normal" di form pengkajian
- Logo Polsub di UI
- Halaman Panduan / Video Tutorial / FAQ

---

## 2. Kondisi Database 3S

### Ringkasan

| Tabel | Jumlah | Status |
|---|---|---|
| `diagnosa_sdki` | 149 | ✅ Lengkap |
| `luaran_slki` | 112 | ⚠️ Kode+label ada, konten NULL |
| `intervensi_siki` | 77 | ⚠️ Kode+label ada, konten hampir semua NULL |
| `sdki_penyebab` | 487 | ✅ Ada untuk D.0001–D.0073 |
| `sdki_gejala` | 786 | ✅ Ada untuk D.0001–D.0073 |
| `sdki_faktor_risiko` | 285 | ✅ Ada untuk D.0001–D.0073 (tipe Risiko) |
| `sdki_kondisi_klinis` | 710 | ✅ Ada untuk D.0001–D.0073 |
| `sdki_slki_relations` | **10** | ❌ Sangat sedikit (perlu ratusan) |
| `slki_siki_relations` | **10** | ❌ Sangat sedikit (perlu ratusan) |

### Detail Gap

**SDKI D.0074–D.0149 (76 diagnosa):**
- `tipe_diagnosa` = NULL
- Tidak ada penyebab, gejala, kondisi klinis
- Termasuk diagnosa penting: Nyeri Akut (D.0077), Ansietas (D.0080), Gangguan Integritas Kulit (D.0129), Risiko Infeksi (D.0142), Risiko Jatuh (D.0143), Defisit Pengetahuan (D.0110), dll.

**SLKI — Konten kosong:**
- Kolom `kriteria_hasil` = NULL di semua 112 baris
- Tidak ada tabel indikator dengan skala 1–5
- Fitur "tetapkan target skor luaran" tidak bisa jalan

**SIKI — Konten hampir kosong:**
- Kolom `tindakan` = NULL di hampir semua 77 baris
- Tidak ada breakdown: observasi / terapeutik / edukasi / kolaborasi
- Fitur "tampil tindakan intervensi" tidak bisa jalan

**Relasi sangat sparse:**
- Dari 149 SDKI, hanya 10 yang punya relasi ke SLKI
- Mahasiswa tidak bisa dapat rekomendasi SLKI/SIKI otomatis saat memilih diagnosa

### Dampak ke Aplikasi

| Fitur Askep | Status Fungsi |
|---|---|
| Pilih diagnosa SDKI | ✅ Bisa |
| Lihat detail gejala/etiologi | ⚠️ Hanya D.0001–D.0073 |
| Pilih SLKI yang relevan per diagnosa | ❌ Hampir tidak ada relasi |
| Set target indikator SLKI (1–5) | ❌ Tidak ada data indikator |
| Pilih SIKI yang relevan per SLKI | ❌ Hampir tidak ada relasi |
| Lihat tindakan SIKI (obs/terapi/edukasi) | ❌ Data kosong |

---

## 3. Fase 1 — Revisi Dosen

> Prioritas segera. Berdasarkan catatan revisi dari dosen pembimbing.

### 3.1 Logo Polsub

**Scope:** Pasang logo Politeknik Negeri Subang di:
- Sidebar header (di samping teks "DIGIKEP")
- Auth layout panel kiri (di bawah nama sistem)
- Mobile header

**File yang dibutuhkan:** Logo PNG atau SVG dari pihak kampus.

---

### 3.2 Sidebar Menu

**Menu saat ini:**
```
Beranda, Pasien, Riwayat, Semua Askep, Arsip Pengkajian
```

**Penambahan yang diminta dosen:**
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

**Catatan:** Panduan, Video Tutorial, FAQ perlu dibuat sebagai halaman statis.
Konten bisa diisi placeholder dulu, diganti konten sesungguhnya nanti.

**Perlu konfirmasi:**
- Apakah halaman Panduan/FAQ berisi teks statis, atau link ke URL eksternal?
- Apakah Video Tutorial link ke YouTube, atau embed video?

---

### 3.3 Tombol Navigasi Antar-Step

**Masalah saat ini:** Setelah save di satu step, mahasiswa harus balik ke daftar pasien
untuk pindah ke step berikutnya. Tidak ada tombol "Lanjut".

**Yang dibutuhkan:** Tombol **"Simpan & Lanjut →"** di bagian bawah setiap halaman step,
yang setelah save langsung navigasi ke step berikutnya.

**Alur navigasi:**
```
[1] Pengkajian  →  [2] Diagnosa  →  [3] Perencanaan  →  [4] Implementasi  →  [5] Evaluasi
```

**Catatan teknis:**
- `Pasien::nextAskepStep()` sudah ada di model — tinggal disambungkan ke tombol
- Tombol hanya aktif setelah data step tersebut tersimpan
- Tombol di step terakhir (Evaluasi) → "Selesai & Kembali ke Pasien"

---

### 3.4 Opsi "Normal" di Form Pengkajian

**Masalah saat ini:** Semua section pengkajian hanya punya textarea kosong.
Mengisi "kondisi normal" membutuhkan pengetikan manual yang berulang.

**Yang dibutuhkan:** Tombol preset **"Normal"** / **"Tidak ada kelainan"** / **"Tidak ada nyeri"**
di setiap section, sesuai konteks bagian tersebut.

**Mekanisme:**
- Klik tombol preset → textarea terisi otomatis dengan teks standar
- Teks bisa diedit setelah diisi
- Untuk Pemeriksaan Fisik (radio/checkbox): tombol "Normal" auto-centang semua nilai normal

**Contoh preset per section:**

| Section | Preset "Normal" |
|---|---|
| Riwayat Penyakit Sekarang | "Tidak ada keluhan utama saat ini" |
| Rasa Aman & Nyaman | "Tidak ada nyeri, pasien merasa nyaman, skala nyeri 0/10" |
| Istirahat & Tidur | "Tidur 7–8 jam/hari, tidak ada gangguan tidur" |
| Eliminasi | "BAB dan BAK normal, tidak ada gangguan" |
| Pernafasan (Fisik) | Irama: Reguler, Kedalaman: Normal, Frekuensi: 16–20x/mnt |
| Kardiovaskuler (Fisik) | Tekanan darah normal, nadi reguler, tidak ada edema |

**Perlu ditinjau:** Referensi website askep yang disebutkan untuk memastikan teks preset tepat.

---

### 3.5 Export PDF Askep

**Scope:** Tombol "Export PDF" di halaman detail askep yang sudah selesai.

**Library:** `barryvdh/laravel-dompdf` (perlu approval penambahan dependency)

**Isi dokumen PDF:**
1. Cover: nama pasien, No. RM, tanggal masuk, nama mahasiswa, institusi
2. Ringkasan data pasien (demografis, diagnosa medis)
3. Pengkajian (per section, 4 tab)
4. Diagnosa Keperawatan (SDKI yang dipilih + prioritas)
5. Perencanaan (SLKI + target kriteria hasil, SIKI + tindakan)
6. Implementasi (tindakan per shift)
7. Evaluasi (SOAP + hasil: Tercapai / Tercapai Sebagian / Belum Tercapai)

**Kondisi:** Tombol hanya muncul jika semua step sudah diisi.

---

## 4. Fase 2 — Core Askep

> Fitur-fitur utama yang membuat sistem berjalan sesuai rancangan penuh.

### 4.1 Status Askep

**Perubahan kolom `pasien.status_askep`:**

```
Sebelum : ENUM('draft', 'selesai')
Sesudah : ENUM('draft', 'menunggu_review', 'perlu_revisi', 'disetujui', 'selesai')
```

**Alur status:**
```
Draft
  └─[Submit ke Dosen]──► Menunggu Review
                              ├─[Dosen: Setujui]───► Disetujui
                              │                           └─[Evaluasi diisi]──► Selesai
                              └─[Dosen: Minta Revisi]──► Perlu Revisi
                                                              └─[Mahasiswa revisi & submit ulang]──► Menunggu Review
```

**Tampilan badge per status:**

| Status | Background | Teks |
|---|---|---|
| Draft | `#FEF5E4` | `#B7770D` |
| Menunggu Review | `#EBF5FB` | `#1B4F72` |
| Perlu Revisi | `#FDE8E8` | `#A32D2D` |
| Disetujui | `#E1F5EE` | `#0F6E56` |
| Selesai | `#0F6E56` | putih |

---

### 4.2 Langkah Implementasi (Step Baru)

**Saat ini:** Luaran dan Intervensi adalah step terpisah (step 3 dan 4).

**Target:** Merge menjadi "Perencanaan" (SLKI + SIKI dalam satu halaman),
dan tambah step baru "Implementasi" sebagai step ke-4.

**Alur step yang benar:**
```
[1] Pengkajian
[2] Diagnosa (SDKI)
[3] Perencanaan (SLKI + SIKI dalam satu halaman per diagnosa)
[4] Implementasi (tindakan yang sudah dilakukan)
[5] Evaluasi (SOAP + pencapaian luaran)
```

**Form Implementasi:**
- Pilih intervensi yang diimplementasikan (dari daftar SIKI yang sudah dipilih di step 3)
- Tanggal & jam pelaksanaan
- Shift: Pagi / Siang / Malam
- Catatan respons pasien
- Bisa input multiple tindakan per hari

**Tabel baru yang dibutuhkan:** `implementasi_pasien`
```
id, diagnosa_pasien_id, intervensi_id, tanggal, shift, catatan_respon, created_at
```

---

### 4.3 Role Dosen

**Perubahan database:**
- Tambah `'dosen'` ke ENUM `users.role`
- Tambah relasi tabel `penugasan` (mahasiswa ↔ dosen)

**Layout & akses dosen:**
- Layout sidebar terpisah (`layouts.dosen`)
- Dosen hanya lihat mahasiswa yang ditugaskan ke dirinya

**Modul dosen:**

| Modul | Deskripsi |
|---|---|
| Dashboard | Stat: mahasiswa bimbingan, askep menunggu review, revisi pending |
| Daftar Mahasiswa | Filter angkatan/kelas, klik → lihat profil & history |
| Review Askep | Baca isi askep, isi catatan, pilih: Setujui / Minta Revisi |
| Riwayat Review | Semua askep yang pernah direview, filter status |
| Monitoring | Progress per mahasiswa, statistik |

---

### 4.4 Sistem Submit & Feedback

**Alur dari sisi mahasiswa:**
1. Klik **"Submit ke Dosen"** di halaman askep (aktif jika semua step diisi)
2. Status berubah → `menunggu_review`
3. Mahasiswa tidak bisa edit selama menunggu review
4. Notifikasi masuk jika ada feedback dari dosen

**Alur dari sisi dosen:**
1. Dashboard menampilkan askep baru yang menunggu review
2. Buka askep → baca seluruh isi (pengkajian s/d evaluasi)
3. Isi catatan per bagian (opsional) + catatan umum
4. Pilih: **Setujui** atau **Minta Revisi**
5. Mahasiswa terima notifikasi + bisa lihat catatan

**Tabel baru yang dibutuhkan:** `feedback_askep`
```
id, pasien_id, dosen_id, catatan_umum, catatan_detail (JSON), status, created_at
```

---

### 4.5 Log Pembelajaran & Refleksi (Gibbs Cycle)

**Form refleksi 6 tahap:**

| Tahap | Pertanyaan |
|---|---|
| 1. Description | Apa yang terjadi selama praktik klinik? |
| 2. Feelings | Apa yang dipikirkan / dirasakan saat itu? |
| 3. Evaluation | Apa yang berjalan baik dan apa yang perlu diperbaiki? |
| 4. Analysis | Mengapa hal tersebut terjadi? |
| 5. Conclusion | Pelajaran utama apa yang didapatkan? |
| 6. Action Plan | Apa rencana tindak lanjut untuk shift berikutnya? |

**Data tambahan per entri:**
- Tanggal shift
- Jenis shift: Pagi / Siang / Malam
- Ruang / bangsal
- Konteks kasus / pasien (opsional)

**Tabel baru:** `log_pembelajaran`
```
id, user_id, tanggal_shift, shift, ruang, konteks_kasus,
description, feelings, evaluation, analysis, conclusion, action_plan,
created_at, updated_at
```

---

## 5. Fase 3 — Kelengkapan Data 3S

> Data yang harus dilengkapi agar fitur Perencanaan bisa berjalan penuh.

### 5.1 Data yang Kurang

**a. SDKI D.0074–D.0149 (76 diagnosa)**
- Perlu: `tipe_diagnosa`, `penyebab`, `gejala`, `kondisi_klinis`
- Sumber: file SQL/Excel dari buku SDKI resmi

**b. SLKI — Indikator & Kriteria Hasil**
- Perlu: tabel `slki_luaran_indikator` dengan kolom `label`, `skala_min`, `skala_max`
- Kolom `kriteria_hasil` di `luaran_slki` saat ini semua NULL
- Sumber: file SQL/Excel dari buku SLKI resmi

**c. SIKI — Tindakan Detail**
- Perlu: breakdown `tindakan` menjadi 4 jenis: Observasi, Terapeutik, Edukasi, Kolaborasi
- Saat ini kolom `tindakan` NULL di hampir semua baris
- Sumber: file SQL/Excel dari buku SIKI resmi

**d. Relasi SDKI↔SLKI↔SIKI**
- `sdki_slki_relations`: hanya 10 pasang → perlu ratusan
- `slki_siki_relations`: hanya 10 pasang → perlu ratusan
- Sumber: tabel mapping dari buku atau file yang tersedia

### 5.2 Halaman Master Data (Read-Only)

Halaman referensi mahasiswa untuk belajar mandiri:
- Tab: SDKI | SLKI | SIKI
- Pencarian berdasarkan kode / nama / kategori
- Detail per item: definisi, etiologi, gejala, indikator, tindakan
- Relasi terhubung: klik SDKI → lihat SLKI & SIKI terkait langsung

---

## 6. Fase 4 — Fitur Tambahan

> Dikerjakan setelah Fase 1–3 selesai.

| Fitur | Role | Keterangan |
|---|---|---|
| Penugasan mahasiswa → dosen | Admin | Assign mahasiswa ke dosen per angkatan/stase |
| Import user massal CSV/Excel | Admin | Upload daftar mahasiswa sekaligus |
| Pengaturan institusi | Admin | Kelola RS, bangsal, periode stase |
| Statistik & audit log | Admin | Grafik aktivitas, siapa mengubah apa |
| Notifikasi sistem | Semua | Notif feedback, status askep berubah |
| Registrasi mandiri mahasiswa | Mahasiswa | Opsional, tergantung kebijakan kampus |

---

## 7. Yang Perlu Disediakan

| Kebutuhan | Digunakan Untuk | Status |
|---|---|---|
| File logo Polsub (PNG/SVG) | Fase 1.1 — Logo di UI | ⏳ Menunggu |
| Konfirmasi struktur menu sidebar | Fase 1.2 — Menu Panduan/FAQ | ⏳ Menunggu |
| Link/screenshot referensi website askep | Fase 1.4 — Teks preset "Normal" | ⏳ Menunggu |
| File SQL/Excel SDKI D.0074–D.0149 | Fase 3.1 — Lengkapi detail diagnosa | ⏳ Menunggu |
| File SQL/Excel SLKI (indikator) | Fase 3.1 — Indikator + kriteria hasil | ⏳ Menunggu |
| File SQL/Excel SIKI (tindakan detail) | Fase 3.1 — Tindakan obs/terapi/edukasi | ⏳ Menunggu |
| File mapping relasi SDKI↔SLKI↔SIKI | Fase 3.1 — Relasi rekomendasi otomatis | ⏳ Menunggu |
| Approval penambahan dependency `dompdf` | Fase 1.5 — Export PDF | ⏳ Menunggu |

---

## Urutan Eksekusi

```
[Sekarang]  Tunggu konfirmasi dari user (logo, menu, referensi website askep)
     │
     ▼
[Fase 1]    Revisi dosen: logo, menu, navigasi antar-step, preset Normal, export PDF
     │
     ▼
[Fase 2]    Core: status askep, step Implementasi, role Dosen, submit & feedback, log pembelajaran
     │
     ▼
[Fase 3]    Lengkapi data 3S (tergantung ketersediaan file data)
     │
     ▼
[Fase 4]    Fitur tambahan: penugasan, import massal, notifikasi, monitoring
```

---

*Terakhir diperbarui: Juni 2026*
*Berdasarkan: review dosen, DIGIKEP-RANCANGAN.md, dan kondisi database aktual*
