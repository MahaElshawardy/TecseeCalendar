<?php

namespace Tecsee\Calendar\Controllers\Frontend;

use Carbon\Carbon;
use JTL\Shop;
use Tecsee\Calendar\Models\Event;
use Tecsee\Calendar\Services\UploadingService;

class EventController
{
    public function index()
    {
        $hostLang = $_SERVER['REQUEST_URI'];
        if ($hostLang === '/Calendar') {
            $events = Event::select('id','title_en', 'description_en', 'location_en', 'image', 'start_time', 'end_time', 'facebook_url', 'twitter_url')
                ->get();
        } else {
            $events = Event::select('id','title_de', 'description_de', 'location_de', 'image', 'start_time', 'end_time', 'facebook_url', 'twitter_url')
                ->get();
        }
        $smarty        = Shop::Smarty();
        $filePath = new UploadingService;
        $uploads = $filePath->get_path('events');
        foreach ($events as $event) {
            $event->image = $uploads . $event->image;
            $day1 = $event->start_time;
            $day2 = $event->end_time;
            $event->duration = Carbon::parse("$day2")->diffForHumans("$day1");
            $event->start_date = Carbon::parse($event->start_time)->toDateString();
            $event->start_day = Carbon::parse($event->start_time)->day;
            $event->start_time = Carbon::parse($event->start_time)->format('g:i A');
            $event->end_date = Carbon::parse($event->end_time)->toDateString();
            $event->end_day = Carbon::parse($event->end_time)->day;
            $event->end_time = Carbon::parse($event->end_time)->format('g:i A');
            $event->start_month = Carbon::parse($event->start_time)->getTranslatedShortMonthName('MMMM');
            $event->title = isset($event->title_en) ? $event->title_en : $event->title_de;
            $event->description = isset($event->description_en) ? $event->description_en : $event->description_de;
            $event->location = isset($event->location_en) ? $event->location_en : $event->location_de;
            $getEvents[] = $event;
        }
        if (isset($getEvents)) {
            $smarty->assign('events', $events);
        }
    }
}
