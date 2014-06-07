<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    //echo "cenas";
    if (!preg_match("/^[^;:\"]{6,15}$/", $_POST['username']) || !preg_match("/^[^;:\"]{8,}$/", $_POST['password'])) {
        $_SESSION['error_messages'][] = 'Invalid login';
        $_SESSION['form_values'] = $_POST;
        header('Location: ' . $BASE_URL . 'pages/users/login.php');
        exit;
    }

    $username = $_POST['username'];
    $password = $_POST['password'];

    try {
        $result = login($username, $password);
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $_SESSION['error_messages'][] = 'Error logging in';
        header('Location: ' . $BASE_URL . 'pages/users/login.php');
        exit;
    }
    if ($result != false && $result[estado_user] == 'normal') {
        $_SESSION['username'] = $username;
        $_SESSION['success_messages'][] = 'Login successful';
        $_SESSION['tipo'] = $result['tipo_user'];
        $_SESSION['estado'] = $result['estado_user'];
        header('Location: ' . $BASE_URL . 'pages/homepage/home.php');
    } else {
        $_SESSION['error_messages'][] = 'Login failed';
        header('Location: ' . $BASE_URL . 'pages/users/login.php');
        exit;
    }
?>
