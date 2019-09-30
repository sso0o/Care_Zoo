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
    <style type="text/css">

    </style> 
<title>reservation2</title>
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
                        <li class='last'><a href='#'>애견동반호텔</a></li>
                        <li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
                    </ul>
                </li>
                <li class='active sub'><a href='#'>REVIEW</a>
                    <ul>
                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
                        <li class='last'><a href='#'>시터</a></li>
                        <li class='last'><a href='#'>호텔</a></li>
                    </ul>
                </li>
                <li class='last'><a href='#' style="font-size: 17px">MTPAGE</a></li>
                <li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
	<div class='container'>
	
		<h1>원하시는 방문 유형을 선택해 주세요</h1>
		<br>
		<button
			onclick="location.href='${contextPath}/visit/apply?c_num=${c_num}'">정기
			방문 돌봄 신청</button>
		<br>
		<button
			onclick="location.href='${contextPath}/visit/nomalapply?c_num=${c_num}'">일반
			방문 돌봄 신청</button>
		<br> <br>
		<h3>
			<img src="${contextPath}/resources/img/schedule.jpg"> <a
				href="${contextPath}/visit/apply?c_num=${c_num}">정기 방문 돌봄 신청</a>
		</h3>
		<br>
		<p>매월 몇 회씩 방문 돌봄을 신청하는 서비스로 정기 결제 시 최대 22% 할인된 가격으로 이용하실 수 있습니다.</p>
		<br>
		<h3>
			<img src="${contextPath}/resources/img/check.jpg"> <a
				href="${contextPath}/visit/nomalapply?c_num=${c_num}">일반 방문 돌봄
				신청</a>
		</h3>
		<br>
		<p>여행 및 출장 등의 이유로 단기 방문 돌봄을 신청하는 서비스로 5회 이상 예약 시 회당 10% 할인된 가격으로
			이용하실 수 있습니다.</p>
		<br> <input type="hidden" name="c_num" value="${c_num}">
	</div>
</body>
</html>