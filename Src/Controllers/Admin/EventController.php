<?php

namespace Tecsee\Calendar\Controllers\Admin;

use JTL\Shop;
use Carbon\Carbon;
use Tecsee\Calendar\Models\Event;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Illuminate\Pagination\Paginator;
use Tecsee\Calendar\Models\Appointment;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Tecsee\Calendar\Services\UploadingService;
use Tecsee\Calendar\Requests\Backend\Event\EventStoreRequest;
use Tecsee\Calendar\Requests\Backend\Event\EventDeleteRequest;
use Tecsee\Calendar\Requests\Backend\Event\EventUpdateRequest;

class EventController
{
    public function index()
    {
        $smarty = Shop::Smarty();
        $events = Event::paginate(5);
        $smarty->assign('events', $events);
    }

    public function getEvent(Request $request)
    {
        $data = $request->all();
        $currentPage = $data['page'];
        Paginator::currentPageResolver(function () use ($currentPage) {
            return $currentPage;
        });
        $events = Event::paginate(5);
        return Response::json($events, 200);
    }

    public function store(EventStoreRequest $request)
    {
        $validatedData = $request->validated();
        $event = Event::where('title_en', $validatedData['titleEN'])
            ->where('title_de', $validatedData['titleDE'])
            ->where('description_en', $validatedData['descriptionEN'])
            ->where('description_de', $validatedData['descriptionDE'])
            ->where('location_en', $validatedData['locationEN'])
            ->where('location_de', $validatedData['locationDE'])
            ->where('start_time', $validatedData['eventstartdate'])
            ->where('end_time', $validatedData['eventenddate'])
            ->where('facebook_url', $validatedData['facebook'])
            ->where('twitter_url', $validatedData['twitter'])
            ->first();
        if (isset($event)) {
            return Response::json([
                'message' => "this event is already created"
            ], 422);
        }
        try {
            if (isset($_FILES['fileField'])) {
                $file = $_FILES['fileField'];
                $fileUpload = new UploadingService;
                $fileName = $fileUpload->uploadFile($file, 'events');
            }
        } catch (\Exception $e) {
            return $e->getMessage();
        }
        Event::create(
            [
                'title_en' => $validatedData['titleEN'],
                'title_de' => $validatedData['titleDE'],
                'description_en' => $validatedData['descriptionEN'],
                'description_de' => $validatedData['descriptionDE'],
                'location_en' => $validatedData['locationEN'],
                'location_de' => $validatedData['locationDE'],
                'image' => $fileName,
                'status' => Carbon::parse($validatedData['eventstartdate'])->toDateString() === Carbon::now()->toDateString() ? 'Started' :'Waiting',
                'start_time' => $validatedData['eventstartdate'],
                'end_time' => $validatedData['eventenddate'],
                'facebook_url' => $validatedData['facebook'],
                'twitter_url' => $validatedData['twitter'],
            ]
        );
        return Response::json(['message' => 'Record is created successfully'], 201);
    }

    public function update(EventUpdateRequest $request)
    {
        $validatedData = $request->validated();
        if (isset($_FILES['image']['name'])) {
            $file = $_FILES['image'];
            $fileUpload = new UploadingService;
            $fileName = $fileUpload->uploadFile($file, 'events');
            Event::where('id', $validatedData['id'])->update(
                [
                    'title_en' => $validatedData['title-en'],
                    'title_de' => $validatedData['title-du'],
                    'description_en' => $validatedData['description-en'],
                    'description_de' => $validatedData['description-du'],
                    'location_en' => $validatedData['location-en'],
                    'location_de' => $validatedData['location-du'],
                    'image' => $fileName,
                    'status' => Carbon::parse($validatedData['start-date'])->toDateString() === Carbon::now()->toDateString() ? 'Started' :'Waiting',
                    'start_time' => $validatedData['start-date'],
                    'end_time' => $validatedData['end-date'],
                    'facebook_url' => $validatedData['facebook'],
                    'twitter_url' => $validatedData['twitter']
                ]
            );
        } else {
            Event::where('id', $validatedData['id'])->update(
                [
                    'title_en' => $validatedData['title-en'],
                    'title_de' => $validatedData['title-du'],
                    'description_en' => $validatedData['description-en'],
                    'description_de' => $validatedData['description-du'],
                    'location_en' => $validatedData['location-en'],
                    'location_de' => $validatedData['location-du'],
                    'status' => Carbon::parse($validatedData['start-date'])->toDateString() === Carbon::now()->toDateString() ? 'Started' :'Waiting',
                    'start_time' => $validatedData['start-date'],
                    'end_time' => $validatedData['end-date'],
                    'facebook_url' => $validatedData['facebook'],
                    'twitter_url' => $validatedData['twitter']
                ]
            );
        }
        return Response::json(['message' => 'Record is updated successfully'], 200);
    }

    public function destroy(EventDeleteRequest $request)
    {
        $params = $request->get_route_params();
        Appointment::where('event_id', $params['id'])->delete();
        Event::where('id', $params['id'])->delete();
        return Response::json(['message' => 'Record is deleted successfully'], 200);
    }

    public function updateStatus(EventUpdateRequest $request)
    {
        $params = $request->get_route_params();
        $validatedData = $request->validated();
        if (isset($validatedData['status']) ==='') {
            # code...
        }
        Event::where('id', $params['id'])->update(
            ['status'=>$validatedData['status']]
        );
        return Response::json(['message' => 'Status is updated successfully'], 200);
    }
}
