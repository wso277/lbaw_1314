<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');
include_once($BASE_DIR . 'database/users.php');

$content = getContentById($_GET['id']);
$results = getContentLinks($_GET['id']);
$i = 0;
$links;
foreach ($results as $link) {
    $links[$i++] = array("i" => $i, "link" => $link);
}

$smarty->assign('content', $content);
$smarty->assign('links', $links);

$smarty->display('content/publish.tpl');