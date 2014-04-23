$(document).ready(function() {
    $("#form").submit(function() {
        var firstName = $('#first_name').text();
        var lastName = $('#last_name').text();
        var username = $('#display_name').text();
        var email = $('#email').text();
        var password = $('#password').text();
        var passConf = $('#password_confirmation').text();

        if (password == passConf) {
            var name = firstName + " " + lastName;

            $.ajax({url: "../api/register.php",
            type: "POST",
            data: data,
            dataType: "json",
            success: function(data) {
                alert("REGISTER YARRRRR");

                if (data[0] == "success") {
                    window.location.replace("../index.php");
                }
            },
            error: function(data) {
                alert("NO REGISTER NO yarr.. :(");
            }
        });
        }
    });
});