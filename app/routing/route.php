<?php
/**
 * Created by PhpStorm.
 * User: Brend van Niekerk.
 * Date: 2019/03/17
 * Time: 1:07 PM
 */
$router = new AltoRouter();

$router->map( 'GET', '/', 'App\Controllers\IndexController@show', 'home' );





