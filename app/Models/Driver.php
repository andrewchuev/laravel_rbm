<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Orchid\Screen\AsSource;

class Driver extends Model
{
    use HasFactory, AsSource;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'chat_id',
        'area_id',
    ];

    //public $timestamps = false;

    protected $guarded = [];

    public function area()
    {
        return $this->hasOne('\App\Models\Area', 'id', 'area_id');
    }
}
