<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$rate = $_GET['rate'];
$contentId = $_GET['contentId'];
$result;

if ($rate == 1 || $rate == -1) {
    $result['msg'] = rateContent($contentId, $rate, $_SESSION['username']);
}

echo json_encode($result);
