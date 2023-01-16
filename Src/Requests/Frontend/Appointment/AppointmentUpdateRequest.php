<?php

namespace Tecsee\Calendar\Requests\Frontend\Appointment;

use Mahaelshawardy\MvcCore\Traits\ValidationTrait;
use Mahaelshawardy\MvcCore\Support\Http\Request;

class AppointmentUpdateRequest extends Request
{
    use ValidationTrait;

    public function rules()
    {
        return [
            // 'time' => 'required',
            // 'day' => 'required',
        ];
    }
}
