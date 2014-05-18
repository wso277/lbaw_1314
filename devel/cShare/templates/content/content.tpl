{include file="common/header.tpl"}

<body>
<link href="{$BASE_URL}css/content.css" rel="stylesheet">
<script type="text/javascript" src="{$BASE_URL}javascript/rating.js"></script>
{include file="common/nav.tpl"}

<!--webcontent-->
<div class="webview-div">
    <iframe class="webview" src="{$links[0].href}" allowfullscreen=""></iframe>
</div>

<div class="left-panel">
    <a href="#" class="btn" role="button"><img src="{$BASE_URL}images/facebook-icon-sm.png"/></a>
    <br>

    {if (isset($USERNAME))}
        <div class="btn-group btn-group-sm" style="margin-left:0.85em">
            <a id="up" name="{$content.id}" class="btn btn-success" role="like" onclick="upvote({$content.idnoticia})">
                <span class="glyphicon glyphicon-arrow-up"/>
            </a>
        </div>
        <br>
        <div class="btn-group btn-group-sm" style="margin-left:0.85em; margin-top: 0.3em">
            <a id="down" name="{$content.id}" class="btn btn-success" role="dislike"
               onclick="downvote({$content.idnoticia})">
                <span class="glyphicon glyphicon-arrow-down"/>
            </a>
        </div>
    {else}
        <div class="btn-group btn-group-sm" style="margin-left:0.85em">
            <a id="up" name="{$content.id}" href="{$BASE_URL}pages/users/login.php" class="btn btn-success" role="like">
                <span class="glyphicon glyphicon-arrow-up"/>
            </a>
        </div>
        <br>
        <div class="btn-group btn-group-sm" style="margin-left:0.85em; margin-top: 0.3em">
            <a id="down" href="{$BASE_URL}pages/users/login.php" name="{$content.id}" class="btn btn-success"
               role="dislike">
                <span class="glyphicon glyphicon-arrow-down"/>
            </a>
        </div>
    {/if}
</div>

<div class="content-text">
    <div class="text">
        <h3>Link para a noticia: {foreach $links as $link}
                <a href="{$link.href}">{$link.homelink}</a>
                &nbsp;{/foreach}
        </h3>
        {$content.conteudo}
    </div>
    <a class="btn btn-primary btn-md" href="{$BASE_URL}pages/users/">
        Edit Content
    </a>

    <div class="comments-header">
        <br/>

        <h1 style="font-family:Calisto MT"><i>Comments</i></h1><br/>
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
                {if (isset($USERNAME))}
                    <div class="btn-group btn-group-sm">
                        <a id="up" name="{$comment.id}" onclick="upvoteComment({$comment.id})">
                            <button type="button" class="btn btn-cmt">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </button>
                        </a>
                    </div>
                    <div class="btn-group btn-group-sm">
                        <a id="down" name="{$comment.id}" onclick="downvoteComment({$comment.id})">
                            <button type="button" class="btn btn-cmt">
                                <span class="glyphicon glyphicon-arrow-down"/>
                            </button>
                        </a>
                    </div>
                {else}
                    <div class="btn-group btn-group-sm">
                        <a id="up" name="{$comment.id}" href="{$BASE_URL}pages/users/login.php">
                            <button type="button" class="btn btn-cmt">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </button>
                        </a>
                    </div>
                    <div class="btn-group btn-group-sm">
                        <a id="down" href="{$BASE_URL}pages/users/login.php" name="{$comment.id}">
                            <button type="button" class="btn btn-cmt">
                                <span class="glyphicon glyphicon-arrow-down"/>
                            </button>
                        </a>
                    </div>
                {/if}

                {if $comment.username == $USERNAME || $PERMISSION == 'moderador'}
                <a class="btn btn-primary btn-md" data-toggle="modal" data-target="#edit{$comment.cont}"
                   data-original-title>
                    Edit
                </a>

                <div class="modal fade" id="edit{$comment.cont}" tabindex="-1" role="dialog"
                     aria-labelledby="contactLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="panel panel-primary" style="border-color:#428bca">
                            <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                </button>
                                <h4 class="panel-title" id="contactLabel"><span
                                            class="glyphicon glyphicon-wrench"></span> Edit comment</h4>
                            </div>
                            <form action="{$BASE_URL}actions/content/edit_comment.php" method="post"
                                  accept-charset="utf-8">
                                <div class="modal-body" style="padding: 5px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <textarea style="resize:vertical;" class="form-control"
                                                      placeholder="New Comment..." rows="6" name="new_comment"
                                                      required></textarea>
                                            <input type="hidden" value="{$content.idnoticia}" name="contentId"/>
                                            <input type="hidden" value="{$comment.id}" name="commentId"/>
                                            <input type="hidden" value="{$comment.username}" name="comment_username"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer" style="margin-bottom:-14px;">
                                    <input type="submit" class="btn btn-success" value="Send"/>
                            </form>
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