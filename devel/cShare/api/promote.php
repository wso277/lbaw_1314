<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_GET['username'];
$result;
if ($_SESSION['tipo'] == 'moderador') {
    /*echo '"{msg:' . promoteUser($user) . '}"';*/
	try{
		$result['msg'] = promoteUser($user);
	}catch(PDOException $ex){
		$result['msg'] = 'Error promoting user!' . $ex->getMessage();
	}
        echo json_encode($result);
    exit;
}

$result['msg'] = false;
echo json_encode($result);

