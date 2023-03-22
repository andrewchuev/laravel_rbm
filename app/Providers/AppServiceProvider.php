<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Observers\VisitObserver;
use App\Models\Visit;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
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
