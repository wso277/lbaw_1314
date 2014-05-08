<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$rate = $_GET['rate'];
$contentId = $_GET['contentId'];
$result;

$result['msg'] = rateContent($contentId,$rate,$USERNAME);

echo json_encode($result);
