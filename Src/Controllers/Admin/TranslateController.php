<?php

namespace Tecsee\Calendar\Controllers\Admin;

use Tecsee\Calendar\Support\Plugin;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Tecsee\Calendar\Requests\Backend\Translate\TranslateRequest;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Translate;
use Mahaelshawardy\MvcCore\Support\Facades\Filesystem\DirectoryComposer;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;


class TranslateController
{
    /**
     * list lang
     *
     * @param Request $request
     * @param integer $pluginId
     * @return Response
     */
    public function index(Request $request)
    {
        $validation = $request->all();
        $lang = $validation['language'];
        $plugin = new Plugin();
        Debugger::die_and_dump($plugin);
        if ($handle = opendir("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}")) {
            while (false !== ($entry = readdir($handle))) {

                if ($entry != "." && $entry != "..") {
                    $json[] = $entry;
                    foreach ($json as $key) {
                        $fileNameBaseExtension = basename($key, '.json');
                        $fileName = file_get_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/{$fileNameBaseExtension}.json");
                        $fileName = json_decode($fileName, true);
                    }
                    $jsons["$fileNameBaseExtension"] = $fileName;
                }
            }

            closedir($handle);
        }
        return Response::json(['message' => 'translate are loaded successfully', 'translate' => $jsons], 200);
    }

    /**
     * store a room
     *
     * @param Request $request
     * @return Response
     */
    public function set_translation()
    {
        $request = new TranslateRequest;
        $plugin = new Plugin();
        
        $validationDate = $request->validated();
        $lang = $validationDate['language'];
        $fileName = $validationDate['categories'];
        $key = $validationDate['key'];
        $value = $validationDate['value'];
        $file = file_get_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/{$fileName}.json");
        $translate = (new Translate($file))->setValue($key, $value);
        file_put_contents("{$plugin->getInestance()->getPaths()->getBasePath()}Src/Langs/{$lang}/{$fileName}.json", $translate);
        return Response::json(['message' => 'translate is set successfully', 'translate' => $translate], 200);
    }
}
