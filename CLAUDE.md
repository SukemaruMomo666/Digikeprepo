# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**DigiKep** is a digital nursing care documentation (Asuhan Keperawatan) app for nursing students at Politeknik Negeri Subang. It guides students through a structured 5-step workflow using Indonesian nursing standards: **SDKI** (diagnoses), **SLKI** (outcomes), **SIKI** (interventions).

Three roles: `mahasiswa` (students), `dosen` (instructors), `admin`.

## Commands

```bash
# Start all dev services (server + queue + Vite)
composer run dev

# Run tests
php artisan test --compact
php artisan test --compact --filter=TestName

# Format PHP after changes (required before finalizing)
vendor/bin/pint --dirty --format agent

# Reset database with seed data
php artisan migrate:fresh --seed

# List routes
php artisan route:list --except-vendor
```

**Default seed accounts**: `admin` / `password`, `231010001` / `231010001` (mahasiswa, forced password change on first login).

## Architecture

### Livewire SFC Pattern

All Livewire components are **Single File Components** colocated in `resources/views/pages/` — there are no separate PHP component classes in `app/Livewire/` (except `app/Livewire/Actions/Logout.php`). Blade files in `pages/` contain both the `@php` component logic and the template.

### 5-Step Askep Workflow

The core feature is a resumable 5-step care plan:

1. **Pengkajian** (`askep_pengkajian`) — 32-section patient assessment across 4 tabs; most data stored as JSON columns
2. **Diagnosa** (`askep_diagnosa`) — Select from 149 SDKI master diagnoses with priority ranking
3. **Perencanaan** (`askep_diagnosa_luaran` + `askep_intervensi`) — Map SLKI outcomes to diagnoses, then SIKI interventions to outcomes
4. **Implementasi** (`askep_implementasi`) — Log interventions performed (date, shift, notes)
5. **Evaluasi** (`askep_evaluasi`) — SOAP notes, vitals, outcome assessment (Tercapai/Membaik/Belum Tercapai)

Each step saves independently so students can resume. Status flow: `draft → menunggu_review → perlu_revisi|disetujui → selesai`.

### Key Models

- `Askep` — owns the whole workflow; has status constants and step-tracking helpers
- `AskepPengkajian` — assessment data (heavy use of JSON columns for flexibility)
- `DiagnosaSdki` / `LuaranSlki` / `IntervensiSiki` — master reference data (149/110/73 entries)
- `User` — has `role`, `nim_nip`, `is_first_login` flag
- `Penugasan` — links dosen to mahasiswa for supervision
- `RiwayatPasien` — activity log driven by `PasienObserver`

### Routing

All routes in `routes/web.php`, grouped by role middleware (`role:mahasiswa`, `role:admin`, `role:dosen`). Named routes use dot notation: `mahasiswa.askep.pengkajian`, `admin.sdki.index`, etc.

### Relationships Between Master Data

`sdki_slki_relations` and `slki_siki_relations` pivot tables control which outcomes are valid for a diagnosis and which interventions are valid for an outcome. Admin manages these mappings via the Relasi page.

### Authentication

Laravel Fortify handles auth. `LoginResponse` redirects by role. `EnsureRole` middleware gates routes. First-login password change is enforced via dedicated middleware redirect to `change-password` route.

### PDF Export

`AskepPdfController` renders `resources/views/pdf/askep.blade.php` for download.

## Key Conventions

- Views in `resources/views/pages/{role}/` mirror route structure
- Layouts: `layouts/mahasiswa.blade.php`, `layouts/admin.blade.php`, `layouts/dosen.blade.php`
- JSON columns used extensively in `askep_pengkajian` for assessment sections
- Factories and seeders required for any new model
- Feature tests (Pest) required for every change
