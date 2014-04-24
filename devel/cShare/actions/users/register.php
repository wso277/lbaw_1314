<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$user = $_POST['display_name'];
$location = $_POST['local'];
$pass = $_POST['password'];
$pass_conf = $_POST['password_confirmation'];
$email = $_POST['email'];
$work = $_POST['work'];

$name = $firstName . " " . $lastName;

//echo "cenas";
/*if (!$_POST['username'] || !$_POST['realname'] || !$_POST['password']) {*/
/*if (!preg_match("/^[^;:\"]{6,15}$/", $user) || !preg_match("/^[^;:\"]{8,}$/", $pass) || !preg_match("/^[a-zA-Z ]+$/", $name)
    || !preg_match("/^[a-zA-Z ]+$/", $location) || !preg_match("/^[a-zA-Z ]+$/", $work)
    || !preg_match("/^[^@]+@[^@]+.[a-zA-Z]{2,6}$/", $email)
    || $pass != $pass_conf) {
*/
if (!isset($user) || !isset($pass) || !isset($name)
    || !isset($location) || !isset($work)
    || !isset($email)
    || $pass != $pass_conf) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
}

$result = createUser($name, $user, $location, $work, $email, $pass);

if ($result != false) {
    $_SESSION['success_messages'][] = 'User registered successfully';
    header('Location: ' . $BASE_URL . 'pages/users/login.php');
    exit;
} else {
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
}

//TODO HANDLE EXCEPTIONS
?>
