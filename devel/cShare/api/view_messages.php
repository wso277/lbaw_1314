<?php
include_once($BASE_DIR . 'database/users.php');
include_once('../config/init.php');

$me = $_GET["username"];
$result;
if(preg_match("/^[^;:\"]{6,15}$/", $me)
{
	try{
	$sentMessages = getSentMessages($me);
	$receivedMessages = getReceivedMessages($me);
	}catch(PDOException $ex){
		$result['msg'] = 'Error viewing messages!' . $ex->getMessage();
		echo json_encode($result);
	}
	
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