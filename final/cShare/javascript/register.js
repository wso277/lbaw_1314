$(document).ready(function() {
    $("#password, #password_confirmation").change(function() {
        var password = $('#password').val();
        var passConf = $('#password_confirmation').val();
        if(password != "" && passConf != "" && password == passConf && $('#t_and_c').prop('checked')){
            $("#sub").prop('disabled',false);
        } else {
            $("#sub").prop('disabled', true);
        }
   });
    $("#agree").click(function() {
        var password = $('#password').val();
        var passConf = $('#password_confirmation').val();
        if(password != "" && passConf != "" && password == passConf && $('#t_and_c').prop('checked')){
            $("#sub").prop('disabled',false);
        } else {
            $("#sub").prop('disabled', true);
        }
    });
});