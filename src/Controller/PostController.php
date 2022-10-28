<?php

namespace App\Controller;

use App\Model\PostModel;
use App\Route\Route;

class PostController extends PostModel
{
    static string $urlAllPosts = "index.php?controller=post&action=index";

    public static function indexAction(object $smarty, int $limit = null)
    {
        $allPosts = PostModel::getLastPosts($limit);
        self::checkAuthForSmartyTemplate($smarty);
        $smarty->assign('pageTitle', 'General page');
        $smarty->assign('allPosts', $allPosts);

        self::loadTemplate($smarty, 'postIndex');
    }

    public static function showAction(object $smarty, int $idPost)
    {
        $onePost = PostModel::getPostById($idPost);

        self::checkAuthForSmartyTemplate($smarty);
        $smarty->assign('pageTitle', 'Show Post');
        $smarty->assign('onePost', $onePost);

        self::loadTemplate($smarty, 'postShow');
    }

    public static function createAction(object $smarty)
    {
        self::checkAuthForSmartyTemplate($smarty);
        self::loadTemplate($smarty, 'postCreate');
    }

    public static function addpostAction()
    {
        $title = trim($_POST['title']) ?? '';
        $subtitle = trim($_POST['subtitle']) ?? '';
        $content = trim($_POST['content']) ?? '';

        $userAuthId = self::checkAuth();
        if ($userAuthId) {
            $idUser = $_SESSION['user']['id'];
            $userId = self::checkUserById($idUser);

            $responseData = self::addNewPost($title, $subtitle, $content, $userId['id']);

            if ($responseData) {
                $responseData['message'] = 'The post successfully added';
            } else {
                $responseData['message'] = 'Error Added';
            }
        }
        $_SESSION['message'] = $responseData;
        self::redirect(self::$urlAllPosts);
    }

    public static function searchAction(object $smarty)
    {
        $searchQuery = trim($_POST['query_search']);
        $validated = self::checkLengthStr($searchQuery);
        
        if (!$validated){
            $responseData = self::searchInDatabase($searchQuery);
            $smarty->assign('responseData', $responseData);
        }

        self::loadTemplate($smarty, 'querySearch');
    }
}