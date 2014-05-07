<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

session_start();
$me = $_SESSION["username"];
$friend = $_GET["username"];

//if(preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)
//{
if (strcasecmp($me, $friend) > 0) {
    $swap = $me;
    $me = $friend;
    $friend = $swap;
}

$result = addFriend($me, $friend);

if ($result) {
    $res['msg'] = true;
} else {
    $res['msg'] = false;
}

echo json_encode($res);