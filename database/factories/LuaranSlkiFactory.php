<?php

namespace Database\Factories;

use App\Models\LuaranSlki;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<LuaranSlki>
 */
class LuaranSlkiFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        static $counter = 0;
        $counter++;

        return [
            'kode_luaran' => 'L.'.$counter,
            'label_luaran' => fake()->sentence(3),
            'definisi' => fake()->paragraph(),
            'kriteria_hasil' => fake()->paragraph(),
        ];
    }
}
