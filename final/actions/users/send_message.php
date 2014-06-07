<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $sender = $_SESSION['username'];
    $receiver = $_POST['name'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    //echo "cenas";
    /*if (!$_POST['username'] || !$_POST['realname'] || !$_POST['password']) {*/
    /*if (!preg_match("/^[^;:\"]{6,15}$/", $user) || !preg_match("/^[^;:\"]{8,}$/", $pass) || !preg_match("/^[a-zA-Z ]+$/", $name)
        || !preg_match("/^[a-zA-Z ]+$/", $location) || !preg_match("/^[a-zA-Z ]+$/", $work)
        || !preg_match("/^[^@]+@[^@]+.[a-zA-Z]{2,6}$/", $email)
        || $pass != $pass_conf) {
    */
    if (!isset($sender) || !isset($receiver) || !isset($subject) || !isset($message)) {

        $_SESSION['error_messages'][] = 'All fields are mandatory';
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/send_message.php?sender=' . $sender . '&receiver=' . $_POST['name']);
        exit;
    }

    try {
        $result = sendMessage($sender, $receiver, $subject, $message);
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $_SESSION['error_messages'][] = 'Error sending message';
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/send_message.php?sender=' . $sender . '&receiver=' . $_POST['name']);
        exit;
    }
    if ($result != false) {
        $_SESSION['success_messages'][] = 'Message successfully sent';
        header('Location: ' . $BASE_URL . 'pages/users/profile.php?username=' . $sender);
        exit;
    } else {
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/send_message.php?sender=' . $sender . '&receiver=' . $_POST['name']);
        exit;
    }

