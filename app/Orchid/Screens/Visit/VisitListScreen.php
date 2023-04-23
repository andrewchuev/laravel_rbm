<?php

namespace App\Orchid\Screens\Visit;

use App\Models\Visit;
use App\Orchid\Layouts\Visit\VisitListLayout;
use App\Orchid\Layouts\Visit\VisitSelection;
use Orchid\Screen\Screen;

class VisitListScreen extends Screen
{
    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(): iterable
    {
        return [
            'visits' => Visit::filters(VisitSelection::class)->orderBy('created_at', 'desc')->paginate(10)
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return 'Поездки';
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
        return [
            VisitSelection::class,
            VisitListLayout::class
        ];
    }
}
