<?php

namespace Database\Factories;

use App\Models\Pasien;
use App\Models\Pengkajian;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Pengkajian>
 */
class PengkajianFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'pasien_id' => Pasien::factory(),
            'pola_kesehatan' => fake()->randomElement(array_keys(Pengkajian::labelPola())),
            'observasi' => fake()->sentence(),
            'data' => null,
            'is_abnormal' => false,
            'tipe_data' => fake()->randomElement(['DS', 'DO']),
        ];
    }
}
