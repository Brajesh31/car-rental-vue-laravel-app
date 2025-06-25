<?php

namespace App\Http\Controllers;

use App\Models\Rental;
use App\Models\User;
use App\Models\Car;
use Inertia\Inertia;
use Illuminate\Http\Request;

class DashbaordController extends Controller
{
    public function dashboard(Request $request)
    {
        $users = User::all();
        $cars = Car::all();
        // $rentals = Rental::all();

        return Inertia::render('DashboardPage', [
            'users' => $users, //user props
            'cars' => $cars, //car props
            // 'rentals' => $rentals //rental props
        ]);


    }
    public function userDashboard(Request $request)
    {
        $rentals = Rental::all();
        return Inertia::render('UserDashboardPage', [
            'rentals' => $rentals //user props
        ]);


    }
}
