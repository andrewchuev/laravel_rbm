<?php

namespace App\Http\Controllers;

use App\Models\Place;
use App\Models\Visit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PlacesController extends Controller
{
    public function getPlaces() {
        return Place::all();
    }

    public function getVisits() {
        return Visit::select(DB::raw("driver_id, max(place_id) as place_id, max(latitude) as latitude, max(longitude) as longitude, max(created_at) as last_date"))
            ->with(['driver', 'place'])
            ->groupBy('driver_id')->get();
    }
}
