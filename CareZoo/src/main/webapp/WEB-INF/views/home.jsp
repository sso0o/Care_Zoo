<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">

<script>
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
</script>
<style>
.menu>ul{
height:45px;
}

</style>
<title>부트스트랩때문에 안되는 상단바 해결</title>
</head>
<body>

</body>
</html>