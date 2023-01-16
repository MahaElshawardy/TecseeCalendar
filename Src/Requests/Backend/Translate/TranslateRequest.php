<?php

namespace Tecsee\Calendar\Requests\Backend\Translate;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class TranslateRequest extends Request
{
    use ValidationTrait;



    public function rules()
    {
        return [];
    }
}
