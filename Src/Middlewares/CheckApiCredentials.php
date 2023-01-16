<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Facades\Middleware\BaseMiddleware;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class CheckApiCredentials extends BaseMiddleware
{
    public function handle()
    {
        $request = new Request;
        $data = $request->all();

        if(count($data) > 3){
            $credential     = new ApiCredentials;

            $searchForCredentials    = $credential->select('client_id')->get();

            if (empty($searchForCredentials)) {
                return Response::json([
                    'message' => 'Note: You have to store Api credentials first.',
                ], 422);
            }
        }
        
    }
}
