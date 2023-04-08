<?php

declare(strict_types=1);

use App\Orchid\Screens\Examples\ExampleCardsScreen;
use App\Orchid\Screens\Examples\ExampleChartsScreen;
use App\Orchid\Screens\Examples\ExampleFieldsAdvancedScreen;
use App\Orchid\Screens\Examples\ExampleFieldsScreen;
use App\Orchid\Screens\Examples\ExampleLayoutsScreen;
use App\Orchid\Screens\Examples\ExampleScreen;
use App\Orchid\Screens\Examples\ExampleTextEditorsScreen;
use App\Orchid\Screens\Area\AreaListScreen;
use App\Orchid\Screens\PlatformScreen;
use App\Orchid\Screens\Role\RoleEditScreen;
use App\Orchid\Screens\Role\RoleListScreen;
use App\Orchid\Screens\User\UserEditScreen;
use App\Orchid\Screens\User\UserListScreen;
use App\Orchid\Screens\User\UserProfileScreen;
use App\Orchid\Screens\Driver\DriverListScreen;
use App\Orchid\Screens\Place\PlaceListScreen;
use App\Orchid\Screens\Driver\DriverEditScreen;
use Illuminate\Support\Facades\Route;
use App\Orchid\Screens\Visit\VisitListScreen;
use Tabuna\Breadcrumbs\Trail;
use App\Orchid\Screens\Place\PlaceEditScreen;
use App\Orchid\Screens\Area\AreaEditScreen;
use App\Orchid\Screens\Map\MapScreen;

/*
|--------------------------------------------------------------------------
| Dashboard Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the need "dashboard" middleware group. Now create something great!
|
*/

// Main
Route::screen('/main', PlatformScreen::class)
    ->name('platform.main');

// Platform > Profile
Route::screen('profile', UserProfileScreen::class)
    ->name('platform.profile')
    ->breadcrumbs(fn(Trail $trail) => $trail
        ->parent('platform.index')
        ->push(__('Profile'), route('platform.profile')));

// Platform > System > Users > User
Route::screen('users/{user}/edit', UserEditScreen::class)
    ->name('platform.systems.users.edit')
    ->breadcrumbs(fn(Trail $trail, $user) => $trail
        ->parent('platform.systems.users')
        ->push($user->name, route('platform.systems.users.edit', $user)));

// Platform > System > Users > Create
Route::screen('users/create', UserEditScreen::class)
    ->name('platform.systems.users.create')
    ->breadcrumbs(fn(Trail $trail) => $trail
        ->parent('platform.systems.users')
        ->push(__('Create'), route('platform.systems.users.create')));

// Platform > System > Users
Route::screen('users', UserListScreen::class)
    ->name('platform.systems.users')
    ->breadcrumbs(fn(Trail $trail) => $trail
        ->parent('platform.index')
        ->push(__('Users'), route('platform.systems.users')));

// Platform > System > Roles > Role
Route::screen('roles/{role}/edit', RoleEditScreen::class)
    ->name('platform.systems.roles.edit')
    ->breadcrumbs(fn(Trail $trail, $role) => $trail
        ->parent('platform.systems.roles')
        ->push($role->name, route('platform.systems.roles.edit', $role)));

// Platform > System > Roles > Create
Route::screen('roles/create', RoleEditScreen::class)
    ->name('platform.systems.roles.create')
    ->breadcrumbs(fn(Trail $trail) => $trail
        ->parent('platform.systems.roles')
        ->push(__('Create'), route('platform.systems.roles.create')));

// Platform > System > Roles
Route::screen('roles', RoleListScreen::class)
    ->name('platform.systems.roles')
    ->breadcrumbs(fn(Trail $trail) => $trail
        ->parent('platform.index')
        ->push(__('Roles'), route('platform.systems.roles')));



// Platform > System > Drivers
Route::screen('drivers', DriverListScreen::class)->name('platform.drivers')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.index')->push(__('Drivers'), route('platform.drivers')));

// Platform > System > Drivers > Driver
Route::screen('drivers/{driver}/edit', DriverEditScreen::class)
    ->name('platform.drivers.edit')
    ->breadcrumbs(fn(Trail $trail, $user) => $trail
        ->parent('platform.drivers')
        ->push($user->name, route('platform.drivers.edit', $user)));

// Platform > System > Drivers > Create
Route::screen('drivers/create', DriverEditScreen::class)->name('platform.drivers.create')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.drivers')->push(__('Create'), route('platform.drivers.create')));

// Platform > System > Areas
Route::screen('areas', AreaListScreen::class)->name('platform.systems.areas')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.index')->push(__('Areas'), route('platform.systems.areas')));
// Platform > System > Areas > Create
Route::screen('areas/create', AreaEditScreen::class)->name('platform.systems.areas.create')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.systems.areas')->push(__('Create'), route('platform.systems.areas.create')));


// Platform > System > Areas > Area
Route::screen('areas/{area}/edit', AreaEditScreen::class)->name('platform.systems.areas.edit')
    ->breadcrumbs(fn(Trail $trail, $user) => $trail->parent('platform.systems.areas')->push($user->name, route('platform.systems.areas.edit', $user)));

// Platform > System > Places
Route::screen('places', PlaceListScreen::class)->name('platform.systems.places')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.index')->push(__('Places'), route('platform.systems.places')));
// Platform > System > Places > Create
Route::screen('places/create', PlaceEditScreen::class)->name('platform.systems.places.create')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.systems.places')->push(__('Create'), route('platform.systems.places.create')));


// Platform > System > Places > Place
Route::screen('places/{place}/edit', PlaceEditScreen::class)->name('platform.systems.places.edit')
    ->breadcrumbs(fn(Trail $trail, $user) => $trail->parent('platform.systems.places')->push($user->name, route('platform.systems.places.edit', $user)));



// Platform > System > Visits
Route::screen('visits', VisitListScreen::class)->name('platform.systems.visits')
    ->breadcrumbs(fn(Trail $trail) => $trail->parent('platform.index')->push(__('Visits'), route('platform.systems.visits')));


Route::screen('map', MapScreen::class)->name('platform.systems.map');

// Example...
/*Route::screen('example', ExampleScreen::class)
    ->name('platform.example')
    ->breadcrumbs(fn (Trail $trail) => $trail
        ->parent('platform.index')
        ->push('Example screen'));

Route::screen('example-fields', ExampleFieldsScreen::class)->name('platform.example.fields');
Route::screen('example-layouts', ExampleLayoutsScreen::class)->name('platform.example.layouts');
Route::screen('example-charts', ExampleChartsScreen::class)->name('platform.example.charts');
Route::screen('example-editors', ExampleTextEditorsScreen::class)->name('platform.example.editors');
Route::screen('example-cards', ExampleCardsScreen::class)->name('platform.example.cards');
Route::screen('example-advanced', ExampleFieldsAdvancedScreen::class)->name('platform.example.advanced');*/

//Route::screen('idea', Idea::class, 'platform.screens.idea');






