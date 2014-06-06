$(document).ready(function() {

    $('#delete').click(function() {

        var data = "id=" + encodeURIComponent($('#contentId').val());
        var x = $('#contentId').val();

        $.ajax({url: "../../api/delete_content.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {
            	if(!data.msg) {	
            		window.location = "http://gnomo.fe.up.pt/~lbaw1353/devel/pages/content/content.php?id="+x;
            	} else {
            		window.location = "http://gnomo.fe.up.pt/~lbaw1353/devel/pages/homepage/home.php";
            	}
            },
            error: function(data) {
            	location.reload();
            }
        });
    });
	

});

    function getBtnId(id){

        var data = "id=" + encodeURIComponent(id);
        var x = $('#contentId').val();

        $.ajax({url: "../../api/delete_comment.php",
            type: "GET",
            data: data,
            dataType: "json",
            success: function(data) {
            	if(data.msg) {	
            		window.location = "http://gnomo.fe.up.pt/~lbaw1353/devel/pages/content/content.php?id="+x;
            	}
            },
            error: function(data) {
            	location.reload();
            }
        });
    };