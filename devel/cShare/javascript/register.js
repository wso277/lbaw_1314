$(document).ready(function() {
    $("#form").submit(function() {
        var firstName = $('#first_name').val();
        var lastName = $('#last_name').val();
        var username = $('#display_name').val();
        var email = $('#email').val();
        var password = $('#password').val();
        var passConf = $('#password_confirmation').val();

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