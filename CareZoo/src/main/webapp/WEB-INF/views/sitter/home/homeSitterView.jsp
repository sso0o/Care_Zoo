<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<!-- 슬라이드 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' />
<!-- 데이트피커 -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' />
<!-- 데이트피커 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<!-- 메뉴바 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 폰트 -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<!-- ?ㅁ?  -->
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<!-- 캘린더 -->
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />
<!-- 캘린더 -->

<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/moment.js'></script>
<!-- 데이트피커 -->


<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script>
<!-- 슬라이더 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<!-- 데이트피커 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/lang/ko.js'></script>
<!-- 캘린더 -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 데이트피커 -->
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<!-- 구글맵 -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap"></script>
<!-- 구글맵 -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script>
<!-- 데이트피커 -->
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<!-- 캘린더 -->
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<!-- 캘린더 -->
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>
<!-- 캘린더 -->

<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<!-- 메뉴바 -->
<!-- 별점 -->
<link rel='stylesheet' href='${contextPath}/resources/css/star.css' />
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap-input-spinner.js"></script><!-- input : number -->


<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui.multidatespicker.css' /><!-- multidatePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css' /><!-- dateTimePicker -->
<script src="${contextPath}/resources/js/jquery-ui.multidatespicker.js" type="text/javascript"></script><!-- multidatePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script><!-- dateTimePicker -->

<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.menu>ul {
	height: 45px;
}

/* light slider*/
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



}
/* <!-- datepicke 달력이모지--> */
.cal {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}
/* .cal::-webkit-inner-spin-button { */
/*   display: none; */
/* } */
/* .cal::-webkit-calendar-picker-indicator { */
/*   opacity: 0; */
/* } */

/*코멘트용*/
body {
	margin-top: 20px;
}

.comment-wrapper .panel-body {
	max-height: 650px;
	overflow: auto;
}

.comment-wrapper .media-list .media img {
	width: 64px;
	height: 64px;
	border: 2px solid #e5e7e8;
}

.comment-wrapper .media-list .media {
	border-bottom: 1px dashed #efefef;
	margin-bottom: 25px;
}
#ui-datepicker-div{
	left: 20%;
}
/*코멘트용*/
</style>
<script type="text/javascript">

