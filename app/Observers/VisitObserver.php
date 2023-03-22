<?php

namespace App\Observers;

use App\Models\Visit;

class VisitObserver
{
    /**
     * Handle the Visit "created" event.
     *
     * @param  \App\Models\Visit  $visit
     * @return void
     */
    public function created(Visit $visit)
    {
        file_put_contents(__DIR__ . '/debug-visit-create.txt', print_r($visit, true), FILE_APPEND);
    }

    /**
     * Handle the Visit "updated" event.
     *
     * @param  \App\Models\Visit  $visit
     * @return void
     */
    public function updated(Visit $visit)
    {
        //
    }

    /**
     * Handle the Visit "deleted" event.
     *
     * @param  \App\Models\Visit  $visit
     * @return void
     */
    public function deleted(Visit $visit)
    {
        //
    }

    /**
     * Handle the Visit "restored" event.
     *
     * @param  \App\Models\Visit  $visit
     * @return void
     */
    public function restored(Visit $visit)
    {
        //
    }

    /**
     * Handle the Visit "force deleted" event.
     *
     * @param  \App\Models\Visit  $visit
     * @return void
     */
    public function forceDeleted(Visit $visit)
    {
        //
    }
}
