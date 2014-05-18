$(document).ready(function () {
    var size = $('.input-append').find('[id="br"]').length;
    var next;
    if (size > 1) {
        next = size;
    } else {
        next = 1;
    }

    $(".add-more").click(function (e) {
        if (next < 7) {
            e.preventDefault();
            var addto = "#field" + next;
            next = next + 1;
            var newIn = '<br /><br /><input autocomplete="off" class="span3 link-box" placeholder="Link" id="field' + next + '" name="field' + next + '" type="text" data-provide="typeahead" data-items="8">';
            var newInput = $(newIn);
            $(addto).after(newInput);
            $("#field" + next).attr('data-source', $(addto).attr('data-source'));
            $("#count").val(next);
        }

        if (next == 7) {
            $('#b1').hide();
            $('#small').hide();
        }
    });


});
