<?php

namespace Tecsee\Calendar\Models;

use Illuminate\Database\Eloquent\Model;

class Tkategorieartikel extends Model
{
    protected $table = 'tkategorieartikel';
    public $timestamps = false;

    protected $primaryKey  = 'kKategorieArtikel';

    protected $fillable = [
        'kArtikel',
        'kKategorie',
    ];

}
