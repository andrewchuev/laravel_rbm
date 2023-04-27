<?php

namespace App\Orchid\Screens\Visit;

use App\Models\Visit;
use App\Orchid\Layouts\Visit\VisitListLayout;
use App\Orchid\Layouts\Visit\VisitSelection;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Layouts\Modal;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Layout;

class VisitListScreen extends Screen
{

    public $visits;
    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(): iterable
    {

        return [
            'visits' => Visit::filters(VisitSelection::class)->orderBy('created_at', 'desc')->paginate(20)
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
        return [
        /*    Button::make('Export file')
                ->method('export', ['name' => 'visits', 'action' => 'export'])
                ->icon('cloud-download')
                ->rawClick()
                ->novalidate(),*/
        ];
    }

    /**
     * The screen's layout elements.
     *
     * @return \Orchid\Screen\Layout[]|string[]
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
            VisitSelection::class,
            VisitListLayout::class
        ];
    }

    public function asyncGetData(string $driver_id): array
    {
        return [
            'driver_id' => $driver_id,
        ];
    }
    public function export()
    {
        dd($this->visits);

    }
}
