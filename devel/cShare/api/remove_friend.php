<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$me = $_SESSION['username'];
$friend = $_GET["username"];
$res;
if (preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)) {
    if (strcasecmp($me, $friend) > 0) {
        $swap = $me;
        $me = $friend;
        $friend = $swap;
    }


    $result = removeFriend($me, $friend);

    if ($result != false) {
        $res['msg'] = true;
    } else {
        $res['msg'] = false;
    }
} else {
    $res['msg'] = "Invalid username";
}

echo json_encode($res);