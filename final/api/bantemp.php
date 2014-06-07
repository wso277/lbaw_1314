<?php
    include_once('../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $user = $_GET['username'];
    $result;
    if ($_SESSION['tipo'] == 'moderador') {
        /*echo '"{msg:' . promoteUser($user) . '}"';*/
        try {
            $result['msg'] = banUserTemp($user);
            $_SESSION['success_messages'][] = "User " . $user . " temporarily banned successfully";
        } catch (PDOException $ex) {
            logError($ex->getMessage());
            $result['msg'] = 'Error temporarily banning user!';
            $_SESSION['error_messages'][] = "Error temporarily banning user";
        }
        echo json_encode($result);
        exit;
    }

    $result['msg'] = false;
    echo json_encode($result);

