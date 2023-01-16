<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Middleware\BaseMiddleware;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Support\Http\Header;
use Mahaelshawardy\MvcCore\Support\Http\Server;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Tecsee\Calendar\Support\Plugin;


class VerifyAjaxRequest extends BaseMiddleware
{
    public function handle()
    {
        $plugin = new Plugin();

        if (!!stripos(Server::previous_url(), 'paypal')) {
            return;
        }

        if (!(Header::has('Accept') && explode(',', Header::get('Accept'))[0] === 'application/json')) {
            return Response::json([
                'message' => (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->translate('messages', 'unauthenticated'),
            ], 403);
        }
    }
}
