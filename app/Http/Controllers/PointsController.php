<?php

namespace App\Http\Controllers;

use App\Models\Visit;
use Illuminate\Http\Request;
use App\Models\Driver;

class PointsController extends Controller
{
    public function addPoint(Request $request) {


        $telegramId =  $request->telegram_id;

        $driver = Driver::where('chat_id', $telegramId)->first();

        if (empty($driver)) {
            file_put_contents(__DIR__ . '/debug-new-drivers.txt', print_r($telegramId, true), FILE_APPEND);
            return 'Driver not found';
        }

        $driverId =  $driver->id;
        $placeId =  $request->place_id;
        $lat =  $request->lat;
        $lng =  $request->lng;

        $visit = new Visit;
        $visit->driver_id = $driverId;
        $visit->place_id = $placeId;
        $visit->lat = $lat;
        $visit->lng = $lng;
        $visit->save();


        $driver = Driver::find($driverId);
        $driver->lat = $lat;
        $driver->lng = $lng;
        $driver->place_id = $placeId;
        $driver->save();


        return $driver;
    }
}
