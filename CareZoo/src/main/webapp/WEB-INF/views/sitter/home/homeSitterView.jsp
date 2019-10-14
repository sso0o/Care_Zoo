<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><!--부트스트랩-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- link for navBar -->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><!-- 부트스트랩 -->
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<!-- 슬라이드 -->
<!-- *필수요소*제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>
<!-- 슬라이더 -->
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script>

<!-- link for datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css'/><!-- datePicker -->
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/jquery-ui.multidatespicker.css'/><!-- multidatePicker -->
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui-timepicker-addon.css" type='text/css'/><!-- dateTimePicker -->
<!-- script for datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- datePicker -->
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script> <!-- moment.js -->
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript" ></script><!-- datePicker -->
<script src="${contextPath}/resources/js/jquery-ui.multidatespicker.js" type="text/javascript" ></script><!-- multidatePicker -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-ui-timepicker-addon.js"></script>   <!-- dateTimePicker -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 코멘트 -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 코멘트 -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 코멘트 -->
<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
<style type="text/css">
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

/*input number*/
.number-input input[type="number"] {
  -webkit-appearance: textfield;
  -moz-appearance: textfield;
  appearance: textfield;
}

.number-input input[type=number]::-webkit-inner-spin-button,
.number-input input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
}

.number-input {
  margin-bottom: 3rem;
}

.number-input button {
  -webkit-appearance: none;
  background-color: transparent;
  border: none;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  margin: 0;
  position: relative;
}

.number-input button:before,
.number-input button:after {
  display: inline-block;
  position: absolute;
  content: '';
  height: 2px;
  transform: translate(-50%, -50%);
}

.number-input button.plus:after {
  transform: translate(-50%, -50%) rotate(90deg);
}

.number-input input[type=number] {
  text-align: center;
}

.number-input.number-input {
  border: 1px solid #ced4da;
  width: 10rem;
  border-radius: .25rem;
}

.number-input.number-input button {
  width: 2rem;
  height: .7rem;
}

.number-input.number-input button.minus {
  padding-left: 10px;
}

.number-input.number-input button:before,
.number-input.number-input button:after {
  width: .7rem;
  background-color: #495057;
}

.number-input.number-input input[type=number] {
  max-width: 4rem;
  padding: .5rem;
  border: 1px solid #ced4da;
  border-width: 0 1px;
  font-size: 1rem;
  height: 2rem;
  color: #495057;
}

