<?php 

namespace Tecsee\Calendar\Support;

class Plugin{
    public static $plugin;

    public function getInestance()
    {
        return self::$plugin;
    }

}