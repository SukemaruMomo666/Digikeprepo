<?php

namespace Database\Factories;

use App\Models\IntervensiPasien;
use App\Models\IntervensiSiki;
use App\Models\LuaranPasien;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<IntervensiPasien>
 */
class IntervensiPasienFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'luaran_pasien_id' => LuaranPasien::factory(),
            'intervensi_id' => IntervensiSiki::factory(),
        ];
    }
}
