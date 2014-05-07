<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$results = getAllContentLikes();

var_dump($results);

$news;
$i = 0;

foreach($results as $result) {
	$temp = getContentById($results['idNoticia']);
	$contentClipped = substr($temp['conteudo'],0,40);
	$news[$i] = array("id" => $results['idNoticia'], "title" => $temp['titulo'], "content" => $contentClipped, "timestamp" => $temp['data_post'], "poster" => $temp['username'], "likes" => $results['likes']);
}

$smarty->assign('news',$news);

$smarty->display('home/homepage.tpl');