{include file="common/header.tpl"}

<body>

<link href="{$BASE_URL}css/login.css" rel="stylesheet">

{include file="common/nav.tpl"}

<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Password Recovery</h1>
            <div class="account-wall">
                <form action="{$BASE_URL}actions/users/login.php" class="form-signin" method="post"
                      enctype="multipart/form-data">
                    <input id="username" name="password" type="text" class="form-control" placeholder="New Password" required autofocus/>
                    <input id="password" name="password" type="password_confirmation" class="form-control" placeholder="Confirm Password"
                           required/>
                    <input id="btn-login" class="btn btn-lg btn-success btn-block" type="submit" value="Submit"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>