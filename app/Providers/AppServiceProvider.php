<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Observers\VisitObserver;
use App\Models\Visit;
use Orchid\Screen\TD;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        TD::macro('multiline', function () {

            $column = $this->column;

            $this->render(function ($datum) use ($column) {
                return view('partials.layouts.th',[
                    'multiline' => $datum->$column
                ]);
            });

            return $this;
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Visit::observe(VisitObserver::class);
    }
}
