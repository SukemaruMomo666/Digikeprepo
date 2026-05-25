<?php

namespace Database\Factories;

use App\Models\DiagnosaPasien;
use App\Models\LuaranPasien;
use App\Models\LuaranSlki;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<LuaranPasien>
 */
class LuaranPasienFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'diagnosa_pasien_id' => DiagnosaPasien::factory(),
            'luaran_id' => LuaranSlki::factory(),
        ];
    }
}
