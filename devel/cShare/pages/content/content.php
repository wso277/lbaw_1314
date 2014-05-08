<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');
include_once($BASE_DIR . 'database/users.php');

$content = getContentById($_GET['id']);
$results = getCommentsByContentId($_GET['id']);
$links = getContentLinks($_GET['id']);

$comments;
$i = 0;

foreach($results as $result) {
	$temp = getCommentLikes($_GET['id'],$result['idcomentario'],$result['username']);
	$comments[$i] = array("username" => $result['username'], "photo" => getUserPhoto($result['username']), "content" => $result['conteudo'], "likes" => $temp['sum']);
	$comments[$i]['content'] = str_replace("\n", "<br>", $comments[$i]['content']);
	$i++;
}

$smarty->assign('content', $content);
$smarty->assign('comments', $comments);
$smarty->assign('links', $links);

$smarty->display('content/content.tpl');