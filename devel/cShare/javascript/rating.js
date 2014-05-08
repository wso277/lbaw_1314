function upvote(id) {
    var rate = 1;
    var data = "rate=" + encodeURIComponent(rate) + "&contentId=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_content.php",
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

function downvote(id) {
    var rate = -1;
    var data = "rate=" + encodeURIComponent(rate) + "&contentId=" + encodeURIComponent(id);

    $.ajax({url: "../../api/rate_content.php",
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