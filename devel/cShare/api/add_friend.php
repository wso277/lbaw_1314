<?php
include_once($BASE_DIR . 'database/users.php');
include_once('../config/init.php');
session_start();
$me = $_GET["amigo1"];
$friend = $_GET["amigo2"];

if(preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)
{
	if(strcasecmp($me,$friend) > 0)
	{
		$swap = $me;
		$me = $friend;
		$friend = $swap;
	}
	
	$result = add_friend($me, $friend);
	
	if($result != false)
	{
		header('HTTP/1.1 200 OK', true, 200);
	}
	else
	{
		header('HTTP/1.1 404 NOT FOUND', true, 404);
	}
}
else echo "INVALID USER";

?> 