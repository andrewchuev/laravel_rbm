<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Filters\Filterable;
use Orchid\Screen\AsSource;

class Place extends Model
{
    use HasFactory, AsSource, Filterable;

    protected $allowedFilters = [
        'name',
    ];
    /**
     * @var array
     */
    protected $allowedSorts = [
        'name',
        'area_id'
    ];
    protected $fillable     = [
        'name',
        'area_id',
        'color',
        'fill_color',
        'latlng_center',
        'latlng_lb',
        'latlng_lt',
        'latlng_rt',
        'latlng_rb',
    ];

    public function area()
    {
        return $this->hasOne('\App\Models\Area', 'id', 'area_id');
    }
}
