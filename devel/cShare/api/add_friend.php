<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

session_start();
$me = $_SESSION["username"];
$friend = $_GET["username"];

//if(preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)
//{
	if(strcasecmp($me,$friend) > 0)
	{
		$swap = $me;
		$me = $friend;
		$friend = $swap;
	}
	
	$result['msg'] = addFriend($me, $friend);
	
	/*if($result == true)
	{
		header('HTTP/1.1 200 OK', true, 200);
	}
	else
	{
		header('HTTP/1.1 404 NOT FOUND', true, 404);
	}*/
//}
//else echo "INVALID USER";
	return json_encode($result);

?> 