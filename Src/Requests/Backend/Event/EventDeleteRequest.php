<?php

namespace Tecsee\Calendar\Requests\Backend\Event;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class EventDeleteRequest extends Request
{
    use ValidationTrait;


    
    public function rules()
    {
        return [
            // 'id'=>'required',
        ];
    }
    
}