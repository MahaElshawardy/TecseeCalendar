<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;

class Twarenkorbper extends Model
{
    protected $table = 'kWarenkorbPers';

    protected $primaryKey  = 'kKunde';

    protected $fillable = [
        'dErstellt',
    ];

}