<?php

namespace Tecsee\Calendar\Controllers\Admin;

use Mahaelshawardy\MvcCore\Helpers\Response;
use Tecsee\Calendar\Models\Appointment;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Illuminate\Pagination\Paginator;
use JTL\Shop;

class AppointmentController
{

    public function index()
    {
        $smarty = Shop::Smarty();
        $appointments = Appointment::with('customer','event')->paginate(5);
        $smarty->assign('appointments', $appointments);
    }

    public function getAppointments(Request $request)
    {
        $data = $request->all();
        $currentPage = $data['page'];
        Paginator::currentPageResolver(function () use ($currentPage) {
            return $currentPage;
        });
        $appointments = Appointment::with('customer','event')->paginate(5);
        return Response::json(['reservation'=>  $appointments], 200);
    }
}
