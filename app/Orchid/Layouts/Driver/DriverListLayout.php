<?php

namespace App\Orchid\Layouts\Driver;

use App\Models\Driver;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Actions\DropDown;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Actions\ModalToggle;
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
            TD::make('', 'Email / Телефон / Telegram ID')
                ->render(fn(Driver $driver) => "$driver->email<br>$driver->phone<br>$driver->chat_id")
                ->width('150px'),
            TD::make('', 'Участок / № автомобиля / № водителя')
                ->render(fn(Driver $driver) => "{$driver->area->name}<br>$driver->car_no<br>$driver->driver_no")
                ->width('150px'),
            TD::make('', 'Последняя поездка')
                ->render(fn(Driver $driver) => "{$driver->place->name}<br>$driver->latitude<br>{$driver->longitude}"),

            TD::make('map', 'Карта')
                ->render(fn(Driver $driver) => ModalToggle::make('Показать на карте')
                    ->modal('showOnMapModal')
                    ->icon('map')
                    ->asyncParameters(['driver_id' => $driver->id])),

            TD::make(__('Actions'))
                ->align(TD::ALIGN_CENTER)
                ->width('100px')
                ->render(fn(Driver $driver) => DropDown::make()
                    ->icon('options-vertical')
                    ->list([

                        Link::make(__('Edit'))
                            ->route('platform.drivers.edit', $driver->id)
                            ->icon('pencil'),

                        Button::make(__('Delete'))
                            ->icon('trash')
                            ->confirm(__('Once the driver is deleted, all of its resources and data will be permanently deleted. Before deleting your account, please download any data or information that you wish to retain.'))
                            ->method('remove', [
                                'id' => $driver->id,
                            ]),
                    ]))
        ];
    }
}
