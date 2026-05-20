<?php

namespace Database\Factories;

use App\Models\Pasien;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Pasien>
 */
class PasienFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->mahasiswa(),
            'no_rm' => 'RM-'.fake()->unique()->numerify('####'),
            'nama_pasien' => fake()->name(),
            'umur' => fake()->numberBetween(1, 90),
            'jenis_kelamin' => fake()->randomElement(['L', 'P']),
            'ruang_rawat' => fake()->randomElement(['Bougenville', 'Mawar', 'ICU', null]),
            'tanggal_masuk' => fake()->dateTimeBetween('-1 year', 'now')->format('Y-m-d'),
            'status_askep' => 'draft',
        ];
    }

    public function selesai(): static
    {
        return $this->state(['status_askep' => 'selesai']);
    }
}
