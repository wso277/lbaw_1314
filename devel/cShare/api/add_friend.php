<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$me = $_SESSION["username"];
$friend = $_GET["username"];

//if(preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)
//{
if (strcasecmp($me, $friend) > 0) {
    $swap = $me;
    $me = $friend;
    $friend = $swap;
}

try{
	$result = addFriend($me, $friend);
}catch(PDOException $ex){
	logError($ex->getMessage());
	$res['msg'] = 'Error adding friend!';
}
if ($result) {
    $res['msg'] = true;
} else {
    $res['msg'] = false;
}

echo json_encode($res);