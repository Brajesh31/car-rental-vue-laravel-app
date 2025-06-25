<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Car extends Model
{
    protected $fillable = [
        'name',

        'brand',

        'model',

        'year',
        'image',

        'car_type',

        'daily_rent_price',

        'availability',


    ];
    public function rentals()
    {
        return $this->hasMany(Rental::class);
    }
}
