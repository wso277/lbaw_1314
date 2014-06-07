<?php
    include_once('../config/init.php');
    include_once($BASE_DIR . 'database/content.php');

    $id = $_GET['id'];
    $result;

    try {
        $result['msg'] = deleteContent($id);
        $_SESSION['success_messages'][] = 'Content successfully deleted!';
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $result['msg'] = false;
        $_SESSION['error_messages'][] = 'Error deleting the content!';
    }
    if (!$result['msg']) {
        $result['msg'] = false;
    }
    echo json_encode($result);
    exit;