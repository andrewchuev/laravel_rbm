<?php

namespace App\Orchid\Screens\Driver;

use App\Models\Area;
use App\Models\Driver;
use App\Models\VehicleType;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Group;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;
use Orchid\Support\Facades\Toast;

class DriverEditScreen extends Screen
{
    public Driver $driver;

    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(Driver $driver): iterable
    {
        return [
            'driver' => $driver
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return $this->driver->exists ? 'Редактирование водителя' : 'Создание нового водителя';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Button::make('Новый водитель')
                ->icon('pencil')
                ->method('createOrUpdate')
                ->canSee(!$this->driver->exists),

            Button::make('Обновить')
                ->icon('note')
                ->method('createOrUpdate')
                ->canSee($this->driver->exists),

            Button::make('Удалить')
                ->icon('trash')
                ->method('remove')
                ->canSee($this->driver->exists),
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
            Layout::columns([
                Layout::rows([
                    Input::make('driver.name')
                        ->title('Имя')->required(),

                    Input::make('driver.email')
                        ->title('Email')
                        ->placeholder('Driver Email')->required(),

                    Input::make('driver.phone')
                        ->title('Телефон')->required(),

                    Input::make('driver.telegram_id')
                        ->title('Telegram ID')->required(),
                ]),
                Layout::rows([

                    Input::make('driver.car_no')
                        ->title('№ авто')->required(),

                    Input::make('driver.driver_no')
                        ->title('№ водителя')->required(),
                    Select::make('driver.area_id')
                        ->title('Участок')
                        ->fromModel(Area::class, 'name')->required()->empty(),


                        Group::make([
                            Input::make('driver.lat')
                                ->title('Latitude'),

                            Input::make('driver.lng')
                                ->title('Longitude'),
                        ]),


                ]),
            ]),

        ];
    }

    public function createOrUpdate(Driver $driver, Request $request)
    {
        $driver->fill($request->get('driver'))->save();

        Alert::info('Водитель сохранен.');

        return redirect()->route('platform.drivers');
    }

    public function remove(Driver $driver)
    {
        $driver->delete();

        Toast::info(__('Водитель удален.'));

        return redirect()->route('platform.drivers');
    }
}
