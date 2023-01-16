<?php

namespace Tecsee\Calendar\Controllers\Admin;

use Carbon\Carbon;
use Tecsee\Calendar\Models\Appointment;
use Tecsee\Calendar\Models\Event;

class CronJobController{

    public function updateStatusWiting()
    {
        $event = Event::select('id','start_time')
        ->where('status','waiting')
        ->where('start_time','<=',Carbon::now()->toDateTimeString())
        ->first();
        if (isset($event->start_time)) {
            Event::where('id',$event->id)->update(
               [ 'status' => 'started']
            );
        }
        // Debugger::die_and_dump(Carbon::now()->toDateString());
        // Debugger::die_and_dump($event);
    }
    public function update()
    {
        $event = Event::
        where('status','started')
        ->where('end_time','<=',Carbon::now()->toDateTimeString())
        ->first();
        if (isset($event)) {
            # code...
            Appointment::where('event_id',$event->id)->update(['status'=>'finished']);
            Event::where('id',$event->id)->update(['status'=>'finished']);
        }
        // Debugger::die_and_dump($event->id);
    }
}