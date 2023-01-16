<?php

namespace Tecsee\Calendar\Requests\Backend\Event;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class EventStoreRequest extends Request
{
    use ValidationTrait;



    public function rules()
    {
        return [
            // 'title_en' => 'required',
            // 'title_de' => 'required',
            // 'description_en' => 'required',
            // 'description_de' => 'required',
            // 'location_en' => 'required',
            // 'location_de' => 'required',
            // 'image' => 'required',
            // 'start_time' => 'required',
            // 'end_time' => 'required',
            // 'facebook_url' => 'required',
            // 'twitter_url' => 'required',
        ];
    }
}
