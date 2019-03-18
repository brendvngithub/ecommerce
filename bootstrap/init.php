<?php
/**
 * Created by PhpStorm.
 * User: Brend van Niekerk.
 * Date: 2019/03/15
 * Time: 9:09 AM
 */
if (!isset ($_SESSION)) {
    session_start();
}

//Load environment variables
require_once __DIR__ . '/../app/config/_env.php';
new \App\classes\Database();
require_once __DIR__ . '/../app/routing/route.php';
new \App\RouteDispatcher($router);
