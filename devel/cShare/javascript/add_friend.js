$(document).ready(function() {
	$('#add_friend').click(function(){
		var username = $("#username").val();
		var data = "username=" + encodeURIComponent(username);

		$.ajax({url: "../api/add_friend.php",
			type: "GET",
			data: data,
			dataType: "json",
			success: function(data) {
				alert("Friend added with success");
			},
			error: function(data) {
				alert("Error adding Friend");
			}
		});
	});
});