<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>

<head>
    <title>Slick Playground</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="./css/indexCss.css"> <script type="text/javascript" src="../assets/js/jquery-latest.js"></script> <script src="../assets/js/admin.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
       <style type="text/css">
        body {
            z-index: 1;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            width: 1100px;
            margin: 0px auto;
        }
        
        .menu {
            z-index: 2;
            width:1100px;
            height: 0px;
            margin: 0px auto;
            text-align: center;
        }
        
        .menu ul {
            list-style: none;
            line-height: 1;
            margin: 0;
            padding: 0;
        }
        
        .menu>ul {
            background: white;
            position: relative;
            text-align: center;
            margin: -4px;
            padding: 4px 60.5px;
            height: 38px;
        }
        
        .menu:after,
        .menu>ul:after {
            content: ".";
            display: block;
            clear: both;
            visibility: hidden;
            line-height: 0;
        }
        
        .menu>ul>li {
            display: inline-flex;
            background-color: white;
            position: relative;
            margin: -4px;
            /*   border-bottom: 1px solid gray;*/
        }
        
        .menu>ul>#menu-button {
            display: none;
        }
        
        .menu ul li a {
            display: block;
            text-decoration: none;
        }
        
        .menu>ul>li>a {
            font-size: 18px;
            font-weight: bold;
            padding: 13px 70.5px;
            color: black;
            text-transform: uppercase;
            -webkit-transition: color 0.25s ease-out;
            -moz-transition: color 0.25s ease-out;
            -ms-transition: color 0.25s ease-out;
            -o-transition: color 0.25s ease-out;
            transition: color 0.25s ease-out;
        }
        
        .menu>ul>li:hover>a {}
        
        .menu>ul>li>a:hover {
            color: #B40404;
            border-bottom: 1px solid;
        }
        
        .menu li.sub::after {
            display: block;
            /*   content: ""; */
            position: absolute;
        }
        
        .menu>ul>li.sub::after {
            right: 10px;
            top: 20px;
            border: 5px solid transparent;
            border-top-color: #7a8189;
        }
        
        .menu>ul>li:hover::after {
            border-top-color: #ffffff;
        }
        
        .menu>ul>li:hover>ul {
            left: auto;
            top: 45px;
            opacity: 1;
        }
        
        .menu.align-right>ul>li:hover>ul {
            left: auto;
            right: 0;
            opacity: 1;
        }
        
        .menu ul ul {
            position: absolute;
            left: -9999px;
            top: 20px;
            opacity: 0;
            -webkit-transition: opacity .3s ease, top .25s ease;
            -moz-transition: opacity .3s ease, top .25s ease;
            -ms-transition: opacity .3s ease, top .25s ease;
            -o-transition: opacity .3s ease, top .25s ease;
            transition: opacity .3s ease, top .25s ease;
            z-index: 1000;
        }
        
        .menu ul ul ul {
            top: 37px;
            padding-left: 5px;
        }
        
        .menu ul ul li {
            position: relative;
        }
        
        .menu ul ul li:hover>ul {
            left: 170px;
            top: 0;
            opacity: 1;
        }
        
        .menu.align-right ul ul li:hover>ul {
            left: auto;
            right: 170px;
            top: 0;
            opacity: 1;
        }
        
        .menu ul ul li a {
            align-content: center;
            width: 134px;
            border-bottom: 1px solid #eeeeee;
            padding: 10px 20px;
            font-size: 15px;
            color: #9ea2a5;
            background: #ffffff;
            -webkit-transition: all .35s ease;
            -moz-transition: all .35s ease;
            -ms-transition: all .35s ease;
            -o-transition: all .35s ease;
            transition: all .35s ease;
        }
        
        .menu.align-right ul ul li a {
            text-align: center;
        }
        
        .menu ul ul li:hover>a {
            background: #f2f2f2;
            color: #8c9195;
        }
        
        .menu ul ul li:last-child>a,
        .menu ul ul li.last>a {
            border-bottom: 0;
        }
        
        .menu>ul>li>ul {
            margin: 0;
            padding: 0;
        }
        
        .menu>ul>li>ul::after {
            < !-- content: '';
            -->border: 6px solid transparent;
            width: 0;
            height: 0;
            border-bottom-color: #ffffff;
            position: absolute;
            top: -12px;
            left: 80px;
        }
        
        .menu.align-right>ul>li>ul::after {
            left: auto;
            right: 30px;
        }
        
        .menu ul ul li.sub::after {
            border: 4px solid transparent;
            border-left-color: #9ea2a5;
            right: 10px;
            top: 12px;
            -moz-transition: all .2s ease;
            -ms-transition: all .2s ease;
            -o-transition: all .2s ease;
            transition: all .2s ease;
            -webkit-transition: -webkit-transform 0.2s ease, right 0.2s ease;
        }
        
        .menu.align-right ul ul li.sub::after {
            border-left-color: transparent;
            border-right-color: #9ea2a5;
            right: auto;
            left: 10px;
        }
        
        .menu ul ul li.sub:hover::after {
            border-left-color: #ffffff;
            right: -5px;
            -webkit-transform: rotateY(180deg);
            -ms-transform: rotateY(180deg);
            -moz-transform: rotateY(180deg);
            -o-transform: rotateY(180deg);
            transform: rotateY(180deg);
        }
        
        .menu.align-right ul ul li.sub:hover::after {
            border-right-color: #ffffff;
            border-left-color: transparent;
            left: -5px;
            -webkit-transform: rotateY(180deg);
            -ms-transform: rotateY(180deg);
            -moz-transform: rotateY(180deg);
            -o-transform: rotateY(180deg);
            transform: rotateY(180deg);
        }
        
        nav {}
        
        header {
            padding-left: 20px;
            text-align: center;
            height: 100px;
        }
        
        .anchor_logo {
            float: left;
            width: 300px;
            height: 80px;
        }
        
        footer {
            border-top: 1px solid;
            text-align: center;
        }
        
        main {
            height: 1100px;
        }
        
        .slider {
            width: 900px;
            margin: 50px auto;
        }
        
        .slick-slide {
            margin: 10px;
        }
        
        .slick-slide img {
            width: 100%;
        }
        
        .slick-prev:before,
        .slick-next:before {
            color: black;
        }
        
        .slick-slide {
            transition: all ease-in-out .3s;
            opacity: .2;
        }
        
        .slick-active {
            opacity: .5;
        }
        
        .slick-current {
            opacity: 1;
        }
        
        .header_Btn {
            float: right;
        }
        
        .header_Btn a {
            margin: 10px;
            text-decoration: none;
            color: black;
        }
        
        .button a {
            display: block;
            padding: 6px 18px;
            text-transform: uppercase;
            text-decoration: : none;
            font-weight: bold;
            color: sienna;
            transition: : all 0.3s ease-in-out;
            font-size: 19px;
            text-decoration: none;
        }
        
        .button a:hover {
            color: #323232;
            background: : #323232;
        }
        
        .review {
            float: left;
            width: 50%;
            margin: auto 0;
        }
        
        .review .fieldview .subReview {
            display: inline-block;
            width: 45%;
            margin: auto 0;
            min-height: 400px;
            border: none;
        }
        
        .review .fieldview {
            border: 5px solid #ddd;
            border-radius: 5px;
            padding: 5px;
            min-height: 200px;
        }
        
        .review .fieldview legend {
            background: #40bf9f;
            color: #fff;
            padding: 5px 10px;
            font-size: 20px;
            border-radius: 5px;
            box-shadow: 0 0 0 5px #ddd;
            margin-left: 20px;
        }
        
        .review.review .fieldview p {
            text-align: right;
            padding-right: 10px;
        }
        
        .jbFixed {
            position: fixed;
            top: 4px;
            width:100%;
        }
        
        .liFixed {
            border-bottom: 1px solid gray;
        }
    </style>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).on('ready', function () {
            $(".lazy").slick({
                dots: true
                , lazyLoad: 'ondemand', // ondemand progressive anticipated
                infinite: true
                , autoplay: true, //자동플레이 유무( false시 자동플레이 안됨)
                autoplaySpeed: 4000 // 자동플레이 스피드
            });
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
</head>

<body>
    <div class="container">
        <header>
            <a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
            <br>
            <div class="header_Btn"> <a class="btn_Login" href="#">로그인</a> <a class="btn_Join" href="#">회원가입</a> </div>
        </header>
    </div>
    <nav>
        <div class='menu'>
            <ul style="">
                <li class='active sub'><a href='#'>시터</a>
                    <ul>
                        <li class='last'><a href='#'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
                        <li class='last'><a href='#'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>호텔</a>
                    <ul>
                        <li class='last'><a href='#'>애견동반호텔</a></li>
                        <li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>후기</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
                        <li class='last'><a href='#'>시터</a></li>
                        <li class='last'><a href='#'>호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">마이페이지</a></li>
                <li class='last'><a href='#' style="font-size: 17px">고객센터</a></li>
            </ul>
        </div>
    </nav>
    <div class='container'>
        <section class="content">
            <main>
                <div class="lazy slider">
                    <div> <img src="${contextPath}/resources/img/event_image.jpg" data-sizes="100vw" data-srcset=""> </div>
                    <div> <img src="${contextPath}/resources/img/event_image2.jpg" data-sizes="100vw" data-srcset=""> </div>
                    <div> <img src="${contextPath}/resources/img/event_image3.jpg" data-sizes="100vw" data-srcset=""> </div>
                    <div> <img src="${contextPath}/resources/img/event_image4.jpg" data-sizes="100vw" data-srcset=""> </div>
                </div>
                <div class="review">
                    <fieldset class="fieldview">
                        <legend>시터후기</legend>
                        <fieldset class="subReview">
                            <a href=""><img src="${contextPath}/resources/img/test.jpg" width="100%"></a> <span>
                                후기웅앵웅
                            </span> </fieldset>
                        <fieldset class="subReview">
                            <a href=""><img src="${contextPath}/resources/img/test2.jpg" width="100%"></a> <span>
                                후기웅앵웅
                            </span> </fieldset>
                        <p><a href="">더보기></a></p>
                    </fieldset>
                </div>
                <div class="review">
                    <fieldset class="fieldview">
                        <legend>호텔후기</legend>
                        <fieldset class="subReview">
                            <a href=""><img src="${contextPath}/resources/img/test.jpg" width="100%"></a> <span>
                                후기웅앵웅
                            </span> </fieldset>
                        <fieldset class="subReview">
                            <a href=""><img src="${contextPath}/resources/img/test2.jpg" width="100%"></a> <span>
                                후기웅앵웅
                            </span> </fieldset>
                            <p><a href="">더보기></a></p>
                    </fieldset>
                </div>
            </main>
            
        <div>
        </div>
        </section>
    </div>
</body>

</html>
