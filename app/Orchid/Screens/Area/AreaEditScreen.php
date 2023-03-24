<?php

namespace App\Orchid\Screens\Area;

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

class AreaEditScreen extends Screen
{

    public Area $area;

    /**
     * Fetch data to be displayed on the screen.
     *
     * @return array
     */
    public function query(Area $area): iterable
    {
        return [
            'area' => $area
        ];
    }

    /**
     * The name of the screen displayed in the header.
     *
     * @return string|null
     */
    public function name(): ?string
    {
        return $this->area->exists ? 'Edit area' : 'Creating a new area';
    }

    /**
     * The screen's action buttons.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): iterable
    {
        return [
            Button::make('Create Area')
                ->icon('pencil')
                ->method('createOrUpdate')
                ->canSee(!$this->area->exists),

            Button::make('Update')
                ->icon('note')
                ->method('createOrUpdate')
                ->canSee($this->area->exists),

            Button::make('Remove')
                ->icon('trash')
                ->method('remove')
                ->canSee($this->area->exists),
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
                Input::make('area.name')
                    ->title('Area Name')
                    ->placeholder('Enter Area Name'),

            ])
        ];
    }

    public function createOrUpdate(Area $area, Request $request): \Illuminate\Http\RedirectResponse
    {
        $area->fill($request->get('area'))->save();

        Alert::info('Area was saved.');

        return redirect()->route('platform.systems.areas');
    }

    public function remove(Area $area)
    {
        $area->delete();

        Toast::info(__('Area was removed'));

        return redirect()->route('platform.systems.areas');
    }
}
