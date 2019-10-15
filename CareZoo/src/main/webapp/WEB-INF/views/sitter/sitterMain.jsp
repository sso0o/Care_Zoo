<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
    <script type="text/javascript">
	// 로그아웃확인 <--모든페이지에 필수
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() { //문서가 로딩되면 실행할 함수
		
	})

	// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!
	
	// })
	
	// 기본적으로 세션에 저장된 정보
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"

    </script>
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#choice {
	text-align: center;
}
</style>

<title>sitterMain</title>
<!-- 방문펫시터, 가정집펫시터 고르는부분  -->
</head>
<body class="container">
  <div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
            <br>
			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<label id="principal" style="display: none;"><sec:authentication property="principal" /></label>
					<label><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a>
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
                <li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>HOTEL</a>
                    <ul>
                        <li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>

                        <!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->

                    </ul>
                </li>
                <li class='last'><a href='${contextPath}/member/myPage'  style="font-size: 17px">MYPAGE</a></li>
                <li class='last'><a href='${contextPath}/member/qna'  style="font-size: 17px">Q&A</a></li>
            </ul>
        </div>
    </nav>
    <br><br><br>
    <div class="container" id="choice">
    <br><br><br><br><br><br>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/home/main'">가정시터</button>				
				<button type="button" class="btn btn-outline-dark" onclick="location.href='${contextPath}/visit/main'">방문시터</button>				


	</div>
</body>
</html>