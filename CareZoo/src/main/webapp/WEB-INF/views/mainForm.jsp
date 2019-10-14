<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>

<head>
    <title>Slick Playground</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style type="text/css">
    </style>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script> 

</head>

<body>
    <div class="container">
        <header>
            <a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
            <br>
            <div class="header_Btn"> <a class="btn_Login" href="${contextPath}/member/login">로그인</a> <a class="btn_Join" href="${contextPath}/member/join">회원가입</a> </div>
        </header>
    </div>
    <nav>
        <div class='menu'>
            <ul style="">
                <li class='active sub'><a href='#'>SITTER</a>
                    <ul>
                        <li class='last'><a href='#'>가정펫시터</a>
                            <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      -->
                        </li>
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='#'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <div class='container'>
        
    </div>
</body>

</html>