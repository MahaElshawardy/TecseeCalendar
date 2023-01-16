<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    protected $table    = 'tec_see_appointments';

    protected $primaryKey  = 'id';

    protected $fillable = [
        'event_id',
        'status',
        'customer_id',
    ];

    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id');
    }

    public function event()
    {
        return $this->belongsTo(Event::class, 'event_id');
    }
}