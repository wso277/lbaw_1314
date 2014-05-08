{include file="common/header.tpl"}

<body>
    <link href="{$BASE_URL}css/content.css" rel="stylesheet">

    {include file="common/nav.tpl"}

    <!--webcontent-->
    <div class="webview-div">
        <iframe class="webview" src="{$links[0].href}" allowfullscreen=""></iframe>
    </div>

    <div class="left-panel">
        <a href="#" class="btn" role="button"><img src="{$BASE_URL}images/facebook-icon-sm.png"/></a>
        <br>

        <div class="btn-group btn-group-sm" style="margin-left:0.85em">
            <a href="#" class="btn btn-primary" role="like">
                <span class="glyphicon glyphicon-arrow-up"/>
            </a>
        </div>
        <br>

        <div class="btn-group btn-group-sm" style="margin-left:0.85em; margin-top: 0.3em">
            <a href="#" class="btn btn-primary" role="dislike">
                <span class="glyphicon glyphicon-arrow-down"/>
            </a>
        </div>
    </div>

    <div class="content-text">
        <div class="text">
            <h3>Link para a noticia: {foreach $links as $link}<ahref="{$link.href}">{$link.homelink}</a>&nbsp;{/foreach}
            </h3>
            {$content.conteudo}
        </div>

        <div class="comments-header">
            <br/>

            <h1 style="font-family:Calisto MT"><i>Comments</i></h1>
            <br/>
            <h4>{count($comments)} comments</h4>
        </div>

        {if ($USERNAME != "")}
        <form action="{$BASE_URL}actions/content/comment.php" method="post">
            <div class="row" style="text-align:right;margin-left:4em">
                <div class="col-lg-6">
                    <!--<img class="avatar-image" src="../img/facebook-icon-sm.png" style=";float:left"/>-->
                    <textarea class="form-control" name="comment" style="resize: none" placeholder="Leave a comment..."
                              rows="4"></textarea>
                    <input type="hidden" name="id" value="{$content.idnoticia}"/>
                    <input type="hidden" name="username" value="{$USERNAME}"/>
                    <input type="submit" value="comment" class="btn btn-success" style="margin-top:0.2em"/>
                </div>
            </div>
        </form>
        {/if}
        <div> {{$ERROR_MESSAGES[sizeof($ERROR_MESSAGES)-1]}}</div>
        <div class="comments-container">
            {foreach $comments as $comment}
            <div class="comment text">
                <div class="avatar">
                    <img class="avatar-image" src="{$comment.photo.fotografia}" width="48em" height="48em"
                         style="float:left"/>
                </div>
                <div class="comment-author">
                    <b>{$comment.username}</b>
                    &nbsp;{$comment.likes} {if $comment.likes > 1}points{else if $comment.likes != NULL}point{/if}{if $comment.likes == NULL}0 points{/if}
                </div>
                <div class="comment-text">
                    {$comment.content}
                </div>
                <div class="vote-buttons">
                    <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-cmt">
                            <span class="glyphicon glyphicon-arrow-down"/>
                        </button>
                    </div>
                    <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-cmt">
                            <span class="glyphicon glyphicon-arrow-up"/>
                        </button>
                    </div>
                    {if $comment.username == $USERNAME || $PERMISSION == 'moderador'}
                    <a class="btn btn-primary btn-md" data-toggle="modal" data-target="#edit" data-original-title>
                        Edit
                    </a>

                    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="contactLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="panel panel-primary" style="border-color:#428bca">
                                <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                    </button>
                                    <h4 class="panel-title" id="contactLabel"><span
                                                class="glyphicon glyphicon-wrench"></span> Edit comment</h4>
                                </div>
                                <form action="#" method="post" accept-charset="utf-8">
                                    <div class="modal-body" style="padding: 5px;">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <textarea style="resize:vertical;" class="form-control"
                                                          placeholder="New Comment..." rows="6" name="comment"
                                                          required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer" style="margin-bottom:-14px;">
                                        <input type="submit" class="btn btn-success" value="Send"/>
                                        <input type="reset" class="btn btn-danger" value="Clear"/>
                                        <button style="float: right;" type="button" class="btn btn-primary btn-close"
                                                data-dismiss="modal">Close
                                        </button>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
            </div>
        </div>
        {/foreach}
    </div>
    </div>
</body>
</html>