$(document).ready(function() {

    $('#promote').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/promote.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Promote successful!");
                }
                else {
                    alert("Error Promoting!");
                }
            },
            error: function(data) {
                alert("NO Promote NO yarr.. :(");
            }
        });
    });

    $('#demote').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/demote.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Demote successful!");
                }
                else {
                    alert("Error Demoting!");
                }
            },
            error: function(data) {
                alert("NO Demote NO yarr.. :(");
            }
        });
    });

    $('#ban').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/ban.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Ban successful!");
                }
                else {
                    alert("Error Baning!");
                }
            },
            error: function(data) {
                alert("NO Ban NO yarr.. :(");
            }
        });
    });
});