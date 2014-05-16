<?php
include_once('../config/init.php');
include_once($BASE_DIR.'database/users.php');

$input = $_GET['query'];
$results;

if (preg_match("/^[^;:\"]{6,15}$/", $input)) {
    $query = "%".$input."%";
	try{
		$answer = getUserByUsername($query);
	}catch(PDOException $ex){
		$results['msg'] = 'Error getting user by username!'. $ex->getMessage();
		echo json_encode($results);
	}
    if (answer != false) {
        $results['user'] = $answer;
    }
}

if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$input."%";
	try{
		$answer = getUserByLocal($query);
	}catch(PDOException $ex){
		$results['msg'] = 'Error getting user by local!'. $ex->getMessage();
		echo json_encode($results);
	}
    if (answer != false) {
        $results['local'] = $answer;
    }
}

if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$input."%";
	try{
		$answer = getUserByWork($query);
		echo json_encode($results);
	}catch(PDOException $ex){
		$results['msg'] = 'Error getting user by work!'. $ex->getMessage();
	}
    if (answer != false) {
        $results['work'] = $answer;
    }
}

echo $results;