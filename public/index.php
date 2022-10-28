<?php
declare(strict_types=1);
session_start();
include_once '../vendor/autoload.php';

use App\Route\Route;

// Инициализация шаблонизатора Smarty
// put full path to Smarty.class.php
require_once('../library/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();
$smarty->setTemplateDir(TemplatePrefix);
$smarty->setCompileDir('../tmp/smarty/templates_c');
$smarty->setCacheDir('../tmp/smarty/cache');
$smarty->setConfigDir('../library/Smarty/configs');
$smarty->assign('templateWebPath' . TemplateWebPath);

//print '<pre>';
//print_r($_GET);
//die;

Route::contentToRender($smarty, 12);
//
//if (!empty($_SESSION['message'])) {
//    echo '<p class="message"> ' . $_SESSION['message']['message'] . '</p>';
//    unset($_SESSION['message']);
//}