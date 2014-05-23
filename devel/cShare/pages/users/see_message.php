<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (isset($_SESSION['username'])) {
    $id = $_GET['id'];

    if (is_numeric($id)) {
        $result = getMessage($id);

        $result['conteudo'] = str_replace("\n", "<br>", $result['conteudo']);
      	//TODO SPLIT POR ESPAÇOS
        if(strstr($result['conteudo'],$BASE_URL.'pages/content/content.php?id=') != false) {
        	$result['conteudo'] = '<a href='.$result['conteudo'].'</a>';	
        }

        $smarty->assign('msg', $result);
        $smarty->display('users/see_message.tpl');
    }
}