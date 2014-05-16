<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$contentId = $_POST['id'];
$comment = $_POST['comment'];
$username = $_POST['username'];

if (!isset($contentId) || !isset($username)
    || !isset($comment)) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/content/content.php?id=' . $contentId);
    exit;
}

try{
	$result = comment($contentId,$username,$comment);
}catch(PDOException $ex){
	$_SESSION['error_messages'][] = 'Error commenting: ' . $ex->getMessage();
	$_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
}
if ($result != false) {
    $_SESSION['success_messages'][] = 'Comment successful';
    header('Location: ' . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
    exit;
}
