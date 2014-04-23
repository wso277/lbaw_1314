<?php
include_once('../config/init.php');
include_once($BASE_DIR.'database/users.php');

$input = $_GET['query'];
$results;

if (preg_match("/^[^;:\"]{6,15}$/", $input)) {
    $query = "%".$input."%";
    $answer = getUserByUsername($query);

    if (answer != false) {
        $results['user'] = $answer;
    }
}

if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$input."%";
    $answer = getUserByLocal($query);

    if (answer != false) {
        $results['local'] = $answer;
    }
}

if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$input."%";
    $answer = getUserByWork($query);

    if (answer != false) {
        $results['work'] = $answer;
    }
}

echo $results;