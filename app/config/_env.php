<?php
/**
 * Created by PhpStorm.
 * User: Brend van Niekerk.
 * Date: 2019/03/15
 * Time: 9:23 AM
 */
define('BASE_PATH', realpath(__DIR__ . '/../../'));

require_once __DIR__ . '/../../vendor/autoload.php';
$dotenv = Dotenv\Dotenv::create(BASE_PATH);
$dotenv->load();



