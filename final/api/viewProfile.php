<?php

    $user = $_GET['username'];
    $res;
    if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
        try {
            $result = getUserByUsername($user);
        } catch (PDOException $ex) {
            logError($ex->getMessage());
            $res['msg'] = 'Error getting user by username!';
            echo json_encode($res);
        }

        if ($result != false) {
            echo $result;
        } else {
            echo "Failure!";
        }

    }