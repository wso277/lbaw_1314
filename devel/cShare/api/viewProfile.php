<?php

$user = $_GET['username'];

if (preg_match("/^[^;:\"]{6,15}$/", $user)) {
    $result = getUserByUsername($user);


}