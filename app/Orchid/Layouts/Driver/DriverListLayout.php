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
            TD::make('id', 'ID')->sort(),

            TD::make('name', 'Имя')
                ->width('200px')->sort(),

            /*TD::make('', "Email")
                ->render(fn(Driver $driver) => $driver?->email),*/

            TD::make('phone', "Телефон")
                ->render(fn(Driver $driver) => $driver?->phone)->sort(),

            TD::make('telegram_id', "Telegram ID ")
                ->render(fn(Driver $driver) => $driver?->telegram_id)->sort(),

            TD::make('place_id', 'Участок')
                ->render(fn(Driver $driver) => $driver->area?->name)->sort(),

            TD::make('car_no', '№ авто')
                ->render(fn(Driver $driver) => $driver?->car_no)->sort(),

            TD::make('driver_no', '№ водителя')
                ->render(fn(Driver $driver) => $driver?->driver_no)->sort(),

            TD::make('updated_at', 'Последняя поездка')
                ->render(
                    function (Driver $driver) {
                        $diffMinutes = $driver->updated_at->diffInMinutes();
                        $diffClass   = $diffMinutes >= 90 ? 'text-danger' : '';
                        $diff =  "<span class='$diffClass'>" . $driver->updated_at->diffForHumans(null, null, true, 2) . "</span>";
                        return "{$driver->place?->name} {$driver?->updated_at->format('Y-d-m H:i')} <br> $diff";
                    })->sort(),

                    TD::make('map', 'Карта')
                        ->render(fn(Driver $driver) => ModalToggle::make('')
                            ->modal('showOnMapModal')
                            ->icon('map')
                            ->asyncParameters(['driver_id' => $driver->id])),

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
