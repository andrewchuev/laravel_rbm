<?php

namespace App\Orchid\Screens\Place;

use App\Models\Area;
use App\Models\Place;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;
use Orchid\Support\Facades\Toast;

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
        return $this->place->exists ? 'Изменить место' : 'Создать новое место';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Button::make('Добавить')
                ->icon('pencil')
                ->method('createOrUpdate')
                ->canSee(!$this->place->exists),

            Button::make('Обновить')
                ->icon('note')
                ->method('createOrUpdate')
                ->canSee($this->place->exists),

            Button::make('Удалить')
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
                    ->title('Название')->required(),
                Select::make('place.area_id')
                    ->title('Участок')
                    ->fromModel(Area::class, 'name')->empty('Не выбран')->required(),
                Input::make('place.color')
                    ->type('color')
                    ->title('Цвет рамки')
                    ->value('#563d7c')
                    ->horizontal(),
                Input::make('place.fill_color')
                    ->type('color')
                    ->title('Цвет заливки')
                    ->value('#с2с2с2')
                    ->horizontal(),
                Input::make('place.latlng_center')->title('Координаты центра' ),
                Input::make('place.latlng_lb')->title('Левый нижний' ),
                Input::make('place.latlng_lt')->title('Левый верхний' ),
                Input::make('place.latlng_rt')->title('Правый верхний' ),
                Input::make('place.latlng_rb')->title('Правый нижний' ),
            ])
        ];
    }

    public function createOrUpdate(Place $place, Request $request): \Illuminate\Http\RedirectResponse
    {
        //dd($request->get('place'));
        $place->fill($request->get('place'))->save();

        Alert::info('Place was saved.');

        return redirect()->route('platform.places');
    }

    public function remove(Place $place)
    {
        $place->delete();

        Toast::info(__('Место удалено.'));

        return redirect()->route('platform.places');
    }
}
