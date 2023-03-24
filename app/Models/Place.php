<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Screen\AsSource;
use Orchid\Filters\Filterable;

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
    protected $fillable = [
        'name',
        'area_id',
    ];

    public function area()
    {
        return $this->hasOne('\App\Models\Area', 'id', 'area_id');
    }
}
