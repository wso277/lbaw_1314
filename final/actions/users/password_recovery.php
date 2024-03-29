<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $username = $_POST['username'];
    $type = $_POST['type'];
    $user;

    try {
        $user = getUserByUsername($username);
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $_SESSION['error_messages'][] = "Error validating username";
        header("Location: $BASE_URL" . 'pages/users/login.php');
        exit;
    }

    if (strcmp($type, "0") == 0) {
        mail($user[0]['email'], "Password Recovery", "Please go to the following link to recover your password: \ngnomo.fe.up.pt" . $BASE_URL . "pages/users/password_recovery.php?user=" . $user[0]['username'], "");
        $_SESSION['success_messages'][] = "An e-mail containing the instructions how to recover your password has been sent to your inbox";
        header("Location: $BASE_URL" . 'pages/homepage/home.php');
        exit;
    } else if (strcmp($type, "1") == 0) {
        $password = $_POST['password'];
        $passConf = $_POST['password_confirmation'];
        if (strcmp($password, $passConf) == 0) {
            try {
                if (updatePassword($user[0]['username'], $password)) {
                    $_SESSION['success_messages'][] = "Password successfully changed!";
                    header("Location: $BASE_URL" . 'pages/users/login.php');
                } else {
                    $_SESSION['error_messages'][] = "Error changing password";
                    header("Location: $BASE_URL" . 'pages/users/password_recovery.php?user=' . $user[0]['username']);
                }
            } catch (PDOException $ex) {
                logError($ex->getMessage());
                $_SESSION['error_messages'][] = "Error updating password!";
                header("Location: $BASE_URL" . 'pages/users/password_recovery.php?user=' . $user[0]['username']);
            }
        } else {
            $_SESSION['error_messages'][] = "The passwords don't match!";
            header("Location: $BASE_URL" . 'pages/users/password_recovery.php?user=' . $user[0]['username']);
        }
        exit;
    } else {
        $_SESSION['error_messages'][] = "Invalid type!";
        header("Location: $BASE_URL" . 'pages/homepage/home.php');
        exit;
    }