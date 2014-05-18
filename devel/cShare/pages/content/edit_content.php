<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/content.php');
include_once($BASE_DIR . 'database/users.php');

$content = getContentById($_GET['id']);
$links = getContentLinks($_GET['id']);

$smarty->assign('content', $content);
$smarty->assign('links', $links);

$smarty->display('content/publish.tpl');