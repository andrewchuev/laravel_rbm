<?php

namespace App\Orchid\Screens\Driver;

use App\Models\Driver;
use App\Orchid\Layouts\Driver\DriverListLayout;
use Illuminate\Http\Request;
use Orchid\Screen\Action;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Actions\ModalToggle;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Layouts\Modal;
use Orchid\Support\Facades\Layout;
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
        return 'Водители';
    }

    /**
     * The screen's action buttons.
     *
     * @return Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Link::make(__('Добавить'))
                ->icon('plus')
                ->route('platform.drivers.create'),

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
            Layout::modal('showOnMapModal', Layout::view('driver-map'))
                ->title('Карта')
                ->size(Modal::SIZE_LG)
                ->withoutApplyButton()
                ->rawClick()
                ->async('asyncGetData'),

            DriverListLayout::class
        ];
    }


    public function asyncGetData(string $driver_id): array
    {
        return [
            'driver_id' => $driver_id,
        ];
    }


    public function remove(Driver $driver)
    {
        $driver->delete();

        Toast::info(__('Водитель удален.'));

        return redirect()->route('platform.drivers');
    }
}
