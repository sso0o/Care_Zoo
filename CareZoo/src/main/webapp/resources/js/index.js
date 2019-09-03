$(document).on('ready', function() {

    var jbOffset = $('.menu').offset();
    $(window).scroll(function () {
        if ($(document).scrollTop() > jbOffset.top) {
            /*내려갔을때*/
            $('.menu').addClass('jbFixed');
            $('.menu>ul').addClass('liFixed');
            /* $('.menu>ul>li:hover>a').css("color","aqua");*/


        }
        else {
            /*올라갔을때*/
            $('.menu').removeClass('jbFixed');
            $('.menu>ul').removeClass('liFixed');
        }
    });
     if($("html").width()<1150){
               $('.menu').css("width","1100px");
            }else{
                $('.menu').css("width","100%");
            }
    $(window).resize(function() {
           if($("html").width()<1150){
               $('.menu').css("width","1100px");
            }else{
                $('.menu').css("width","100%");
            }
        });
});