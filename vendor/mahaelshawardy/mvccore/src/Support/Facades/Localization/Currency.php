<?php

namespace Mahaelshawardy\MvcCore\Support\Facades\Localization;

use Mahaelshawardy\MvcCore\Support\Http\Session;

class Currency
{
    public static function get(): string
    {
        $session = new Session();
        return $session->get_session()['cWaehrungName'];
    }

    public static function set($currency): string
    {
        $session = new Session();
        return $session->add_items(['cWaehrungName' => $currency])['cWaehrungName'];;
    }
}
