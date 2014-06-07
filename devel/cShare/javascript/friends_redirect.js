$(document).ready(function(){
	var x = location.hash;
	if (x == "#friends") {
		$('#inf').removeClass('active');
		$('#fri').addClass('active');
	}
});