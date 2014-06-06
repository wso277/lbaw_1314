<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');

    $results = getAllContentLikes(0);

$news;
$i = 0;

foreach ($results as $result) {
    $temp = getContentById($results[$i]['idnoticia']);
    $comments = getCommentsByContentId($result['idnoticia']);
    $contentClipped = substr($temp['conteudo'], 0, 80);
    $news[$i] = array("id" => $results[$i]['idnoticia'], "title" => $temp['titulo'], "content" => $contentClipped, "timestamp" => $temp['data_post'], "poster" => $temp['username'], "likes" => $results[$i]['likes'], "ncomments" => count($comments), "photo" => $temp['fotografia']);
    $i++;
}

$smarty->assign('news', $news);
    $smarty->assign('current', 0);

$smarty->display('home/homepage.tpl');