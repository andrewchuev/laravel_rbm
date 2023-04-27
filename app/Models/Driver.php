<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Filters\Filterable;
use Orchid\Screen\AsSource;

class Driver extends Model
{
    use HasFactory, AsSource, Filterable;

    protected $casts = [
        'updated_at' => 'datetime:Y-m-d H:i:s',
        'created_at' => 'datetime:Y-m-d H:i:s',
    ];
    protected $fillable = [
        'name',
        'email',
        'phone',
        'telegram_id',
        'car_no',
        'driver_no',
        'area_id',
        'place_id',
        'lat',
        'lng',
    ];

    protected $allowedSorts = [
        'id',
        'name',
        'phone',
        'telegram_id',
        'area_id',
        'car_no',
        'driver_no',
        'updated_at',
    ];

    protected array $allowedFilters = [
        'id',
        'name',
        'phone',
        'telegram_id',
        'area',
        'car_no',
        'driver_no',
        'updated_at',
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
