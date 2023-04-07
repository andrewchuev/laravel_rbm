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
          'telegram_id' => $telegramId,
        ];
    }
}
