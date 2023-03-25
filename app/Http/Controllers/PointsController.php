<?php

namespace App\Http\Controllers;

use App\Models\Visit;
use Illuminate\Http\Request;

class PointsController extends Controller
{
    public function addPoint(Request $request) {



        $driverId =  $request->driver_id;
        $placeId =  $request->place_id;
        $latitude =  $request->latitude;
        $longitude =  $request->longitude;

        $visit = new Visit;
        $visit->driver_id = $driverId;
        $visit->place_id = $placeId;
        $visit->latitude = $latitude;
        $visit->longitude = $longitude;
        $visit->save();



        return [
          'driver_id' => $driverId,
          'place_id' => $placeId,
          'latitude' => $latitude,
          'longitude' => $longitude,
        ];
    }
}
