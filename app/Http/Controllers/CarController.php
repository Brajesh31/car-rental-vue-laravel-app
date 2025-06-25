<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Exception;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CarController extends Controller
{
    /**
     * Display a listing of the cars.
     */
    public function listCars(Request $request)
    {
        $cars = Car::all();

        return Inertia::render('Cars/Cars', [
            'cars' => $cars,
        ]);
    }

    /**
     * Show the form for creating a new car.
     */
    public function createCar()
    {
        return Inertia::render('Cars/Create');
    }

    /**
     * Store a newly created car in storage.
     */
    public function store(Request $request)
{
    try{
 $validated= $request->validate([
        'name' => 'required|string|max:255',
        'model' => 'required|string|max:255',
        'brand' => 'required|string|max:255',
        'year' => 'required|integer|min:1900|max:' . (date('Y') + 1),
        'car_type' => 'required|string|max:255',
        'daily_rent_price' => 'required|numeric|min:0',
        'availability' => 'required|string|max:255', // or boolean if coming from checkbox
        'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    // Handle image upload if present
    $imagePath="";
    if ($request->hasFile('image')) {
        $imagePath = $request->file('image')->store('images', 'public');
        $validated['image'] = $imagePath;
    }else{
         $validated['image'] = null;
    }

  $k=  Car::create([
        'name' =>$request->name ,
        'model' =>$request->model,
        'brand' =>$request->brand,
        'year' => $request->year,
        'car_type' => $request->car_type,
'daily_rent_price'=>$request->daily_rent_price,
        'availability' => $request->availability,
        'image' => $imagePath,
       ]) ;

    return redirect()->route('cars.index')->with('success', 'Car added successfully.');
    }catch(Exception $e){
return response()->json([
    'status'=>'New adding failed',
    'message'=>$e->getMessage(),
]);
    }
}

public function showCar(Car $car){
 return Inertia::render('Cars/Show', [
            'car' => $car,
        ]);

}


    /**
     * Show the form for editing a specific car.
     */
    public function edit(Car $car)
    {
        return Inertia::render('Cars/Edit', [
            'car' => $car,
        ]);
    }

    /**
     * Update the specified car in storage.
     */
   public function update(Request $request, Car $car)
{

    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'brand' => 'required|string|max:255',
        'model' => 'required|string|max:255',
        'year' => 'required|integer|min:1900|max:' . (date('Y') + 1),
        'car_type' => 'required|string',
        'daily_rent_price' => 'required|numeric|min:0',
        'availability' => 'required|boolean|max:255', 
        'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    if ($request->hasFile('image')) {
        $validated['image'] = $request->file('image')->store('images', 'public');
    } else {
        $validated['image'] = $car->image; // keep old image if none uploaded
    }

    $car->update($validated);

    return redirect()->route('cars.index')->with('success', 'Car updated successfully.');
}


    /**
     * Remove the specified car from storage.
     */
    public function deleteCar($id)
    {
        $car= Car::where('id',$id);
        $car->delete();
        return redirect('/listCars');


    }
}
