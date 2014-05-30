{include file="common/header.tpl"}

<body>

<link href="{$BASE_URL}css/login.css" rel="stylesheet">
{include file="common/nav.tpl"}

<!-- LOGIN -->
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Log in to have fun!</h1>

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

                    <a class="pull-left need-help" href="" data-toggle="modal" data-target="#forgot" data-original-title>Forgot your password?</a>

                    <a href="" data-toggle="modal" data-target="#help" data-original-title class="pull-right need-help">Need
                        help? </a><span class="clearfix"></span>
                </form>
            </div>
            <a href="{$BASE_URL}pages/users/register.php" class="text-center new-account">Create an account </a>
        </div>
    </div>

    <div class="modal fade" id="help" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="panel panel-primary" style="border-color:#428bca">
                <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="panel-title" id="contactLabel"><span
                                class="glyphicon glyphicon-question-sign"></span> Forgot your password?</h4>
                </div>
                    <div class="modal-body" style="padding: 5px;">
                        <p>Enter your username in the username field and your password in the password field!</p><br/>
                        <p>You will be redirected to the homepage after you log in</p>
                    </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>