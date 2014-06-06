{include file="common/header.tpl"}

<body>

{include file="common/nav.tpl"}

<link href="{$BASE_URL}css/search.css" rel="stylesheet">
<script type="text/javascript" src="{$BASE_URL}javascript/filter.js"></script>

<div class="count">
    Found {(sizeof($results['user']) + sizeof($results['work']) + sizeof($results['local']) + sizeof
    ($results['content']))} results
</div>
<div class="well well-sm">
    <table>
        <tr>
            <td width="10%">
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
            <td> 
                <input type="date" class="form-control" id="first_date" placeholder="Date range(min value)">
            </td>
            <td>
                <input type="date" class="form-control" id="last_date" placeholder="Date range(max value)">
            </td>
            <td>
                <button class="btn btn-md btn-success" id="filter">Filter by date</button>
            </td>
            </form>
        </tr>
    </table>

    <div class="results">&nbsp;Found {count($results['content'])} news</div>
    <div id ="news">
    {foreach $results['content'] as $content}
        <div class="media" id="{$content.data_post}">
            <a class="pull-left" href="{$BASE_URL}pages/content/content.php?id={$content.idnoticia}">
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
    </div>

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
