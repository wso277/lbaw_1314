<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$user = getUserByUsername($_SESSION['username']);

//var_dump($user);

$smarty->assign('user', $user);

$smarty->display("users/edit_profile.tpl");