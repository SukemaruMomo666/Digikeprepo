<?php

use App\Models\DiagnosaSdki;
use App\Models\IntervensiSiki;
use App\Models\LuaranSlki;
use App\Models\User;
use Livewire\Livewire;

// ── Akses Kontrol ──────────────────────────────────────────────────────────────

test('guest diarahkan ke login ketika akses admin', function () {
    $this->get(route('admin.dashboard'))->assertRedirect(route('login'));
});

test('mahasiswa tidak bisa akses halaman admin', function () {
    $mahasiswa = User::factory()->mahasiswa()->create(['is_first_login' => false]);

    foreach (['admin.dashboard', 'admin.users.index', 'admin.sdki.index', 'admin.slki.index', 'admin.siki.index', 'admin.relasi.index', 'admin.log.index', 'admin.data-mahasiswa.index'] as $route) {
        $this->actingAs($mahasiswa)->get(route($route))->assertForbidden();
    }
});

test('admin bisa mengakses semua halaman admin', function () {
    $admin = User::factory()->admin()->create();

    foreach (['admin.dashboard', 'admin.users.index', 'admin.sdki.index', 'admin.slki.index', 'admin.siki.index', 'admin.relasi.index', 'admin.log.index', 'admin.data-mahasiswa.index'] as $route) {
        $this->actingAs($admin)->get(route($route))->assertOk();
    }
});

// ── Kelola Mahasiswa ───────────────────────────────────────────────────────────

test('admin bisa menambah akun mahasiswa baru', function () {
    $admin = User::factory()->admin()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.users.index')
        ->call('openCreate')
        ->set('name', 'Rina Sari')
        ->set('nim_nip', '231010099')
        ->call('saveUser');

    $this->assertDatabaseHas('users', [
        'nim_nip' => '231010099',
        'name' => 'Rina Sari',
        'role' => 'mahasiswa',
    ]);
});

test('admin bisa mengedit data mahasiswa', function () {
    $admin = User::factory()->admin()->create();
    $mahasiswa = User::factory()->mahasiswa()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.users.index')
        ->call('openEdit', $mahasiswa->id)
        ->set('name', 'Nama Baru')
        ->call('saveUser');

    $this->assertDatabaseHas('users', [
        'id' => $mahasiswa->id,
        'name' => 'Nama Baru',
    ]);
});

test('admin bisa reset password mahasiswa', function () {
    $admin = User::factory()->admin()->create();
    $mahasiswa = User::factory()->mahasiswa()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.users.index')
        ->call('openReset', $mahasiswa->id)
        ->set('resetPassword', 'newpassword123')
        ->call('resetPassword');

    $fresh = $mahasiswa->fresh();
    expect($fresh->is_first_login)->toBeTrue();
});

test('admin bisa hapus akun mahasiswa', function () {
    $admin = User::factory()->admin()->create();
    $mahasiswa = User::factory()->mahasiswa()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.users.index')
        ->call('hapus', $mahasiswa->id);

    $this->assertDatabaseMissing('users', ['id' => $mahasiswa->id]);
});

test('admin tidak bisa hapus akun admin lain', function () {
    $admin = User::factory()->admin()->create();
    $admin2 = User::factory()->admin()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.users.index')
        ->call('hapus', $admin2->id)
        ->assertForbidden();
});

// ── Diagnosa SDKI ─────────────────────────────────────────────────────────────

test('admin bisa menambah diagnosa SDKI', function () {
    $admin = User::factory()->admin()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.sdki.index')
        ->call('openCreate')
        ->set('kode_diagnosa', 'D.9999')
        ->set('label_diagnosa', 'Diagnosa Test')
        ->set('definisi', 'Definisi test.')
        ->call('save');

    $this->assertDatabaseHas('diagnosa_sdki', [
        'kode_diagnosa' => 'D.9999',
        'label_diagnosa' => 'Diagnosa Test',
    ]);
});

