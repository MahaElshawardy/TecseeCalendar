<?php

namespace Tecsee\Calendar\Services;

use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Tecsee\Calendar\Database\Migrations\DataBaseMigrations;
use Mahaelshawardy\MvcCore\Support\Facades\Filesystem\Storage;
use Tecsee\Calendar\Database\Initialization\Database;
use Tecsee\Calendar\Database\Seeders\DatabaseSeeder;

class InstallService
{

    private Storage $storage;

    private Database $database;

    private DataBaseMigrations $dataBaseMigrations;

    private DatabaseSeeder $databaseSeeder;

    public function __construct()
    {
        // $this->storage = new Storage();
        $this->dataBaseMigrations = new DataBaseMigrations();
        // $this->databaseSeeder = new DatabaseSeeder();
        $this->database = new Database();
    }

    /**
     * * it's migrate database tables  and create seeders when plugin installed
     */

    public function install()
    {
        $debugger = new Debugger();
        try {

            $start = microtime(true);

            $this->database->connect();
            $debugger->log("database connect");
            $this->dataBaseMigrations->up();
            $debugger->log("Migrations 1");
            // $this->databaseSeeder->run();
            // $debugger->log($this->databaseSeeder);

            //$this->storage->load_resources('Resources', 'images');

            $end = microtime(true);
            // $debugger = new Debugger();
            $time = $end - $start;
            $debugger->log("installed in $time seconds");
        } catch (\Exception $th) {
            $debugger->log($th);

        }
    }

    public function unInstall()
    {
        $debugger = new Debugger();
        try {
            $this->database->connect();
            $debugger->log("uninstall database connect");
            $this->dataBaseMigrations->down();
            $debugger->log("uninstall Migrations 1");
        } catch (\Exception $th) {
            $debugger->log($th);

        }
        //$this->storage->unload_resources('Resources/images');
    }
}
