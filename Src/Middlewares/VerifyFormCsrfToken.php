<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Authentication\CsrfAuthentication;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Helpers\ArrayValidator;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Validations\Alerts;
use Tecsee\Calendar\Support\Plugin;

class VerifyFormCsrfToken
{
    public static function handle()
    {
        $plugin = new Plugin();
        if ((Request::type() === 'POST') || (Request::type() === 'PUT') || (Request::type() === 'DELETE')) {
            $request = new Request();
            $requestData = $request->all();
            $arrayValidator = new ArrayValidator($requestData);
            if ($arrayValidator->array_keys_exists('jtl_token')) {
                if (!CsrfAuthentication::validate_token($requestData['jtl_token'])) {
                    Alerts::show('danger', ['message' => (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->translate('messages', 'unauthenticated')]);
                }
            } else {
                Alerts::show('danger', ['message' => (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->translate('messages', 'unauthenticated')]);
            }
        }
    }
}
