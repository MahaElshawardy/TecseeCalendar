<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Helpers\Response;
use JTL\Session\Frontend;

class VerifyUserLogin
{
    public static function handle()
    {
        $customer = Frontend::getCustomer();
        $customerId = $customer->kKunde;

        if (empty($customerId)) {
            return Response::json([
                'message' => 'unauthenticated',
            ], 403);
        }
    }
}
