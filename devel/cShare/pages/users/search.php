<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/users.php');
include_once($BASE_DIR.'database/content.php');

$search = $_GET['search'];

$results;

if (preg_match("/^[^;:\"]{1,15}$/", $search)) {
    $query = "%".$search."%";
    $answer = searchUserByUsername(strtoupper($query));

    if (answer != false) {
        $results['user'] = $answer;
    }
}


//if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$search."%";
    $answer = getUserByLocal(strtoupper($query));

    if (answer != false) {
        $results['local'] = $answer;
    }
//}

//if (preg_match("/^[a-zA-Z ]+$/", $input)) {
    $query = "%".$search."%";
    $answer = getUserByWork(strtoupper($query));

    if (answer != false) {
        $results['work'] = $answer;
    }
//}

$query = "%".$search."%";
    $answer = getContentByTitle(strtoupper($query));

if (answer != false) {
    $results['content'] = $answer;
}

$smarty->assign('results', $results);
$smarty->assign('search', $search);

$smarty->display('users/search.tpl');