@media not all and (min-resolution:.001dpcm) {
  @supports (-webkit-appearance: none) and (stroke-color:transparent) {

    .number-input.def-number-input.safari_only button:before,
    .number-input.def-number-input.safari_only button:after {
      margin-top: -.3rem;
    }
  }
}
/* <!-- datepicke 달력이모지--> */
.cal {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
/* .cal::-webkit-inner-spin-button { */
/*   display: none; */
/* } */
/* .cal::-webkit-calendar-picker-indicator { */
/*   opacity: 0; */
/* } */

/*코멘트용*/
body{margin-top:20px;}

.comment-wrapper .panel-body {
    max-height:650px;
    overflow:auto;
}

.comment-wrapper .media-list .media img {
    width:64px;
    height:64px;
    border:2px solid #e5e7e8;
}

.comment-wrapper .media-list .media {
    border-bottom:1px dashed #efefef;
    margin-bottom:25px;
}
/*코멘트용*/
</style>
<script type="text/javascript">

$(function() {
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
		minTime:'${hsList.hsl_chkin_str_time}' ,
		timeFormat: "HH:mm",
		maxTime: '${hsList.hsl_chkin_end_time}',
		stepMinute: 30		
	});
	var takebackTime = $('#hsr_pickup_time').timepicker({
		format: 'LT',
		minTime:'${hsList.hsl_chkout_str_time}' ,
		timeFormat: "HH:mm",
		maxTime: '${hsList.hsl_chkout_end_time}',
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
	
	//후기 이미지 갖고 오기
// 	$.ajax({
// 		url:"${contextPath}/home/getComment",
// 		data:{
// 			hs_num : ${hsList.hs_num}
// 		},
// 		dataType: "JSON",
// 		success: function(data) {
// 			console.log(data)
// 			if(data.filename != null){
// 				$(".img-circle").attr("src","${contextPath}/home/image?fileName="+data.filename)
// 			} else {
// 				$(".img-circle").attr("src","https://bootdey.com/img/Content/user_1.jpg")
// 			}
			
// 		}, error: function() {
// 			alert("error")
// 		}
// 	})
	
// 				<ul class="media-list">
// 				<c:forEach items="${comment}" var="cmmt">
// 					<li class="media"><a href="#" class="pull-left">
// 						 <img class="img-circle"></a>
// 						<div> </div>
// 						<div class="media-body">
// 							<span class="text-muted pull-right"> <small class="text-muted">${cmmt.hsc_write_date}</small>
// 							</span> <strong class="text-success">@${cmmt.c_name}</strong>
// 							<p>
// 								${cmmt.hsc_comment} <a href="#">#consecteturadipiscing </a>.
// 							</p>
// 						</div>
// 					</li>
// 				</c:forEach>
// 			</ul>
	
// 	var unavailableDates = ${disDates};
// -----------------------------------------
// 	$("#email").val("${hsList.hsl_chkin_str_time}");
// 	$("#name").val("${hs.hs_name}");
// 	$("#contact").val("${hs.hs_contact}");
// 	$("#address").val("${hs.hs_address}");
// 	$("#d_address").val("${hs.hs_d_address}");
// 	$("#birth").val("${hs.hs_birth}");
// 	if("${hs.hs_birth}" == "1"){
// 		$("#sex").val("여자");
// 		$("#hs_sex").val("1");
// 	} else {
// 		$("#sex").val("남자");
// 		$("#hs_sex").val("2");
// 	}
	
// 	$.ajax({
// 		url:"${contextPath}/home/getComment",
// 		data:{
// 			hs_num : $('#demo1').val()
// 		},
// 		dataType: "JSON",
// 		success: function(data) {
// 			console.log(data)
		
// // 			if(data.filename != null){
// // 				$("#img").attr("src","${contextPath}/sitter/image?fileName="+data.filename)
// // 			} else {
// // 				$("#img").attr("src","${contextPath}/resources/img/user.jpg")
// // 			}
			
// 		}, error: function() {
// 			alert("error")
// 		}
// 	})
	
	
// 	function ajaxSucessLoading(hsList){
// 		console.log("성겅!");
// 		for(i;breaker<8;i++){
// 			console.log(i);
// 			if(breaker <7){			
// 				var ul = $('<ul class="media-list">');	
// 				var li = $('<li class="media">');
// 				ul.append(li);
// 				var img = $('<a href="#" class="pull-left"> <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle"></a>');
// 				li.append(img);
// 				var cmmtBodyDiv = $('<div class="media-body">');
// 				img.append(cmmtBodyDiv);
// 				var writedate = $('<span class="text-muted pull-right"> <small class="text-muted">'+comment[i].hsc_write_date+'</small>');
// 				cmmtBodyDiv.append(writedate);
// 				var name = $('</span><strong class="text-success">@'+comment[i].c_name+'</strong>');
// 				writedate.append(name);
// 				var cmmt = $('<p>'+comment[i].hsc_comment+'.</p>');
// 				name.append(cmmt);
// 				$('.row bootstrap snippets').append(ul);

// 				breaker = breaker + 1;
// 			} else{
// 				breaker = 0;
// 				break;
// 			}
// 		}
// 	}
// -----------------------------------------------	
	
// 	var a = ${hsList.hsl_chkin_str_time};
// 	console.log(a);
	
	
	
	
	
	
	
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

</script>
</head>
<body>
<!-- 네비게이션 -->
<div>
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
				<li class='last'><a href='${contextPath}/member/qna' style="font-size: 17px">FAQ</a></li>
			</ul>
		</div>
	</nav>
</div>	
<!-- 칸 띄우기 위함 -->
<br><br><br><br><br>

<!-- 		여기다 내용을 작성하시면 됩니다 -->
<div class="container">
	<div  style="width: 750px; display: inline-block; float: left;">
	<div><strong>${hsList.hsl_title}</strong></div>

		<div class="demo">
			<div class="item">
				<div class="clearfix" style="width: 700px; height:402px ">
					<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
					<c:forEach items="${hsimg}" var="img">
						<li data-thumb="${contextPath}/home/image?fileName=${img}">
							<img src="${contextPath}/home/image?fileName=${img}" style="width: 700px; height:402px "/>										
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>	
		</div>
		<br><br>
		<fieldset>
			<legend><strong>돌봄 가능한 강아지 크기&나이</strong></legend>
			<ul>
				<li>${hsList.hsl_size } 가능합니다.</li>
				<li>${hsList.hsl_pet_age }케어 가능합니다.</li>
			</ul>
		</fieldset>
		<br><br>
		<fieldset>
			<legend><strong>돌보미환경</strong></legend>
				<ul>
					<li>돌봄 공간 : <span>${hsList.hsl_care_place }</span></li>
					<li>마당유무 : <span>${hsList.hsl_yard }</span></li>
					<li>14세 미만 아동 : <span>${hsList.hsl_baby }</span></li>
					<li>가족 동거 여부 : <span>${hsList.hsl_family }</span></li>
				</ul>
		</fieldset>
		<br><br>
		<fieldset>
		<legend><strong>돌보미 소개</strong></legend>
		<ul>
			<li>제목 : <span>${hsList.hsl_title }</span></li>
			<li>내용 : <br><span>${hsList.hsl_comment }</span></li>
		</ul>
		</fieldset>		
		<br><br>
		
		<div class="row bootstrap snippets">
			<ul class="media-list">
				<c:forEach items="${comment}" var="cmmt">
					<li class="media">
						<a href="#" class="pull-left">						 
						<c:choose>
							<c:when test="${cmmt.c_filename eq null}">
								<img src="https://bootdey.com/img/Content/user_1.jpg" class="img-circle">
							</c:when>
							<c:otherwise>
								<img src="${contextPath }/home/image?fileName=${cmmt.c_filename }" class="img-circle">
							</c:otherwise>
						</c:choose>
						</a>
						<div></div>
						<div class="media-body">
							<span class="text-muted pull-right"> <small class="text-muted">${cmmt.hsc_write_date}</small>
							</span> <strong class="text-success">${cmmt.c_name}</strong>
							<p>
								${cmmt.hsc_comment}
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div style="width: 293px; display: inline-block; float: left;">
		<div>
			<fieldset>
				<form action="reserve" method="post" >
					<div>
						<ul>
							<li>
								예약을 원하는 날짜와 시간을 선택해주세요.<br>
								<input type="text" id="checkin" name="hsr_chkin"  class="cal" placeholder="시작일" style="width: 143px;">
								<input type="text" id="checkout" name="hsr_chkout"  class="cal" placeholder="마침일" style="width: 143px;">
							</li>
							<li>
								시작 시간 : <input type="text" id="hsr_dropoff_time" name="hsr_dropoff_time"><br>
								종료 시간 : <input type="text" id="hsr_pickup_time" name="hsr_pickup_time"><br>
							</li>
							<li><span id="pricePerDay">20000</span>원 
								<span>
									<select id="petSize-select" name="hsl_size" data-width="130px">
										<option id="nomalSize" value="소형견, 중형견" selected="selected">15kg 미만</option>
										<option id="bigSize" value="대형견">15kg 이상</option>
									</select>
								</span>
							</li>
							<li>반려견 추가 당 <span id="addPet">15000</span>원</li>
							<li><span id ="DAY">1 day</span> <span class="pricePerDays"> 20000</span>원</li>
							<li>반려견 추가<span><input type="number" min="0" max="5" name="hsr_numof_pet" id="hsr_numof_pet" value="0"></span><span id="totalAddPetPrice">0</span>원</li>
							<li>총 가격 : <span id="hsr_totalprice">20,000</span>원<br>
							</li>
						</ul>					
						<ul>
							<li><input type="submit" value="예약하기"><input type="reset" value="초기화"></li>
						</ul>
					</div>
					<input type="hidden" name="c_num" value="<%=session.getAttribute("user_num")%>">
					<input type="hidden" name="hsl_num" value="${hsList.hsl_num }">
					<input type="hidden" name="hs_num" value="${hsList.hs_num}">
					<input type="hidden" name="hsr_totalprice" id="totalpriceInput">
					<input type="hidden" name="hsr_pricePerPetSize" id="pricePerPetSize">
					<input type="hidden" name="hsr_priceperday" id="hsr_priceperday">
					<input type="hidden" name="hsr_pricePerDays" class="pricePerDays">
					<input type="hidden" id="days" name="hsr_duringdays" value="0">
					<input type="hidden" name="hsr_days" id="Days"><!-- 이거 확인하기(삭제해도 괜찮은지....)-->
				</form>
			</fieldset>
		</div>
		<div>
			<div >캘린더 미리보기</div>
			<div id="calendar"></div>
		</div>
<!-- 		<div id="sideInfo" style='position: fixed; right:0; top:50%;'> -->
<!-- 			<ul> -->
<!-- 				<li><img alt="" src="">홈시터 이미지</li> -->
<%-- 				<li>${hsList.hs_name}</li> --%>
<%-- 				<li>${hsList.hsl_address}${hsList.hsl_d_address }</li> --%>
<%-- 				<li>${hsList.hs_avgStar}</li> --%>
<!-- 				<li><button onclick="">예약요청하기</button></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
	</div>
</div>	

	
<!-- <br><br> -->
<!-- <footer> -->
<!-- 	<div>durlsms footer</div> -->
<!-- </footer> -->
</body>
</html>