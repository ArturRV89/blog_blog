<?php

namespace App\Model;

class UsersModel extends ServiceModel
{
    protected static function getAllUsers()
    {
        $sql = "SELECT * 
                FROM `users` 
                ORDER BY `id` 
                DESC";

        $records = (mysqli_query(self::getMysqli(), $sql));
        if (!empty($records)) {
            return self::changeRecordsToArrayForSmarty($records);
        } else {
            return 'Something went wrong';
        }
    }

    protected static function registerNewUser($email, $passwordHashed)
    {
        $email = htmlspecialchars(
            mysqli_real_escape_string(
                self::getMysqli(), $email));

        $sql = "INSERT INTO 
                `users` (`email`, `password`)
                VALUES ('{$email}', '{$passwordHashed}')";

        $records = mysqli_query(self::getMysqli(), $sql);

        if ($records) {
            $sql = "SELECT *
                    FROM `users`
                    WHERE (`email` = '{$email}')
                    LIMIT 1";

            $records = mysqli_query(self::getMysqli(), $sql);
            return mysqli_fetch_assoc($records);
        }
        return $records;
    }

    protected static function checkExistEnter(string $email, string $password): array
    {
        $response = [];

        if (!$email) {
            $response['message'] = 'Enter email';
        }
        if (!$password) {
            $response['message'] = 'Enter password';
        }
        return $response;
    }

    protected static function checkExistUserEmail(string $email): bool|array|null
    {
        $email = htmlspecialchars(
            mysqli_real_escape_string(
                self::getMysqli(), $email));

        $sql = "SELECT `id`, `email`
                FROM `users` 
                WHERE (`email` = '{$email}')
                LIMIT 1";

        $records = mysqli_query(self::getMysqli(), $sql);
        return mysqli_fetch_assoc($records);
    }

    protected static function checkExistUserPasswordByEmail($checkedEmail)
    {
        $sql = "SELECT `password` 
                FROM `users` 
                WHERE (`email` = '{$checkedEmail}')
                LIMIT 1";

        $records = mysqli_query(self::getMysqli(), $sql);
        return mysqli_fetch_assoc($records);
    }

    protected static function updatePasswordHash(string $checkedEmail, string $newHash)
    {
        $sql = "UPDATE `users` 
                SET `password` = '{$newHash}'
                WHERE (`email` = '{$checkedEmail}')";

        $records = mysqli_query(self::getMysqli(), $sql);
        return mysqli_fetch_assoc($records);
    }
}
