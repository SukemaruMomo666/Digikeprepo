<?php

namespace Database\Factories;

use App\Models\DiagnosaSdki;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<DiagnosaSdki>
 */
class DiagnosaSdkiFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        static $counter = 0;
        $counter++;

        return [
            'kode_diagnosa' => 'D.'.$counter,
            'label_diagnosa' => fake()->sentence(3),
            'definisi' => fake()->paragraph(),
        ];
    }
}
