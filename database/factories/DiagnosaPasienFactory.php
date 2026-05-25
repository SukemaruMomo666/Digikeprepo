<?php

namespace Database\Factories;

use App\Models\DiagnosaPasien;
use App\Models\DiagnosaSdki;
use App\Models\Pasien;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<DiagnosaPasien>
 */
class DiagnosaPasienFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'pasien_id' => Pasien::factory(),
            'diagnosa_id' => DiagnosaSdki::factory(),
            'data_subjektif' => fake()->sentence(),
            'data_objektif' => fake()->sentence(),
        ];
    }
}
