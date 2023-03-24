<?php

namespace App\Orchid\Layouts\Place;

use App\Orchid\Filters\PlaceFilter;
use Orchid\Filters\Filter;
use Orchid\Screen\Layouts\Selection;

class PlaceFiltersLayout extends Selection
{
    /**
     * @return Filter[]
     */
    public function filters(): iterable
    {
        return [
            PlaceFilter::class
        ];
    }
}
