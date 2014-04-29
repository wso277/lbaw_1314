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

    $('#see_friends').click(function() {
        var username = $("#username").val();
        var data = "username=" + encodeURIComponent(username);
        var container = document.getElementById('friends_list');
        container.innerHTML = "";
        var row;

        var table = document.createElement("table");
        container.appendChild(table);

        $.ajax({url: "../api/get_friends.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {
                alert("I HAVE FRIENDS YARRRRR");
                for (i = 0; i < data.size(); i++) {
                    if (i % 2 == 0 && i != 0) {
                        table.append('</tr>');
                    }
                    if (i % 2 == 0) {
                        var tmp = $('<tr>');
                        row = tmp;
                        table.append(row);
                    }
                    row.append('<td> <div class="jumbotron" style="text-align:center;background-color:#fff;width:15em;height:7em"> <img src="' + data[i].fotografia + '" width="64em" height="64em" style="float:left"/><div class="caption" ><h4>' + data[i].nome + '</h4></div></div></td>');
                }
            },
            error: function(data) {
                alert("NO FRIENDS NO yarr.. :(");
            }
        });
    });
});