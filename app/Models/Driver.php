<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Screen\AsSource;

class Driver extends Model
{
    use HasFactory, AsSource;

    protected $casts = [
        'updated_at' => 'datetime:Y-m-d H:i:s',
        'created_at' => 'datetime:Y-m-d H:i:s',
    ];
    protected $fillable = [
        'name',
        'email',
        'phone',
        'chat_id',
        'car_no',
        'driver_no',
        'area_id',
        'place_id',
        'latitude',
        'longitude',
    ];

    public function area()
    {
        return $this->hasOne('\App\Models\Area', 'id', 'area_id');
    }

    public function place()
    {
        return $this->hasOne('\App\Models\Place', 'id', 'place_id');
    }
}
