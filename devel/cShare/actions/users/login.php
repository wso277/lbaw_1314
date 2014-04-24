<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

//echo "cenas";
if (!preg_match("/^[^;:\"]{6,15}$/", $_POST['username']) || !preg_match("/^[^;:\"]{8,}$/", $_POST['password'])) {
    $_SESSION['error_messages'][] = 'Invalid login';
    $_SESSION['form_values'] = $_POST;
    header('Location: '. $BASE_URL .'pages/users/login.php');
    exit;
}

$username = $_POST['username'];
$password = $_POST['password'];

$result = login($username, $password);
if ($result != false) {
    $_SESSION['username'] = $username;
    $_SESSION['success_messages'][] = 'Login successful';
    $_SESSION['tipo'] = $result['tipo_user'];
    $_SESSION['estado'] = $result['estado_user'];
    header('Location: '. $BASE_URL .'pages/homepage/home.php');
} else {
    $_SESSION['error_messages'][] = 'Login failed';
    header('Location: '. $BASE_URL .'pages/users/login.php');
}
?>
