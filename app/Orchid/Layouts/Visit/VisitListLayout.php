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
            TD::make('driver','Driver')->render(fn(Visit $visit) => $visit->driver->name),
            TD::make('place','Place')->render(fn(Visit $visit) => $visit->place->name),
            TD::make('latitude','latitude'),
            TD::make('longitude','longitude'),
        ];
    }
}
