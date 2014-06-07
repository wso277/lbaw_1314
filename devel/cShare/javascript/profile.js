$(document).ready(function() {

    $('#promote').click(function() {

        var data = "username=" + encodeURIComponent($('#username').text());

        $.ajax({url: "../../api/promote.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
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
                location.reload();
            },
            error: function(data) {
            }
        });
    });
});