{include file="common/header.tpl"}

<body>

{include file="common/nav.tpl"}

<link href="{$BASE_URL}css/search.css" rel="stylesheet">

<div class="count">
    Found {(sizeof($results['user']) + sizeof($results['work']) + sizeof($results['local']) + sizeof
    ($results['content']))} results
</div>
<div class="well well-sm">
    <table>
        <tr>
            <td width="30%">
				<span class="glyphicon glyphicon-search" style="font-size:48px;margin:30% 30% 30% 30%;">
				</span>
            </td>
            <td>
                <form action="{$BASE_URL}pages/users/search.php" method="get" class="navbar-form navbar-left"
                      role="search">
                    <div id="search">
                        <input name="search" class="form-control" type="text" value="{$search}"/>
                    </div>
            </td>
            <td>
                <input type="submit" class="btn btn-success" value="Search"/>
            </td>
            </form>
        </tr>
    </table>

    <div class="glyphicon glyphicon-filter"></div>
    <!--Filters

    <div class="well">
        <table>
            <tr>
                <td width="30%">
                    <a href="#">Filter 1</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 5</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 9</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 13</a>
                </td>
            </tr>

            <tr>
                <td width="30%">
                    <a href="#">Filter 2</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 6</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 10</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 14</a>
                </td>
            </tr>

            <tr>
                <td width="30%">
                    <a href="#">Filter 3</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 7</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 11</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 15</a>
                </td>
            </tr>

            <tr>
                <td width="30%">
                    <a href="#">Filter 4</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 8</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 12</a>
                </td>
                <td width="30%">
                    <a href="#">Filter 16</a>
                </td>
            </tr>
        </table>
    </div>-->

    <div class="results">&nbsp;Found {count($results['content'])} news</div>
    {foreach $results['content'] as $content}
        <div class="media">
            <a class="pull-left" href="{$BASE_URL}pages/users/content.php?id={$content.idnoticia}">
                <img class="media-object" src="{$content.fotografia}" width="64px" height="64px">
            </a>

            <a href="{$BASE_URL}pages/users/content.php?id={$content.idnoticia}">
                <div class="media-body">
                    <h4 class="media-heading">{$content.titulo}</h4>

                    <p>{substr($content.conteudo, 0, 250)}</p>
                </div>
            </a>
        </div>
    {/foreach}

    <br>

    <div class="results">&nbsp;Search by Username:
        Found {count($results['user'])} {if count($results['user']) > 1} users {else if count($results['user']) == 1} user {/if} </div>
    {foreach $results['user'] as $user}
        <div class="media">
            <a class="pull-left" href="{$BASE_URL}pages/users/profile.php?username={$user.username}">
                <img class="media-object" src="{$user.fotografia}" width="64px" height="64px">
            </a>

            <a href="{$BASE_URL}pages/users/profile.php?username={$user.username}">
                <div class="media-body">
                    <h4 class="media-heading">{$user.nome}</h4>
                </div>
            </a>
        </div>
    {/foreach}

    <br/>

    <div class="results">&nbsp;Search by Hometown:
        Found {count($results['local'])} {if count($results['local']) > 1 || count($results['local']) < 1} users {else if count($results['local']) == 1} user {/if} </div>
    {foreach $results['local'] as $local}
        <div class="media">
            <a class="pull-left" href="{$BASE_URL}pages/users/profile.php?username={$local.username}">
                <img class="media-object" src="{$local.fotografia}" width="64px" height="64px">
            </a>

            <a href="{$BASE_URL}pages/users/profile.php?username={$local.username}">
                <div class="media-body">
                    <h4 class="media-heading">{$local.nome}</h4>
                </div>
            </a>
        </div>
    {/foreach}

    <br/>

    <div class="results">&nbsp;Search by Work:
        Found {count($results['work'])} {if count($results['work']) > 1 || count($results['work']) < 1} users {else if count($results['work']) == 1} user {/if} </div>
    {foreach $results['work'] as $work}
        <div class="media">
            <a class="pull-left" href="{$BASE_URL}pages/users/profile.php?username={$work.username}">
                <img class="media-object" src="{$work.fotografia}" width="64px" height="64px">
            </a>

            <a href="{$BASE_URL}pages/users/profile.php?username={$work.username}">
                <div class="media-body">
                    <h4 class="media-heading">{$work.nome}</h4>
                </div>
            </a>
        </div>
    {/foreach}

</div>
</body>
