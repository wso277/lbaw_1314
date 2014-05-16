<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$rate = $_GET['rate'];
$contentId = $_GET['contentId'];
$result;

if ($rate == 1 || $rate == -1) {
try{
    $result['msg'] = rateContent($contentId, $rate, $_SESSION['username']);
}catch(PDOException $ex){
	$result['msg'] = 'Error rating content!' . $ex->getMessage();
}
}

echo json_encode($result);
