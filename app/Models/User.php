<?php

namespace App\Models;

use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;
use Laravel\Fortify\TwoFactorAuthenticatable;

#[Fillable(['nim_nip', 'name', 'email', 'password', 'role', 'is_first_login'])]
#[Hidden(['password', 'two_factor_secret', 'two_factor_recovery_codes', 'remember_token'])]
class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable, TwoFactorAuthenticatable;

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'is_first_login' => 'boolean',
        ];
    }

    /**
     * Check whether this user is an admin.
     */
    public function pasien(): HasMany
    {
        return $this->hasMany(Pasien::class);
    }

    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    /**
     * Check whether this user is a mahasiswa.
     */
    public function isMahasiswa(): bool
    {
        return $this->role === 'mahasiswa';
    }

    /**
     * Check whether this user is a dosen.
     */
    public function isDosen(): bool
    {
        return $this->role === 'dosen';
    }

    /**
     * Relationships for Dosen & Mahasiswa.
     */
    public function penugasanSebagaiMahasiswa(): HasMany
    {
        return $this->hasMany(Penugasan::class, 'mahasiswa_id');
    }

    public function penugasanSebagaiDosen(): HasMany
    {
        return $this->hasMany(Penugasan::class, 'dosen_id');
    }

    public function feedback(): HasMany
    {
        return $this->hasMany(AskepFeedback::class, 'dosen_id');
    }

    public function logPembelajaran(): HasMany
    {
        return $this->hasMany(LogPembelajaran::class);
    }

    public function askep(): HasMany
    {
        return $this->hasMany(Askep::class);
    }

    /**
     * Get the user's initials.
     */
    public function initials(): string
    {
        return Str::of($this->name)
            ->explode(' ')
            ->take(2)
            ->map(fn ($word) => Str::substr($word, 0, 1))
            ->implode('');
    }
}
