<?php
include_once('../config/init.php');
include_once($BASE_DIR.'database/users.php');

$user = $_POST['username'];
$name = $_POST['name'];
$location = $_POST['location'];
$pass = $_POST['pass'];
$email = $_POST['email'];
$job = $_POST['job'];
$res;
if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[^;:\"]{8,}$/", $pass)) {
        if (preg_match("/^[a-zA-Z ]+$/", $name)) {
            if (preg_match("/^[a-zA-Z ]+$/", $location)) {
                if (preg_match("/^[a-zA-Z ]+$/", $job)) {
                    if (preg_match("/^[^@]+@[^@]+.[a-zA-Z]{2,6}$/", $email)) {
						try{
							$result = createUser($name, $user, $location, $job, $email, $pass);
						}catch(PDOException $ex){
							logError($ex->getMessage());
							$res['msg'] = 'Error registering user!';
							echo json_encode($res);
						}
                        if ($result != false) {
                            echo json_encode("success");
                        }
                        else {
                            echo "Failure";
                        }
                    }
                    else {
                        echo "Invalid Email!";
                    }
                }
                else {
                    echo "Invalid Location!";
                }
            }
            else {
                echo "Invalid Location!";
            }
        }
        else {
            echo "Invalid Name!";
        }
    }
    else {
        echo "Invalid Password!";
    }
} else {
    echo "Invalid Username!";
}