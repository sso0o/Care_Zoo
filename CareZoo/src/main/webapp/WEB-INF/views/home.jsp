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
            /*����������*/
            $('.menu').addClass('jbFixed');
            $('.menu>ul').addClass('liFixed');
            /* $('.menu>ul>li:hover>a').css("color","aqua");*/


        }
        else {
            /*�ö�����*/
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
<title>��Ʈ��Ʈ�������� �ȵǴ� ��ܹ� �ذ�</title>
</head>
<body>

</body>
</html>