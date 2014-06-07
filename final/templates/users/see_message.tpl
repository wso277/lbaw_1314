{include file="common/header.tpl"}

<body>
<link href="{$BASE_URL}css/see_message.css" rel="stylesheet">
{include file="common/nav.tpl"}
<div class="container account-wall">
    <div class="well well-sm" style="display:inline;float:left;border-radius:0px;width:35%;margin-left:2em">
        {$msg.emissor}
    </div>
    <br><br><br>

    <div class="well well-sm" style="border-radius:0px;width:50%;margin-left:2em">
        {$msg.titulo}
    </div>
    <br>

    <div class="well well-sm"
         style="border-radius:0px;height:15em;margin-left:2em;margin-right:2em;word-wrap:break-word">
        {$msg.conteudo}
    </div>
    <div class="well well-sm" style="display:inline;float:right;border-radius:0px;width:35%;margin-right:2em">
        {$msg.recetor}
    </div>
</div>
</body>