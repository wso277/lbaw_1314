<?php /* Smarty version Smarty-3.1.15, created on 2014-04-11 16:59:36
         compiled from "/opt/lbaw/lbaw1353/public_html/frmk/templates/common/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:113768385053481168516e14-58772599%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '17f9c8cb8138655c554491473735734577c3268b' => 
    array (
      0 => '/opt/lbaw/lbaw1353/public_html/frmk/templates/common/header.tpl',
      1 => 1396428230,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '113768385053481168516e14-58772599',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
    'ERROR_MESSAGES' => 0,
    'error' => 0,
    'SUCCESS_MESSAGES' => 0,
    'success' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5348116859c5f1_65395225',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5348116859c5f1_65395225')) {function content_5348116859c5f1_65395225($_smarty_tpl) {?><!DOCTYPE html>
<html>
  <head>
    <title>Fritter</title>
    <meta charset='utf-8'>
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/style.css">
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/main.js"></script>
  </head>
  <body>
    <header>
      <h1><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
">Fritter</a></h1>
      <?php if ($_smarty_tpl->tpl_vars['USERNAME']->value) {?>
        <?php echo $_smarty_tpl->getSubTemplate ('common/menu_logged_in.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

      <?php } else { ?>
        <?php echo $_smarty_tpl->getSubTemplate ('common/menu_logged_out.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

      <?php }?>
    </header>
    <?php if ($_smarty_tpl->tpl_vars['USERNAME']->value) {?>
    <div id="tweet_form">
      <form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/tweets/tweet.php" method="post">
        <textarea name="tweet" placeholder="Say something"></textarea>
        <input type="submit">
      </form>
    </div>
    <?php }?>
    <div id="error_messages">
    <?php  $_smarty_tpl->tpl_vars['error'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['error']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ERROR_MESSAGES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['error']->key => $_smarty_tpl->tpl_vars['error']->value) {
$_smarty_tpl->tpl_vars['error']->_loop = true;
?>
      <div class="error"><?php echo $_smarty_tpl->tpl_vars['error']->value;?>
<a class="close" href="#">X</a></div>
    <?php } ?>
    </div>
    <div id="success_messages">
    <?php  $_smarty_tpl->tpl_vars['success'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['success']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['SUCCESS_MESSAGES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['success']->key => $_smarty_tpl->tpl_vars['success']->value) {
$_smarty_tpl->tpl_vars['success']->_loop = true;
?>
      <div class="success"><?php echo $_smarty_tpl->tpl_vars['success']->value;?>
<a class="close" href="#">X</a></div>
    <?php } ?>
    </div>
<?php }} ?>
