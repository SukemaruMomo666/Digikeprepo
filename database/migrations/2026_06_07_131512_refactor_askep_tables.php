<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * Fase 0 — Refactor struktur database askep.
 *
 * Hapus: pengkajian, diagnosa_pasien, luaran_pasien, intervensi_pasien, evaluasi_pasien
 * Update: pasien (hapus status_askep, tambah 9 kolom baru)
 * Buat: askep, askep_pengkajian, askep_diagnosa, askep_diagnosa_luaran,
 *        askep_intervensi, askep_implementasi, askep_evaluasi
 */
return new class extends Migration
{
    public function up(): void
    {
        // ── 1. Hapus tabel lama (urutan FK: child dulu) ──────────────────────
        Schema::disableForeignKeyConstraints();

        Schema::dropIfExists('evaluasi_pasien');
        Schema::dropIfExists('intervensi_pasien');
        Schema::dropIfExists('luaran_pasien');
        Schema::dropIfExists('diagnosa_pasien');
        Schema::dropIfExists('pengkajian');

        Schema::enableForeignKeyConstraints();

        // ── 2. Update tabel pasien ────────────────────────────────────────────
        Schema::table('pasien', function (Blueprint $table) {
            $table->dropColumn('status_askep');

            $table->date('tanggal_lahir')->nullable()->after('umur');
            $table->string('agama', 50)->nullable()->after('tanggal_lahir');
            $table->string('status_perkawinan', 30)->nullable()->after('agama');
            $table->string('pekerjaan', 100)->nullable()->after('status_perkawinan');
            $table->string('pendidikan', 50)->nullable()->after('pekerjaan');
            $table->text('alamat')->nullable()->after('pendidikan');
            $table->string('diagnosa_medis')->nullable()->after('alamat');
            $table->decimal('bb', 5, 2)->nullable()->after('diagnosa_medis');
            $table->unsignedSmallInteger('tb')->nullable()->after('bb');
        });

        // ── 3. Buat tabel askep ───────────────────────────────────────────────
        Schema::create('askep', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pasien_id')->constrained('pasien')->cascadeOnDelete();
            $table->foreignId('user_id')->constrained('users');
            $table->enum('status', [
                'draft',
                'menunggu_review',
                'perlu_revisi',
                'disetujui',
                'selesai',
            ])->default('draft');
            $table->unsignedTinyInteger('step_terakhir')->default(1);
            $table->text('catatan_dosen')->nullable();
            $table->timestamp('submitted_at')->nullable();
            $table->timestamp('reviewed_at')->nullable();
            $table->timestamps();
        });

        // ── 4. Buat tabel askep_pengkajian ────────────────────────────────────
        Schema::create('askep_pengkajian', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_id')->unique()->constrained('askep')->cascadeOnDelete();

            // Identitas penanggung jawab
            $table->string('pj_nama')->nullable();
            $table->unsignedTinyInteger('pj_umur')->nullable();
            $table->string('pj_pendidikan', 100)->nullable();
            $table->string('pj_pekerjaan', 100)->nullable();
            $table->text('pj_alamat')->nullable();

            // EWS / Tanda Vital
            $table->string('ews_td', 20)->nullable();
            $table->unsignedTinyInteger('ews_nadi')->nullable();
            $table->unsignedTinyInteger('ews_rr')->nullable();
            $table->decimal('ews_suhu', 4, 1)->nullable();
            $table->unsignedTinyInteger('ews_spo2')->nullable();
            $table->string('ews_kesadaran', 20)->nullable();
            $table->unsignedTinyInteger('ews_skor')->nullable();

            // Anthropometri
            $table->decimal('bb', 5, 2)->nullable();
            $table->unsignedSmallInteger('tb')->nullable();

            // Riwayat Penyakit
            $table->json('riwayat_sekarang')->nullable();
            $table->json('riwayat_lalu')->nullable();
            $table->json('riwayat_keluarga')->nullable();

            // Pengkajian Biologis
            $table->json('biologis_nyeri')->nullable();
            $table->json('biologis_aktivitas')->nullable();
            $table->json('biologis_istirahat')->nullable();
            $table->json('biologis_tidur')->nullable();
            $table->json('biologis_cairan')->nullable();
            $table->json('biologis_nutrisi')->nullable();
            $table->json('biologis_eliminasi_feses')->nullable();
            $table->json('biologis_eliminasi_urine')->nullable();
            $table->json('biologis_oksigenasi')->nullable();
            $table->json('biologis_kardiovaskuler')->nullable();
            $table->json('biologis_hygiene')->nullable();
            $table->json('biologis_seksualitas')->nullable();

            // Psikososial & Spiritual
            $table->json('psiko_emosi')->nullable();
            $table->json('psiko_konsep_diri')->nullable();
            $table->json('psiko_sosial')->nullable();
            $table->json('psiko_spiritual')->nullable();

            // Pemeriksaan Fisik
            $table->text('fisik_umum')->nullable();
            $table->json('fisik_penglihatan')->nullable();
            $table->json('fisik_pendengaran')->nullable();
            $table->json('fisik_wicara')->nullable();
            $table->json('fisik_pernapasan')->nullable();
            $table->json('fisik_kardiovaskuler')->nullable();
            $table->json('fisik_hematologi')->nullable();
            $table->json('fisik_saraf')->nullable();
            $table->json('fisik_pencernaan')->nullable();
            $table->json('fisik_endokrin')->nullable();
            $table->json('fisik_urogenital')->nullable();
            $table->json('fisik_integumen')->nullable();
            $table->json('fisik_muskuloskeletal')->nullable();
            $table->json('fisik_imun')->nullable();

            $table->timestamps();
        });

        // ── 5. Buat tabel askep_diagnosa ──────────────────────────────────────
        Schema::create('askep_diagnosa', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_id')->constrained('askep')->cascadeOnDelete();
            $table->foreignId('sdki_id')->constrained('diagnosa_sdki');
            $table->unsignedTinyInteger('prioritas')->default(1);
            $table->json('etiologi_dipilih')->nullable();
            $table->json('gejala_dipilih')->nullable();
            $table->timestamps();
        });

        // ── 6. Buat tabel askep_diagnosa_luaran (Step 3 — SLKI) ──────────────
        Schema::create('askep_diagnosa_luaran', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_diagnosa_id')->constrained('askep_diagnosa')->cascadeOnDelete();
            $table->foreignId('slki_id')->constrained('luaran_slki');
            $table->string('target_waktu', 50)->nullable();
            $table->timestamps();
        });

        // ── 7. Buat tabel askep_intervensi (Step 3 — SIKI) ───────────────────
        Schema::create('askep_intervensi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_diagnosa_id')->constrained('askep_diagnosa')->cascadeOnDelete();
            $table->foreignId('siki_id')->nullable()->constrained('intervensi_siki')->nullOnDelete();
            $table->string('nama_manual')->nullable();
            $table->string('frekuensi', 50)->nullable();
            $table->json('tindakan_dipilih')->nullable();
            $table->boolean('is_included')->default(true);
            $table->timestamps();
        });

        // ── 8. Buat tabel askep_implementasi (Step 4) ─────────────────────────
        Schema::create('askep_implementasi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_intervensi_id')->constrained('askep_intervensi')->cascadeOnDelete();
            $table->date('tanggal');
            $table->time('waktu');
            $table->enum('shift', ['Pagi', 'Siang', 'Malam']);
            $table->unsignedSmallInteger('durasi_menit')->nullable();
            $table->json('tindakan_dilakukan')->nullable();
            $table->unsignedTinyInteger('spo2_sebelum')->nullable();
            $table->unsignedTinyInteger('spo2_setelah')->nullable();
            $table->text('catatan')->nullable();
            $table->enum('respons_pasien', ['Positif', 'Netral', 'Negatif'])->nullable();
        });

        // ── 9. Buat tabel askep_evaluasi (Step 5) ─────────────────────────────
        Schema::create('askep_evaluasi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('askep_diagnosa_id')->constrained('askep_diagnosa')->cascadeOnDelete();
            $table->date('tanggal');
            $table->time('jam');
            $table->unsignedTinyInteger('hari_ke')->nullable();
            $table->text('komplikasi')->nullable();
            $table->text('catatan_soap')->nullable();
            $table->string('tv_td', 20)->nullable();
            $table->unsignedTinyInteger('tv_rr')->nullable();
            $table->unsignedTinyInteger('tv_nadi')->nullable();
            $table->unsignedTinyInteger('tv_spo2')->nullable();
            $table->decimal('tv_suhu', 4, 1)->nullable();
            $table->json('skor_indikator')->nullable();
            $table->enum('analisis', ['Tercapai', 'Membaik', 'Belum Tercapai'])->nullable();
            $table->text('analisis_narasi')->nullable();
            $table->enum('tindak_lanjut', ['Lanjutkan', 'Hentikan', 'Modifikasi', 'Rujuk'])->nullable();
            $table->string('penanggung_jawab')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::disableForeignKeyConstraints();

        Schema::dropIfExists('askep_evaluasi');
        Schema::dropIfExists('askep_implementasi');
        Schema::dropIfExists('askep_intervensi');
        Schema::dropIfExists('askep_diagnosa_luaran');
        Schema::dropIfExists('askep_diagnosa');
        Schema::dropIfExists('askep_pengkajian');
        Schema::dropIfExists('askep');

        Schema::table('pasien', function (Blueprint $table) {
            $table->dropColumn([
                'tanggal_lahir', 'agama', 'status_perkawinan',
                'pekerjaan', 'pendidikan', 'alamat',
                'diagnosa_medis', 'bb', 'tb',
            ]);
            $table->enum('status_askep', ['draft', 'selesai'])->default('draft');
        });

        Schema::enableForeignKeyConstraints();
    }
};
