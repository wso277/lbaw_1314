<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');
    include_once($BASE_DIR . 'database/content.php');

    $user = getUserByUsername($_GET['username']);
    $interests = getInterests($_GET['username']);
    $friends = getFriends($_GET['username']);
    $sentMessages = getSentMessages($_GET['username']);
    $receivedMessages = getReceivedMessages($_GET['username']);
    $posts = getUserContent($_GET['username']);

    $result;

    $i = 0;

    $smarty->assign('isFriend', false);

    foreach ($friends as $friend) {
        if (strcmp($friend['amigo1'], $user[0]['username']) == 0) {
            $userFriend = getUserByUsername($friend['amigo2']);
            $temp = getFriends($friend['amigo2']);
        } else {
            $userFriend = getUserByUsername($friend['amigo1']);
            $temp = getFriends($friend['amigo1']);
        }

        $result[$i] = array("username" => $userFriend[0]['username'], "name" => $userFriend[0]['nome'], "photo" => $userFriend[0]['fotografia'], "friends" => count($temp));
        if (strcmp($userFriend[0]['username'], $_SESSION['username']) == 0) {
            $smarty->assign('isFriend', true);
        }
        $i++;
    }

    $smarty->assign('user', $user);
    $smarty->assign('interests', $interests);
    $smarty->assign('friends', $result);
    $smarty->assign('sentMessages', $sentMessages);
    $smarty->assign('receivedMessages', $receivedMessages);
    $smarty->assign('posts', $posts);

    $smarty->display("users/profile.tpl");