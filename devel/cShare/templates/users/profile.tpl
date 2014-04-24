{include file="common/header.tpl"}

<body>
    <link href="{$BASE_URL}css/profile.css" rel="stylesheet">
    <script type="text/javascript" src="{$BASE_URL}javascript/see_friends.js"></script>
    <script type="text/javascript" src="{$BASE_URL}javascript/add_friend.js"></script>
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
                    <img src="".{$user[0].fotografia}."" width="128em" height="128em" style="float:left"/>

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
                    <img src="../img/profile-pic.jpg" width="128em" height="128em" style="float:left"/>

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
        <a href="#" class="btn btn-primary" role="dislike">
            <span class="glyphicon glyphicon-envelope"/>&nbsp;Send Message
        </a>
    </div>
    <div class="btn-group btn-group-sm" style="display:block;margin-top:1em">
        <a id="see_friends" class="btn btn-primary" data-toggle="modal" data-target="#friends" data-original-title>
            <span class="glyphicon glyphicon-th-list"/>&nbsp;See Friends
        </a>

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
                        <div class="row" style="padding-left:7em">
                            <div id="friends_list">
                                <table id="table">
                                    <tr>
                                        <td>
                                            <div class="jumbotron"
                                                 style="text-align:center;background-color:#fff;width:15em;height:7em">
                                                <img src="http://imagens1.publico.pt/imagens.aspx/829711?tp=UH&db=IMAGENS&w=749"
                                                     width="64em" height="64em" style="float:left"/>

                                                <div class="caption">
                                                    <h4>Joao Cenas</h4>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding-left:5px">
                                            <div class="jumbotron"
                                                 style="text-align:center;background-color:#fff;width:15em;height:7em">
                                                <img src="http://imagens1.publico.pt/imagens.aspx/829711?tp=UH&db=IMAGENS&w=749"
                                                     width="64em" height="64em" style="float:left"/>

                                                <div class="caption">
                                                    <h4>Fabio Cego</h4>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="jumbotron"
                                                 style="text-align:center;background-color:#fff;width:15em;height:7em">
                                                <img src="http://imagens1.publico.pt/imagens.aspx/829711?tp=UH&db=IMAGENS&w=749"
                                                     width="64em" height="64em" style="float:left"/>

                                                <div class="caption">
                                                    <h4>Coiso cegueta</h4>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="padding-left:5px">
                                            <div class="jumbotron"
                                                 style="text-align:center;background-color:#fff;width:15em;height:7em">
                                                <img src="http://imagens1.publico.pt/imagens.aspx/829711?tp=UH&db=IMAGENS&w=749"
                                                     width="64em" height="64em" style="float:left"/>

                                                <div class="caption">
                                                    <h4>Lel lelote</h4>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="margin-bottom:-14px;">
                        <button style="" type="button" class="btn btn-primary btn-close" data-dismiss="modal">
                            Close
                        </button>
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
                <a href="{$BASE_URL}pages/users/edit_profile.php" class="btn btn-primary" role="dislike">
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
                        <a href="#" class="btn" role="button"><img src="../img/facebook-icon-sm.png"/></a>

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
                        <a href="#" class="btn" role="button"><img src="../img/facebook-icon-sm.png"/></a>

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