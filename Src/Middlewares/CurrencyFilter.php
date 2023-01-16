<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Localization\Currency;
use Mahaelshawardy\MvcCore\Support\Facades\Middleware\BaseMiddleware;
use Mahaelshawardy\MvcCore\Support\Http\Header;

class CurrencyFilter extends BaseMiddleware
{
    public function handle()
    {
        if (Header::has('Content-Currency')) {
            Currency::set(Header::get('Content-Currency'));
        }
    }
}
