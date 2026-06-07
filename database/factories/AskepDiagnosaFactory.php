<?php

namespace Database\Factories;

use App\Models\Askep;
use App\Models\AskepDiagnosa;
use App\Models\DiagnosaSdki;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<AskepDiagnosa>
 */
class AskepDiagnosaFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'askep_id' => Askep::factory(),
            'sdki_id' => DiagnosaSdki::inRandomOrder()->first()?->id ?? DiagnosaSdki::factory(),
            'prioritas' => fake()->numberBetween(1, 5),
            'etiologi_dipilih' => null,
            'gejala_dipilih' => null,
        ];
    }
}
