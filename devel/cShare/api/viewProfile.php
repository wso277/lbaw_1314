<?php

$user = $_GET['username'];
$res;
if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
	try{
		$result = getUserByUsername($user);
	}catch(PDOException $ex){
		$res['msg'] = 'Error getting user by username!' . $ex->getMessage();
		echo json_encode($res);
	}

    if ($result != false) {
        echo $result;
    }
    else {
        echo "Failure!";
    }

}