<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

$user = getUserByUsername($_GET['username']);
$interests = getInterests($_GET['username']);
$friends = getFriends($_GET['username']);

$result;

$i = 0;

foreach($friends as $friend) {
	$userFriend = getUserByUsername($friend['username']);
	$temp = getFriends($friend['username']);
	$result[$i] = array("name" => $userFriend[0]['nome'], "photo" => $userFriend[0]['fotografia'], "friends" => count($temp));
	$i++;
}

$smarty->assign('user', $user);
$smarty->assign('interests', $interests);
$smarty->assign('friends', $result);

$smarty->display("users/profile.tpl");