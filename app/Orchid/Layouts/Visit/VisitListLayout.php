<?php

namespace App\Orchid\Layouts\Visit;

use App\Models\Visit;
use Orchid\Screen\Layouts\Table;
use Orchid\Screen\TD;

class VisitListLayout extends Table
{
    /**
     * Data source.
     *
     * The name of the key to fetch it from the query.
     * The results of which will be elements of the table.
     *
     * @var string
     */
    protected $target = 'visits';

    /**
     * Get the table cells to be displayed.
     *
     * @return TD[]
     */
    protected function columns(): iterable
    {
        return [
            TD::make('driver_id', 'Водитель')->render(fn(Visit $visit) => $visit->driver?->name . ' (' . $visit->driver?->area->name . ')')->sort(),
            TD::make('place_id', 'Место')->render(fn(Visit $visit) => $visit->place?->name ?? '')->sort(),
            /*TD::make('lat','Lat'),
            TD::make('lng','Lng'),*/
            TD::make('created_at', 'Дата/Время')->render(fn(Visit $visit) => $visit->created_at->format('d M Y - H:i:s'))->sort(),
            /*TD::make('diff_time', 'Последняя поездка')
                ->render(
                    function (Visit $visit) {
                        $diffMinutes = $visit->created_at->diffInMinutes();
                        $diffClass   = $diffMinutes >= 90 ? 'text-danger' : '';
                        return "<span class='$diffClass'>" . $visit->created_at->diffForHumans(null, null, true, 2) . "</span>";
                    }
                ),*/
        ];
    }
}
