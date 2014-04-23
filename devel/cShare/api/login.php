<?php
$user = $_POST['username'];
$pass = $_POST['pass'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    if (preg_match("/^[^;:\"]{8,}$/", $pass)) {
        global $conn;
    }
    else {
        echo "Invalid Password!";
    }
} else {
    echo "Invalid Username!";
}
?>