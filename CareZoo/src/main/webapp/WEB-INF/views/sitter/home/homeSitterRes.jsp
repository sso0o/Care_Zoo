<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' />
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel='stylesheet' href='${contextPath}/resources/css/phReservation_modal.css' />

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
.menu>ul {
	height: 45px;
}


#map_canvas {
	width: 300px;
	height: 300px;
}

.pignose-calendar-unit-disabled a {
	color: red !important
}

footer {
	
}

.slider {
	width: 200px;
	margin: 50px auto;
}

.slick-slide {
	margin: 10px;
}

.slick-slide img {
	width: 80%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	margin-left: 0;
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}

.lazy slider slick-initialized slick-slider slick-dotted {
	margin-left: 0;
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

.modal-table {
	height: auto;
	margin-top: -300px;
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

body {
	margin: 0;
}

ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.demo .item {
	margin-bottom: 60px;
}

.content-slider li {
	background-color: #ed3020;
	text-align: center;
	color: #FFF;
}

.content-slider h3 {
	margin: 0;
	padding: 70px 0;
}

.demo {
	width: 800px;
}

.inputGroup {
	font-family: "Fira Sans", sans-serif;
	background-color: cornsilk;
	display: block;
	margin: 10px 0;
	position: relative;
}

.inputGroup label {
	padding: 12px 30px;
	width: 100%;
	display: block;
	text-align: left;
	color: #3c454c;
	cursor: pointer;
	position: relative;
	z-index: 2;
	transition: color 200ms ease-in;
	overflow: hidden;
}

.inputGroup label:before {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	content: "";
	background-color: #40bf9f;
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
	opacity: 0;
	z-index: -1;
	box-sizing: inherit;
}

.inputGroup label:after {
	width: 40px;
	height: 40px;
	content: "";
	border: 2px solid #d1d7dc;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5.414 11L4 12.414l5.414 5.414L20.828 6.414 19.414 5l-10 10z' fill='%23fff' fill-rule='nonzero'/%3E%3C/svg%3E ");
	background-repeat: no-repeat;
	background-position: 6px 6px;
	border-radius: 50%;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	transition: all 200ms ease-in;
}

.inputGroup input:checked ~ label {
	color: #fff;
}

.inputGroup input:checked ~ label:before {
	-webkit-transform: translate(-50%, -50%) scale3d(56, 56, 1);
	transform: translate(-50%, -50%) scale3d(56, 56, 1);
	opacity: 1;
	box-sizing: inherit;
}

.inputGroup input:checked ~ label:after {
	background-color: #54e0c7;
	border-color: #54e0c7;
	box-sizing: inherit;
}

.inputGroup input {
	width: 32px;
	height: 32px;
	order: 1;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	visibility: hidden;
}

.radioForm {
	padding: 0 16px;
	max-width: 550px;
	margin: 50px auto;
	font-size: 18px;
	font-weight: 600;
	line-height: 36px;
}

*, *::before, *::after {
	box-sizing: inherit;
}

.modal-modify {
	box-sizing: border-box;
}

/* -------카카오 상담버튼------- */
.bottom-left {
  position: fixed;
  bottom: 0;
  right:0;
}

.alert {
  background: white;
  font-weight: bold;
  padding: 1em;
}
/* -------카카오 상담버튼------- */

textarea{
	resize: none;

}
.btn-my:hover{
	color: #40bf9f;
	background-color:#fff;
	border-color: #40bf9f;
}

.btn-my {
	color: #fff;
	background-color:#40bf9f;
	border-color: #40bf9f;
}
</style>
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
	//----카카오 1:1상담
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('d5215a661c44ab13805d6f04adeddadb');
	// 플러스친구 1:1채팅 버튼을 생성합니다.
	Kakao.PlusFriend.createChatButton({
		container : '#plusfriend-chat-button',
		plusFriendId : '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
	//----카카오 1:1상담	
})

// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!

// })

// 기본적으로 세션에 저장된 정보
var user_numtype = "<%=session.getAttribute("user_numtype")%>"
var user_num = "<%=session.getAttribute("user_num")%>"
var user_name = "<%=session.getAttribute("user_name")%>"

</script>
<title>homeSitterResForm</title>

</head>
<body>
  <div class="container">
        <header>
            <a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo" style="position: relative; left: 35px"></a>
            <br>
			<div class="header_Btn" id="sessioncheck">
				<sec:authorize access="isAnonymous()">
					<a class="btn_Login" href="${contextPath}/member/loginForm">로그인</a>
					<a class="btn_Join" href="${contextPath}/member/joinForm">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<label id="principal" style="display: none;"><sec:authentication property="principal" /></label>
					<label style="width: 150px;"><%=session.getAttribute("user_name")%>님 반갑습니다!</label>
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
    <div class='container'></div>
	<br>
	<br>
	<br>
	<br>
	<br>
	
<div class="container">

	<form action="${contextPath }/home/confirm" method="post">
		<div style="text-align: left;">
			<label style="font-size: 25px">예약페이지</label>
			<hr>
		</div>
		<div style="margin-top: 50px; margin-right: 100px; margin-left: 100px; border: 1px solid darkgray; padding: 50px; border-radius: 4px;">
			<div>
				<h2>결제 확인</h2>
			</div>
				<div style="text-align: center">
					<div class="petAddForm">
						<div class="PriceAndSize" style="">
							<div style="width: 800px; margin-left: -32px; border-radius: 4px; padding: 30px; height: auto; font-size: 18px; border-color: #40bf9f">
								<div style="font-size: 20px; display: inline-block; border-bottom: 1px solid; height: 86px">
									<div style="text-align: left; float: left; padding-top: 10px; padding-right: 5px; padding-left: 10px;">
										
										<label style="font-weight: bold;">체크인: </label>&nbsp;<label class="hsr_chkin">${params.hsr_chkin}</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label style="font-weight: bold">체크아웃: </label>&nbsp;<label class="hsr_chkout">${params.hsr_chkout}&nbsp;&nbsp;</label>
										&nbsp;&nbsp; <label class="totalDays" style="">(총 ${params.hsr_days})</label>&nbsp;&nbsp;
										<br> <span style="font-size: 17px;">맡기는 시간 : </span><span style="font-size: 17px;">${params.hsr_dropoff_time}</span> & 
											<span style="font-size: 17px;">데려가는 시간 : </span><span style="font-size: 17px;">${params.hsr_pickup_time}</span><br>
									</div>
									&nbsp; <label style="font-size: 30px; padding-bottom: 20px; position: relative; top: -10px;">&</label> &nbsp;
									<div style="text-align: left; display: inline-block; padding-top: 10px; padding-right: 5px; padding-left: 10px; border-color: #40bf9f">
										<label class="totalDays" style="float: right">반려견 ${params.hsr_numof_pet+1} 마리</label>
									</div>
								</div>
								
								
								
								
								<br>
								<div></div>
								<br>
								<div class="night" style="display: inline-block; width: 600px">
									<div class="nightCount" style="text-align: left; float: left"><fmt:formatNumber value="${params.hsr_priceperday}" type="currency"></fmt:formatNumber>원 X ${params.hsr_days}</div>
									<div class="countPrice" style="float: right">
										<span class="nightCountPrice"><fmt:formatNumber value="${params.hsr_pricePerDays}" type="currency"></fmt:formatNumber>원</span>
									</div>
								</div>
								<hr style="width: 680px">
								<div class="night" style="display: inline-block; width: 600px">
									<div class="nightCount" style="text-align: left; float: left">반려견 추가</div>
									<div class="countPrice" style="float: right">
										<c:choose>
											<c:when test="${params.hsr_numof_pet eq 0}">
												<div>
													<span class="nightCountPrice">없음</span>
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<span class="nightCountPrice"><fmt:formatNumber value="${params.hsr_pricePerPetSize }" type="currency"></fmt:formatNumber>원 X ${params.hsr_numof_pet}마리 X ${params.hsr_days}</span>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<hr style="width: 680px">
								<div class="night" style="display: inline-block; width: 600px">
									<div class="nightCount" style="text-align: left; float: left">Total</div>
									<div class="countPrice" style="float: right">
										<fmt:formatNumber value="${params.hsr_totalprice}" type="currency"></fmt:formatNumber>원
										<!-- 										<input type="hidden" -->
										<%-- 											value="${totalValue}" class="" name="phr_price"> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-top: 50px; margin-right: 100px; margin-left: 100px;">
				<div style="margin: 40px 0 0; padding: 25px; background-color: #f5f5f5; border-top: solid 1px #dfdfdf; line-height: 1.6;">
					<h4>예약요청 전 꼭 확인해주세요!</h4>
					<ul>
						<li>* 예약을 위해 강아지에 대한 내용을 상세히 적어주세요.</li>
						<li>* 환불은 체크인 3일전까지 가능합니다.</li>
						<li>* 요금이 맞는지 확인해 주세요.</li>
					</ul>
					<br>
				</div>
				<textarea  class="form-control" name="hsr_message" placeholder="강아지에 대한 내용을 돌보미에게 상세히 적어주세요." maxlength="4000" id="txtMESSAGE" style="margin: 0px; width: 894px;; height: 126px;"></textarea>
				<br> <br>
				<div>
					<div style="margin-bottom: 15px">맡겨주를 이용하시는 이유에 대해 알려주세요!</div>
					<div style="margin-bottom: 15px">
						<select name="hsr_purpose">
							<option value="여행">여행</option>
							<option value="출장">출장</option>
							<option value="회사업무 (워크샵, 야근 등등)">회사업무 (워크샵, 야근 등등)</option>
							<option value="집안행사">집안행사</option>
							<option value="혼자 있는 시간동안 잠시 맡기기 위해">혼자 있는 시간동안 잠시 맡기기 위해</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<ul>
					<li>※요청 시 잘못된 정보를 전달할 경우 이로인해 발생되는 문제에 대한 책임은 의뢰인 본인에게 있습니다.</li>
					<li>※'예약 요청'을 클릭하면 서비스 총액을 지불하는 것과 서비스 약관, 환불정책에 동의하는 것입니다.</li>
				</ul>
				<br> <br>
			</div>
			<div style="text-align: center">
				<button id="btnsubmit" class="btn btn-my" style="text-align: center; font-size: 23px; padding-left: 40px; padding-right: 40px">예약요청</button>
			</div>
			<hr>
			<div>
				<input type="hidden" name="hsl_num" value="${params.hsl_num }"> 
				<input type="hidden" name="c_num" value="<%=session.getAttribute("user_num")%>"> 
				<input type="hidden" name="hs_num" value="${params.hs_num}"> 
				<input name="hsr_chkin" type="hidden" value="${params.hsr_chkin}"> 
				<input name="hsr_dropoff_time" type="hidden" value="${params.hsr_dropoff_time}"> 
				<input name="hsr_chkout" type="hidden" value="${params.hsr_chkout}"> 
				<input name="hsr_pickup_time" type="hidden" value="${params.hsr_pickup_time}"> 
				<input name=hsr_duringdays type="hidden" value="${params.hsr_duringdays}"> 
				<input name="hsr_numof_pet" type="hidden" value="${params.hsr_numof_pet+1}"> 
				<input name="hsr_days" type="hidden" value="${params.hsr_days}"> 
				<input name="hsr_priceperday" type="hidden" value="${params.hsr_priceperday}"> 
				<input name="hsr_priceperdays" type="hidden" value="${params.hsr_priceperdays }"> 
				<input name="hsr_priceperpetsize" type="hidden" value="${params.hsr_priceperpetsize }"> 
				<input name="hsr_totalprice" type="hidden" value="${params.hsr_totalprice}">
			</div>
		</form>
	</div>
	<div class="row">
		<div class="span8 well invoice-thank">
			<h5 style="text-align:center;">Thank You!</h5>
		</div>
	</div>
<br><br><br><br>
<div class="bottom-left alert" id="plusfriend-chat-button"/>
</body>
</html>