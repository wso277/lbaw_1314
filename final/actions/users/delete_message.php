<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $id = $_GET['id'];

    if (is_numeric($id)) {
        try {
            $result = deleteMessage($id);
            $_SESSION['sucess_messages'][] = 'Message successfully deleted!';
        } catch (PDOException $ex) {
            logError($ex->getMessage());
            $_SESSION['error_messages'][] = 'Error deleting message';
            exit;
        }

        header("Location: " . $BASE_URL . "pages/users/profile.php?username=" . $_SESSION['username']);
    } else {
        $res['error'] = "Invalid id";
    }

