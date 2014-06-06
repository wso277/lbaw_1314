<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];

if (isset($_SESSION['tipo'])) {
    try{
		$user = getUserByUsername($user);
		mail($user[0]['email'],"Password Recovery","Please go to the following link to recover your password:".{$BASE_URL}."pages/users/password_recovery.php?user=".$user,"admin@cshare.com");
    	$_SESSION['success_messages'] = "An e-mail containing the instructions how to recover your password has been sent to your inbox";
    }catch(PDOException $ex){
		logError($ex->getMessage());
		$_SESSION['error_messages'] = "Error validating username";
	}
    exit;
}


