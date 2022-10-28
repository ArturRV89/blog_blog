<?php
//константы для обращения к контроллерам
define('PathPrefix', '../src/Controller/');
define('PathPostfix', 'Controller.php');

// используемый шаблон
$template = 'default';

// пути к файлам шаблонов (*.tpl)
// default
define('TemplatePrefix', "../views/{$template}/");
define('TemplatePostfix', '.tpl');

//пути к файлам шаблонов в вебпространстве
define('TemplateWebPath', "/templates/{$template}/");