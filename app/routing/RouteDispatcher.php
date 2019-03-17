<?php
/**
 * Created by PhpStorm.
 * User: Brend van Niekerk.
 * Date: 2019/03/17
 * Time: 3:26 PM
 */

namespace App;

use AltoRouter;

class RouteDispatcher
{
    protected $match;
    
    protected $controller;
    
    protected $method;
    
    public function __construct(AltoRouter $router)
    {
        $this->match = $router->match();
      
        if ($this->match) {
            list($controller, $method) = explode('@', $this->match['target']);
            $this->controller = $controller;
            $this->method = $method;
            
            
            if (is_callable([new $this->controller, $this->method])){
                call_user_func_array([new $this->controller, $this->method], [$this->match['params']]);
            } else {
                echo 'this method is not defined';
            }
        } else {
            header('HTTP/1.0 404 Not Found');
            view('errors/404');
            //view(__DIR__ .'/../../resources/views/errors/404.blade.php');
        }
        
        
    }
}