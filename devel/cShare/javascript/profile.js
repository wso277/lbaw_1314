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

    $('#bantemp').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/bantemp.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Temporary Ban successful!");
                }
                else {
                    alert("Error Baning!");
                }
            },
            error: function(data) {
                alert("NO Temporary Ban NO yarr.. :(");
            }
        });
    });

    $('#unban').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/unban.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Unban successful!");
                }
                else {
                    alert("Error Baning!");
                }
            },
            error: function(data) {
                alert("NO Unban NO yarr.. :(");
            }
        });
    });

    $('#add_friend').click(function(){
        var username = $("#username").text();
        var data = "username=" + encodeURIComponent(username);

        $.ajax({url: "../../api/add_friend.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {
                
                if (data.msg == true) {
                    alert("Friend added with success!");
                    location.reload();
                }
                else {
                    alert("Error adding friend!");
                }
            },
            error: function(data) {
                alert("NO friend NO yarr.. :(");
            }
        });
    });

    $('#remove_friend').click(function() {
        var username = $('#username').text();
        var data = "username=" + encodeURIComponent(username);

        $.ajax({url: "../../api/remove_friend.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Friend removed with success!");
                    location.reload();
                }
                else {
                    alert("Error removing friend!" + data.msg);
                }
            },
            error: function(data) {
                alert("NO friend NO yarr.. :(");
            }
        });
    });

    $('[id="remove_friends"]').click(function() {
        var username = $(this).attr('name');
        var data = "username=" + encodeURIComponent(username);

        $.ajax({url: "../../api/remove_friend.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {

                if (data.msg == true) {
                    alert("Friend removed with success!");
                    location.reload();
                }
                else {
                    alert("Error removing friend!" + data.msg);
                }
            },
            error: function(data) {
                alert("NO friend NO yarr.. :(");
            }
        });
    });
});