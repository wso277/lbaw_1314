<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$user = getUserByUsername($_GET['username']);
$interests = getInterests($_GET['username']);

$smarty->assign('user', $user);
$smarty->assign('interests', $interests);

$smarty->display("users/profile.tpl");
