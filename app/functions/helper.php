<?php
/**
 * Created by PhpStorm.
 * User: Brend van Niekerk.
 * Date: 2019/03/15
 * Time: 9:13 AM
 */
require __DIR__ .'/../../vendor/autoload.php';
use Philo\Blade\Blade;

function view($path, $data = [])
{
    $view = __DIR__.'/../../resources/views';
    $cache = __DIR__ .'/../../bootstrap/cache';
    $blade = new Blade($view, $cache);
    
    echo $blade->view()->make($path, $data)->render();
}