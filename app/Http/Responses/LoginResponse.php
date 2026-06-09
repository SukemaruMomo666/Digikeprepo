<?php

namespace App\Http\Responses;

use Laravel\Fortify\Contracts\LoginResponse as LoginResponseContract;
use Symfony\Component\HttpFoundation\Response;

class LoginResponse implements LoginResponseContract
{
    /**
     * Redirect after successful login based on role and first-login status.
     */
    public function toResponse($request): Response
    {
        $user = $request->user();

        if ($user->is_first_login) {
            return redirect()->route('password.change');
        }

        return redirect()->intended(match (true) {
            $user->isAdmin() => route('admin.dashboard'),
            $user->isDosen() => route('dosen.dashboard'),
            default => route('dashboard'),
        });
    }
}
