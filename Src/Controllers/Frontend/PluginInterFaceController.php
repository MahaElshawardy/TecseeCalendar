<?php

namespace Tecsee\Calendar\Controllers\Frontend;

use JTL\Shop;
use Tecsee\Calendar\Support\Plugin;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Support\Facades\Filesystem\DirectoryComposer;


class PluginInterFaceController
{
    /**
     * list lang
     *
     * @return Response
     */
    public function interface_smarty(Request $request)
    {
        $hostLang = $_SERVER['REQUEST_URI'];
        $url = substr($hostLang, -2, 2);
        if ($url === 'en' || $url === 'on') {
            $lang = 'en';
            $plugin = new Plugin();
            $fileName = file_get_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/interface.json", true);
            $translate = json_decode($fileName, true);
            $smarty = Shop::Smarty();
            $smarty->assign("interfaceCalendar", $translate);
        } else {
            $lang = 'de';
            $plugin = new Plugin();
            $fileName = file_get_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/interface.json", true);
            // $translate = (new Translate($fileName))->getTranslations('interface');
            $translate = json_decode($fileName, true);

            $smarty = Shop::Smarty();
            $smarty->assign("interfaceCalendar", $translate);
        }
    }

    /**
     * list lang
     *
     * @return Response
     */
    public function interface_respons(Request $request)
    {
        $validationData = $request->all();
        $lang = $validationData['lang'];
        $plugin = new Plugin();
        $fileName = file_get_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/interface.json", true);
        $fileName = json_decode($fileName, true);
        return Response::json(['interface' => $fileName], 200);
    }
}
