<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function login()
    {
        // return "user logged in from login function User controller";
        // return Inertia::render('LoginPage');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function userCreate()
    {
        return Inertia::render('SignupPage');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function userStore(Request $request)
    {
        // dd($request->all());

        try {
            $request->validate([
                'name' => 'required|string',
                'email' => 'required|string|email|max:255|unique:users,email,',
                'role' => 'required|string',
                'password' => 'required|string|min:5|confirmed',
            ]);


           $k= User::create([
                'name' => $request->name,
                'email' => $request->email,
                'role' => $request->role,
                'password' => bcrypt($request->password),

            ]);
            // return redirect()->back()->with('success', 'User created successfully.');
            return redirect('/login')->with('success', 'User created successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
        return Inertia::render('EditUser', [
            'user' => $user,
        ]);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
          $user = User::findOrFail($id);
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'role' => $request->role,
                'password' => bcrypt($request->password),
            ]);

            return redirect()->route('dashboard')->with('success', 'User updated successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', $th->getMessage());
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function userLogout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        $request->session()->flush();

        return redirect()->route('login'); // Redirect to login or homepage
    }
    public function userDelete( $id)
    {
        try {
            $user = User::findOrFail($id);

            $user->delete();
            return redirect()->route('dashboard')->with('success', 'User Deleted successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', $th->getMessage());
        }

    }
}