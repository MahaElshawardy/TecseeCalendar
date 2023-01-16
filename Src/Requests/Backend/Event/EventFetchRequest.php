<?php

namespace Tecsee\Calendar\Requests\Backend\Product;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class EventFetchRequest extends Request
{
    use ValidationTrait;
    
    public function rules()
    {
        return [
            'fetch' => 'required',
        ];
    }
    
}