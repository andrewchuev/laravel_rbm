<?php

use App\Http\Controllers\DriversController;
use App\Http\Controllers\TelebotController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PointsController;
use App\Http\Controllers\PlacesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('setpoint/{id}{lat}{lng}', function ($id, $lat, $lng) {
    return "$id $lat $lng";
});

Route::get('addpoint', [PointsController::class, 'addPoint' ]);
Route::get('places', [PlacesController::class, 'getPlaces' ]);
Route::get('visits', [PlacesController::class, 'getVisits' ]);
Route::get('drivers', [DriversController::class, 'getDrivers' ]);
Route::get('driver/{id}', [DriversController::class, 'getDriver' ]);
Route::get('login/{telegram_id}', [DriversController::class, 'getPlaces' ]);

Route::any('telebot', [TelebotController::class, 'index' ]);
