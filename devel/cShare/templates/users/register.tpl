{include file="common/header.tpl"}

<script type="text/javascript" href="{$BASE_URL}javascript/btn_register.js"></script>

<body>

    <link href="{$BASE_URL}css/register.css" rel="stylesheet">
    {include file="common/nav.tpl"}

    <div class="container account-wall">

        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="{$BASE_URL}actions/users/register.php" class="form-signin" method="post"
                      enctype="multipart/form-data">
                    <h2 style="color:#f0f0f0">Please Register
                        <small style="color:#f0f0f0">It's free and always will be.</small>
                    </h2>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="first_name" id="first_name" class="form-control input-lg"
                                       placeholder="First Name" value="{$FORM_VALUES['first_name']}" tabindex="1" required>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="text" name="last_name" id="last_name" class="form-control input-lg"
                                       placeholder="Last Name" value="{$FORM_VALUES['last_name']}" tabindex="2" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group"> 
                        <input type="text" name="display_name" id="display_name" class="form-control input-lg"
                               placeholder="Username" value="{$FORM_VALUES['display_name']}"  
                        {literal} tabindex="3" required pattern="^[^;:&quot;]{6,15}">
                        {/literal}
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="form-control input-lg"
                               placeholder="Email Address" value="{$FORM_VALUES['email']}" 
                        {literal}  tabindex="4" required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}">
                        {/literal} 
                    </div>
                    <div class="form-group">
                        <input type="text" name="local" id="local" class="form-control input-lg" placeholder="Hometown"
                               value="{$FORM_VALUES['local']}" tabindex="4" required>
                    </div>
                    <div class="form-group">
                        <input type="work" name="work" id="work" class="form-control input-lg" placeholder="Work"
                               value="{$FORM_VALUES['work']}" tabindex="4" required>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                {literal} 
                                <input type="password" name="password" id="password" class="form-control input-lg"
                                       placeholder="Password" tabindex="5" required pattern="^[^;:&quot;]{8,}">
                                {/literal} 
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group">
                                <input type="password" name="password_confirmation" id="password_confirmation"
                                       class="form-control input-lg" placeholder="Confirm Password" tabindex="6" required>
                            </div>
                        </div>
                    </div>
                    <!--<div class="row">
                        <div class="col-xs-4 col-sm-3 col-md-3">
            <span class="button-checkbox">
              <button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
              <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1" required>
            </span>
                        </div>
                        <div class="col-xs-8 col-sm-9 col-md-9">
                            By clicking <strong class="label label-primary">Register</strong>, you agree to the <a
                                    href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set
                            out by this site, including our Cookie Use.
                        </div>
                    </div>-->

                    <hr class="colorgraph">
                    <div class="row">
                        <input type="submit" value="Register" class="btn btn-success btn-block btn-lg" tabindex="7">
                    </div>
                </form>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
                    </div>
                    <div class="modal-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam
                            nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus
                            ipsa porro delectus quidem dolorem ad.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">I Agree</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </div>


    <br/><br/><br/>
    <div style="padding-left:15em;color:red;font-size:3em"> {$ERROR_MESSAGES[sizeof($ERROR_MESSAGES)-1]} </div>
</body>
</html>