$(document).ready(function () {
    $('#filter').click(function (e) {
        e.preventDefault();
        $('#news > div').each(function () {
            var date1 = $('#first_date').val();
            var date2 = $('#last_date').val();
            var x = new Date(date1);
            var y = new Date(date2);
            if (x < y) {
                var z = new Date($(this).attr('id'));
                if (z < x || z > y) {
                    $(this).hide();
                }
            } else if (x > y) {
                alert("The first date must be lower than the second");
            } else {
                var z = new Date($(this).attr('id'));
                if (z != x) {
                    $(this).hide();
                }
            }
        });
    });
});