<?php
include_once($BASE_DIR . 'database/users.php');
include_once('../config/init.php');
session_start();
$me = $_GET["username"];

if(preg_match("/^[^;:\"]{6,15}$/", $me)
{
	$sentMessages = getSentMessages($me);
	$receivedMessages = getReceivedMessages($me);
	
	foreach($sentMessages as $str)
	{
		if(strlen($str["conteudo"]) > 140) 
			echo "MESSAGE SIZE > 140";
		
	}
	
	foreach($receivedMessages as $str)
	{
		if(strlen($str["conteudo"]) > 140) 
			echo "MESSAGE SIZE > 140";
		
	}
	
	$mergedMessages = array_merge($sentMessages, $receivedMessages);
	
	echo $mergedMessages;
}
?>