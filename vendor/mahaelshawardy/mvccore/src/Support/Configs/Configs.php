<?php

namespace Mahaelshawardy\MvcCore\Support\Configs;

use Mahaelshawardy\MvcCore\Support\Debug\Debugger;

class Configs
{
    private array $configs = [];
    private string $path ;

    public function __construct($path)
    {
        $this->path = $path;
        $lines  = file("{$path}/.env");
        $keys   = [];
        $values = [];
        foreach ($lines as $line) {
            $line = trim($line);
            if (!$line) {
                continue;
            }
            if ($line === PHP_EOL || stripos($line, '#') === 0) {
                continue;
            }
            if (stripos($line, PHP_EOL)) {
                [$line,] = explode(PHP_EOL, $line);
            }
            [$keys[], $values[]] = explode('=', $line);
        }
        $this->configs = array_combine($keys, $values);
    }

    public function keyValue($key)
    {
        if (array_key_exists($key, $this->configs)) {
            return trim($this->configs[$key]);
        }
        return NULL;
    }

    public function setValue($key, $newValue)
    {
        
        if (array_key_exists($key, $this->configs)) {
            $this->configs[$key] = $newValue;
            $configCopy = $this->configs;
            
            array_walk($configCopy, function (&$value, $key) {
                $value = "{$key}={$value}";
            });
            file_put_contents("{$this->path}/.env", implode("\n", $configCopy));
        }
    }

    public function get_configs(): array
    {
        return $this->configs;
    }
}
