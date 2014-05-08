<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$rate = $_GET['rate'];
$commentId = $_GET['commentID'];
$result;

$result['msg'] = rateComment($commentId,$rate,$USERNAME);

echo json_encode($result);
