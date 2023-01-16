<?php

namespace Tecsee\Calendar\Middlewares;

use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Tecsee\Calendar\Support\Plugin;
use JTL\Shop;

class Localization
{
    public static function handle()
    {
        $plugin = new Plugin();
        $smarty        = Shop::Smarty();
        $translations = (new Translate($plugin->getInestance()->getPaths()->getBasePath()))->getTranslations($plugin->getInestance()->getPaths()->getBasePath(),'frontend');
        $smarty->assign('translations', $translations);
    }
}
