<?php

declare(strict_types=1);

namespace Plugin\TecseeCalendar;

use Shop;
use JTL\Smarty\JTLSmarty;
use JTL\Events\Dispatcher;
use JTL\Link\LinkInterface;
use JTL\Plugin\Bootstrapper;
use Mahaelshawardy\MvcCore\Helpers\Header;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use Reneknox\DotEnvLoader\EnvLoader;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Tecsee\Calendar\Services\RoutesService;
use Tecsee\Calendar\Services\InstallService;
use Tecsee\Calendar\Support\Plugin;

require_once __DIR__ . '/vendor/autoload.php';
/**
 * Class Bootstrap
 * @package Plugin\TecseeCalendar
 */
class Bootstrap extends Bootstrapper
{
    private RoutesService $routesService;
    private InstallService $installService;
    /**
     * @inheritdoc
     */
    public function boot(Dispatcher $dispatcher)
    {
        parent::boot($dispatcher);
        $this->routesService = new RoutesService();
        if (Shop::isFrontend()) {

            $dispatcher->listen('shop.hook.' . \HOOK_IO_HANDLE_REQUEST, function (array $args) {
                $request = new Request();
                Plugin::$plugin = $this->getPlugin();
                $path = "{$this->getPlugin()->getPaths()->getBasePath()}";
                $file = ".env";
                $config = EnvLoader::load_data($path, $file);
                $io = key_exists('io', $request->all()) ? $request->all()['io'] : NULL;
                if ($io === $config['ENTRY_POINT']) {
                    $this->routesService->frontend_endpoints();
                }
            }, 1);
            $dispatcher->listen('shop.hook.' . \HOOK_SMARTY_FETCH_TEMPLATE, function () {
                Plugin::$plugin = $this->getPlugin();
                $path = "{$this->getPlugin()->getPaths()->getBasePath()}";
                $this->routesService->frontend_executions();
            }, 1);
        } else {
            $dispatcher->listen('shop.hook.' . \HOOK_IO_HANDLE_REQUEST_ADMIN, function () {
                $request = new Request();
                Plugin::$plugin = $this->getPlugin();
                // Debugger::die_and_dump(new Plugin());
                $path = "{$this->getPlugin()->getPaths()->getBasePath()}";
                $file = ".env";
                $config = EnvLoader::load_data($path, $file);
                $io = key_exists('io', $request->all()) ? $request->all()['io'] : NULL;
                if ($io === $config['ENTRY_POINT']) {
                    // Debugger::die_and_dump($io);
                    $this->routesService->backend_endpoints();
                }
            }, 1);
        }
    }

    /**
     * @inheritdoc
     */
    public function installed()
    {
        parent::installed();
        $this->installService = new InstallService();
        $this->installService->install();
    }

    /**
     * 
     * it's migrate database tables when plugin 
     */

    public function enabled()
    {
    }

    public function uninstalled(bool $deleteData = false)
    {
        if ($deleteData === true) {
            $this->installService = new InstallService();
            $this->installService->unInstall();
        }
    }
    /**
     * 
     * writing adminpanel routes for retriving data from database
     * @return string
     */
    public function renderAdminMenuTab(string $template, int $menuID, JTLSmarty $smarty): string
    {
        Plugin::$plugin = $this->getPlugin();
        $this->routesService->backend_executions();
        $adminRender = new AdminRender($this->getPlugin());
        return $adminRender->renderPage($template, $smarty);
    }

    /**
     * writing frontend routes for retrieving data from database
     */
    public function prepareFrontend(LinkInterface $link, JTLSmarty $smarty): bool
    {
        parent::prepareFrontend($link, $smarty);
        return true;
    }
}
