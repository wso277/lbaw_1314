<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/content.php');
    include_once($BASE_DIR . 'database/users.php');

    $content = getContentById($_GET['id']);
    $results = getCommentsByContentId($_GET['id']);
    $links = getContentLinks($_GET['id']);

    $comments;
    $i = 0;

    foreach ($results as $result) {
        var_dump($_GET['id']);
        var_dump($result['idcomentario']);
        var_dump($result['username']);
        $temp = getCommentLikes($_GET['id'], $result['idcomentario']);
        var_dump($temp);
        $comments[$i] = array("id" => $result['idcomentario'], "username" => $result['username'], "photo" => getUserPhoto($result['username']), "content" => $result['conteudo'], "likes" => $temp['sum'], "cont" => $i);
        $comments[$i]['content'] = str_replace("\n", "<br>", $comments[$i]['content']);
        $i++;
    }

    //var_dump($comments);

    $smarty->assign('content', $content);
    $smarty->assign('comments', $comments);
    $smarty->assign('links', $links);

    $smarty->display('content/content.tpl');