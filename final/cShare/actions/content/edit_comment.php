<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$contentId = $_POST['contentId'];
$commentId = $_POST['commentId'];
$comment = $_POST['new_comment'];
$username = $_POST['comment_username'];

if (!isset($commentId) || !isset($username)
    || !isset($comment)) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/content/content.php?id=' . $contentId);
    exit;
}
try{
	$result = editComment($username,$commentId,$comment);
}catch(PDOException $ex){
	logError($ex->getMessage());
	$_SESSION['error_messages'][] = 'Error editing comment';
	$_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
}
if ($result != false) {
    $_SESSION['success_messages'][] = 'Edit Comment successful';
    header('Location: ' . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php?id=' . $contentId);
    exit;
}
