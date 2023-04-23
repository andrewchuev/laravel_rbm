<?php

namespace App\Orchid\Layouts\Visit;

use App\Orchid\Filters\Visit\DriverFilter;
use App\Orchid\Filters\Visit\PlaceFilter;
use Orchid\Filters\Filter;
use Orchid\Screen\Layouts\Selection;

class VisitSelection extends Selection
{
    /**
     * @return Filter[]
     */
    public function filters(): iterable
    {
        return [
            PlaceFilter::class,
            DriverFilter::class
        ];
    }
}
