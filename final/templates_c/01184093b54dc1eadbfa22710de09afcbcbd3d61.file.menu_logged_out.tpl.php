<?php /* Smarty version Smarty-3.1.15, created on 2014-04-11 16:59:36
         compiled from "/opt/lbaw/lbaw1353/public_html/frmk/templates/common/menu_logged_out.tpl" */
?>
<?php /*%%SmartyHeaderCode:1520383608534811685a1b87-38601493%%*/
    if (!defined('SMARTY_DIR')) exit('no direct access allowed');
    $_valid = $_smarty_tpl->decodeProperties(array('file_dependency' => array('01184093b54dc1eadbfa22710de09afcbcbd3d61' => array(0 => '/opt/lbaw/lbaw1353/public_html/frmk/templates/common/menu_logged_out.tpl', 1 => 1386927924, 2 => 'file',),), 'nocache_hash' => '1520383608534811685a1b87-38601493', 'function' => array(), 'variables' => array('BASE_URL' => 0,), 'has_nocache_code' => false, 'version' => 'Smarty-3.1.15', 'unifunc' => 'content_534811685b44f8_16688853',), false); /*/%%SmartyHeaderCode%%*/
?>
<?php if ($_valid && !is_callable('content_534811685b44f8_16688853')) {
    function content_534811685b44f8_16688853($_smarty_tpl)
    { ?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value; ?>
pages/users/register.php">Register</a>
        <form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value; ?>
actions/users/login.php" method="post">
            <input type="text" placeholder="username" name="username">
            <input type="password" placeholder="password" name="password">
            <input type="submit" value=">">
        </form>
    <?php }
} ?>
