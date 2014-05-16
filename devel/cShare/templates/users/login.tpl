{include file="common/header.tpl"}

<body>

    <link href="{$BASE_URL}css/login.css" rel="stylesheet">
    {include file="common/nav.tpl"}

    <!-- LOGIN -->
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Log in to start sharing stuff and have a good time!</h1>

                <div class="account-wall">
                    <img class="profile-img"
                         src="{$BASE_URL}images/assets/default.png"
                         alt="user" align="middle">

                    <form action="{$BASE_URL}actions/users/login.php" class="form-signin" method="post"
                          enctype="multipart/form-data">
                        <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                               value="{$FORM_VALUES['username']}" required autofocus/>
                        <input id="password" name="password" type="password" class="form-control" placeholder="Password"
                               required/>
                        <input id="btn-login" class="btn btn-lg btn-success btn-block" type="submit" value="Login"/>
                        <!--<label class="checkbox pull-left">
                            <input id="remember" name="remember" type="checkbox" value="remember-me"/>
                            Remember me
                        </label>-->
                        <a href="" data-toggle="modal" data-target="#help" data-original-title class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                    </form>
                </div>
                <a href="{$BASE_URL}pages/users/register.php" class="text-center new-account">Create an account </a>
            </div>
        </div>
        <div class="modal fade" id="help" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">Help</h4>
                    </div>
                    <div class="modal-body">
                        <p>Enter your username in the username field and your password in the password field!</p>
                    </div>
                    <div class="modal-footer">
                         <button type="button" class="btn btn-primary btn-close" data-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>

    <br/><br/>
    <div style="padding-left:31.5em;color:red;font-size:2em"> {$ERROR_MESSAGES[sizeof($ERROR_MESSAGES)-1]} </div>
</body>
</html>