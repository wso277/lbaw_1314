<?php

include_once($BASE_DIR . 'database/users.php');
include_once('../config/init.php');

$sender = $_POST["emissor"];
$receiver = $_POST["recetor"];
$title = $_POST["titulo"];
$content = $_POST["conteudo"];

if(preg_match("/^[^;:\"]{6,15}$/", $sender) && preg_match("/^[^;:\"]{6,15}$/", $receiver))
{
	if(strlen($title) > 85) echo "TOO LONG TITLE";
	else
	{
		if(strlen($content) > 140) echo "TOO LONG MESSAGE";
		else {
			try{
				sendMessage($sender, $receiver, $title, $content);
			}catch(PDOException $ex){
				logError($ex->getMessage());
				
			}
		}
	}
}
else echo "INVALID USER";
?>