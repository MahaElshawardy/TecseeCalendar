<?php

namespace Tecsee\Calendar\Controllers\Admin;

use Mahaelshawardy\MvcCore\Support\Facades\Filesystem\DirectoryComposer;
use Tecsee\Calendar\Requests\Backend\LicenseRequest;
use Mahaelshawardy\MvcCore\Support\Configs\Configs;
use Mahaelshawardy\MvcCore\Support\Http\Request;
use Mahaelshawardy\MvcCore\Helpers\Response;
use Reneknox\Fetch\HttpRequest;
use Mahaelshawardy\MvcCore\Support\Debug\Debugger;
use SimpleXMLElement;
use JTL\Shop;
use Tecsee\Calendar\Support\Plugin;

class LicenseController
{
    public function verifyCalendar(LicenseRequest $request)
    {
        $validatedData = $request->validated();
        $plugin = new Plugin();
        $hostLicenses = (new Configs($plugin->getInestance()->getPaths()->getBasePath()))->get_configs()['HOST_LICENSES'];
        $httpClient = new HttpRequest();
        $httpClient->set_base_url($hostLicenses)->set_headers([
            'Accept' => 'application/xml'
        ]);

        $response = $httpClient->post('/modules/servers/licensing/check_license', $validatedData);
        $response = new SimpleXMLElement($response['body']);
        $response = current((array)$response);
        if ($response === 'Valid') {
            $licensesFile = "{$plugin->getInestance()->getPaths()->getBasePath()}/.licenses";
            $encryptedLicense = sha1($validatedData['licensekey']);
            $text = "Licenses Status: $response\nKey: $encryptedLicense";
            file_put_contents($licensesFile, $text);
            return Response::json([
                'message' => 'licenses is valid your plugin is activated'
            ], 201);
        }
        return Response::json([
            'message' => 'licenses is Invalid please contact support team'
        ], 422);
    }

    public function index(Request $request)
    {
        $smarty = Shop::Smarty();
        $plugin = new Plugin();
        $licensesFile = "{$plugin->getInestance()->getPaths()->getBasePath()}.licenses";
        file_exists($licensesFile) ? $smarty->assign('licensesFile', true) : $smarty->assign('licensesFile', false);
    }
}
