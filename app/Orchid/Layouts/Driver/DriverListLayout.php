<?php

namespace App\Orchid\Layouts\Driver;

use App\Models\Driver;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Actions\DropDown;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Actions\ModalToggle;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Layouts\Table;
use Orchid\Screen\TD;

class DriverListLayout extends Table
{
    /**
     * Data source.
     *
     * The name of the key to fetch it from the query.
     * The results of which will be elements of the table.
     *
     * @var string
     */
    protected $target = 'drivers';

    /**
     * Get the table cells to be displayed.
     *
     * @return TD[]
     */
    protected function columns(): iterable
    {
        return [
            TD::make('id', 'ID'),
            TD::make('name', 'Имя')
                ->width('200px'),
            TD::make('', " Email \n Телефон \n Telegram ID ")
                ->render(fn(Driver $driver) => "$driver?->email <br>$driver?->phone  <br>$driver?->telegram_id")
                ->alignCenter(),
            TD::make('', 'Участок / № автомобиля / № водителя')
                ->render(fn(Driver $driver) => "{$driver->area?->name}  <br>$driver?->car_no<br>$driver?->driver_no"),
            TD::make('', 'Последняя поездка')
                ->render(fn(Driver $driver) => "{$driver->place?->name}<br>{$driver?->updated_at->format('Y-d-m')}<br>{$driver?->updated_at->format('H:i')}"),

            TD::make('map', 'Карта')
                ->render(fn(Driver $driver) => ModalToggle::make('Показать на карте')
                    ->modal('showOnMapModal')
                    ->icon('map')
                    ->asyncParameters(['driver_id' => $driver->id])),

            /*TD::make('map', 'Карта')
                ->render(fn(Driver $driver) => Input::make('updated_at')->value($driver->updated_at)),*/

            TD::make(__('Actions'))
                ->align(TD::ALIGN_CENTER)
                ->width('100px')
                ->render(fn(Driver $driver) => DropDown::make()
                    ->icon('options-vertical')
                    ->list([

                        Link::make(__('Изменить'))
                            ->route('platform.drivers.edit', $driver->id)
                            ->icon('pencil'),

                        Button::make(__('Удалить'))
                            ->icon('trash')
                            ->confirm(__('Вы действительно хотите удалить водителя?'))
                            ->method('remove', [
                                'id' => $driver->id,
                            ]),
                    ]))
        ];
    }
}
