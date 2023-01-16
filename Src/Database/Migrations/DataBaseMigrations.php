<?php

namespace Tecsee\Calendar\Database\Migrations;

use Tecsee\Calendar\Database\Initialization\Migration;

class DataBaseMigrations extends Migration
{
    public function up()
    {
        $this->call([ 
            EventsTable::class,
            AppointmentsTable::class
        ], 'up');
    }

    public function down()
    {
        $this->call([
            EventsTable::class,
            AppointmentsTable::class
        ], 'down');
    }
}
