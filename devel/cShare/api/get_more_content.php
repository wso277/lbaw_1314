<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/content.php');

$current = $_GET['current'];
$result;
$news;
$i;

try{
    $result['posts'] = getAllContentLikes($current);
    foreach ($result['posts'] as $result) {
    $temp = getContentById($results[$i]['idnoticia']);
    $comments = getCommentsByContentId($result['idnoticia']);
    $contentClipped = substr($temp['conteudo'], 0, 80);
    $news[$i] = array("id" => $results[$i]['idnoticia'], "title" => $temp['titulo'], "content" => $contentClipped, "timestamp" => $temp['data_post'], "poster" => $temp['username'], "likes" => $results[$i]['likes'], "ncomments" => count($comments), "photo" => $temp['fotografia']);
    $i++;
}
}catch(PDOException $ex){
	$news[0] = 'Error loading more posts!' . $ex->getMessage();
}

echo json_encode($news);
var_dump($news);
