<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<!-- 필수요소 -->
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/>
<!--  link for DogMate datepicker css -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>
<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<meta charset="UTF-8">
<title>Reservation</title>
<!-- 가정집 펫시터 예약확인창 -->
<script type="text/javascript">
//네비게이션
function logoutCheck() {
	if (confirm("정말 로그아웃?") == true) {
		location.href = '${contextPath}/logout'
	} else {
		return false;
	}
}
</script>
</head>
<body>
<div>
	<div class="container">
	    <header>
	        <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
	     
	        <div class="header_Btn" id="sessioncheck"> 
	        <sec:authorize access="isAnonymous()">
	        	<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
	        	<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
	        </sec:authorize>
	        <sec:authorize access="isAuthenticated()">
	        	<label id="principal" style="display: none;" ><sec:authentication property="principal"/></label>
	        	<label><%=session.getAttribute("user_name") %>님 반갑습니다!</label>
	        	<a class="btn_Logout" onclick="logoutCheck()" href="#">로그아웃</a>
	        </sec:authorize>
	         </div>
	    </header>
	</div>
	<nav>
	    <div class='menu'>
	        <ul style="">
	            <li class='active sub'><a href='${contextPath}/sitter/main'>SITTER</a>
	     
	                <ul>
	                    <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
	                    <li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
	                </ul>
	            </li>
	            <li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
	                <ul>
	                    <li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
	                    <li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
	                </ul>
	            </li>
	            <li class='active sub'><a href='#'>REVIEW</a>
	                <ul>
	                    <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
	                    <li class='last'><a href='#'>시터</a></li>
	                    <li class='last'><a href='#'>호텔</a></li>
	                </ul>
	            </li>
	            <li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
	            <li class='last'><a href='${contextPath}/admin/qna' style="font-size: 17px">Q&A</a></li>
	        </ul>
	    </div>
	</nav>
</div>
<!-- 칸 띄우기 위함-->
<br><br><br>
<!-- 		여기다 내용을 작성하시면 됩니다 -->
<div class="container">



</div>
</body>
</html>