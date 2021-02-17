$(function(){
  $(".main_menu li").hover(
    function() {
    $(this).children('ul').show();
},
    function() {
    $(this).children('ul').hide();
});                      
       });  