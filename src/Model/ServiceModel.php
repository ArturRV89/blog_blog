<?php

namespace App\Model;

use mysqli;

class ServiceModel
{
    protected static function getMysqli(): mysqli
    {
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        $mysqli = new mysqli('blog_db', 'root', '123123', 'blog', 3306, null);
        $mysqli->set_charset('utf8mb4');
        return $mysqli;
    }

    protected static function loadTemplate(object $smarty, string $templateName): void
    {
        $smarty->display($templateName . TemplatePostfix);
    }

    protected static function redirect(string $url): void
    {
        header('Location:' . "{$url}");
        die();
    }

    public static function changeRecordsToArrayForSmarty($records): bool|array
    {
        if (!$records)
            return false;
        $smartyRecords = [];
        while ($row = mysqli_fetch_assoc($records)) {
            $smartyRecords[] = $row;
        }
        return $smartyRecords;
    }

    public static function checkAuthForSmartyTemplate(object $smarty): object|string
    {
        return isset($_SESSION['user']) ? $smarty->assign('user', $_SESSION['user']) : '';
    }

    public static function checkAuth(): bool
    {
        return isset($_SESSION['user']);
    }

}
