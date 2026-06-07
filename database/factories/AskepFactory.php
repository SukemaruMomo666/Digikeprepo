<?php

namespace Database\Factories;

use App\Models\Askep;
use App\Models\Pasien;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Askep>
 */
class AskepFactory extends Factory
{
    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $pasien = Pasien::factory()->create();

        return [
            'pasien_id' => $pasien->id,
            'user_id' => $pasien->user_id,
            'status' => Askep::STATUS_DRAFT,
            'step_terakhir' => 1,
            'catatan_dosen' => null,
            'submitted_at' => null,
            'reviewed_at' => null,
        ];
    }

    public function selesai(): static
    {
        return $this->state([
            'status' => Askep::STATUS_SELESAI,
            'step_terakhir' => 5,
        ]);
    }

    public function menungguReview(): static
    {
        return $this->state([
            'status' => Askep::STATUS_MENUNGGU_REVIEW,
            'step_terakhir' => 5,
            'submitted_at' => now(),
        ]);
    }
}
