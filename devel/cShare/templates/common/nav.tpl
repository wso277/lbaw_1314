<!-- barra de cima-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="navbar-collapse">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="{$BASE_URL}pages/homepage/home.php"><img
                            src="{$BASE_URL}images/cshare_xxs.png" height="24px"/></a>
            </div>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    {if isset($USERNAME)}
                        <li><a href="{$BASE_URL}pages/users/profile.php?username={$USERNAME}"><span
                                        class="glyphicon glyphicon-user"/>&nbsp;Profile</a></li>
                        <li><a href="{$BASE_URL}pages/users/profile.php?username={$USERNAME}#friends"><span class="glyphicon glyphicon-list"/>&nbsp;Friends</a></li>
                        <li><a href="{$BASE_URL}pages/content/publish.php"><i class="glyphicon glyphicon-share"></i>&nbsp;Share It!</a>
                    {else}
                        <li><a href="{$BASE_URL}pages/users/login.php"><span class="glyphicon glyphicon-user"/>&nbsp;Profile</a></li>
                        <li><a href="{$BASE_URL}pages/users/login.php"><span class="glyphicon glyphicon-list"/>&nbsp;Friends</a></li>
                        <li><a href="{$BASE_URL}pages/users/login.php"><i class="glyphicon glyphicon-share"></i>&nbsp;Share It!</a>
                    {/if}

                </ul>
                <form action="{$BASE_URL}pages/users/search.php" method="get"
                      class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input name="search" type="text" class="form-control" placeholder="Search" style="width:175%%">
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    </li>
                {if ($USERNAME != "")}
                        <li><a href="" data-toggle="modal" data-target="#what" data-original-title><i class="glyphicon glyphicon-question-sign"></i>&nbsp;What am I doing here?</a></li>
                        <li><a href="{$BASE_URL}actions/users/logout.php"><span class="glyphicon glyphicon-log-in"/>&nbsp;Logout</a>
                        </li>
                {else}
                        <li><a href="" data-toggle="modal" data-target="#what" data-original-title><i class="glyphicon glyphicon-question-sign"></i>&nbsp;What am I doing here?</a></li>
                        <li><a href="{$BASE_URL}pages/users/login.php"><span class="glyphicon glyphicon-log-in"/>&nbsp;Login</a>
                        </li>
                        <li><a href="{$BASE_URL}pages/users/register.php"><span class="glyphicon glyphicon-check"/>&nbsp;Register</a>
                        </li>
                {/if}
                </ul>

            </div>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

{if $ERROR_MESSAGES[sizeof($ERROR_MESSAGES)-1] != NULL}
<div class="alert alert-danger"> 
    {$ERROR_MESSAGES[sizeof($ERROR_MESSAGES)-1]}  <a class="close" href="">X</a> 
</div> 
{/if}
{if $SUCCESS_MESSAGES[sizeof($SUCCESS_MESSAGES)-1] != NULL}
<div class="alert alert-success"> 
    {$SUCCESS_MESSAGES[sizeof($SUCCESS_MESSAGES)-1]}  <a class="close" href="">X</a> 
</div> 
{/if}


<div class="modal fade" id="what" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="panel panel-primary" style="border-color:#428bca">
            <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="panel-title" id="contactLabel"><span
                            class="glyphicon glyphicon-question-sign"></span>What am I doing here?</h4>
            </div>
                <div class="modal-body" style="padding: 5px;">
                    <h4>What can you do here you say?</h4></br>
					{if $smarty.server.REQUEST_URI|strstr: 'publish'}
					<p>This page allows you to publish a fresh new content!</p>
					<p>The <b>Title</b> must have 85 alphanumeric characters at most.</p>
					<p>You can also provide an URL to some image representing your content.</>
					<p>Besides this, you can give an URL to the news page</p>
					{else}
                    <p>As a <b>Visitor</b>, you can see all our content, who posted it and share news via Facebook. Plus, you can <span class="glyphicon glyphicon-check"></span><b>Register</b> to our great website!</p>
					<p>If you are already a member, please <span class="glyphicon glyphicon-log-in"></span><b> Log In</b>. From this page you can go to your <span class="glyphicon glyphicon-user"></span><b>Profile</b>, <span class="glyphicon glyphicon-share"></span><b>Share</b> content, see your <span class="glyphicon glyphicon-list"></span><b>Friends</b>,
					<span class="glyphicon glyphicon-arrow-up"></span><b>Upvote</b> or <span class="glyphicon glyphicon-arrow-down"></span><b>Downvote</b> a news and all the things a <b>Visitor</b> can do.</p>
					{/if}
				</div>
        </div>
    </div>
</div>
