<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!-- 이것도 네줄이 꼭 있어야합니당! -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 필수요소 -->
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- 메뉴바 -->
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<!-- 선택요소 -->

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 구글맵 api -->
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap">


<!-- 풀캘린더 -->
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>

<!-- 시간 관련된 함수 사용하기위해서 있어야할것들(캘린더 데이터픽커) -->
<script type="text/javascript" src='${contextPath}/resources/js/moment.js'></script>

<!-- 사이드메뉴 -->
<link rel='stylesheet' href='${contextPath}/resources/css/sideMenu.css' />

<!-- 마이페이지(달력에 모달) -->
<link rel='stylesheet' href='${contextPath}/resources/css/myPage_modal.css' />
<!-- 별점 -->
<link rel='stylesheet' href='${contextPath}/resources/css/star.css' />

<!-- 달력 이벤트 마우스 가져다대면 정보뜨는거 -->
<link rel='stylesheet' href='${contextPath}/resources/css/popper_tooltip.css' />
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>

<!-- 주소가져오기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!--//////////////////////////////////희진 Start//////////////////////////////////////////////////-->
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/>

<!--  link for DogMate datepicker css -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css'/>

<!-- script for datepicker -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script>
<!--//////////////////////////////////희진 End////////////////////////////////////////////////// -->
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



<title>Insert title here</title>
</head>
<body>
<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
						<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>PETHOTEL</a>
					<ul>
						<li class='last'><a href='${contextPath}/petHotel/petHotelList'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/comment/hscList'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>가정시터</a></li>
						<li class='last'><a href='#'>방문시터</a></li>
						<li class='last'><a href='#'>펫호텔</a></li>
					</ul></li>
				<li class='last'><a href='${contextPath}/member/myPage' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">FAQ</a></li>
			</ul>
		</div>
	</nav>
	
	<br><br><br>
	<div class="container">
<!-- 		여기다 내용을 작성하시면 됩니다 -->
		
	</div>
	</body>
</html>