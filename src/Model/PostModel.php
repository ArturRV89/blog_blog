<?php

namespace App\Model;

class PostModel extends ServiceModel
{
    static function getLastPosts(int $limit = null): bool|array
    {
        $sql = "SELECT *
                FROM `posts`
                ORDER BY `id` DESC";

        if ($limit) {
            $sql .= " LIMIT {$limit}";
        }

        $records = mysqli_query(self::getMysqli(), $sql);
        return self::changeRecordsToArrayForSmarty($records);
    }

    static function getPostById(int $idPost): bool|array
    {
        $sql = "SELECT *
                FROM `posts`
                WHERE `id` = '{$idPost}'
                LIMIT 1";

        $records = mysqli_query(self::getMysqli(), $sql);
        return self::changeRecordsToArrayForSmarty($records);
    }

    public static function checkUserById(int $idUser): array|null
    {
        $sql = "SELECT `id` 
                FROM `posts` 
                WHERE (`id` = '{$idUser}')
                LIMIT 1";

        $records = mysqli_query(self::getMysqli(), $sql);
        return mysqli_fetch_assoc($records);
    }

    public static function addNewPost(string $title, string $subtitle, string $content, $userId)
    {
        $title = htmlspecialchars(
                 mysqli_real_escape_string(
                 self::getMysqli(), $title));

        $subtitle = htmlspecialchars(
                    mysqli_real_escape_string(
                    self::getMysqli(), $subtitle));

        $content = htmlspecialchars(
                   mysqli_real_escape_string(
                   self::getMysqli(), $content));

        $sql = "INSERT INTO `posts`
                SET
                   `title` = '{$title}',
                   `subtitle` = '{$subtitle}',
                   `content` = '{$content}',
                   `user_id` = '{$userId}'";

        $result = mysqli_query(self::getMysqli(), $sql);

        if ($result) {
            $sql = "SELECT * 
                    FROM `posts`
                    WHERE (`user_id` = '{$userId}')
                    LIMIT 1";

            $records = mysqli_query(self::getMysqli(), $sql);
            return mysqli_fetch_assoc($records);
        } else {
            return $result;
        }
    }
    public static function checkLengthStr($searchQuery)
    {
        $errors = [];
        if (strlen($searchQuery) < 3) 
            $errors['message'] =  "a short request";

        if (strlen($searchQuery) > 50)
            $errors['message'] = "a long request";

        if (!empty($errors))
            return $errors['message'];
    }

    public static function searchInDatabase($searchQuery): array|bool
    {
        $searchQuery = htmlspecialchars(
                       mysqli_real_escape_string(
                       self::getMysqli(), $searchQuery));

        $sql = "SELECT `title`, `subtitle`, `content`, `id`
                FROM `posts`
                WHERE `title` LIKE '%$searchQuery%' OR
                      `subtitle` LIKE '%$searchQuery%' OR
                      `content` LIKE '%$searchQuery%' OR
                      `id` LIKE '%$searchQuery%'";
        
        $records = mysqli_query(self::getMysqli(), $sql);
        if ($records){
            $responseData = self::changeRecordsToArrayForSmarty($records);
            return $responseData;
        } else {
            return false;
        }
    }
}
