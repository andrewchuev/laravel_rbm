<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Screen\AsSource;

class Visit extends Model
{
    use HasFactory, AsSource;

    protected $fillable = [
        'driver_id',
        'place_id',
        'lat',
        'lng',
        'permissions',
        'created_at',
    ];

    public function driver()
    {
        return $this->hasOne('\App\Models\Driver', 'id', 'driver_id');
    }

    public function place()
    {
        return $this->hasOne('\App\Models\Place', 'id', 'place_id');
    }

    public function area()
    {
        return $this->hasOne('\App\Models\Place', 'id', 'area_id');
    }
}