test('admin bisa mengedit diagnosa SDKI', function () {
    $admin = User::factory()->admin()->create();
    $diagnosa = DiagnosaSdki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.sdki.index')
        ->call('openEdit', $diagnosa->id)
        ->set('label_diagnosa', 'Label Diperbarui')
        ->call('save');

    $this->assertDatabaseHas('diagnosa_sdki', [
        'id' => $diagnosa->id,
        'label_diagnosa' => 'Label Diperbarui',
    ]);
});

test('admin bisa hapus diagnosa SDKI', function () {
    $admin = User::factory()->admin()->create();
    $diagnosa = DiagnosaSdki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.sdki.index')
        ->call('hapus', $diagnosa->id);

    $this->assertSoftDeleted('diagnosa_sdki', ['id' => $diagnosa->id]);
});

// ── Luaran SLKI ───────────────────────────────────────────────────────────────

test('admin bisa menambah luaran SLKI', function () {
    $admin = User::factory()->admin()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.slki.index')
        ->call('openCreate')
        ->set('kode_luaran', 'L.9999')
        ->set('label_luaran', 'Luaran Test')
        ->call('save');

    $this->assertDatabaseHas('luaran_slki', ['kode_luaran' => 'L.9999']);
});

test('admin bisa hapus luaran SLKI', function () {
    $admin = User::factory()->admin()->create();
    $luaran = LuaranSlki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.slki.index')
        ->call('hapus', $luaran->id);

    $this->assertSoftDeleted('luaran_slki', ['id' => $luaran->id]);
});

// ── Intervensi SIKI ───────────────────────────────────────────────────────────

test('admin bisa menambah intervensi SIKI', function () {
    $admin = User::factory()->admin()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.siki.index')
        ->call('openCreate')
        ->set('kode_intervensi', 'I.9999')
        ->set('label_intervensi', 'Intervensi Test')
        ->call('save');

    $this->assertDatabaseHas('intervensi_siki', ['kode_intervensi' => 'I.9999']);
});

test('admin bisa hapus intervensi SIKI', function () {
    $admin = User::factory()->admin()->create();
    $intervensi = IntervensiSiki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.siki.index')
        ->call('hapus', $intervensi->id);

    $this->assertSoftDeleted('intervensi_siki', ['id' => $intervensi->id]);
});

// ── Relasi ────────────────────────────────────────────────────────────────────

test('admin bisa menyimpan relasi SDKI ke SLKI', function () {
    $admin = User::factory()->admin()->create();
    $diagnosa = DiagnosaSdki::factory()->create();
    $luaran1 = LuaranSlki::factory()->create();
    $luaran2 = LuaranSlki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.relasi.index')
        ->call('selectSdki', $diagnosa->id)
        ->set('selectedSlkiIds', [(string) $luaran1->id, (string) $luaran2->id])
        ->call('saveRelasiSdkiSlki');

    $this->assertDatabaseHas('sdki_slki_relations', [
        'diagnosa_id' => $diagnosa->id,
        'luaran_id' => $luaran1->id,
    ]);
    $this->assertDatabaseHas('sdki_slki_relations', [
        'diagnosa_id' => $diagnosa->id,
        'luaran_id' => $luaran2->id,
    ]);
});

test('admin bisa menyimpan relasi SLKI ke SIKI', function () {
    $admin = User::factory()->admin()->create();
    $luaran = LuaranSlki::factory()->create();
    $intervensi1 = IntervensiSiki::factory()->create();
    $intervensi2 = IntervensiSiki::factory()->create();

    Livewire::actingAs($admin)
        ->test('pages::admin.relasi.index')
        ->call('selectSlki', $luaran->id)
        ->set('selectedSikiIds', [(string) $intervensi1->id, (string) $intervensi2->id])
        ->call('saveRelasiSlkiSiki');

    $this->assertDatabaseHas('slki_siki_relations', [
        'luaran_id' => $luaran->id,
        'intervensi_id' => $intervensi1->id,
    ]);
});
