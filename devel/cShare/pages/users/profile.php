<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$user = getUserByUsername($_GET['username']);

//var_dump($user);

$smarty->assign('user', $user);

$smarty->display("users/profile.tpl");
