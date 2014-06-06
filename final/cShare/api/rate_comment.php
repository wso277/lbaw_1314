<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$rate = $_GET['rate'];
$commentId = $_GET['commentID'];
$result;

if ($rate == 1 || $rate == -1) {
	try{
		$result['msg'] = rateComment($commentId, $rate, $_SESSION['username']);
	}catch(PDOException $ex){
		logError($ex->getMessage());
		$result['msg'] = 'Error rating comment!';
	}
}


echo json_encode($result);
