<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" type='text/css'>안이쁨 dateTimePicker  -->

<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->
<!--  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>안이쁨 dateTimePicker  -->
<meta charset="UTF-8">
<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
<script type="text/javascript">
$(function() {
	calculatePrice();
	$('#calendar').datepicker({ beforeShowDay: unavailableD });
	var unavailableDates = ["2019-9-19","2019-9-14"];   //*************** 홈시터가 지정한 날짜를 disable 설정필요
	function unavailableD(date) {
	    var dateType = date.getFullYear()+ "-" +(date.getMonth()+1)+ "-" +date.getDate();
	    if ($.inArray(dateType, unavailableDates) < 0) {
	        return [true,"","Book Now"];
	    } else {
	        return [false,"","Booked Out"];
	    }
	}
	var pickupTime = $('#pickUpTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30		
	});
	var takebackTime = $('#takeBackTime').timepicker({
		minTime:'07:00' ,
		timeFormat: "HH:mm",
		maxTime: '22:00',
		stepMinute: 30
	});
	var datepickerStart = $('#checkin').datepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		onSelect: function (selected) {
			datepickerEnd.datepicker('option', 'minDate', selected);
			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate', selected);
			} 
			showDays();
		}
// 		minTime:'07:00' ,
// 		timeFormat: "HH:mm",
// 		maxTime: '22:00',
// 		stepMinute: 30
	});
	var datepickerEnd = $('#checkout').datepicker({
		beforeShowDay: unavailableD,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		//예약 불가능일때 선택 막기
		onSelect: function(){
			var startDate = new Date(datepickerStart.val())
			var endDate = new Date($(this).val())
			for(var i in unavailableDates){				
				var notableDays = new Date(unavailableDates[i])
				if(startDate<notableDays && notableDays<endDate){
					alert("예약 불가능한 일자가 존재합니다. 다시 선택해 주세요.");
					return [false];	
				}		
			}
			showDays();
			alert("성공")
			return [true];
		}
	});
	$('#petSize-select').off("change").on("change",function() {
		console.log("펫사이즈")
		empdays = document.getElementById('days').value;
		console.log("petSize-select")
		if($('#petSize-select option:selected').val()=="소형견, 중형견"){
			pricePerPetSize = 15000;
			if(days==0){
				pricePerDay = 20000;
				empdays = 1;
			}else if(days > 0){
				pricePerDay = 40000;
				empdays = days;
			}
		}else{
			console.log('대형견');
			pricePerPetSize = 25000;
			if(days==0){
				pricePerDay = 30000;
				empdays = 1;
			}else if(days> 0){
				pricePerDay = 50000;
				empdays = days;
			}
		}
		calculatePrice(); 
	});
	//반려견 추가 당
	$('#hsr_numof_pet').off("change").on("click", function(){
		console.log("펫추가")
		calculatePrice();
	});
});
var days = 0;
var pricePerDay = 20000;
var pricePerPetSize = 15000;
var totalAddPetPrice = 0;
var totalPrice = 20000;
var empdays = 1;
//날짜 기간차 가격 구하기
function showDays() {	
    var start = $('#checkin').val();
   	var startL = start.split('-');
   	var startday = new Date(startL[0], Number(startL[1])-1, startL[2]);
    console.log(startday);
    var end = $('#checkout').val();
    var endL = end.split('-');
    var endday = new Date(endL[0], Number(endL[1])-1, endL[2])
    console.log(endday);
    if (!start||!end) return days;
    days = ((endday.getTime() - startday.getTime())/1000/60/60/24);
    if (days == 0){
    	$('#DAY').empty().append('1 day');
    	$('#days').val(days);
    	$('#Days').val('1 day');
   		empdays = 1;
    	if($('#petSize-select option:selected').val()=="소형견, 중형견"){
    		pricePerPetSize = 15000;
    		pricePerDay=20000;
    	} else{
    		pricePerPetSize = 25000;
    		pricePerDay=30000;
    	}
    }else if(days > 0){
    	$('#DAY').empty().append(days+'박');
    	$('#days').val(days);
    	$('#Days').val(days+'박');
    	empdays=days;
    	if($('#petSize-select option:selected').val()=="소형견, 중형견"){
    		pricePerPetSize = 15000;
    		pricePerDay=40000;
    	} else{
    		pricePerPetSize = 25000;
    		pricePerDay=50000;
    	}
    }
   	calculatePrice();
    console.log("pricePerDay ="+pricePerDay);
    console.log("showDays days : "+days);
    return true;
}
function calculatePrice() {
	totalAddPetPrice = document.getElementById('hsr_numof_pet').value*pricePerPetSize*empdays;
	totalPrice = (pricePerDay*empdays+totalAddPetPrice); 
	console.log("totalPrice ; "+totalPrice);
	$('#addPet').empty().append(pricePerPetSize);
	$('.pricePerDay').empty().append(pricePerDay);
	$('#totalAddPetPrice').empty().append(totalAddPetPrice);
	$('#hsr_totalprice').empty().append(totalPrice);
	$('#totalpriceInput').val(totalPrice);
	$('#pricePerPetSize').val(pricePerPetSize);
	$('#PricePerDay').val(pricePerDay);
// 	//펫 크기 당
// 	$('#petSize-select').off("change").on("change",function() {
// 		empdays = document.getElementById('days').value;
// 		console.log("petSize-select")
// 		if($('#petSize-select option:selected').val()=="소형견, 중형견"){
// 			pricePerPetSize = 15000;
// 			if(days==0){
// 				pricePerDay = 20000;
// 				empdays = 1;
// 			}else if(days > 0){
// 				pricePerDay = 40000;
// 				empdays = days;
// 			}
// 		}else{
// 			console.log('대형견');
// 			pricePerPetSize = 25000;
// 			if(days==0){
// 				pricePerDay = 30000;
// 				empdays = 1;
// 			}else if(days> 0){
// 				pricePerDay = 50000;
// 				empdays = days;
// 			}
// 		}
// 		console.log("펫사이즈 : "+pricePerPetSize);
// 		console.log("pricePerDay : "+pricePerDay);
// 		console.log("empdays ; "+empdays);
// 		//
// 		totalAddPetPrice = document.getElementById('hsr_numof_pet').value*pricePerPetSize*empdays;
// 		totalPrice = (pricePerDay*empdays+totalAddPetPrice); 
// 		console.log("totalPrice ; "+totalPrice);
// 		$('#addPet').empty().append(pricePerPetSize);
// 		$('.pricePerDay').empty().append(pricePerDay);
// 		$('#totalAddPetPrice').empty().append(totalAddPetPrice);
// 		$('#hsr_totalprice').empty().append(totalPrice);
// 		$('#totalpriceInput').val(totalPrice);
// 		$('#hsr_duringdays').val(days);
// 		$('#pricePerPetSize').val(pricePerPetSize);
// 		$('#PricePerDay').val(pricePerDay);
// 	});
// 	//반려견 추가 당
// 	$('#hsr_numof_pet').off("change").on("click", function(){
// 		console.log("펫추가")
// 		totalAddPetPrice = document.getElementById('hsr_numof_pet').value*pricePerPetSize*empdays;
// 		totalPrice = (pricePerDay*empdays+totalAddPetPrice); 
// 		console.log("totalPrice ; "+totalPrice);
// 		$('#addPet').empty().append(pricePerPetSize);
// 		$('.pricePerDay').empty().append(pricePerDay);
// 		$('#totalAddPetPrice').empty().append(totalAddPetPrice);
// 		$('#hsr_totalprice').empty().append(totalPrice);
// 		$('#totalpriceInput').val(totalPrice);
// 		$('#hsr_duringdays').val(days);
// 		$('#pricePerPetSize').val(pricePerPetSize);
// 		$('#PricePerDay').val(pricePerDay);
// 	});
	return true;
}
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
	<div>
		<div>이미지 올리기</div>
		<div>
			<ul>
				<li>돌봄 가능한 강아지 크기&나이</li>
				<li>$KG부터 모두 가능합니다.</li>
				<li>${hsList.hsl_pet_age }케어 가능합니다.</li>
			</ul>
		</div>
		<fieldset>
			<legend>돌보미환경</legend>
				<ul>
					<li>돌봄 공간 : <span>${hsList.hsl_chkout }</span></li>
					<li>인근지하철역 : <span>${hsList.hsl_subway }</span></li>
					<li>마당유무 : <span>${hsList.hsl_yard }</span></li>
					<li>14세 미만 아동 : <span>${hsList.hsl_baby }</span></li>
					<li>가족 동거 여부 : <span>${hsList.hsl_family }</span></li>
					<li>다른 동물 유무 : <span>칼럼추가필요**</span></li>
				</ul>
		</fieldset>
		<fieldset>
		<legend>돌보미 소개</legend>
		<ul>
			<li>제목 : <span>${hsList.hsl_title }</span></li>
			<li>내용 : <span>${hsList.hsl_comment }</span></li>
		</ul>
		</fieldset>
		<div>
			<div>후기</div>
			<div>
				<div>프로필사진<img src="" alt=""></div>
				<div>이름</div><div>돌봄타입</div>
				<div>후기내용</div>
				<div>작성일</div>
			</div>
		</div>
	</div>
	<div>
		<div>
			<fieldset>
				<legend>예약을 원하는 날짜와 시간을 선택해주세요</legend>
				<form action="reserve" method="post" >
					<div>
						<ul>
							<li>시작/마침날짜 선택할 수 있도로 누르면 달력 띄우기<br>
								<input type="text" id="checkin" name="hsr_chkin"> 맡기는 시간 : <input type="text" id="pickUpTime" name="pickUpTime"><br>
								<input type="text" id="checkout" name="hsr_chkout"> 데리러 오는 시간 : <input type="text" id="takeBackTime" name="takeBackTime"><br>
								<input type="hidden" id="days" name="hsr_duringdays" value="0">
							</li>
							<li><span class="pricePerDay">20000</span>원 
								<span>
									<select id="petSize-select" name="hsl_size" data-width="130px">
										<option id="nomalSize" value="소형견, 중형견" selected="selected">15kg 미만</option>
										<option id="bigSize" value="대형견">15kg 이상</option>
									</select>
								</span>
							</li>
							<li>반려견 추가 당 <span id="addPet">15000</span>원</li>
							<li><span id ="DAY">1 day</span> <span class="pricePerDay"> 20000</span>원</li>
							<li>반려견 추가<span><input type="number" min="0" max="5" name="hsr_numof_pet" id="hsr_numof_pet" value="0"></span><span id="totalAddPetPrice">0</span>원</li>
							<li>총 가격 : <span id="hsr_totalprice">20,000</span>원<br>
							<input type="hidden" name="hsr_totalprice" id="totalpriceInput">
							<input type="hidden" name="pricePerPetSize" id="pricePerPetSize">
							<input type="hidden" name="PricePerDay" id="PricePerDay">
							<input type="hidden" name="Days" id="Days">
							</li>
						</ul>					
						<ul>
							<li><input type="submit" value="예약하기"><input type="reset" value="초기화"></li>
						</ul>
					</div>
					<input type="hidden" name="c_num" value="<%=session.getAttribute("user_num")%>">
					<input type="hidden" name="hsl_num" value="${hsList.hsl_num }">
					<input type="hidden" name="hs_num" value="${hsList.hs_num}">
				</form>
			</fieldset>
		</div>
		<div>
			<div >캘린더 미리보기</div>
			<div id="calendar">
			**************달력 그리기**********
			</div>
		</div>
		<div>
			<ul>
				<li><img alt="" src="">홈시터 이미지</li>
				<li>홈시터 별점</li>
				<li>홈시터 이름</li>
				<li>홈시터 주소</li>
				<li><button onclick="">예약요청하기</button></li>
			</ul>
		</div>
	</div>	
</div>
</body>
</html>