<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function homePage(){
        return Inertia::render('HomePage');
    }

    public function contactUs(){
        return Inertia::render('Contact');
    }
    
    public function aboutPage(){
        return Inertia::render('AboutPage');
    }
}
