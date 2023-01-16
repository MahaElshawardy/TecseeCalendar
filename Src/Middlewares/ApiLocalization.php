<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Middleware\BaseMiddleware;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Lang;
use Mahaelshawardy\MvcCore\Support\Http\Header;

class ApiLocalization extends BaseMiddleware
{
    public function handle()
    {
        if (Header::has('Content-Lang')) {
            Lang::set(Header::get('Content-Lang') ?? null);
        }
    }
}
