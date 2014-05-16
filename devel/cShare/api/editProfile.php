<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$user = $_POST['username'];
$name = $_POST['name'];
$location = $_POST['location'];
$email = $_POST['email'];
$job = $_POST['job'];
$favs = $_POST['favs'];
$res;
if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[a-zA-Z ]+$/", $name)) {
        if (preg_match("/^[a-zA-Z ]+$/", $location)) {
            if (preg_match("/^[a-zA-Z ]+$/", $job)) {
                if (preg_match("/^[^@]+@[^@]+.[a-zA-Z]{2,6}$/", $email)) {
					try{
						$result = editUser($user, $location, $job, $favs, $email, $name);
					}catch(PDOException $ex){
						$res['msg'] = 'Error editing profile!' . $ex->getMessage();
						echo json_encode($res);
					}
                    if ($result != false) {
                        echo "Success!";
                    } else {
                        echo "Failure";
                    }
                } else {
                    echo "Invalid Email!";
                }
            } else {
                echo "Invalid Location!";
            }
        } else {
            echo "Invalid Location!";
        }
    } else {
        echo "Invalid Name!";
    }
} else {
    echo "Invalid Username!";
}