$(document).ready(function() {
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