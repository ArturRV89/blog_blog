<?php

namespace App\Controller;

use App\Model\UsersModel;

class UserController extends UsersModel
{
    static string $urlUserIndex = "index.php?controller=user&action=index";
    static string $urlPostIndex = "index.php?controller=post&action=index";

    static public function indexAction($smarty)
    {
        self::checkAuthForSmartyTemplate($smarty);
        $allUsers = self::getAllUsers();
        $smarty->assign('allUsers', $allUsers);
        $smarty->assign('pageTitle', 'Users');

        self::loadTemplate($smarty, 'userIndex');
    }

    static public function createAction($smarty)
    {
        self::loadTemplate($smarty, 'userCreate');
    }

    public static function registrationAction()
    {
        $email = trim($_POST['email']) ?? null;
        $password = trim($_POST['password']) ?? null;

        $responseData = self::checkExistEnter($email, $password);

        if (!$responseData && self::checkExistUserEmail($email)) {
            $responseData['message'] = "User with such ('{$email}') already exists";
        }

        if (!$responseData) {
            $passwordHashed = password_hash($password, PASSWORD_DEFAULT);

            $userData = self::registerNewUser($email, $passwordHashed);

            if ($userData) {
                $responseData['message'] = 'User successfully registered';

                $responseData['userEmail'] = $email;
                $_SESSION['user'] = $userData['id'];
                $_SESSION['user'] = $userData['email'];
//                setcookie("user_id", $userData['id'], time() + 3600 + 3600);
            } else {
                $responseData['message'] = 'Registration error';
            }
        }
        $_SESSION['message'] = $responseData;
        self::redirect(self::$urlUserIndex);
    }

    static public function loginpageAction(object $smarty)
    {
        self::loadTemplate($smarty, 'userLogin');
    }

    public static function loginAction()
    {
        $email = trim($_POST['email']);

        $password = $_POST['password'];
        $password = trim($password);

        $errors = [];
        $checkedEnter = self::checkExistEnter($email, $password);
        $checkedEmail = self::checkExistUserEmail($email);
        $checkedPassword = self::checkExistUserPasswordByEmail($checkedEmail['email']);

        if (!$checkedEmail) {
            $errors['message'] = "User with such ('{$email}') not exists";
        }
        if (!$checkedPassword) {
            $errors['message'] = 'Entered password not correct';
        }
        if (password_verify($password, $checkedPassword['password'])) {
            // Проверяем, не нужно ли использовать более новый алгоритм
            // или другую алгоритмическую стоимость
            if (password_needs_rehash($checkedPassword['password'], PASSWORD_DEFAULT)) {
                $newHash = password_hash($password, PASSWORD_DEFAULT);
                self::updatePasswordHash($checkedEmail, $newHash);
            }
        } else {
            $errors['message'] = 'Different passwords';
        }
//        если прошел все проверки
        if (!$checkedEnter && $checkedPassword && $checkedEmail) {
            if (isset($_SESSION['user'])) {
                self::redirect(self::$urlPostIndex);
            } else {
                $_SESSION['user'] = $checkedEmail;
                self::redirect(self::$urlPostIndex);
            }
        } else {
            $errors['message'] = 'Data failed validate';
        }
        if (!empty($errors)) {
            print $errors['message'];
        }
    }

    public static function logoutAction(object $smarty)
    {
        if (self::checkAuthForSmartyTemplate($smarty)) {
            $_SESSION['user'] = null;
            self::redirect(self::$urlPostIndex);
        }
    }
}
