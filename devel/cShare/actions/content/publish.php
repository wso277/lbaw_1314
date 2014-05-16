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

<<<<<<< HEAD
try{
	$result = publish($username,$title,$message,$links);
}catch(PDOException $ex){
	$_SESSION['error_messages'][] = 'Error publishing: ' . $ex->getMessage();
	$_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php');
}
=======
$result = publish($username, $title, $message, $links);

>>>>>>> 1dfd94d5fa49cee2c2369d73eb7401a9d6796544
if ($result != false) {
    $_SESSION['success_messages'][] = 'Successfully published!';
    header('Location: ' . $BASE_URL . 'pages/homepage/home.php?');
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: " . $BASE_URL . 'pages/content/content.php');
    exit;
}