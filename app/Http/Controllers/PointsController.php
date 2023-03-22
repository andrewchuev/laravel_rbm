<?php

namespace App\Http\Controllers;

use App\Models\Visit;
use Illuminate\Http\Request;

class PointsController extends Controller
{
    public function addPoint(Request $request) {



        $driveId =  $request->driver_id;
        $placeId =  $request->place_id;
        $latitude =  $request->latitude;
        $longitude =  $request->longitude;

        $visit = new Visit;
        $visit->driver_id = $driveId;
        $visit->place_id = $placeId;
        $visit->latitude = $latitude;
        $visit->longitude = $longitude;
        $visit->save();

        return [
          'driver_id' => $request->driver_id,
          'place_id' => $request->place_id,
          'latitude' => $request->latitude,
          'longitude' => $request->longitude,
        ];
    }
}