$(function() {
	$("input[type='number']").inputSpinner();
	//날짜 확인
	var unavailableDates = new Array();	
	<c:forEach items='${disDates}' var = 'item' >
	var d = "${item}";
	unavailableDates.push(d);
	</c:forEach>
	console.log(unavailableDates)		
	function disableAllTheseDays(date) {
	    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    for (i = 0; i < unavailableDates.length; i++) {
	        if($.inArray(y + '-' +(m+1) + '-' + d,unavailableDates) != -1) {
	            return [false];
	        }
	    }
	    return [true];
	}
	calculatePrice();
	$('#calendar').datepicker({beforeShowDay: disableAllTheseDays});
	
	console.log(unavailableDates);
	var pickupTime = $('#hsr_dropoff_time').timepicker({		
		format: 'LT',
		minTime:'${hsList.HSL_CHKIN_STR_TIME}' ,
		timeFormat: "HH:mm",
		maxTime: '${hsList.HSL_CHKIN_END_TIME}',
		stepMinute: 30		
	});
	var takebackTime = $('#hsr_pickup_time').timepicker({
		format: 'LT',
		minTime:'${hsList.HSL_CHKOUT_STR_TIME}' ,
		timeFormat: "HH:mm",
		maxTime: '${hsList.HSL_CHKOUT_END_TIME}',
		stepMinute: 30
	});
	var datepickerStart = $('#checkin').datepicker({
		beforeShowDay: disableAllTheseDays,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		onSelect: function (selected) {
			datepickerEnd.datepicker('option', 'minDate', selected);
			if (datepickerEnd.prop('disabled')) {
				datepickerEnd.datepicker('setDate', selected);
			} 
			showDays();
		}
	});
	var datepickerEnd = $('#checkout').datepicker({
		beforeShowDay: disableAllTheseDays ,
		dateFormat: 'yy-mm-dd', 
		minDate: 'today',
		//예약 불가능일때 선택 막기
		onSelect: function(){
			var startDate = new Date(datepickerStart.val())
			var endDate = new Date($(this).val())
			for(var i in unavailableDates){				
				var notableDays = new Date(unavailableDates[i])
				if(startDate<notableDays && notableDays<endDate){
					datepickerEnd.datepicker('setDate','today')
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
	$('#hsr_numof_pet').change(function(){
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
	console.log(document.getElementById('hsr_numof_pet').value)
	totalAddPetPrice = document.getElementById('hsr_numof_pet').value*pricePerPetSize*empdays;
	totalPrice = (pricePerDay*empdays+totalAddPetPrice); 
	pricePerDays = (pricePerDay*empdays);
	console.log("pricePerDays :"+pricePerDays);
	console.log("totalPrice ; "+totalPrice);
	$('#addPet').empty().append(pricePerPetSize);
	$('#pricePerDay').empty().append(pricePerDay);
	$('.pricePerDays').empty().append(pricePerDays);
	$('#totalAddPetPrice').empty().append(totalAddPetPrice);
	$('#hsr_totalprice').empty().append(totalPrice);
	$('#totalpriceInput').val(totalPrice);
	$('#pricePerPetSize').val(pricePerPetSize);
	$('#hsr_priceperday').val(pricePerDay);
	$('.pricePerDays').val(pricePerDays);
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
$(function() {
	$("#content-slider").lightSlider({
		loop : true,
		keyPress : true
	});
	$('#image-gallery').lightSlider({
		isthumb : false,
		gallery : true,
		item : 1,
		thumbItem : 8,
		slideMargin : 0,
		speed : 1000,
		loop : true,
		onSliderLoad : function() {
			$('#image-gallery').removeClass('cS-hidden');
		}
	});
	
})
 	var calendar=null;
	document.addEventListener('DOMContentLoaded', function() {
		var d = new Date();
		<%=session.getAttribute("c_num")%>
		var calendarEl = document.getElementById('calendar');
		var calHeight = 450;
		calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid', 'interaction' ],
			//		 			timeZone : "Asian/Seoul",
			locale : 'ko',
			height : calHeight,
			// 				    contentHeight:calHeight,
			allDayDefault : false,
			editable : false,
			displayEventTime : false,
			defaultView : 'dayGridMonth',
			defaultDate : d,
			editable : true,
			selectable : false,
			eventLimit : false, // allow "more" link when too many events
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek'
			},
			eventRender : function(info) {
				var tooltip = new Tooltip(info.el, {
					title : info.event.extendedProps.description,
					placement : 'top',
					trigger : 'hover',
					container : 'body'
				});
			},
		});
		function roomCalendar() {
			var room_num = $('.rCalSelect option:selected').val();
			$.ajax({
				url : "${contextPath}/petHotel/petHotelReservation",
				data : {
					phrm_num : room_num
				},
				dataType : "JSON",
				success : function(data) {

					var events = calendar.getEvents();
					var len = events.length;
					for (var i = 0; i < len; i++) {
						events[i].remove();
					}
					for (var i = 0; i < data.length; i++) {
						e = {
							groupId : 'phr_num',
							id : data[i].phr_num,
							start : data[i].phr_chkin,
							end : data[i].phr_chkout + 'T11:00',
							title :  '예약'+(i+1),
							description : data[i].phr_chkin.substring(2, 12)
									+ ' ~ '
									+ data[i].phr_chkout.substring(2, 12),
							color : Math.random().toString(16).replace(/.*(\w{3})/, '#$1'),
							textColor : "#FFFFFF",
						}

						calendar.addEvent(e);
						calendar.render();
					}

				},
				error : function() {
					alert("데이터를 불러오는데 실패했습니다.")
				}
			})
		}
		calendar.render();
		$('.rCalSelect').on("change", function() {
			roomCalendar();
		});
		roomCalendar();
	});
</script>
</head>
<body>
<div class="container">
	<!-- 네비게이션 -->
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
						<li class='last'><a href='${contextPath}/home/main'>가정펫시터</a> <!-- 
                    <ul>
                       <li><a href='#'>HTML Basic</a></li>
                       <li class='last'><a href='#'>HTML Advanced</a></li>
                    </ul>
                     --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='${contextPath}/petHotel/petHotelList'>HOTEL</a>
					<ul>
						<li class='last'><a href='${contextPath}/petHotel/petHotelList'>펫호텔</a></li>
                 </ul>
             </li>
             <li class='last'><a href='${contextPath}/member/myPage'  style="font-size: 17px">MYPAGE</a></li>
             <li class='last'><a href='${contextPath}/member/qna'  style="font-size: 17px">Q&A</a></li>
         </ul>
     </div>
 </nav>
<!-- 칸 띄우기 위함 -->
<br><br><br>
	<!-- 		여기다 내용을 작성하시면 됩니다 -->
	<div class="container">
		<div style="width: 750px; display: inline-block; float: left;">
			<div>
				<strong>${hsList.HSL_TITLE}</strong>
			</div>
			<div class="demo">
				<div class="item">
					<div class="clearfix" style="width: 700px; height: 402px">
						<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
							<c:forEach items="${hsimg}" var="img">
								<li data-thumb="${contextPath}/home/image?fileName=${img}">
									<img src="${contextPath}/home/image?fileName=${img}" style="width: 700px; height: 402px" />
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

				
			<div style="width: 750px; display: inline-block; float: left;">
					<div style="width: 70px; display: inline-block; float: left;">
						<img src="${contextPath}/resources/img/reserveDog.JPG" >
					</div>
				<div style="width: 304.5px; display: inline-block; float: left;">
					<fieldset>
						<legend>
							<small><i>돌봄 가능한 강아지 크기&나이</i></small>
						</legend>
						<ul>
							<li>${hsList.HSL_SIZE }가능합니다.</li>
							<li>${hsList.HSL_PET_AGE }케어가능합니다.</li>
						</ul>
					</fieldset>			
				</div>
					<div style="width: 70px; display: inline-block; float: left;">
						<img src="${contextPath}/resources/img/reserveClock.JPG" style="height: 105px;left: -14px; position: relative;">
					</div>
				<div style="width: 304.5px; display: inline-block; float: left;">
					<fieldset>
						<legend>
							<small><i>체크인, 체크아웃 시간</i></small>
						</legend>
						<ul>
							<li>체 크 인 : ${hsList.HSL_CHKIN_STR_TIME } ~ ${hsList.HSL_CHKIN_END_TIME }</li>
							<li>체 크 아 웃 : ${hsList.HSL_CHKOUT_STR_TIME } ~ ${hsList.HSL_CHKOUT_END_TIME }</li>
						</ul>
					</fieldset>				
				</div>
			</div>
			
			<div style="width: 750px; display: inline-block; float: left;">
			<br><br>
			</div>
			
			<div style="width: 750px; display: inline-block; float: left;">		
				<fieldset>
					<legend>
						<strong><i>돌보미환경</i></strong>
					</legend>
					<ul>
						<li>돌봄 공간 : <span>${hsList.HSL_CARE_PLACE }</span></li>
						<li>마당유무 : <span>${hsList.HSL_YARD }</span></li>
						<li>14세 미만 아동 : <span>${hsList.HSL_BABY }</span></li>
						<li>가족 동거 여부 : <span>${hsList.HSL_FAMILY }</span></li>
					</ul>
				</fieldset>
				<br>
				<br>
				<fieldset>
					<legend>
						<strong><i>돌보미 소개</i></strong>
					</legend>
					<ul>
						<li>제목 : <span>${hsList.HSL_TITLE }</span></li>
						<li>내용 : <br>
						<span>${hsList.HSL_COMMENT }</span></li>
					</ul>
				</fieldset>
<!-- 				<div style="width: 750px; display: inline-block; float: left;"> -->
			<br><br>
<!-- 			</div> -->
				<div>
					<c:forEach items="${comment}" var="cmmt">
						<div class="media border p-3" style="margin: 3px auto;">
							<c:choose>
								<c:when test="${cmmt.C_FILENAME eq null}">
									<img src="${contextPath}/resources/img/user.jpg" class="mr-3 mt-3 rounded-circle" style="width: 60px; height: 60px">
								</c:when>
								<c:otherwise>
									<img src="${contextPath }/home/image?fileName=${cmmt.C_FILENAME }" class="mr-3 mt-3 rounded-circle" style="width: 60px; height: 60px">
								</c:otherwise>
							</c:choose>
							<div class="media-body">
								<div class="media-body">
									<table style="width: 100%">
										<tr>
											<td style="text-align: left; width: 50%">${cmmt.C_NAME}</td>
											<td style="text-align: right; width: fit-content;" colspan="2">
												<c:forEach var="i" begin="1" end="${cmmt.HSC_STAR-(cmmt.HSC_STAR%1)}">
													<img src="${contextPath}/resources/img/paw.png" style="width: 20px; height: 20px;">
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: left; width: 80%">
												<p style="margin-left: 10px;">${cmmt.HSC_COMMENT}</p>
											</td>
											<td colspan="1" style="text-align: right; width: fit-content;">
												<fmt:formatDate value="${cmmt.HSC_WRITE_DATE}"></fmt:formatDate>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>	
		
		<div style="width: 280px; display: inline-block; float: left;">
			<div>
				<fieldset>
					<form action="reserve" method="post">
						<h5 style="text-align: center">예약을 확인해 주세요.</h5>
						<table class="table table-hover">
							<thead>
								<tr>
									<th><input type="text" id="checkin" name="hsr_chkin" class="cal" placeholder="시작일" style="width: 143px;"></th>
									<th><input type="text" id="checkout" name="hsr_chkout" class="cal" placeholder="마침일" style="width: 143px;"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th colspan="2"><small>(반려견 추가 당<span id="addPet">15000</span>원)
									</small></th>
								</tr>
								<tr>
									<td>시작 시간 :</td>
									<td>
										<input type="text" id="hsr_dropoff_time" name="hsr_dropoff_time">
									</td>
								</tr>
								<tr>
									<td>종료 시간 :</td>
									<td>
										<input type="text" id="hsr_pickup_time" name="hsr_pickup_time">
									</td>
								</tr>
								<tr>
									<td>
										<span id="pricePerDay">20000</span>원
									</td>
									<td>
										<select id="petSize-select" name="hsl_size" data-width="130px">
											<option id="nomalSize" value="소형견, 중형견" selected="selected">15kg 미만</option>
											<option id="bigSize" value="대형견">15kg 이상</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="1"><small>반려견 추가</small> <input class="form-control-sm" type="number" min="0" max="5" name="hsr_numof_pet" id="hsr_numof_pet" value="0" ></td>
									<td style="line-height: 50px;"><span id="totalAddPetPrice" >0</span>원 </td>
								</tr>
								<tr>
									<td>총 가격 :</td>
									<td>
										<span id="hsr_totalprice">20,000</span>원
									</td>
								</tr>
							</tbody>
						</table>
										<input type="submit" value="예약하기" class="btn btn-outline-info"> <input type="reset" value="초기화" class="btn btn-outline-info">
						<input type="hidden" name="c_num" value="<%=session.getAttribute("user_num")%>"> <input type="hidden" name="hsl_num" value="${hsList.HSL_NUM }"> <input type="hidden" name="hs_num" value="${hsList.HS_NUM}"> <input type="hidden" name="hsr_totalprice" id="totalpriceInput"> <input type="hidden" name="hsr_pricePerPetSize" id="pricePerPetSize"> <input type="hidden" name="hsr_priceperday" id="hsr_priceperday"> <input type="hidden" name="hsr_pricePerDays" class="pricePerDays"> <input type="hidden" id="days" name="hsr_duringdays" value="0"> <input type="hidden" name="hsr_days" id="Days">
					</form>
				</fieldset>
			</div>
			<div>
				<div>캘린더 미리보기</div>
				<div id="calendar"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>