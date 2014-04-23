<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];
$url = $_POST['photo'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    $name = md5($url);
    file_put_contents($name, fopen($url, 'r'));

    $result = updatePhoto($user, "../images/assets/".$name);   //no extension

    if ($result != false) {
        echo "Failure!";
    } else {
        echo "Success!";
    }
} else {
    echo "Invalid Username!";
}


