<?php
include_once('../config/init.php');
include_once($BASE_DIR.'database/users.php');

$user = $_POST['username'];
$pass = $_POST['pass'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[^;:\"]{8,}$/", $pass)) {
        $result = login($user, $pass);

        if ($result != false && $result['username'] == $user) {
            if ($result['estado'] == 'normal') {
                session_start();
                $_SESSION['username'] = $user;
                $_SESSION['tipo'] = $result['tipo_user'];

                echo "SUCCESS!";
            }
            else {
                echo "User is banned!";
            }
        }
        else {
            echo "User not found!";
        }
    }
    else {
        echo "Invalid Password!";
    }
} else {
    echo "Invalid Username!";
}