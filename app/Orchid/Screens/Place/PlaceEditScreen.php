<?php

namespace App\Orchid\Screens\Place;

use App\Models\Driver;
use App\Models\Place;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;

class PlaceEditScreen extends Screen
{
    public Place $place;

    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(Place $place): iterable
    {
        return [
            'place' => $place
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return $this->place->exists ? 'Edit place' : 'Creating a new place';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Button::make('Create place')
                ->icon('pencil')
                ->method('createOrUpdate')
                ->canSee(!$this->place->exists),

            Button::make('Update')
                ->icon('note')
                ->method('createOrUpdate')
                ->canSee($this->place->exists),

            Button::make('Remove')
                ->icon('trash')
                ->method('remove')
                ->canSee($this->place->exists),
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
                Input::make('place.name')
                    ->title('Place Name')
                    ->placeholder('Enter Place Name'),
            ])
        ];
    }

    public function createOrUpdate(Place $place, Request $request): \Illuminate\Http\RedirectResponse
    {
        $place->fill($request->get('place'))->save();

        Alert::info('Place was saved.');

        return redirect()->route('platform.systems.places');
    }
}
