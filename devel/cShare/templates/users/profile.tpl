{include file="common/header.tpl"}

<body>
    <link href="{$BASE_URL}css/profile.css" rel="stylesheet">
    <script type="text/javascript" src="{$BASE_URL}javascript/profile.js"></script>

    {include file="common/nav.tpl"}

    <!-- separador de lado-->
    <div class="pull-right" style="width:25%;position:fixed;margin-left:75%">
        <div class="panel panel-primary">
            <div class="panel-heading" style="position:fixed;width:25%;">Latest messages</div>
        </div>
    </div>

    <div class="pull-right" style="margin-top:3em;width:25%;height:95.1%;position:fixed;margin-left:75%">
        <div class="panel panel-primary" style="height:100%;overflow:auto;">
            <div class="panel-body">
                <div class="jumbotron" style="text-align:center;float:left;width:100%">
                    <img src="{$BASE_URL}images/profile-pic.jpg" width="128em" height="128em" style="float:left"/>

                    <div class="caption">
                        <h2>Maria Espinha</h2>

                        <p>Ve la esta noticia sobr...</p>

                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-envelope"/>&nbsp;Open
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-ok"/>&nbsp;Read
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="dislike">
                                <span class="glyphicon glyphicon-trash"/>&nbsp;Delete
                            </a>
                        </div>
                    </div>
                </div>

                <div class="jumbotron" style="text-align:center;float:left;width:100%">
                    <img src="{$BASE_URL}images/profile-pic.jpg" width="128em" height="128em" style="float:left"/>

                    <div class="caption">
                        <h2>José Manuel</h2>

                        <p>Já viste o jogo de ontem?</p>

                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-envelope"/>&nbsp;Open
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-ok"/>&nbsp;Read
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="dislike">
                                <span class="glyphicon glyphicon-trash"/>&nbsp;Delete
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!--Profile-->
    <div>
        <img class="profile-pic" src="{$user[0].fotografia}" width="254em" height="254em"/>
    </div>
    <h1 style="margin-top:1em;">{$user[0].nome}</h1>
    <span class="glyphicon glyphicon-home" style="margin-top:1em"></span>&nbsp;&nbsp;Hometown: {$user[0].localidade}

    <p style="display:block;"><span class="glyphicon glyphicon-briefcase" style="margin-top:0em"></span>&nbsp;&nbsp;Work:
        {$user[0].profissao}</p>

    <div class="btn-group btn-group-sm">
        <a class="btn btn-primary" id="add_friend">
            <span class="glyphicon glyphicon-heart"/>&nbsp;Add Friend
        </a>
    </div>
    <br/>

    <div class="btn-group btn-group-sm" style="margin-top:1em">
        <a href="{$BASE_URL}pages/users/send_message.php?sender={$USERNAME}&receiver={$user[0].username}" class="btn btn-primary" role="dislike">
            <span class="glyphicon glyphicon-envelope"/>&nbsp;Send Message
        </a>
    </div>
    <div class="btn-group btn-group-sm" style="display:block;margin-top:1em">
        <a id="see_friends" class="btn btn-primary" data-toggle="modal" data-target="#friends" data-original-title>
            <span class="glyphicon glyphicon-th-list"/>&nbsp;See Friends
        </a>
        <a id="see_friends" class="btn btn-primary" data-toggle="modal" data-target="#interests" data-original-title>
            <span class="glyphicon glyphicon-th-list"/>&nbsp;Interests
        </a>

        <div class="modal fade" id="interests" tabindex="-1" role="dialog" aria-labelledby="contactLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary" style="border-color:#428bca">
                    <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-th-list"></span>
                            Interests</h4>
                    </div>
                    <div class="modal-body" style="padding:5px;">
                        <div class="row" style="padding-left:4.8em;">
                            <ul class="list-group">
                                {foreach $interests as $inter}
                                <li class="list-group-item" style="width:35em"> {$inter.nome} </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="panel-footer" style="margin-bottom:-14px;">
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="friends" tabindex="-1" role="dialog" aria-labelledby="contactLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary" style="border-color:#428bca">
                    <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-th-list"></span>
                            Friends</h4>
                    </div>
                    <div class="modal-body" style="padding:5px;">
                        {foreach $friends as $friend}
                        <div class="row" style="padding-left:7em;padding-top:0.7em">
                            <div class="user_image">
                                <img src="{$friend.photo}"
                                                     width="64em" height="64em" style="float:left"/>
                            </div>
                            <div class="user_name" style="padding-left: 5em; padding-top: 0.7em">
                                <h4> <a href="#" style="text-decoration:none"> {$friend.name} </a>
                                    <br/> <small style="font-size:12px;padding-left:0.5em;color:#000">{$friend.friends} amigo(s)</small>
                                </h4>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                    <div class="panel-footer" style="margin-bottom:-14px;">
                    </div>
                </div>
            </div>
        </div>
    </div>

    {if ($PERMISSION == 'moderador') && $USERNAME != $user[0].username}
        <br>
        <div name="promote" id="promote" class="btn-group btn-group-sm" style="display:block;margin-top:1em">
            <a class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-chevron-up"/>&nbsp;Promote
            </a>
        </div>
        <div name="demote" id="demote" class="btn-group btn-group-sm" style="display:block;margin-top:1em">
            <a class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-chevron-down"/>&nbsp;Demote
            </a>
        </div>
        <div name="ban" id="ban" class="btn-group btn-group-sm" style="display:block;margin-top:1em">
            <a class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-remove"/>&nbsp;Ban
            </a>
        </div>
        <div name="bantemp" id="bantemp" class="btn-group btn-group-sm" style="display:block;margin-top:1em">
            <a class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-remove"/>&nbsp;Temporary Ban
            </a>
        </div>
        <div name="unban" id="unban" class="btn-group btn-group-sm" style="display:block;margin-top:1em">
            <a class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-remove"/>&nbsp;Unban
            </a>
        </div>
    {/if}

    </div>

    <div style="display:block;margin-top:5em;margin-left:2em">
        <p style="display:inline;float:left;margin-right:1em"><span class="glyphicon glyphicon-user"
                    ></span>&nbsp;

        <div style="display:inline">Username:
            <div id="username" style="display:inline">{$user[0].username}</div>
        </div>
        </p>

        {if ($USERNAME == $user[0].username) || $PERMISSION == 'moderador'}
            <div class="btn-group btn-group-sm" style="display:inline">
                <a href="{$BASE_URL}pages/users/edit_profile.php?username={$user[0].username}" class="btn btn-primary" role="dislike">
                    <span class="glyphicon glyphicon-cog"/>&nbsp;Edit
                </a>
            </div>
        {/if}

    </div>

    <!--post history-->
    <div class="pull-left post-history">
        <div class="panel panel-primary">
            <div class="panel-heading">Post history</div>
        </div>
    </div>

    <div class="pull-left post-history">
        <div class="panel panel-primary" style="height:100%;overflow:auto;">
            <div class="panel-body">

                <div class="jumbotron" style="text-align:center;float:left;width:100%;">
                    <img src="http://imagens8.publico.pt/imagens.aspx/773638?tp=UH&db=IMAGENS" width="192em"
                         height="192em"
                         style="float:left"/>

                    <div class="caption">
                        <h2 style="color:#b74934">Governo insiste no aumento dos descontos para a ADSE através do
                            Parlamento</h2>

                        <p> Conselho de Ministros aprovou envio do diploma vetado </p>

                        <p> por Cavaco Silva para a Assembleia da República.</p>
                        <a href="#" class="btn" role="button"><img src="{$BASE_URL}images/facebook-icon-sm.png"/></a>

                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="dislike">
                                <span class="glyphicon glyphicon-arrow-down"/>
                            </a>
                        </div>
                    </div>
                    <p>

                    <div style="float:left;clear:left">
                        <h4>Posted by maxPoster93 at 21:36</h4>
                    </div>
                    <div style="float:right">
                        <h4>8987 points &nbsp;34 comments</h4>
                    </div>
                    </p>
                </div>

                <div class="jumbotron" style="text-align:center;float:left;width:100%;">
                    <img src="http://imagens8.publico.pt/imagens.aspx/829728?tp=UH&db=IMAGENS" width="192em"
                         height="192em"
                         style="float:left"/>

                    <div class="caption">
                        <h2 style="color:#b74934">Rui Costa sobe mais dois lugares na Paris-Nice</h2>

                        <p>O actual campeão do mundo de ciclismo de estrada mantém-se a 19 segundos da
                            liderança.</p>
                        <a href="#" class="btn" role="button"><img src="{$BASE_URL}images/facebook-icon-sm.png"/></a>

                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="like">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </a>
                        </div>
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-primary" role="dislike">
                                <span class="glyphicon glyphicon-arrow-down"/>
                            </a>
                        </div>
                        <p>

                        <div style="float:left;clear:left">
                            <h4>Posted by maxPoster93 at 21:36</h4>
                        </div>
                        <div style="float:right">
                            <h4>8987 points &nbsp;34 comments</h4>
                        </div>
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>


</body>
</html>