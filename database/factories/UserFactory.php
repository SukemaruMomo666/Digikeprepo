<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends Factory<User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $nim = (string) fake()->unique()->numerify('23101####');

        return [
            'nim_nip' => $nim,
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'password' => static::$password ??= Hash::make('password'),
            'role' => 'mahasiswa',
            'is_first_login' => false,
            'remember_token' => Str::random(10),
        ];
    }

    /**
     * State untuk mahasiswa.
     */
    public function mahasiswa(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => 'mahasiswa',
        ]);
    }

    /**
     * State untuk admin.
     */
    public function admin(): static
    {
        return $this->state(fn (array $attributes) => [
            'nim_nip' => fake()->unique()->numerify('##################'), // 18 digit NIP
            'role' => 'admin',
            'is_first_login' => false,
        ]);
    }

    /**
     * State untuk mahasiswa yang belum pernah login (password masih default NIM).
     */
    public function firstLogin(): static
    {
        return $this->state(function (array $attributes) {
            return [
                'password' => Hash::make($attributes['nim_nip']),
                'is_first_login' => true,
            ];
        });
    }
}
