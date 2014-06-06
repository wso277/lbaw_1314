{include file="common/header.tpl"}

<body>
<script type="text/javascript" src="{$BASE_URL}javascript/rating.js"></script>
{if (isset($USERNAME))}
    <script type="text/javascript" src="{$BASE_URL}javascript/home_buttons.js"></script>
{else}
    <script type="text/javascript" src="{$BASE_URL}javascript/home_no_buttons.js"></script>
{/if}

{include file="common/nav.tpl"}

<div class="container">

    {foreach $news as $new}
        <div class="jumbotron"
             style="border-radius:0px;padding-left:0px;padding-bottom:0px;padding-right:2em;margin-left:0px;margin-bottom:0.5em;background-color:#222222">
            <div class="container" style="padding:0px">

                <div style="float:left;margin-top:3em;">
                    <div>
                        <a href="https://www.facebook.com/sharer/sharer.php?u=gnomo.fe.up.pt{$BASE_URL}pages/content/content.php?id={$new.id}"
                           target="_new" class="btn" role="button"><img class="img-circle" style="padding-left:0.2em"
                                                                        src="{$BASE_URL}images/facebook-icon-sm.png"/></a>
                    </div>
                    <br/>

                    {if (isset($USERNAME))}
                        <div class="btn-group btn-group-sm" style="margin-left:1em">
                            <button id="up{$new.id}" name="{$new.id}" class="btn btn-success" role="like"
                                    onclick="upvote({$new.id})">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </button>
                        </div>
                        <br/>
                        <div class="btn-group btn-group-sm " style="margin-left:1em; margin-top: 0.3em">
                            <button id="down{$new.id}" name="{$new.id}" class="btn btn-success" role="dislike"
                                    onclick="downvote({$new.id})">
                            <span class="glyphicon glyphicon-arrow-down"/>
                            </button>
                        </div>
                    {else}
                        <div class="btn-group btn-group-sm" style="margin-left:1em">
                            <a id="up" name="{$new.id}" href="{$BASE_URL}pages/users/login.php" class="btn btn-success"
                               role="like">
                                <span class="glyphicon glyphicon-arrow-up"/>
                            </a>
                        </div>
                        <br/>
                        <div class="btn-group btn-group-sm " style="margin-left:1em; margin-top: 0.3em">
                            <a id="down" href="{$BASE_URL}pages/users/login.php" name="{$new.id}"
                               class="btn btn-success" role="dislike">
                                <span class="glyphicon glyphicon-arrow-down"/>
                            </a>
                        </div>
                    {/if}

                </div>

                <div style="color:#f0f0f0;font-family:Ubuntu">
                    <img src="{$new.photo}" width="192em" height="192em" style="float:left"/>

                    <div style="padding-left:20em">
                        <h2 style="margin-top:0px"><a href="{$BASE_URL}pages/content/content.php?id={$new.id}"
                                                      style="text-decoration:none">{$new.title}</a></h2>

                        <p style="font-size:1.2em">{$new.content}...</p>
                    </div>
                    <p>

                    <div style="float:left;clear:left;padding-left:4.5em">
                        <h4>Posted by <a href="{$BASE_URL}pages/users/profile.php?username={$new.poster}"
                                         style="text-decoration:none">{$new.poster}</a> at {$new.timestamp}</h4>
                    </div>
                    <div style="float:right">
                        <h4 id={$new.id}>{$new.likes} {if $new.likes > 1 || $new.likes !=
                            -1}points{else}point{/if}
                            &nbsp;{$new.ncomments} {if $new.ncomments > 1}comments{else}comment{/if}</h4>
                    </div>
                    </p>
                </div>
            </div>
        </div>
    {/foreach}
    <div id="append">
        <input type="hidden" id="current" value="{$current}"/>
    </div>

</div>

</body></html>