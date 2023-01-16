<?php

namespace Tecsee\Calendar\Controllers\Frontend;

use Mahaelshawardy\MvcCore\Helpers\Response;
use Tecsee\Calendar\Models\Appointment;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Tecsee\Calendar\Requests\Frontend\Appointment\AppointmentStoreRequest;
use Tecsee\Calendar\Requests\Frontend\Appointment\AppointmentUpdateRequest;
use JTL\Session\Frontend;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use JTL\Shop;

class AppointmentController
{
    public function index(Request $request)
    {
        $smarty = Shop::Smarty();
        $customer = Frontend::getCustomer();
        $customerId = $customer->kKunde;
        $hostLang = $_SERVER['REQUEST_URI'];
        if ($hostLang === '/mein-kalender') {
            $myAppointments = Appointment::select('tec_see_appointments.*', 'events.title_de', 'events.location_de', 'events.start_time', 'events.end_time', 'events.description_de')
                ->join('events', 'events.id', '=', 'tec_see_appointments.event_id')
                ->where('customer_id', $customerId)->get();
        } else {
            $myAppointments = Appointment::select('tec_see_appointments.*', 'events.title_en', 'events.location_en', 'events.start_time', 'events.end_time', 'events.description_en')
                ->join('events', 'events.id', '=', 'tec_see_appointments.event_id')
                ->where('customer_id', $customerId)->get();
        }

        foreach ($myAppointments as $appointment) {
            $appointment->title = isset($appointment->title_en) ? $appointment->title_en : $appointment->title_de;
            $appointment->location = isset($appointment->location_en) ? $appointment->location_en : $appointment->location_de;
            $appointment->description = isset($appointment->description_en) ? $appointment->description_en : $appointment->description_de;
            $getreserve[] = $appointment;
        }
        if (isset($getreserve)) {
            $smarty->assign('appointments', $getreserve);
        }
    }

    public function store(AppointmentStoreRequest $request, Appointment $appointment)
    {
        $validatedData = $request->validated();
        $customer          = Frontend::getCustomer();
        $customerId = $customer->kKunde;
        $validatedData['customer_id'] = $customerId;
        $appointment = $appointment->select('id')->where([
            ['customer_id', '=', $customerId],
            ['event_id', '=', $validatedData['id']],
            ['status', '=', 'reserved']
        ], 'AND')->first();
        if (isset($appointment->id)) {
            return Response::json([
                'message' => 'you cant book two events on the same day'
            ], 422);
        }
        $appointment = Appointment::create([
            'customer_id' => $customerId,
            'event_id' => $validatedData['id'],
            'status' => 'reserved'
        ])->get();
        return Response::json([
            'message' => 'Appointment is created successfully',
            'appointment' => $appointment
        ], 201);
    }

    public function update(AppointmentUpdateRequest $request)
    {
        $validatedData = $request->validated();
        Appointment::where('id', $validatedData['id'])->update([
            'status' => $validatedData['status']
        ]);
        return Response::json([
            'message' => 'Appointment is updated successfully'
        ], 200);
    }
}
