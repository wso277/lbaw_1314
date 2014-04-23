<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];
$pass = $_POST['pass'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[^;:\"]{8,}$/", $pass)) {
        $result = updatePassword($user, $pass);

        if ($result != false) {
            echo "SUCCESS!";
        } else {
            echo "User is banned!";
        }
    } else {
        echo "Invalid Password!";
    }
} else {
    echo "Invalid Username!";
}