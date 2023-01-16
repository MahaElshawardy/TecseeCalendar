<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;

class Twarenkorbperspos extends Model
{
    protected $table = 'twarenkorbperspos';

    protected $primaryKey  = 'kWarenkorbPersPos';

    protected $fillable = [
        'kWarenkorbPers',
        'kArtikel',
        'cArtikelName',
        'fAnzahl',
        'dHinzugefuegt',
        'cUnique',
        'cResponsibility',
        'kKonfigitem',
        'nPosTyp',
    ];

}


