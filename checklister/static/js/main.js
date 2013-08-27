$(document).ready(function(){
  // set sizes of input fields
  $('input[type=text]').each(function(){
    var length = $(this).val().length;
    $(this).attr('size', length);
  });
});