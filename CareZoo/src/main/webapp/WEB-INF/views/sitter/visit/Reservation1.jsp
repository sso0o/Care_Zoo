<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style type="text/css">
    </style>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script> 
<title>Reservation1</title>
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
                        <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
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
        
    </div>
	<div style=" margin-top: 50px;">
		<h2>방문펫시터 예약을 위해 고객님 로그인을 부탁 드립니다.</h2>
		<hr>
		<button onclick="location.href='${contextPath}/visit/join'">회원가입</button>
		<button onclick="location.href='${contextPath}/visit/login'">로그인</button>
	</div>
</body>
</html>