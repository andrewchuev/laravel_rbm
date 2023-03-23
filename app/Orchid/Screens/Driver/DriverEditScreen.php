<?php

namespace App\Orchid\Screens\Driver;

use App\Models\Driver;
use App\Models\Place;
use App\Models\VehicleType;
use App\Orchid\Layouts\Place\PlaceListLayout;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;

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
        return $this->driver->exists ? 'Edit driver' : 'Creating a new driver';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Button::make('Create driver')
                ->icon('pencil')
                ->method('createOrUpdate')
                ->canSee(!$this->driver->exists),

            Button::make('Update')
                ->icon('note')
                ->method('createOrUpdate')
                ->canSee($this->driver->exists),

            Button::make('Remove')
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
                    ->title('Driver Name')
                    ->placeholder('Enter Driver Name'),

                Input::make('driver.email')
                    ->title('Email')
                    ->placeholder('Driver Email'),

                Input::make('driver.phone')
                    ->title('Phone')
                    ->placeholder('Driver Phone'),

                Input::make('driver.chat_id')
                    ->title('Telegram ID')
                    ->placeholder('Driver Telegram ID'),

                Select::make('driver.place_id')
                    ->title('Place')
                    ->fromModel(Place::class, 'name'),

            ])
        ];
    }

    public function createOrUpdate(Driver $driver, Request $request)
    {
        $driver->fill($request->get('driver'))->save();

        Alert::info('Driver was saved.');

        return redirect()->route('platform.systems.drivers');
    }
}
