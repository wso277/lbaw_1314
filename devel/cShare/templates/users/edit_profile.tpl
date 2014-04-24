{include file="common/header.tpl"}

<body>

    <link href="../css/register.css" rel="stylesheet">
    {include file="common/nav.tpl"}

    <div class="container">

        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="{$BASE_URL}actions/users/edit_profile.php" class="form-signin" method="post"
                      enctype="multipart/form-data">
                    <h2>Edit your profile information</h2>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="first_name" id="first_name" class="form-control input-lg"
                                       placeholder="First Name" tabindex="1">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="last_name" id="last_name" class="form-control input-lg"
                                       placeholder="Last Name" tabindex="2">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" name="work" id="work" class="form-control input-lg" placeholder="Work"
                               tabindex="3">
                    </div>
                    <div class="form-group">
                        <input type="text" name="local" id="local" class="form-control input-lg" placeholder="Local"
                               tabindex="3">
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="form-control input-lg"
                               placeholder="Email Address" tabindex="4">
                    </div>
                    <div class="form-group">
                        <input type="text" name="picture" id="picture" class="form-control input-lg"
                               placeholder="Picture URL" tabindex="4">
                    </div>
                    <div>
                        <h3>Interests</h3>

                        <div class="checkbox">

                            <label>
                                <input type="checkbox" name="sports" id="sports"> Sports </input><br>
                                <input type="checkbox" name="culture" id="culture"> Culture </input><br>
                                <input type="checkbox" name="football" id="football"> Football </input><br>
                                <input type="checkbox" name="cinema" id="cinema"> Cinema </input><br>
                                <input type="checkbox" name="literature" id="literature"> Literature </input><br>
                                <input type="checkbox" name="agriculture" id="agriculture"> Agriculture </input><br>
                                <input type="checkbox" name="politics" id="politics"> Politics </input><br>
                                <input type="checkbox" name="sex" id="sex"> Sex </input><br>
                                <input type="checkbox" name="video-games" id="video-games"> Video-Games </input><br>
                                <input type="checkbox" name="news" id="news"> News </input><br>
                                <input type="checkbox" name="gastronomy" id="gastronomy"> Gastronomy </input><br>
                                <input type="checkbox" name="meteorology" id="meteorology"> Meteorology </input><br>
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
</body>
</html>