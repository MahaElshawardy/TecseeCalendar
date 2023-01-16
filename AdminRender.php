<?php

declare(strict_types=1);

namespace Plugin\TecseeCalendar;

use InvalidArgumentException;
use JTL\Smarty\JTLSmarty;

/**
 * Class AdminRender
 * @package Plugin\TecseeCalendar
 */
class AdminRender
{
    /**
     * @var path
     */
    private $plugin;

    /**
     * @var path
     */
    private $path;

    /**
     * AdminRender constructor.
     * @param Object $plugin
     */
    public function __construct(Object $plugin)
    {
        $this->plugin = $plugin;
        $this->path   = $this->plugin->getPaths()->getAdminPath() . '/templates/';
    }

    /**
     * @param string    $template
     * @param int       $menuID
     * @param Object $smarty
     * @return string
     * @throws \SmartyException
     */
    public function renderPage(string $template, JTLSmarty $smarty): string
    {
        $smarty->assign('pluginPath', $this->plugin->getPaths()->getAdminURL());

        $smarty->assign('pluginURL', $this->plugin->getPaths()->getShopURL());

        $smarty->assign('pluginId', $this->plugin->getId());

        switch ($template) {
            case "Add_Event":
                $template = 'addEvent/index.tpl';
                break;
            case "All_Event":
                $template = 'allEvent/index.tpl';
                break;
            case "Translate_Massages":
                $template = 'translation/layout.tpl';
                break;
            case "Reservations_Details":
                $template = 'reservation/layout.tpl';
                break;
            default:
                throw new InvalidArgumentException('Cannot render tab ' . $template);
        }
        return $smarty->fetch($this->path . $template);
    }
}
