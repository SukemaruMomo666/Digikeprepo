# DigiKep — Rencana Pengembangan & Progress Report

> Dokumen ini adalah acuan teknis pengerjaan DigiKep ke depan.
> Berdasarkan: review dosen, `spesifikasi_alur_askep_digikep.md`, `DIGIKEP-RANCANGAN.md`, dan kondisi database aktual per Juni 2026.

---

## Ringkasan Status Proyek (Juni 2026)

| Fase | Deskripsi | Status | Keterangan |
|---|---|---|---|
| **Fase 0** | Refactor Database | ✅ Selesai | Tabel baru & model sudah siap. |
| **Fase 1** | Revisi Dosen | ⏳ Progres | Logo ada, Menu siap, PDF Export Aktif. |
| **Fase 2** | Rebuild Modul Askep | ✅ Selesai | Step 1-5 sudah berfungsi penuh. |
| **Fase 3** | Role Dosen & Feedback | ✅ Selesai | Dashboard & review dosen sudah aktif. |
| **Fase 4** | Fitur Tambahan | ❌ Belum | Import user, Statistik, Notifikasi. |
| **Fase 7** | Kelengkapan Data 3S | ⚠️ Kritis | Relasi SDKI-SLKI-SIKI masih minim (10 relasi). |

---

## 1. Keputusan Arsitektur

| # | Keputusan | Detail | Status |
|---|---|---|---|
| 1 | **Full refactor** | Semua tabel askep lama dihapus, dibangun ulang | ✅ |
| 2 | **Tabel `pasien` diperluas** | Tambah 8 kolom baru, hapus `status_askep` | ✅ |
| 3 | **Nama tabel 3S tetap** | `diagnosa_sdki`, `luaran_slki`, `intervensi_siki` | ✅ |
| 4 | **SLKI di step 3** | Step 3 = Perencanaan (SLKI + SIKI) | ✅ |
| 5 | **Rekomendasi diagnosa** | Filter + search saja (MVP) | ✅ |
| 6 | **JSON Storage** | Pengkajian & Biologis disimpan dalam format JSON | ✅ |

---

## 2. Progress Checklist Detail

### 2.1 Fase 0 — Refactor Database (100%)
- [x] Migrasi tabel baru: `askep`, `askep_pengkajian`, `askep_diagnosa`, dsb.
- [x] Update tabel `pasien` dengan kolom identitas lengkap.
- [x] Implementasi 8 Model Eloquent baru (`Askep`, `AskepPengkajian`, dll).
- [x] Hapus model-model lama yang redundan.

### 2.2 Fase 1 — Revisi Dosen & UI (80%)
- [x] Pasang Logo Polsub (`logo-polsub.png`).
- [x] Sidebar menu baru (Utama & Bantuan).
- [x] Tombol navigasi antar-step ("Simpan & Lanjut").
- [x] Opsi "Set Normal" di Pengkajian (Preset data).
- [x] **Export PDF:** Implementasi `barryvdh/laravel-dompdf` dengan template profesional.
- [ ] Konten halaman Panduan, Video Tutorial, dan FAQ (masih placeholder).

### 2.3 Fase 2 — Rebuild Modul Askep (100%)
- [x] **Step 1 (Pengkajian):** Form 5 tab, hitung EWS otomatis, preset normal.
- [x] **Step 2 (Diagnosa):** Pemilihan SDKI, etiologi, dan gejala.
- [x] **Step 3 (Perencanaan):** Pemilihan SLKI (luaran) & SIKI (intervensi).
- [x] **Step 4 (Implementasi):** Log tindakan per shift.
- [x] **Step 5 (Evaluasi):** SOAP, Scoring SLKI, dan submit ke dosen.
- [x] **Laporan (Detail):** Tampilan ringkasan lengkap 5 tahapan untuk mahasiswa.

### 2.4 Fase 3 — Role Dosen & Feedback (100%)
- [x] Role `dosen` di tabel `users`.
- [x] Dashboard Dosen (Daftar mahasiswa & Askep masuk).
- [x] Modul Review Askep (Read-only view + Form Feedback).
- [x] Sistem Alur Submit -> Review -> Disetujui/Revisi.

---

## 3. Rencana Kerja Selanjutnya (Prioritas)

### 3.1 Kelengkapan Data 3S (Prioritas Utama)
- [ ] Melengkapi detail SDKI (D.0074 s/d D.0149).
- [ ] Mengisi konten Indikator SLKI dan Tindakan SIKI.
- [ ] **Mapping Relasi:** Menghubungkan SDKI ↔ SLKI ↔ SIKI secara lengkap (saat ini baru 10 sample).
- [ ] Update Seeder Master Data.

### 3.2 Fase 4 — Fitur Tambahan & Admin
- [ ] **Import User Massal:** Upload CSV/Excel untuk pendaftaran mahasiswa.
- [ ] **Manajemen Penugasan:** UI Admin untuk memetakan Mahasiswa ke Dosen Pembimbing.
- [ ] **Log Pembelajaran:** UI untuk modul refleksi harian (Gibbs Cycle).
- [ ] **Notifikasi:** Alert/Badge saat ada feedback revisi masuk.
- [ ] **Statistik:** Grafik perkembangan mahasiswa dan tren diagnosa.

### 3.3 Pembersihan & Polishing
- [ ] Mengisi konten Bantuan (Panduan/FAQ) dengan teks resmi prodi.
- [ ] Validasi input yang lebih ketat pada form Pengkajian.
- [ ] Optimalisasi performa loading pada form Diagnosa/Perencanaan.

---

## 4. Arsitektur Database Terkini

```
askep (status: draft, menunggu_review, perlu_revisi, disetujui, selesai)
  ├── askep_pengkajian (JSON storage)
  └── askep_diagnosa
        ├── askep_diagnosa_luaran (SLKI + Target Skor)
        ├── askep_intervensi (SIKI + Tindakan)
        │     └── askep_implementasi (Log per shift)
        └── askep_evaluasi (SOAP + Skor Akhir)
```

---

*Terakhir diperbarui: Selasa, 9 Juni 2026*
*Oleh: Gemini CLI Agent*
