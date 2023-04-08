<?php

namespace App\Http\Controllers;

use App\Models\Driver;
use Illuminate\Http\Request;

class DriversController extends Controller
{
    public function getDrivers() {
        return Driver::with(['area', 'place'])
            ->whereNotNull(['latitude', 'longitude', 'place_id', 'area_id'])
            ->where('latitude', '!=', '0.00000000')->get();
    }

    public function getDriver(int $id) {
        //dd($id);
        return Driver::find($id);
    }
}
