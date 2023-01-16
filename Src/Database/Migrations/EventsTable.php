<?php

namespace Tecsee\Calendar\Database\Migrations;

use Illuminate\Database\Capsule\Manager as Capsule;

class EventsTable
{
    public function up()
    {
        Capsule::schema()->create('events', function ($table) {
            $table->engine = 'InnoDB';
            $table->id();
            $table->string('title_en');
            $table->string('title_de');
            $table->string('description_en');
            $table->string('description_de');
            $table->string('location_en');
            $table->string('location_de');
            $table->string('image');
            $table->dateTime('start_time');
            $table->dateTime('end_time');
            $table->string('facebook_url');
            $table->string('twitter_url');
            $table->enum('status', ['waiting', 'started', 'cancel', 'finished']);
            $table->index('status');
            $table->timestamps();
        });
    }
    public function down()
    {
        Capsule::schema()->dropIfExists('events');
    }
}
