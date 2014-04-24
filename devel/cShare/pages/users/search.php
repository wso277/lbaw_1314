<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/users.php');

$search = $_GET['search'];

$results;

if (preg_match("/^[^;:\"]{1,15}$/", $search)) {
    $query = "%".$search."%";
    $answer = getUserByUsername($query);

    if (answer != false) {
        $results['user'] = $answer;
    }
}

/*
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
}*/

$smarty->assign('results', $results);
$smarty->assign('search', $search);

$smarty->display('users/search.tpl');