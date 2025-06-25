<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class AuthController extends Controller
{
    public function loginPage()
    {
        return Inertia::render('LoginPage');
    }


    public function login(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'email' => 'email|required',
            'password' => 'required',
        ]);
        $email = $request->email;
        $password = $request->password;
        if (!Auth::attempt(['email' => $email, 'password' => $password])) {
            return redirect()->back()->with('error', 'invalid credentials');
        }

        return Inertia::render('HomePage')->with(['success' => 'User logged in successfully!']);

    }
}
