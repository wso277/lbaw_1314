{include file="common/header.tpl"}

<body>

<link href="{$BASE_URL}css/register.css" rel="stylesheet">
{include file="common/nav.tpl"}

<div class="container account-wall">

    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form action="{$BASE_URL}actions/users/edit_profile.php" class="form-signin" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="username" id="username" class="form-control input-lg"
                       value="{$user[0].username}" tabindex="2">

                <h2 style="color:#f0f0f0">Edit your profile information</h2>
                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="first_name" id="first_name" class="form-control input-lg"
                                   placeholder="First Name" value="{$firstName}" tabindex="1">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="last_name" id="last_name" class="form-control input-lg"
                                   placeholder="Last Name" value="{$lastName}" tabindex="2">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" name="work" id="work" class="form-control input-lg" placeholder="Work"
                           value="{$user[0].profissao}" tabindex="3">
                </div>
                <div class="form-group">
                    <input type="text" name="local" id="local" class="form-control input-lg" placeholder="Local"
                           value="{$user[0].localidade}" tabindex="3">
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-lg" value="{$user[0].email}"
                           placeholder="Email Address" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="file" name="file" id="file" accept="image/*"><br>
                </div>
                <div>
                    <h3 style="color:#f0f0f0">Interests</h3>

                    <div class="checkbox" style="color:#f0f0f0">
                        <label>
                            <input type="checkbox" name="sports" id="sports"> Sports </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="culture" id="culture"> Culture </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="football" id="football"> Football </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="cinema" id="cinema"> Cinema </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="literature" id="literature"> Literature </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="agriculture" id="agriculture"> Agriculture </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="politics" id="politics"> Politics </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="sex" id="sex"> Sex </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="video-games" id="video-games"> Video-Games </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="news" id="news"> News </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="gastronomy" id="gastronomy"> Gastronomy </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="meteorology" id="meteorology"> Meteorology </input><br>
                        </label>
                        <label>
                            <input type="checkbox" name="motor sports" id="motor_sports"> Motor Sports </input><br>
                        </label>
                    </div>
                </div>

                <hr class="colorgraph">
                <div class="row">
                    <input type="submit" value="Edit" class="btn btn-success btn-block btn-lg" tabindex="7">
                </div>
                <br>
            </form>
        </div>
    </div>
</div>
</body></html>