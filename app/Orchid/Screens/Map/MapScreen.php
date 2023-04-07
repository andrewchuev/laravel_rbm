<?php

namespace App\Orchid\Screens\Map;

use App\Models\Visit;
use Illuminate\Support\Facades\DB;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Layout;

class MapScreen extends Screen
{
    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(): iterable
    {
        return [
            //'visits' => Visit::with(['driver', 'place'])->get()
            'visits' => Visit::select(DB::raw("driver_id, any_value(place_id) as place_id, any_value(latitude) as latitude, any_value(longitude) as longitude, max(created_at)"))->with(['driver', 'place'])->groupBy('driver_id')->get()
            //        $users = User::select("*", DB::raw("count(*) as user_count"))
            //
            //                        ->groupBy('status')
            //
            //                        ->get();
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return 'Map';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [];
    }

    /**
     * The screen's layout elements.
     *
     * @return \Orchid\Screen\Layout[]|string[]
     */
    public function layout(): iterable
    {
        return [Layout::view('map'),];
    }
}
