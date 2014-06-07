<?php
    include_once('../config/init.php');
    include_once($BASE_DIR . 'database/content.php');

    $current = $_GET['current'];
    $result;
    $news;
    $i = 0;

    try {
        $results = getAllContentLikes($current);

        foreach ($results as $result) {
            $temp = getContentById($results[$i]['idnoticia']);
            $comments = getCommentsByContentId($result['idnoticia']);
            $contentClipped = substr($temp['conteudo'], 0, 80);
            $news[$i] = array("id" => $results[$i]['idnoticia'], "title" => $temp['titulo'], "content" => $contentClipped, "timestamp" => $temp['data_post'], "poster" => $temp['username'], "likes" => $results[$i]['likes'], "ncomments" => count($comments), "photo" => $temp['fotografia']);
            $i++;
        }
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $news[0] = 'Error loading more posts!';
    }

    echo json_encode($news);
