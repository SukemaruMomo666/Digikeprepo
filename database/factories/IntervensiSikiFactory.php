<?php

namespace Database\Factories;

use App\Models\IntervensiSiki;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<IntervensiSiki>
 */
class IntervensiSikiFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        static $counter = 0;
        $counter++;

        return [
            'kode_intervensi' => 'I.'.$counter,
            'label_intervensi' => fake()->sentence(3),
            'definisi' => fake()->paragraph(),
            'tindakan' => fake()->paragraph(),
        ];
    }
}
