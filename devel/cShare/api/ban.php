<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_GET['username'];
$result;
if ($_SESSION['tipo'] == 'moderador') {
    /*echo '"{msg:' . promoteUser($user) . '}"';*/
    try{
		$result['msg'] = banUser($user);
		$_SESSION['success_messages'][] = "User ".$user." banned successfully";
    }catch(PDOException $ex){
		logError($ex->getMessage());
		$result['msg'] = 'Error banning user!';
		$_SESSION['error_messages'][] = "Error banning user";
	}
	echo json_encode($result);
    exit;
}

$result['msg'] = false;
echo json_encode($result);

