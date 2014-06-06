<?php
include_once('../../config/init.php');
$user = $_GET['user'];

$smarty->assign('user',$user);
$smarty->display("users/password_recovery.tpl");