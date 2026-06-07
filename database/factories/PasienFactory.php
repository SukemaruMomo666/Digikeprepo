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
            'tanggal_lahir' => fake()->dateTimeBetween('-80 years', '-1 year')->format('Y-m-d'),
            'agama' => fake()->randomElement(['Islam', 'Kristen', 'Katolik', 'Hindu', 'Buddha', null]),
            'status_perkawinan' => fake()->randomElement(['Belum Kawin', 'Kawin', 'Cerai', null]),
            'pekerjaan' => fake()->jobTitle(),
            'pendidikan' => fake()->randomElement(['SD', 'SMP', 'SMA', 'D3', 'S1', null]),
            'alamat' => fake()->address(),
            'diagnosa_medis' => fake()->randomElement(['Hipertensi', 'Diabetes Mellitus', 'Pneumonia', 'Gagal Jantung', null]),
            'bb' => fake()->randomFloat(1, 40, 120),
            'tb' => fake()->numberBetween(140, 185),
        ];
    }
}
