<?php

namespace App\Route;

class Route
{
    public static function contentToRender($smarty, $limit = null): void
    {
        $uri = self::processURI();

        if (!class_exists($uri['controller'])) {
            print 'This controller was not found';
            exit();
        }

        $controller = $uri['controller'];
        $method = $uri['action'];
        $id = $uri['id'];
        $id ? $controller::{$method}($smarty, $id) : $controller::{$method}($smarty, $limit);
    }

    private static function getURI(): array
    {
        $queryString = ($_SERVER['QUERY_STRING']);
        parse_str($queryString, $uri);

        return $uri;
    }

    private static function processURI(): array
    {
        $controllerName = self::getURI()['controller'] ?? '';
        $actionName = self::getURI()['action'] ?? '';
        $id = self::getURI()['id'] ?? '';

        $controller = !empty($controllerName) ?
            'App\Controller\\' . ucfirst($controllerName) . 'Controller' :
            'App\Controller\\PostController';

        $method = !empty($actionName) ?
            $actionName . 'Action' :
            'indexAction';

        $id = !empty($id) ?
            $id :
            '';

        return [
            'controller' => $controller,
            'action' => $method,
            'id' => $id
        ];
    }
}