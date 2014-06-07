<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_GET['username'];
$result;
if ($_SESSION['tipo'] == 'moderador') {
    /*echo '"{msg:' . promoteUser($user) . '}"';*/
	try{
		$result['msg'] = unbanUser($user);
		$_SESSION['success_messages'][] = "User ".$user." unbanned successfully";
	}catch(PDOException $ex){
		logError($ex->getMessage());
		$result['msg'] = 'Error unbaning user!';
		$_SESSION['error_messages'][] = "Error unbanning user";
	}
    echo json_encode($result);
    exit;
}

$result['msg'] = false;
echo json_encode($result);

