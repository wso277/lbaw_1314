<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$username = $_POST['username'];
$title = $_POST['title'];
$photo = $_POST['photo'];
$message = $_POST['message'];

$i = 1;
$links;

while (true) {
    $name = 'link' . $i;
    $temp = $_POST[$name];
    if ($temp == null) {
        break;
    } else {
        $tmp = parse_url($temp);
        $links[$i - 1] = array("href" => $temp, "homeLink" => $tmp['host']);
        $i++;
    }
}


if (!isset($username) || !isset($title)
    || !isset($photo) || !isset($message)
) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/content/publish.php');
    exit;
}

$result = publish($username, $title, $message, $links);

if ($result != false) {
    $_SESSION['success_messages'][] = 'Successfully published!';
    header('Location: ' . $BASE_URL . 'pages/homepage/home.php?');
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php');
    exit;
}