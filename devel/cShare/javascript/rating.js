function upvote(id) {
    var rate = 1;
    var data = "rate=" + encodeURIComponent(rate) + "&contentId=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_content.php",
        type: "GET",
        data: data,
        dataType: "json",
        success: function (data) {

            if (data.msg == true) {
                var text = $('#' + id).text();
                alert(text);
                var rate = parseInt(text);
                alert(rate);
                text = replaceAt(text, rate.toString().length - 1, rate + 1);
                $('#' + id).text(text);
                alert(text);
            }
        },
        error: function (data) {
            alert("No luck " + data.msg);
        }
    });
}

function downvote(id) {
    var rate = -1;
    var data = "rate=" + encodeURIComponent(rate) + "&contentId=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_content.php",
        type: "GET",
        data: data,
        dataType: "json",
        success: function (data) {

            if (data.msg == true) {
                var text = $('#' + id).text();
                var rate = parseInt(text);
                text = replaceAt(text, rate.toString().length - 1, rate - 1);
                $('#' + id).text(text);
                alert(text);
            }
        },
        error: function (data) {
            alert("No luck " + data.msg);
        }
    });
}

function upvoteComment(id) {
    var rate = 1;
    var data = "rate=" + encodeURIComponent(rate) + "&commentID=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_comment.php",
        type: "GET",
        data: data,
        dataType: "json",
        success: function (data) {

            if (data.msg == true) {
                alert("Upvote with success");
                //location.reload();
            }
            else {
                alert("Error upvoting!" + data.msg);
            }
        },
        error: function (data) {
            alert("No luck " + data.msg);
        }
    });
}

function downvoteComment(id) {
    var rate = -1;
    var data = "rate=" + encodeURIComponent(rate) + "&commentID=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_comment.php",
        type: "GET",
        data: data,
        dataType: "json",
        success: function (data) {

            if (data.msg == true) {
                alert("Upvote with success!");
                //location.reload();
            }
            else {
                alert("Error downvoting!" + data.msg);
            }
        },
        error: function (data) {
            alert("No luck " + data.msg);
        }
    });
}

// replace the 'n'th character of 's' with 't'
function replaceAt(s, n, t) {
    return t + s.substring(n + 1);
}