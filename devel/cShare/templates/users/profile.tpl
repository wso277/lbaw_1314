{include file="common/header.tpl"}

<body>
  <link href="{$BASE_URL}css/profile_stuff.css" rel="stylesheet">
  <link href="{$BASE_URL}css/messages.css" rel="stylesheet">
  <script type="text/javascript" src="{$BASE_URL}javascript/profile.js"></script>
  <script type="text/javascript" src="{$BASE_URL}javascript/profile_stuff.js"></script>
  <script type="text/javascript" src="{$BASE_URL}javascript/messages.js"></script>

  {include file="common/nav.tpl"}

  <div class="container">
   <div class="row well" style="background-color:#222;color:#fff;border-color:#222;box-shadow: 1px 2px 2px #111;">
    <div class="col-md-15">
      <div class="panelx">
        <img class="pic img-circle" src="{$user[0].fotografia}" alt="...">
        <div class="name"><small>{$user[0].nome}, {$user[0].localidade}</small></div>
      </div>

      <br/><br/>
      <div style="padding-left:33em">

        {if ($USERNAME != $user[0].username)}
        <div class="btn-group btn-group-sm">
          <a class="btn btn-success" id="add_friend">
            <i class="glyphicon glyphicon-heart"></i>&nbsp;Add Friend
          </a>
        </div>
        {/if}
        <div class="btn-group btn-group-sm">
          {if ($USERNAME != $user[0].username)}
          <a class="btn btn-success" href="{$BASE_URL}pages/users/send_message.php?sender={$USERNAME}&receiver={$user[0].username}">
            <i class="glyphicon glyphicon-envelope"></i>&nbsp;Send Message
          </a>
          {else}
          <a href="{$BASE_URL}pages/users/send_message.php?sender={$USERNAME}&receiver="
          class="btn btn-success">
          <i class="glyphicon glyphicon-envelope"></i>&nbsp;Send Message
        </a>
        {/if}
      </div>
      {if ($PERMISSION == 'moderador') && $USERNAME != $user[0].username}
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" id="promote">
          <i class="glyphicon glyphicon-chevron-up"></i>&nbsp;Promote
        </a>
      </div>
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" id="demote">
          <i class="glyphicon glyphicon-chevron-down"></i>&nbsp;Demote
        </a>
      </div>
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" id="ban">
          <i class="glyphicon glyphicon-remove"></i>&nbsp;Ban
        </a>
      </div>
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" id="bantemp">
          <i class="glyphicon glyphicon-remove"></i>&nbsp;Temporary Ban
        </a>
      </div>
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" id="unban">
          <i class="glyphicon glyphicon-remove"></i>&nbsp;Unban
        </a>
      </div>
      {/if}
      {if ($USERNAME == $user[0].username) || $PERMISSION == 'moderador'}
      <div class="btn-group btn-group-sm">
        <a class="btn btn-success" href="{$BASE_URL}pages/users/edit_profile.php?username={$user[0].username}">
          <i class="glyphicon glyphicon-cog"></i>&nbsp;Edit
        </a>
      </div>
      {/if}
    </div>

    <br><br><br>

    

    <ul class="nav nav-tabs" id="myTab">
      <li class="active"><a href="#info" data-toggle="tab"><i class="glyphicon glyphicon-list-alt"></i> Info</a></li>
      <li><a href="#messages" data-toggle="tab"><i class="glyphicon glyphicon-comment"></i> Messages</a></li>
      <li><a href="#posts" data-toggle="tab"><i class="glyphicon glyphicon-time"></i> Post History</a></li>
      <li><a href="#friends" data-toggle="tab"><i class="glyphicon glyphicon-list"></i> Friends</a></li>
      <li><a href="#inter" data-toggle="tab"><i class="glyphicon glyphicon-ok"></i> Interests</a></li>
    </ul>

    <div class="tab-content">
      <div class="tab-pane active" id="info">
        <div style="padding-left:3em;padding-top:1em">
          <i class="glyphicon glyphicon-home"></i>&nbsp;Hometown: {$user[0].localidade}
          <br/>
          <br/>
          <i class="glyphicon glyphicon-briefcase"></i>&nbsp;Work: {$user[0].profissao}
          <br/>
          <br/>
          <i class="glyphicon glyphicon-user"></i>&nbsp;username: {$user[0].username}
        </div>
      </div>


      <div class="tab-pane" id="messages">
        <div style="padding-top:1em">
          <div class="col-md-6">
            <div class="panel panel-primary" style="border-color:#777">
              <div class="panel-heading" style="background-color:#428bca;border-color:#428bca">
                <h3 class="panel-title">Messages Sent</h3>
                <div class="pull-right">
                  <span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
                    <i class="glyphicon glyphicon-filter"></i>
                  </span>
                </div>
              </div>
              <div class="panel-body">
                <input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
              </div>
              <table class="table table-hover" id="dev-table">
                <thead>
                  <tr>
                    <th>Message Title</th>
                    <th>Receiver</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  {foreach $sentMessages as $msg}
                  <tr>
                    <td><a href="#">{$msg.titulo}</a></td>
                    <td><a href="{$BASE_URL}pages/users/profile.php?username={$msg.recetor}">{$msg.recetor}</a></td>
                    <td><a href="">Delete</a></td>
                  </tr>
                  {/foreach}
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-md-6">
            <div class="panel panel-primary" style="border-color:#777">
              <div class="panel-heading" style="background-color:#5cb85c;border-color:#5cb85c">
                <h3 class="panel-title">Messages Received</h3>
                <div class="pull-right">
                  <span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
                    <i class="glyphicon glyphicon-filter"></i>
                  </span>
                </div>
              </div>
              <div class="panel-body">
                <input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
              </div>
              <table class="table table-hover" id="dev-table">
                <thead>
                  <tr>
                    <th>Message Title</th>
                    <th>Receiver</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>
                  {foreach $receivedMessages as $msg}
                  <tr>
                    <td><a href="#">{$msg.titulo}</a></td>
                    <td><a href="{$BASE_URL}pages/users/profile.php?username={$msg.username}">{$msg.username}</a></td>
                    <td><a href="">Delete</a></td>
                  </tr>
                  {/foreach}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>


      <div class="tab-pane" id="posts">
        <a href=""><div class="well well-sm" style="margin:0px;background-color:#222;border-color:#222">Open GL Assignments <span class="pull-right"><i class="glyphicon glyphicon-time"></i> 12:20 AM 20 Dec 2014 </span></div></a>        
      </div>

      <a name="friends">
        <div class="tab-pane" id="friends">
         {foreach $friends as $friend}
         <div class="row" style="padding-left:7em;padding-top:0.7em">
          <div class="user_image">
            <img src="{$friend.photo}"
            width="64em" height="64em" style="float:left"/>
          </div>
          <div class="user_name" style="padding-left: 5em; padding-top: 0.7em">
            <h4><a href="{$BASE_URL}pages/users/profile.php?username={$friend.username}"
              style="text-decoration:none"> {$friend.name} </a>
              <br/>
              <small style="font-size:12px;padding-left:0.5em;color:#fff"> {$friend.friends}
                amigo(s)
              </small>
            </h4>
          </div>
        </div>
        {/foreach}
      </div>
    </a>


    <div class="tab-pane" id="inter">
      <div id="div_ul" style="padding-top:2em;padding-left:22em">
        <ul class="list-group">
          {foreach $interests as $inter}
          <li class="list-group-item" style="width:35em;color:#000"> {$inter.nome} </li>
          {/foreach}
        </ul>
      </div>
    </div>

  </div>

</div>
</div>


</div>


</body>
</html>