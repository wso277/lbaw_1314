<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

session_start();
$id = $_GET['id'];

if (is_numeric($id)) {
    $result = deleteMessage($id);
    if (!$result) {
    }

    header("Location: " . $BASE_URL . "pages/users/profile.php?username=" . $_SESSION['username']);
}
else {
    $res['error'] = "Invalid id";
}

