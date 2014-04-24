{include file="common/header.tpl"}

<body>

    <link href="{$BASE_URL}css/login.css" rel="stylesheet">
    {include file="common/nav.tpl"}

    <!-- LOGIN -->
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Login to continue to cShare</h1>

                <div class="account-wall">
                    <img class="profile-img"
                         src="{$BASE_URL}images/assets/default.png"
                         alt="user" align="middle">

                    <form action="{$BASE_URL}actions/users/login.php" class="form-signin" method="post"
                          enctype="multipart/form-data">
                        <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                               required autofocus/>
                        <input id="password" name="password" type="password" class="form-control" placeholder="Password"
                               required/>
                        <input id="btn-login" class="btn btn-lg btn-success btn-block" type="submit" value="Login"/>
                        <label class="checkbox pull-left">
                            <input id="remember" name="remember" type="checkbox" value="remember-me"/>
                            Remember me
                        </label>
                        <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                    </form>
                </div>
                <a href="#" class="text-center new-account">Create an account </a>
            </div>
        </div>
    </div>
</body>
</html>