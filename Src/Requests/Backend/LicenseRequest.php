<?php

namespace Tecsee\Calendar\Requests\Backend;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class LicenseRequest extends Request
{
    use ValidationTrait;
    
    public function rules()
    {
        return [
            'email' => 'required',
            'licensekey' => 'required'
        ];
    }
}