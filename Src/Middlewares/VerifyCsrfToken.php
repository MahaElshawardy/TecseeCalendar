<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Authentication\CsrfAuthentication;
use Mahaelshawardy\MvcCore\Support\Facades\Middleware\BaseMiddleware;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Support\Http\Header;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Tecsee\Calendar\Support\Plugin;

class VerifyCsrfToken extends BaseMiddleware
{
    public function handle()
    {
        $plugin = new Plugin();
        if ((Request::type() === 'POST') || (Request::type() === 'PUT') || (Request::type() === 'DELETE')) {

            if ((Header::has('Jtl-Token') === false) || (empty(Header::get('Jtl-Token')))) {
                return Response::json([
                    'message' => (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->translate('messages', 'unauthenticated'),
                ], 403);
            }
            if (!CsrfAuthentication::validate_token(Header::get('Jtl-Token'))) {
                return Response::json([
                    'message' => (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->translate('messages', 'unauthenticated'),
                ], 403);
            }
        }
    }
}
