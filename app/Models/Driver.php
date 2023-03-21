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
        'place_id',
    ];

    public $timestamps = false;

    protected $guarded = [];

    public function place()
    {
        return $this->hasOne('\App\Models\Place', 'id', 'place_id');
    }
}
