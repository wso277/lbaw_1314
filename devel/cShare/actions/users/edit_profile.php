<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$user = $_SESSION['username'];
$location = $_POST['local'];
$email = $_POST['email'];
$work = $_POST['work'];
$pic = $_POST['picture'];

$name = $firstName . " " . $lastName;

if (!isset($user) || !isset($name)
    || !isset($location) || !isset($work)
    || !isset($email)) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
    exit;
}

$inter = array();
$i = 0;
if ($_POST['sports']) {
    $inter[$i++] = 'sports';
}
if ($_POST['cinema']) {
    $inter[$i++] = 'cinema';
}
if ($_POST['news']) {
    $inter[$i++] = 'news';
}
if ($_POST['gastronomy']) {
    $inter[$i++] = 'gastronomy';
}
if ($_POST['football']) {
    $inter[$i++] = 'football';
}
if ($_POST['literature']) {
    $inter[$i++] = 'literature';
}
if ($_POST['agriculture']) {
    $inter[$i++] = 'agriculture';
}
if ($_POST['politics']) {
    $inter[$i++] = 'politics';
}
if ($_POST['sex']) {
    $inter[$i++] = 'sex';
}
if ($_POST['video-games']) {
    $inter[$i++] = 'video-games';
}
if ($_POST['meteorology']) {
    $inter[$i++] = 'meteorology';
}
if ($_POST['motor sports']) {
    $inter[$i++] = 'motor sports';
}
if ($_POST['culture']) {
    $inter[$i++] = 'culture';
}


$result = editUser($user, $location, $work, $inter, $email, $name);

if ($result != false) {
    $_SESSION['success_messages'][] = 'User edited successfully';
    header('Location: ' . $BASE_URL . 'pages/users/profile.php?username=' . $user);
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
    exit;
}

//TODO HANDLE EXCEPTIONS