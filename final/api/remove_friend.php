<?php
    include_once('../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $me = $_SESSION['username'];
    $friend = $_GET["username"];
    $res;
    if (preg_match("/^[^;:\"]{6,15}$/", $me) && preg_match("/^[^;:\"]{6,15}$/", $friend)) {
        if (strcasecmp($me, $friend) > 0) {
            $swap = $me;
            $me = $friend;
            $friend = $swap;
        }

        try {
            $result = removeFriend($me, $friend);
            $_SESSION['success_messages'][] = "Friend removed with success";
        } catch (PDOException $ex) {
            logError($ex->getMessage());
            $res['msg'] = 'Error removing friend!';
            $_SESSION['error_messages'][] = "Error removing friend";
        }
        if ($result != false) {
            $res['msg'] = true;
        }
    } else {
        $res['msg'] = "Invalid username";
    }

    echo json_encode($res);