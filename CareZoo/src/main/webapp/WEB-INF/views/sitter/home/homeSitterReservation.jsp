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
<!-- 가정집 펫시터 예약하기 -->
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
	        <a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
	     
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
	<div>
		<dl>
<%-- 			<fmt:form value="${params.hsr_chkin}"  pattern="yyyy년 MM월 dd일"></fmt:formatDate> --%>
			<dt><strong>${params.hs_name}</strong>님에게 예약요청 메시지를 보냅니다.</dt>
			<dd>아래 예약 내역을 확인 후 돌보미에게 문의하세요!</dd>
		</dl>
	</div>
	<form action="confirm" method="post">
		<input name="hsl_num" value="${params.hsl_num }"> 
		<input name="c_num" value="<%=session.getAttribute("user_num")%>">
		<input name="hs_num" value="${params.hs_num}" >
		<div>
			<ul>
				<li>
					<dl>
						<dt>체크인</dt>
						<dd id="checkIn">${params.hsr_chkin}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>체크아웃</dt>
						<dd id="checkOut">${params.hsr_chkout}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>총 반려견</dt>
						<dd>${params.hsr_numof_pet+1}<input type="text" value="${params.hsr_numof_pet}+1"></dd>
					</dl>
				</li>
			</ul>
			<h2>예약내역 상세보기</h2>
			<dl>
				<dt><fmt:formatNumber value="${params.PricePerDay }" pattern="#,###" />원 X ${params.Days} day</dt>
				<dd>반려견 추가(<fmt:formatNumber value="${params.pricePerPetSize }" pattern="#,###" />원) X ${params.hsr_numof_pet}마리 X ${params.Days}</dd>			
				<dt>최종금액</dt>
				<dd><fmt:formatNumber value="${params.hsr_totalprice}" pattern="#,###" />원</dd>
			</dl>
		</div>
		<div>
			<h4>예약요청 전 꼭 확인해주세요!</h4>
			<ul>
				<li>* 예약을 위해 강아지에 대한 내용을 돌보미에게 상세히 적어주세요.</li>
				<li>* 예약완료를 위해 돌보미의 결제요청 후 2시간 이내로 입금해주셔야합니다. (늦어질 경우 도그메이트 고객센터로 연락주세요.)</li>
				<li>* 사전만남은 예약 완료 후 진행하실 수 있으며, 환불은 예약 3일전까지 100% 가능합니다.</li>
				<li>* 개인 연락처를 공유하지마세요. 예약이 완료되면 돌보미의 연락처를 확인하실 수 있습니다.</li>
				<li>* 메시지 내용은 안전거래 등의 목적으로 회사가 열람, 수집할 수 있습니다.</li>
			</ul>
		</div>
		<textarea placeholder="김수연 돌보미에게 예약요청을 위해 메시지를 남겨주세요." maxlength="4000" id="txtMESSAGE" style="margin: 0px;width: 1099px;height: 126px;"></textarea>
		<dl>
			<dt>사전만남 가능 일자를 알려주세요!</dt>
			<dd>
				<strong>* 사전만남이란?</strong> 돌봄 전 돌보미와 의뢰인, 의뢰인의 반려견이 사전에 만나 체크리스트를 작성하고 미리 시간을 함께 보내는 것으로, 최소 예약 3~5일 전까지 진행하시는 것을 권장하며 첫거래시에만 필수로 진행하고 있습니다. 사전만남없이 돌봄을 진행할 경우 돌보미에 따라 예약이 불가할 수 있습니다.
			</dd>
			<dd><input type="text" placeholder="사전만남 가능 일자를 최대 5개 까지 입력해주세요 ^.^" style="margin:0px;width:1089px;height:156px;"></dd>
			<dd id="calendar">달력띄우기***********************</dd>
		</dl>
		<dl>
			<dt>도그메이트를 이용하시는 이유에 대해 알려주세요!</dt>
			<dd>
				<select>
					<option value="여행">여행</option>
					<option value="출장">출장</option>
					<option value="회사업무 (워크샵, 야근 등등)">회사업무 (워크샵, 야근 등등)</option>
					<option value="집안행사">집안행사</option>
					<option value="혼자 있는 시간동안 잠시 맡기기 위해">혼자 있는 시간동안 잠시 맡기기 위해</option>
					<option value="기타">기타</option>
				</select>
			</dd>
		</dl>
		<ul>
			<li>요청 시 잘못된 정보를 전달할 경우 이로인해 발생되는 문제에 대한 책임은 의뢰인 본인에게 있습니다.</li>
			<li>'예약 요청'을 클릭하면 서비스 총액을 지불하는 것과 서비스 약관, 환불정책에 동의하는 것입니다.</li>
			<li>돌보미가 예약 요청을 수락해야 결제를 진행 할 수 있으며, 24시간 이내에 돌보미가 요청에 대한 응답을 할 것 입니다.</li>
		</ul>
		<input type="submit" value="예약 요청 보내기">
	</form>
</div>
</body>
</html>