<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$user = getUserByUsername($_GET['username']);
$name = explode(" ", $user[0]['nome'], 2);
$first_name = $name[0];
$last_name = $name[1];

$smarty->assign('user', $user);
$smarty->assign('firstName', $first_name);
$smarty->assign('lastName', $last_name);

$smarty->display("users/edit_profile.tpl");