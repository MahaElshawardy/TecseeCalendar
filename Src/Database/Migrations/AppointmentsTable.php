<?php

namespace Tecsee\Calendar\Database\Migrations;

use Illuminate\Database\Capsule\Manager as Capsule;

class AppointmentsTable
{
    public function up()
    {
        Capsule::schema()->create('tec_see_appointments', function ($table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('event_id');
            $table->enum('status', ['reserved', 'cancelled', 'finished'])->nullable('status');
            $table->string('customer_id')->nullable('customer_id');
            $table->date('created_at');
            $table->date('updated_at');
        });
    }
    public function down()
    {
        Capsule::schema()->dropIfExists('tec_see_appointments');
    }
}
