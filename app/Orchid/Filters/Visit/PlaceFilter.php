<?php

namespace App\Orchid\Filters\Visit;

use App\Models\Place;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Orchid\Filters\Filter;
use Orchid\Screen\Field;
use Orchid\Screen\Fields\Select;

class PlaceFilter extends Filter
{
    /**
     * The displayable name of the filter.
     *
     * @return string
     */
    public function name(): string
    {
        return 'Место';
    }

    /**
     * The array of matched parameters.
     *
     * @return array|null
     */
    public function parameters(): ?array
    {
        return ['place_id', 'name'];
    }

    /**
     * Apply to a given Eloquent query builder.
     *
     * @param Builder $builder
     *
     * @return Builder
     */
    public function run(Builder $builder): Builder
    {
        return $builder->where('place_id', $this->request->get('place_id'));
    }

    /**
     * Get the display fields.
     *
     * @return Field[]
     */
    public function display(): iterable
    {
        $query = Place::select("places.id as id", DB::raw("CONCAT(places.name, ' - ' , areas.name) as name"))
            ->leftJoin('areas', 'areas.id', '=', 'places.area_id');

        return [
            Select::make('place_id')
                ->fromQuery($query, 'name')
                ->title('Место')
                ->value($this->request->get('place_id'))
                ->empty('Не выбрано')
        ];
    }
}
