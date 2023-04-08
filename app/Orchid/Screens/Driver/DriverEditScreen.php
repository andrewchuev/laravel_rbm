<?php

namespace App\Orchid\Screens\Driver;

use App\Models\Area;
use App\Models\Driver;
use App\Models\VehicleType;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
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
            Layout::rows([
                Input::make('driver.name')
                    ->title('Имя'),

                Input::make('driver.email')
                    ->title('Email')
                    ->placeholder('Driver Email'),

                Input::make('driver.phone')
                    ->title('Телефон'),

                Input::make('driver.chat_id')
                    ->title('Telegram ID'),

                Input::make('driver.car_no')
                    ->title('№ авто'),

                Input::make('driver.driver_no')
                    ->title('№ водителя'),

                Select::make('driver.area_id')
                    ->title('Участок')
                    ->fromModel(Area::class, 'name'),

            ])
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
