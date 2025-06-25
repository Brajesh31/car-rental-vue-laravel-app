<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CarController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RentalController;
use App\Http\Controllers\DashbaordController;

Route::get('/', [HomeController::class, 'homePage'])->name('homepage');
Route::get('/contact', [HomeController::class, 'contactUs'])->name('contactUs');
Route::get('/about', [HomeController::class, 'aboutPage'])->name('aboutPage');


// All user routes
Route::get('/user/create', [UserController::class, 'userCreate'])->name('user.createform');
Route::post('/user/create', [UserController::class, 'userStore'])->name('user.create');
//Auth controller for login
Route::get('/login', [AuthController::class, 'loginPage'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.post');




Route::middleware(['auth'])->group(function () {
    
    
    
});

Route::middleware(['auth', 'RoleMiddleware:admin'])->group(function () {
    
    //user all URI 
    
    Route::get('/user/edit/{id}', [UserController::class, 'edit']);
    Route::put('/user/update/{id}', [UserController::class, 'update']);
    Route::delete('/user/delete/{id}', [UserController::class, 'userDelete']);
    
    
    
    
    //Car all URI - read,create,edit,update,delete
    
    Route::get('/listCars', [CarController::class, 'listCars'])->name('cars.index');
    Route::get('/cars/create', [CarController::class, 'createCar'])->name('cars.create');
    Route::post('/cars/store', [CarController::class, 'store'])->name('cars.store');
    Route::get('/showCar/{car}', [CarController::class, 'showCar'])->name('cars.show');
    Route::get('/cars/{car}/edit', [CarController::class, 'edit'])->name('cars.edit');
    Route::post('/cars/{car}/update', [CarController::class, 'update'])->name('cars.update');
    Route::get('/cars/{car}/delete', [CarController::class, 'deleteCar'])->name('cars.destroy');
    
});
Route::middleware(['auth', 'RoleMiddleware:user,admin'])->group(function () {
    
    Route::get('/dashboard', [DashbaordController::class, 'dashboard'])->name('dashboard');
    Route::get('/user/logout', [UserController::class, 'userLogout'])->name('logout');

    //rental all URI - read,create,edit,update,delete

    Route::put('/rentals/{id}/update-status', [RentalController::class, 'updateStatus']);
    // Route::post('/rentals/update-status/{id}', [RentalController::class, 'autoUpdateStatus']);


    Route::get('/listRentals', [RentalController::class, 'rentalList'])->name('rentals.index');
    Route::get('/rentals/create', [RentalController::class, 'createRental'])->name('rentals.create');
    Route::get('/cars/{car}/book', [RentalController::class, 'bookForm'])->name('cars.book');
    Route::post('/cars/{car}/book', [RentalController::class, 'bookCar']);

    //check availability

    Route::post('/check-availability', [RentalController::class, 'checkAvailability']);


    Route::get('/showRental/{rental}', [RentalController::class, 'showRental'])->name('rentals.show');
    Route::get('/rentals/{rental}/edit', [RentalController::class, 'edit'])->name('rentals.edit');
    Route::put('/rentals/{rentalId}/cancel', [RentalController::class, 'cancelRental'])->name('rentals.destroy');

});

