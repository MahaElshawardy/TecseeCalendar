<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;


class Event extends Model
{

    protected $table    = 'events';

    protected $primaryKey  = 'id';

    protected $fillable = [
        'title_en',
        'title_de',
        'description_en',
        'description_de',
        'location_en',
        'location_de',
        'image',
        'start_time',
        'end_time',
        'facebook_url',
        'twitter_url',
        'status'
    ];
}
