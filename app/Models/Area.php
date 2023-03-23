<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Screen\AsSource;

class Area extends Model
{
    use HasFactory, AsSource;

    protected $fillable = [
        'name',
    ];

    public function places()
    {
        return $this->hasMany('\App\Models\Place', 'id', 'place_id');
    }
}
