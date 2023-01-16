<?php

namespace Tecsee\Calendar\Services;

use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Support\Facades\Router\Route;
use Mahaelshawardy\MvcCore\Exceptions\DatabaseQueryException;
use Mahaelshawardy\MvcCore\Exceptions\RouteNotFoundException;
use Tecsee\Calendar\Database\Initialization\Database;

class RoutesService
{   
    private Database $database;

    public function __construct()
    {
        $this->database = new Database();
        $this->database->connect();
    }

    
    public function backend_executions()
    {
        Route::execute('Tecsee\Calendar\Controllers\Admin\LicenseController@index');
        Route::execute('Tecsee\Calendar\Controllers\Admin\EventController@index');
        Route::execute('Tecsee\Calendar\Controllers\Admin\CronJobController@updateStatusWiting');
        Route::execute('Tecsee\Calendar\Controllers\Admin\CronJobController@update');
        Route::execute('Tecsee\Calendar\Controllers\Admin\AppointmentController@index');
    }

    public function backend_endpoints()
    {
        MiddlewaresService::load();

        Route::group(['Localization', 'Ajax'], function () {

            Route::post('/licensekey/calendar', 'Tecsee\Calendar\Controllers\Admin\LicenseController@verifyCalendar');
            Route::post('/get/event', 'Tecsee\Calendar\Controllers\Admin\EventController@getEvent');
            Route::post('/add/event', 'Tecsee\Calendar\Controllers\Admin\EventController@store');
            Route::post('/update/event/{id}', 'Tecsee\Calendar\Controllers\Admin\EventController@update');
            Route::post('/delete/event/{id}', 'Tecsee\Calendar\Controllers\Admin\EventController@destroy');
            Route::post('/update/status/{id}', 'Tecsee\Calendar\Controllers\Admin\EventController@updateStatus');
            Route::post('/translate', 'Tecsee\Calendar\Controllers\Admin\TranslateController@index');
            Route::post('/set/translate', 'Tecsee\Calendar\Controllers\Admin\TranslateController@set_translation');
            Route::post('/get/appointment', 'Tecsee\Calendar\Controllers\Admin\AppointmentController@getAppointments');
        });
         try {
            Route::resolveApi(Request::uri(), Request::type());
         } catch (RouteNotFoundException $exception) {
             return Response::json(['message' => $exception->getMessage()], 404);
         } catch (DatabaseQueryException $exception) {
             return Response::json(['message' => $exception->getMessage()], 422);
         }
    }

    public function frontend_executions()
    {
        Route::execute('Tecsee\Calendar\Controllers\Admin\LicenseController@index');
        Route::execute('Tecsee\Calendar\Controllers\Frontend\PluginInterFaceController@interface_smarty');
        Route::execute('Tecsee\Calendar\Controllers\Frontend\EventController@index');
        Route::execute('Tecsee\Calendar\Controllers\Frontend\AppointmentController@index');
        Route::execute('Tecsee\Calendar\Controllers\Admin\CronJobController@updateStatusWiting');
        Route::execute('Tecsee\Calendar\Controllers\Admin\CronJobController@update');
    }


    public function frontend_endpoints()
    {
        MiddlewaresService::load();

        Route::group(['Localization', 'Ajax'], function () {
            Route::post('/store/appointment', 'Tecsee\Calendar\Controllers\Frontend\AppointmentController@store');
            Route::post('/update/appointment/{id}', 'Tecsee\Calendar\Controllers\Frontend\AppointmentController@update');
            Route::post('/get/plugin-interface', 'Tecsee\Calendar\Controllers\Frontend\PluginInterFaceController@interface_respons');
        });
        try {
            Route::resolveApi(Request::uri(), Request::type());
        } catch (RouteNotFoundException $exception) {
            return Response::json(['message' => $exception->getMessage()], 404);
        } catch (DatabaseQueryException $exception) {
            return Response::json(['message' => $exception->getMessage()], 422);
        }
    }
}
