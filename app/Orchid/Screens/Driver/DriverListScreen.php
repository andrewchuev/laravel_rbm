<?php

namespace App\Orchid\Screens\Driver;

use App\Models\Driver;
use App\Orchid\Layouts\Driver\DriverListLayout;
use Orchid\Screen\Action;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Layout;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Toast;

class DriverListScreen extends Screen
{
    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(): iterable
    {
        return [
            'drivers' => Driver::all(),
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return 'Drivers List';
    }

    /**
     * The screen's action buttons.
     *
     * @return Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Link::make(__('Add'))
                ->icon('plus')
                ->route('platform.systems.drivers.create'),
        ];
    }

    /**
     * The screen's layout elements.
     *
     * @return Layout[]|string[]
     */
    public function layout(): iterable
    {
        return [
            DriverListLayout::class
        ];
    }

    public function remove(Driver $driver)
    {
        $driver->delete();

        Toast::info(__('Driver was removed'));

        return redirect()->route('platform.systems.drivers');
    }
}
