<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$sender = $_GET['sender'];
$receiver = $_GET['receiver'];

$smarty->assign('sender', $sender);
$smarty->assign('receiver', $receiver);

$smarty->display("users/send_message.tpl");
