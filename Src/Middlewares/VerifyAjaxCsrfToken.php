<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Authentication\CsrfAuthentication;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Helpers\Response;

class VerifyAjaxCsrfToken
{
    public static function handle()
    {
        if ((Request::type() === 'POST') || (Request::type() === 'PUT') || (Request::type() === 'DELETE')) {
            $request = new Request();
            $requestData = $request->all();
            if ((isset($requestData['jtl_token']) === false) || (empty(trim($requestData['jtl_token'])))) {
                return Response::json([
                    'message' => 'unauthenticated',
                ], 403);
            }
            if ( CsrfAuthentication::validate_token($requestData['jtl_token']) ) {
                return Response::json([
                    'message' => 'unauthenticated',
                ], 403);
            }
        }
    }
}
