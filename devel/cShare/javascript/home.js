$(document).ready(function () {

    $('#load').click(function () {
        var current = $('#current').val();

        var data = "current=" + current;

        current += 2;
        $('#current').value = current;

        $.ajax({url: "../../api/get_more_content.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.size; i++) {
                    var terror = '<div class="jumbotron" style="border-radius:0px;padding-left:0px;padding-bottom:0px;padding-right:2em;margin-left:0px;margin-bottom:0.5em;background-color:#222222"> <div class="container" style="padding:0px"> <div style="float:left;margin-top:3em;"> <div> <a href="" class="btn" role="button"><img class="img-circle" style="padding-left:0.2em" src="/~lbaw1353/devel/images/facebook-icon-sm.png"/></a> </div> <br/> </div> <div style="color:#f0f0f0;font-family:Ubuntu"> <img src="' + data[i].photo + '" width="192em" height="192em" style="float:left"/> <div style="padding-left:20em"> <h2 style="margin-top:0px"><a href="/~lbaw1353/devel/pages/content/content.php?id=' + data[i].id + '" style="text-decoration:none">' + data[i].title + '</a></h2> <p style="font-size:1.2em">' + data[i].content + '...</p> </div> <p> <div style="float:left;clear:left;padding-left:4.5em"> <h4>Posted by <a href="/~lbaw1353/devel/pages/users/profile.php?username=' + data[i].poster + '" style="text-decoration:none">' + data[i].poster + '</a> at ' + data[i].timestamp + '</h4> </div> <div style="float:right"> <h4>' + data[i].likes + ' points &nbsp;' + data[i].ncomments + ' comments</h4> </div> </p> </div> </div> </div>';

                    $.('#append').append(terror);
                }
            },
            error: function (data) {
                alert("No luck " + data.msg);
            }
        });
    })
});
