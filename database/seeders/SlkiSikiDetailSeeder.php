<?php

namespace Database\Seeders;

use App\Models\LuaranSlki;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class SlkiSikiDetailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->seedSlkiKriteria();
        $this->seedSikiMaster();
        $this->seedSikiTindakan();
    }

    private function seedSikiMaster(): void
    {
        $filePath = database_path('seeders/data/siki_data_master_i08233_i12376 (2).sql');

        if (! File::exists($filePath)) {
            return;
        }

        $sql = File::get($filePath);

        // Menangkap master SIKI: ('I.08233', 'Aromaterapi', 'Fisiologis', 'Nyeri dan Kenyamanan', 'Memberikan minyak...')
        preg_match_all("/\('(.*?)',\s*'(.*?)',\s*'(.*?)',\s*'(.*?)',\s*'(.*?)'\)/", $sql, $matches, PREG_SET_ORDER);

        if (empty($matches)) {
            return;
        }

        $count = 0;
        foreach ($matches as $match) {
            $kode = $match[1];
            $label = $match[2];

            if (empty($kode) || $kode === 'NULL') {
                continue;
            }

            \App\Models\IntervensiSiki::withTrashed()->updateOrCreate(
                ['kode_intervensi' => $kode],
                ['label_intervensi' => $label, 'deleted_at' => null]
            );
            $count++;
        }

        $this->command->info("Berhasil mengimpor/memperbarui $count master SIKI dari file eksternal.");
    }

    private function seedSikiTindakan(): void
    {
        $filePath = database_path('seeders/data/siki_data_master_i08233_i12376 (2).sql');

        if (! File::exists($filePath)) {
            $this->command->warn("File siki_data_master... tidak ditemukan di $filePath");
            return;
        }

        $sql = File::get($filePath);

        // Cari INSERT INTO siki_tindakan ... VALUES ...
        // Menggunakan regex untuk menangkap: kode_intervensi, jenis, urutan, deskripsi
        preg_match_all("/\(\(SELECT id FROM siki WHERE kode_intervensi='(.*?)'\),\s*'(.*?)',\s*(\d+),\s*'(.*?)'\)/", $sql, $matches, PREG_SET_ORDER);

        if (empty($matches)) {
            $this->command->warn("Tidak ada data tindakan yang cocok ditemukan di file SIKI.");
            return;
        }

        $this->command->info("Memproses " . count($matches) . " tindakan SIKI...");

        $sikiMap = \App\Models\IntervensiSiki::pluck('id', 'kode_intervensi')->toArray();
        
        $dataToInsert = [];
        $batchSize = 500;
        $count = 0;

        DB::table('siki_tindakan')->truncate();

        foreach ($matches as $match) {
            $kode = $match[1];
            $jenis = $match[2];
            $urutan = (int)$match[3];
            // Bersihkan escape quote jika ada
            $deskripsi = str_replace("''", "'", $match[4]); 

            if (isset($sikiMap[$kode])) {
                $dataToInsert[] = [
                    'intervensi_id' => $sikiMap[$kode],
                    'jenis' => $jenis,
                    'urutan' => $urutan,
                    'deskripsi' => $deskripsi,
                ];
                $count++;
            }

            if (count($dataToInsert) >= $batchSize) {
                DB::table('siki_tindakan')->insert($dataToInsert);
                $dataToInsert = [];
            }
        }

        if (!empty($dataToInsert)) {
            DB::table('siki_tindakan')->insert($dataToInsert);
        }

        $this->command->info("Berhasil mengimpor $count tindakan SIKI.");
    }

    private function seedSlkiKriteria(): void
    {
        $filePath = database_path('seeders/data/data_slki.sql');

        if (! File::exists($filePath)) {
            $this->command->warn("File data_slki.sql tidak ditemukan di $filePath");
            return;
        }

        $sql = File::get($filePath);

        // Ambil semua baris values (format: ('id', 'kode', 'deskripsi', 'arah'))
        // Menggunakan regex untuk menangkap baris-baris value
        preg_match_all("/\('(.*?)', '(.*?)', '(.*?)', '(.*?)'\)/", $sql, $matches, PREG_SET_ORDER);

        if (empty($matches)) {
            $this->command->warn("Tidak ada data yang cocok ditemukan di data_slki.sql");
            return;
        }

        $this->command->info("Memproses " . count($matches) . " kriteria hasil SLKI...");

        // Mapping kode_luaran ke ID
        $luaranMap = LuaranSlki::pluck('id', 'kode_luaran')->toArray();
        
        $dataToInsert = [];
        $batchSize = 500;
        $count = 0;

        DB::table('slki_kriteria_hasil')->truncate();

        foreach ($matches as $match) {
            $kode = $match[2];
            $deskripsi = $match[3];
            $arah = $match[4];

            if (isset($luaranMap[$kode])) {
                $dataToInsert[] = [
                    'luaran_id' => $luaranMap[$kode],
                    'deskripsi' => $deskripsi,
                    'arah' => $arah,
                    'urutan' => 0, // Default urutan
                ];
                $count++;
            }

            if (count($dataToInsert) >= $batchSize) {
                DB::table('slki_kriteria_hasil')->insert($dataToInsert);
                $dataToInsert = [];
            }
        }

        if (!empty($dataToInsert)) {
            DB::table('slki_kriteria_hasil')->insert($dataToInsert);
        }

        $this->command->info("Berhasil mengimpor $count kriteria hasil SLKI.");
    }
}
