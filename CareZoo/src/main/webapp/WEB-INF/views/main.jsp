<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>

<head>
<title>맡겨주~~</title>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<!-- 메인 이미지슬라이드 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick-theme.css">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 메뉴바 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

<script type="text/javascript" src="../assets/js/jquery-latest.js"></script>
<script src="../assets/js/admin.js"></script>

<style type="text/css">
nav {
	
}

footer {
	border-top: 1px solid;
	text-align: center;
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

.slick-prev:before, .slick-next:before {
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
</style>

<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script type="text/javascript">
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	$(document).on('ready', function() {
		$(".lazy").slick({
			dots : true,
			lazyLoad : 'ondemand', // ondemand progressive anticipated
			infinite : true,
			autoplay : true, //자동플레이 유무( false시 자동플레이 안됨)
			autoplaySpeed : 4000
		// 자동플레이 스피드
		});

	});
</script>

</head>

<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/join">회원가입</a>
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
						<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/hotel/main'>HOTEL</a>
					<ul>
						<li class='last'><a href='${contextPath}/dongbanHotel/hotelList'>애견동반호텔</a></li>
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
				<li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<div class='container'>
		<section class="content">
			<main>
			<div class="lazy slider">
				<div>
					<img src="${contextPath}/resources/img/event_image.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image2.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image3.jpg" data-sizes="100vw" data-srcset="">
				</div>
				<div>
					<img src="${contextPath}/resources/img/event_image4.jpg" data-sizes="100vw" data-srcset="">
				</div>
			</div>
			<div class="review">
				<fieldset class="fieldview">
					<legend>시터후기</legend>
					<fieldset class="subReview">
						<a href=""><img src="${contextPath}/resources/img/test.jpg" width="100%"></a> <span> 후기웅앵웅 </span>
					</fieldset>
					<fieldset class="subReview">
						<a href=""><img src="${contextPath}/resources/img/test2.jpg" width="100%"></a> <span> 후기웅앵웅 </span>
					</fieldset>
					<p>
						<a href="">더보기></a>
					</p>
				</fieldset>
			</div>
			<div class="review">
				<fieldset class="fieldview">
					<legend>호텔후기</legend>
					<fieldset class="subReview">
						<a href=""><img src="${contextPath}/resources/img/test.jpg" width="100%"></a> <span> 후기웅앵웅 </span>
					</fieldset>
					<fieldset class="subReview">
						<a href=""><img src="${contextPath}/resources/img/test2.jpg" width="100%"></a> <span> 후기웅앵웅 </span>
					</fieldset>
					<p>
						<a href="">더보기></a>
					</p>
				</fieldset>
			</div>
			</main>

		</section>
	</div>
</body>

</html>
