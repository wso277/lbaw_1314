$(document).ready(function () {


    $("#x").submit(function () {

        var username = $("#username").val();
        var password = $("#pass").val();
        var remember = $("#remember").prop('checked');
        alert(username);
        //var data = "username=" + encodeURIComponent(username) + "&pass=" + encodeURIComponent(password) + "&remember=" + encodeURIComponent(remember);

        $.ajax({url: "../api/login.php",
            type: "POST",
            data: {username:username, pass:password, remember:remember},
            dataType: "json",
            success: function (data) {

                if (data[0] == "success") {
                    windows.location.replace("../index.php");
                }
            },
            error: function (request,error) {
            console.log(error);
                console.log(request);
                alert("Error Logging in!");
            }
        });
    });
});