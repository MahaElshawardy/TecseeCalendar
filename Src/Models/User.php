<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'tkunde';

    protected $primaryKey  = 'kKunde';
    public $timestamps = false;
    protected $fillable = [
        'kSprache',
        'cKundenNr',
        'cPasswort',
        'cAnrede',
        'cTitel',
        'cVorname',
        'cNachname',
        'cFirma',
        'cZusatz',
        'cStrasse',
        'cHausnummer',
        'cAdressZusatz',
        'cPLZ',
        'cOrt',
        'cBundesland',
        'cLand',
        'cTel',
        'cMobil',
        'cFax',
        'cMail',
        'cUSTID',
        'cWWW',
        'cSperre',
        'fGuthaben',
        'cNewsletter',
        'dGeburtstag',
        'fRabatt',
        'cHerkunft',
        'dErstellt',
        'dVeraendert',
        'cAktiv',
        'cAbgeholt',
        'nRegistriert',
        'nLoginversuche',
        'kKundengruppe'
    ];
}
