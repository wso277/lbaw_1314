$(document).ready(function() {
    $("#password, #password_confirmation").change(function() {
        var password = $('#password').val();
        var passConf = $('#password_confirmation').val();
        if(password == passConf){
            $("#sub").prop('disabled',false);
        } else {
            $("#sub").prop('disabled', true);
        }
   });
});