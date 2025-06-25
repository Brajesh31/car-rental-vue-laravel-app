<?php

namespace App\Http\Controllers;

use Exception;
use Carbon\Carbon;
use App\Models\Car;
use Inertia\Inertia;
use App\Models\Rental;
use Illuminate\Http\Request;
use function Laravel\Prompts\alert;
use App\Mail\CarBookingConfirmation;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class RentalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function rentalList(Request $request)
    {
        $user = Auth::user();

        $rentals = $user->role === 'admin'
            ? Rental::with('car', 'user')->latest()->get()
            : Rental::with('car')->where('user_id', $user->id)->latest()->get();
            

        return Inertia::render('Rentals/RentalList', [
            'rentals' => $rentals,
            'isAdmin' => $user->role === 'admin',
            'user' => $user,
        ]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function createRental(Request $request)
    {
        $cars = Car::all();
        //    $cars=Car::paginate(6);
        return Inertia::render('Rentals/RentalCreate', ['cars' => $cars, 'user_name' => $request->name]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function bookForm(Car $car)
    {

        return Inertia::render('Rentals/BookForm', ['car' => $car]);
    }

    public function checkAvailability(Request $request)
    {
        $request->validate([
            'car_id' => 'required|exists:cars,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $conflict = Rental::where('car_id', $request->car_id)
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_date', [$request->start_date, $request->end_date])
                    ->orWhereBetween('end_date', [$request->start_date, $request->end_date])
                    ->orWhere(function ($query) use ($request) {
                        $query->where('start_date', '<=', $request->start_date)
                            ->where('end_date', '>=', $request->end_date);
                    });
            })->exists();



        if ($conflict) {
            return response()->json(['available' => false]);
        }

        $days = Carbon::parse($request->start_date)->diffInDays(Carbon::parse($request->end_date)) + 1;
        $car = Car::find($request->car_id);
        $total = $car->daily_rent_price * $days;

        return response()->json([
            'available' => true,
            'total_cost' => $total,
        ]);



    }

    public function bookCar(Request $request)
    {

        $request->validate([
            'car_id' => 'required|exists:cars,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        // Double-check
        $availability = $this->checkAvailability($request)->getData();
        if (!$availability->available) {
            return back()->withErrors(['message' => 'Car is not available for the selected dates.']);
        }
        $rental = Car::where('id', $request->car_id)->get();

        $booking = Rental::create([
            'user_id' => auth()->id(),
            'car_id' => $request->car_id,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'total_cost' => $request->total_cost,
        ]);



        Mail::to(auth()->user()->email)->send(new CarBookingConfirmation($booking));

        return redirect()->route('rentals.index')->with('success', 'Booking confirmed and email sent.');


    }

    /**
     * Update the specified resource in storage.
     */


    public function updateStatus(Request $request, $id)
    {
        try {

            $rental = Rental::findOrFail($id);

            if (Auth::user()->role !== 'admin') {
                abort(403, 'Unauthorized');
            }
            $rental->status = $request->status;
            $rental->save();
            return back()->with('success', 'Rental status updated successfully. from controller');
        } catch (Exception $e) {
            return back()->with('error', 'failed to update');
        }
    }



    /**
     * Display the specified resource.
     */
    public function showRental(Rental $rental)
    {
        // $rentals=Rental::all();
        // return Inertia::render();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Rental $rental)
    {
        //
    }


    /**
     * Remove the specified resource from storage.
     */
    public function cancelRental($id)
    {
        try {

            $rental = Rental::findOrFail($id);
            $rental->status = 'Cancelled';
            $rental->save();
            return back()->with('success', 'Rental booking Cancelled successfully.');
        } catch (Exception $e) {
            return back()->with('error', 'failed to cancel');
        }
    }
}
