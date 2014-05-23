{include file="common/header.tpl"}

<body>
<link href="{$BASE_URL}css/see_message.css" rel="stylesheet">
{include file="common/nav.tpl"}

<div class="container account-wall">
    <div style="margin:2em">
        <div
        <!--class="col-sm-4"-->>
        <h3 style="color:#F0F0F0">Send Message</h3>
        <hr>
    </div>

    <div class="row" style="clear:left">
        <form action="{$BASE_URL}actions/users/send_message.php" method="post">
            <div class="col-lg-5">
                <label style="color:#F0F0F0" for="destination">To</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Enter name"
                       value="{$receiver}" required="required"/>
                <br>

                <div class="margintop">
                    <label style="color:#F0F0F0" for="destination">Subject</label>
                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Enter subject"
                           value="{$subject}" required="required"/>
                </div>
            </div>

            <br>

            <div class="col-lg-11 margintop">
                <br>
                <textarea name="message" id="message" class="form-control" cols="50" rows="9" required="required"
                          placeholder="Message">{$BASE_URL}pages/content/content.php?id={$id}
                </textarea>
                <button type="submit" class="btn btn-success pull-right" style="margin-top:1em" id="btnContactUs">
                    Send Message
                </button>
            </div>
        </form>
    </div>
    </div>
</div>