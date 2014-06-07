<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];
$pass = $_POST['pass'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[^;:\"]{8,}$/", $pass)) {
	
		try{
			$result = updatePassword($user, $pass);
		catch(PDOException $ex){
			logError($ex->getMessage());
			echo "Error updating password!";
		}
        if ($result != false) {
            echo "SUCCESS!";
        } 
    } else {
        echo "Invalid Password!";
    }
} else {
    echo "Invalid Username!";
}