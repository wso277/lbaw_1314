<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$sender = $_GET['sender'];
$receiver = $_GET['receiver'];
$id = $_GET['id'];
$subject = $_GET['subject'];

$smarty->assign('sender', $sender);
$smarty->assign('receiver', $receiver);
$smarty->assign('id', $id);
$smarty->assign('subject', $subject);

$smarty->display("users/send_message.tpl");
