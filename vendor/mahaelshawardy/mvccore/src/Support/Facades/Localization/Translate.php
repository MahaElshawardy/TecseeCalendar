<?php

namespace Mahaelshawardy\MvcCore\Support\Facades\Localization;

use Tecsee\Calendar\Support\Plugin;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Mahaelshawardy\MvcCore\Support\Facades\Localization\Lang;
use Mahaelshawardy\MvcCore\Support\Facades\Filesystem\DirectoryComposer;

class Translate
{
    private string $file;

    public function __construct($file)
    {
        $this->file = $file;
    }
    public static function translate($file,$fileName, $key): string
    {
        $lang = Lang::get();
        $fileName = file_get_contents("{$file}Src/Langs/{$lang}/{$fileName}.json");
        $fileName = json_decode($fileName, true);
        if (array_key_exists($key, $fileName)) {
            return $fileName[$key];
        }
        return 'NULL';
    }

    public function setValue($key, $newValue)
    {
        $fileName = json_decode($this->file, true);
        if (array_key_exists($key, $fileName)) {
            $fileName[$key] = $newValue;
            $decoded = json_encode($fileName);
            // file_put_contents("$this->file", $decoded);
        }
        return $decoded;
    }

    public static function getTranslations($file,$fileName): array
    {
        $lang = Lang::get();
        $fileName = file_get_contents("{$file}Src/Langs/{$lang}/{$fileName}.json");
        // Debugger::die_and_dump($file);
        $fileName = json_decode($fileName, true);
        return $fileName;
    }
}
