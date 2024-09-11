<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->add('/', 'Home::index');


$routes->group('/pegawai', ['filter' => 'permission:access-pegawai'], static function ($routes) {
    $routes->add('', 'Pegawai::index');
});
