{include file="common/header.tpl"}

<body>

    {include file="common/nav.tpl"}

    <div class="count">
        Found {sizeof($results['user'])} results
    </div>
    <div class="well well-sm">
        <table>
            <tr>
                <td width="30%">
				<span class="glyphicon glyphicon-search" style="font-size:48px;margin:30% 30% 30% 30%;">
				</span>
                <td>
                    <form action="{$BASE_URL}pages/users/search.php" method="get"
                          class="navbar-form navbar-left" role="search">
                        <td>

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

        <div class="glyphicon glyphicon-filter">
        </div>
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

        {foreach $results['user'] as $user}
            <div class="media">
                <a class="pull-left" href="{$BASE_URL}pages/users/profile.php?username={$user.username}">
                    <img class="media-object" src="{$user.fotografia}"
                         width="64px" height="64px">
                </a>

                <a href="{$BASE_URL}pages/users/profile.php?username={$user.username}">
                    <div class="media-body">
                        <h4 class="media-heading">{$user.nome}</h4>
                    </div>
                </a>
            </div>
        {/foreach}
        <!--        <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://imagens1.publico.pt/imagens.aspx/829711?tp=UH&db=IMAGENS&w=749"
                             width="64px" height="64px">
                    </a>

                    <div class="media-body">
                        <h4 class="media-heading">Parlamento Europeu aprova carregador único para telemóveis</h4>

                        <p> Medida ainda terá de ser aprovada pelo Conselho Europeu e transposta para as legislações
                            nacionais.</p>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img class="media-object"
                                 src="http://imagens8.publico.pt/imagens.aspx/773638?tp=UH&db=IMAGENS&w=749" width="64px"
                                 height="64px">
                        </a>

                        <div class="media-body">
                            <h4 class="media-heading">Governo insiste no aumento dos descontos para a ADSE através do
                                Parlamento</h4>

                            <p>Conselho de Ministros aprovou envio do diploma vetado
                                por Cavaco Silva para a Assembleia da República. </p>
                        </div>

                    </div>
                    -->

    </div>
    <!--    </td>
        </td>
        </tr>
        </table>
        </div>-->
</body>
