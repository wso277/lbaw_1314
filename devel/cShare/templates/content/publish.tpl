{include file="common/header.tpl"}

<body>

<link href="{$BASE_URL}css/publication.css" rel="stylesheet">
<script src="{$BASE_URL}javascript/publication.js"></script>

{include file="common/nav.tpl"}

<!-- Publication Form -->

<div class="container account-wall">
    <div>
        <div class="col-sm-4">
            <h3 style="color:#f0f0f0">Share your news!</h3>
            <hr>
        </div>

        <div class="col-sm-8 contact-form" style="float:left;clear:left">
            <form id="public" action="{$BASE_URL}actions/content/publish.php" method="post" class="form" role="form">
                <div class="row">
                    <div class="col-xs-6 col-md-6 form-group" style="width:100%">
                        <input class="form-control" id="title" name="title" placeholder="Title" type="text" required
                               autofocus/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-md-6 form-group" style="width:100%">
                        <input class="form-control" id="photo" name="photo" placeholder="Image URL" type="text"/>
                    </div>
                </div>
                <textarea class="form-control" style="resize: none" id="message" name="message" placeholder="Message"
                          rows="10"></textarea>
                <br/>

                <div class="row">
                    <div class="col-xs-12 col-md-12 form-group">
                        <button class="btn btn-success pull-right" type="submit">Submit</button>
                        <button class="btn btn-primary pull-right" style="margin-right:1em">Preview</button>
                    </div>
                </div>
        </div>
    </div>

    <div class="link-form">
        <input type="hidden" name="count" value="1"/>

        <div class="control-group" id="fields">
            <label class="control-label" for="field1" style="color:#f0f0f0">Included links</label>

            <div class="controls" id="profs">
                <div class="input-append">
                    <input autocomplete="off" class="span3 link-box" id="field1" name="link1" type="text"
                           placeholder="Link" data-provide="typeahead" data-items="8"
                           data-source='["Aardvark","Beatlejuice","Capricorn","Deathmaul","Epic"]'/>
                    <button id="b1" class="btn btn-primary add-more" type="button" style="margin-top:1em">+</button>
                </div>
                <br>

                <div id="small">
                    <small style="color:#f0f0f0">Press + to add another link</small>
                </div>

            </div>
        </div>
    </div>
    <input type="hidden" name="username" value="{$USERNAME}"/>
    </form>
</div>

</body></html>