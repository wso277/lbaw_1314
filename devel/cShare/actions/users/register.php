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
$pic = $BASE_URL."images/assets/default.png";
$name = $firstName . " " . $lastName;

/*if (!$_POST['username'] || !$_POST['realname'] || !$_POST['password']) {*/
/*if (!preg_match("/^[^;:\"]{6,15}$/", $user) || !preg_match("/^[^;:\"]{8,}$/", $pass) || !preg_match("/^[a-zA-Z ]+$/", $name)
    || !preg_match("/^[a-zA-Z ]+$/", $location) || !preg_match("/^[a-zA-Z ]+$/", $work)
    || !preg_match("/^[^@]+@[^@]+.[a-zA-Z]{2,6}$/", $email)
    || $pass != $pass_conf) {
*/
if (!isset($user) || !isset($pass) || !isset($name)
    || !isset($location) || !isset($work)
    || !isset($email)) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
}

if(strcmp($pass,$pass_conf) != 0) {
    $_SESSION['error_messages'][] = 'Both passwords must be the same!';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
}

try{
	$result = createUser($name, $user, $location, $work, $email, $pass, $pic);
}catch(PDOException $ex) {
	logError($ex->getMessage());
	$_SESSION['error_messages'][] = 'Error registering';
	$_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
	exit;
}
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
