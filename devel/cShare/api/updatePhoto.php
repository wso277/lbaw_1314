<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];
$url = $_POST['photo'];
$res;
if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    $name = md5($url);
    file_put_contents($name, fopen($url, 'r'));
	try{
		$result = updatePhoto($user, "../images/assets/".$name);   //no extension
	}catch(PDOException $ex){
		$res['msg'] = "Error updating photo: " . $ex->getMessage();
		echo json_encode($res);
	}
    if ($result != false) {
        echo "Success!";
    }
} else {
    echo "Invalid Username!";
}


