<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

session_start();

if (isset($_SESSION['username'])) {
    $id = $_GET['id'];

    if (is_numeric($id)) {
        $result = getMessage($id);

        $result['conteudo'] = str_replace("\n", "<br>", $result['conteudo']);

        $smarty->assign('msg', $result);
        $smarty->display('users/see_message.tpl');
    }
}