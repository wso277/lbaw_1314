<?php
    include_once('../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $user = $_GET['username'];
    $result;
    if ($_SESSION['tipo'] == 'moderador') {
        /*echo '"{msg:' . promoteUser($user) . '}"';*/
        try {
            $result['msg'] = demoteUser($user);
            $_SESSION['success_messages'][] = "User " . $user . " demoted successfully";
        } catch (PDOExecption $ex) {
            logError($ex->getMessage());
            $result['msg'] = 'Error demoting user!';
            $_SESSION['error_messages'][] = "Error demoting user";
        }
        echo json_encode($result);

        exit;
    }

    $result['msg'] = false;
    echo json_encode($result);

