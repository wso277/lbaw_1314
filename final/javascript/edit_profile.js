$(document).ready(function () {
    $('#edit').submit(function () {
        var firstName = $('#first_name').val();
        var lastName = $('#last_name').val();
        var work = $('#job').val();
        var email = $('#email').val();
        var local = $('#local').val();
        var sports = $('#sports').val();
        var culture = $('#culture').val();
        var football = $('#football').val();
        var cinema = $('#cinema').val();
        var literature = $('#literature').val();
        var agriculture = $('#agriculture').val();
        var politics = $('#politics').val();
        var sex = $('#sex').val();
        var videoGames = $('#video-games').val();
        var news = $('#news').val();
        var gastronomy = $('#gastronomy').val();
        var meteorology = $('#meteorology').val();
        var motorSports = $('#motor_sports').val();
        var interests = new Array();
        var name = firstName + " " + lastName;
        var i = 0;

        if (sports == true) {
            interests[i] = 'desporto';
            i++;
        }

        if (culture == true) {
            interests[i] = 'cultura';
            i++;
        }

        if (football == true) {
            interests[i] = 'futebol';
            i++;
        }

        if (cinema == true) {
            interests[i] = 'cinema';
            i++;
        }

        if (literature == true) {
            interests[i] = 'literatura';
            i++;
        }

        if (agriculture == true) {
            interests[i] = 'agicultura';
            i++;
        }

        if (politics == true) {
            interests[i] = 'politica';
            i++;
        }

        if (sex == true) {
            interests[i] = 'sexo';
            i++;
        }

        if (videoGames == true) {
            interests[i] = 'video-jogos';
            i++;
        }

        if (news == true) {
            interests[i] = 'atualidade';
        }

        if (gastronomy == true) {
            interests[i] = 'gastronomia';
        }

        if (meteorology == true) {
            interests[i] = 'meteorologia';
        }

        if (motorSports == true) {
            interests[i] = 'desportos motorizados';
        }

        var data = "name=" + encodeURIComponent(name) + "&work=" + encodeURIComponent(work) + "&email=" + encodeURIComponent(email) + "&local=" + encodeURIComponent(local) + "&interests=" + encodeURIComponent(interests);

        $.ajax({url: "../api/edit_profile.php",
            type: "POST",
            data: data,
            dataType: "json",
            success: function (data) {
                alert("EDIT PROFILE YARRRRR");

                if (data[0] == "success") {
                    window.location.replace("../profile.php");
                }
            },
            error: function (data) {
                alert("NO EDIT PROFILE NO yarr.. :(");
            }
        });
    });
});