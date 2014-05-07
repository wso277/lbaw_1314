<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$id = $_GET['id'];

if (is_int($id)) {
    $result = deleteMessage($id);
    if (!$result) {
        $res['error'] = "Error deleting message";
        echo json_encode($res);
    }
}
else {
    $res['error'] = "Invalid id";
    echo json_encode($res);
}

