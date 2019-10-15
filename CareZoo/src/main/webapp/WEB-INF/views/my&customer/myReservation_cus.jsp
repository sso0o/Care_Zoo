<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />

<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>
<%-- <script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/moment-timezone/main.js'></script> --%>
<%-- <script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/moment/main.js'></script> --%>

<script type="text/javascript" src='${contextPath}/resources/js/moment.js'></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>

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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script>
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"
	var d = new Date();
	var eee = null;
	var rstnum = null;
	
	
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() {
		console.log("numtype : "+user_numtype)
		console.log("name : "+user_name)
		console.log("num : "+user_num)
		
		if("${msg}" != ""){
			alert("${msg}");
		}
	})//문서가 로딩되면 실행할 함수
	

	document.addEventListener('DOMContentLoaded', function() {
		
		var num = <%=session.getAttribute("user_num")%>
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid', 'interaction' ],
// 			timeZone : "Asian/Seoul",
			editable : false,
			defaultView : 'dayGridMonth',
			defaultDate : d,
			editable : true,
			selectable : true,
			eventLimit : true, // allow "more" link when too many events
			header : {
				left : 'prev,next today',
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

			//// uncomment this line to hide the all-day slot
			//allDaySlot: false,

			select : function(arg) {


			},
			eventClick : function(info) {
				var infocheck = info.event.groupId+'='+info.event.id
				var chkoutTime = info.event.end;

				eee = info.event.end;
				$(".groupid").val(info.event.groupId)
				$(".number").val(info.event.id)
				
				modalOpen(chkoutTime);
			}
		});
		calendar.render();

		// 캘린더에 내 예약 추가(고객)
		$.ajax({
			url : "${contextPath}/member/myReservationCustomer",
			data : {
				c_num : num
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data)
				for (var i = 0; i < data.vsrList.length; i++) {
					var e = {
						groupId : 'vsr_num',
						id : data.vsrList[i].VSR_NUM,
						start : data.vsrList[i].VSR_CHKIN,
						end : data.vsrList[i].VSR_CHKOUT,
						title : '방문시터예약',
						color : 'rgba(0, 0, 120, 0.6)',
						textColor: "white"
					}
					calendar.addEvent(e)
					calendar.render();
				}
				for (var i = 0; i < data.hsrList.length; i++) {
					var e = {
						groupId : 'hsr_num',
						id : data.hsrList[i].HSR_NUM,
						start : data.hsrList[i].HSR_CHKIN+"T"+data.hsrList[i].HSR_PICKUP_TIME,
						end : data.hsrList[i].HSR_CHKOUT+"T"+data.hsrList[i].HSR_DROPOFF_TIME,
						title : data.hsrList[i].HS_NAME+' 가정시터',
						color : 'rgba(0, 120, 0, 0.6)',
						textColor: "white"
					}
					calendar.addEvent(e)
					calendar.render();
				}
				for (var i = 0; i < data.phrList.length; i++) {
					console.log(data.phrList[i])
					var e = {
						groupId : 'phr_num',
						id : data.phrList[i].PHR_NUM,
						start : data.phrList[i].PHR_CHKIN+'T13:00',
						end : data.phrList[i].PHR_CHKOUT+'T11:00',
						title : data.phrList[i].PH_NAME,
						color : 'rgba(200, 0, 0, 0.6)',
						textColor: "white"
					}
					calendar.addEvent(e)
					calendar.render();
				}

			},
			error : function() {
				alert("데이터를 불러오는데 실패했습니다.")
			}
		})
	});
	
	function modalOpen(endday) {
		console.log("endday : "+endday);
		console.log($(".groupid").val()+"=="+$(".number").val())
		var urll = "";
		if($(".groupid").val()=="phr_num"){
			urll = "getModalPH";
			$.ajax({
				url: "${contextPath}/member/"+urll ,
				data:{
					num: $(".number").val()
				},
				dataTpe:"JSON",
				success: function(data) {
					
					console.log(data)	
					if(d>endday){
						$(".cancel").hide();
					} else{
						$(".review").hide();
					}
					$("#ph_name").text(data.PH_NAME);
					$("#ph_contact").text(data.PH_CONTACT);
					$("#ph_address").text(data.PH_ADDRESS+" "+data.PH_D_ADDRESS);
					$("#ph_chkin").text(data.PHR_CHKIN);
					$("#ph_chkout").text(data.PHR_CHKOUT);
					$("#ph_total").text(data.PHR_PRICE+"원");
					$("#ph_message").text(data.PHR_MESSAGE);
					var rststar = parseInt(data.STAR / 0.5);
					console.log(rststar)
					$("#ph_star"+rststar).addClass('on').prevAll('span').addClass('on');
					
					$("#modal-showMain").show();
					$("#phrInfo").show();
					
				},error: function() {
		
				}
			})
		} else if($(".groupid").val()=="hsr_num"){
			urll = "getModalHS";
			$.ajax({
				url: "${contextPath}/member/"+urll ,
				data:{
					num: $(".number").val()
				},
				dataTpe:"JSON",
				success: function(data) {
					console.log(data)	
					if(d>endday){
						$(".payment").hide();
						$(".cancel").hide();
						
					} else{
						if(data.HSR_STATUS == 2){
							$(".payment").hide();
						}
						$(".review").hide();
					}
					$("#hs_name").text(data.HS_NAME);
					$("#hs_contact").text(data.HS_CONTACT);
					$("#hs_chkin").text(data.HSR_CHKIN + " "+data.HSR_PICKUP_TIME);
					$("#hs_chkout").text(data.HSR_CHKOUT+" "+data.HSR_DROPOFF_TIME);
					$("#hs_total").text(data.HSR_TOTALPRICE+"원");
					$("#hs_message").text(data.HSR_MESSAGE);
					var rststar = parseInt(data.STAR / 0.5);
					console.log(rststar)
					$("#hs_star"+rststar).addClass('on').prevAll('span').addClass('on');
					
					$("#modal-showMain").show();
					$("#hsrInfo").show();
					
				},error: function() {
		
				}
			})
		}else if($(".groupid").val()=="vsr_num"){
			urll = "getModalVS";
			$.ajax({
				url: "${contextPath}/member/"+urll ,
				data:{
					num: $(".number").val()
				},
				dataTpe:"JSON",
				success: function(data) {
					console.log(data)	
					if(d>data.VSR_CHKIN){
						$(".payment").hide();
						$(".cancel").hide();
						
					} else{
						if(data.VSR_STATUS == 2){
							$(".payment").hide();
						}
						$(".review").hide();
					}
					$("#vs_name").text("");
					$("#vs_contact").text("");
					$("#vs_chkin").text("");
					$("#vs_chkout").text("");
					$("#vs_total").text("");
					$("#vs_message").text("");
					$("#vs_name").text(data.VS_NAME);
					$("#vs_contact").text(data.VS_CONTACT);
					$("#vs_chkin").text(data.VSR_CHKIN+" "+data.VSR_HOUR+":00");
					$("#vs_chkout").text(data.VSR_CHKIN+" "+(data.VSR_HOUR*1+3+data.VSR_HADD*1)+":00");
					$("#vs_total").text(data.VSR_TOTALPRICE+"원");
					var str = "";
					if(data.VSR_ATTENTION.includes("1")){
						str += "/ 놀이위주 ";
					}
					if(data.VSR_ATTENTION.includes("2")){
						str += "/ 산책위주 ";
					} 
					if(data.VSR_ATTENTION.includes("3")){
						srt += "/ 생식급여 ";
					} 
					if(data.VSR_ATTENTION.includes("4")){
						str += "/ 케어필요 ";
					}
					$("#vs_attention").text(str);
					$("#vs_message").text(data.VSR_CONTENTS);
					var rststar = parseInt(data.STAR / 0.5);
					console.log(rststar)
					$("#vs_star"+rststar).addClass('on').prevAll('span').addClass('on');
					
					$("#modal-showMain").show();
					$("#vsrInfo").show();
					
				},error: function() {
		
				}
			})
		}

		$(".close").on("click", function() {
			$("#modal-showMain").hide();
			$("#phrInfo").hide();
			$("#hsrInfo").hide();
			$("#vsrInfo").hide();
			$(".starRev").children('span').removeClass('on');
			$(".payment").show();
			$(".cancel").show();
			$(".review").show();
			
		});
	}
	
	function payMent() {
		console.log("결제버튼 누름->"+$(".groupid").val()+"="+$(".number").val());
		if (confirm("선택한 예약을 결제하시겠습니까?") == true) {
			//location.href = '${contextPath}/logout'
		} else {
			return false;
		}	
	}
	
	function cancel() {
		console.log("취소버튼 누름->"+$(".groupid").val()+"="+$(".number").val());
		if (confirm("선택한 예약을 취소하시겠습니까?") == true) {
			//location.href = '${contextPath}/logout'
			if($(".groupid").val()=="hsr_num"){
				location.href='${contextPath}/member/cancelHSR?num='+$(".number").val();
			}else if($(".groupid").val()=="vsr_num"){
				location.href='${contextPath}/member/cancelVSR?num='+$(".number").val();
			}else if($(".groupid").val()=="phr_num"){
				location.href='${contextPath}/member/cancelPHR?num='+$(".number").val();
			}
			
		} else {
			return false;
		}
	}
	
	function review() {
		console.log("후기버튼 누름->"+$(".groupid").val()+"="+$(".number").val());
		if(d>eee){
			$.ajax({
				url:"${contextPath}/comment/commentchk",
				data:{
					groupId : $(".groupid").val(),
					id:$(".number").val()
				},
				dataType:"JSON",
				success: function(data){
					if(data){
						if($(".groupid").val()=="hsr_num"){
							location.href='${contextPath}/comment/hsCommentForm?hsr_num='+$(".number").val();
						}else if($(".groupid").val()=="vsr_num"){
							location.href='${contextPath}/comment/vsCommentForm?vsr_num='+$(".number").val();
						}else if($(".groupid").val()=="phr_num"){
							location.href='${contextPath}/comment/phCommentForm?phr_num='+$(".number").val();
						}
					} else{
						alert("이미 후기를 작성 하셨습니다")
					}
					
					
				}, error : function() {
					
				}
			})
			
		} else{
			alert("조건을 갖추지 못하였습니다:/");
		}
		
	
	}

</script>
<style>

/*   body { */
/*     margin: 0; */
/*     padding: 0; */
/*     font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
/*     font-size: 14px; */
/*   } */
#calendar {
	max-width: 900px;
	margin: 30px auto;
	max-height: 100%;
}

.noshow {
	display: none;
}

.content{
	width: 900px;
	margin: 0 auto;
}

.fieldset{
	border: 1px solid #888;
	border-radius: .125em;
	margin: 20px auto;
	padding: 20px;
}

.fieldset legend{
	max-width: 400px;
	width: auto;
}

.col{
	text-align: center;
}


.my-btn{
	border: 1px solid #40bf9f;
	color: #40bf9f;
}

textarea {
	width: 100%;
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: .3em;
	resize: none;
}


.my-btn:hover, .my-btn:focus{
	border: 1px solid #40bf9f;
	color: white;
	background-color: #40bf9f;
	cursor: pointer;
}

.hsrInfo, .vsrInfo, .phrInfo {
	background-color: #fff;
	width: 500px;
	height: 500px;
	position: absolute;
	margin-top: -250px;
	margin-left: -250px;
	top: 50%;
	left: 50%;
}


td{
	vertical-align: middle;
}

</style>
<title>mypage</title>
<!-- 마이페이지 시작 -->
</head>
<body>
<input type="checkbox" id="menuicon">
			<label for="menuicon">
				<span></span>
				<span></span>
				<span></span>
			</label>
			<div class="sidebar">
				<div>
					<ul>
						<li><a href="${contextPath}/member/myPage">내 정보</a></li>
						<li><a href="${contextPath}/member/myPet?user_num=<%=session.getAttribute("user_num")%>">펫 정보</a></li>
						<li><a href="${contextPath}/member/myReservation">예약상황 보기</a></li>
						<li><a href="${contextPath}/member/goodByeCheckUser">회원탈퇴</a></li>
					</ul>
				</div>
			</div>

	<div class="container">
		<header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h2>내 예약 현황</h2>
		<hr>
		<div id='calendar'></div>
		<div class="content">
			<fieldset id="showEvent" class="fieldset">
				<legend style="text-align: center;" id="legend"><fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/></legend>
					<div class="row" id="showDiv">
						
					</div>
			</fieldset>
		</div>
		<div>
			
		</div>

	</div>

	<footer>
		<div>durlsms footer</div>
	</footer>

	

	<!-- ///////////////////////////////////////////////////////////////모달 -->
	<div class="container-fluid modal-modify" id="modal-showMain">
		<div id="hsrInfo" class="hsrInfo noshow">
			<table class="table table-hover">
				<tr>
					<td>
						<input type="hidden" class="groupid" name="groupid">
					</td>
					<td>
						<input type="hidden" class="number" name="number">
					</td>
					<td colspan="2" style="text-align: right;">
						<button type="button" class="close">&times;</button>
					</td>
				</tr>
				<tr>
					<th>시터이름</th>
					<td id="hs_name"></td>
					<th>연락처</th>
					<td id="hs_contact"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3" id="hs_address"></td>
				</tr>
				<tr>
					<th>시작일</th>
					<td id="hs_chkin"></td>
					<th>종료일</th>
					<td id="hs_chkout"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="5" cols="50" id="hs_message"></textarea>
				</tr>
				<tr>
					<td colspan="2" class="starTr" id="starTr" style="padding-left: 35px">
						<span id="starRev" class="starRev"> 
							<span class="starR1" id="hs_star1" title="0.5">별1_왼쪽</span> 
							<span class="starR2" id="hs_star2" title="1">별1_오른쪽</span> 
							<span class="starR1" id="hs_star3" title="1.5">별2_왼쪽</span> 
							<span class="starR2" id="hs_star4" title="2">별2_오른쪽</span> 
							<span class="starR1" id="hs_star5" title="2.5">별3_왼쪽</span> 
							<span class="starR2" id="hs_star6" title="3">별3_오른쪽</span> 
							<span class="starR1" id="hs_star7" title="3.5">별4_왼쪽</span> 
							<span class="starR2" id="hs_star8" title="4">별4_오른쪽</span> 
							<span class="starR1" id="hs_star9" title="4.5">별5_왼쪽</span> 
							<span class="starR2" id="hs_star10" title="5">별5_오른쪽</span>
						</span>
					</td>
					<th>총가격</th>
					<td id="hs_total"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						<a href="#" onclick="payMent()" class="btn my-btn payment" id="payment">결제</a>
						<a href="#" onclick="cancel()" class="btn my-btn payment" id="cancel">취소</a>
						<a href="#" onclick="review()" class="btn my-btn review" id="review" style="position:relative;right:190px">후기</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="vsrInfo" class="vsrInfo noshow">
			<table class="table table-hover">
				<tr>
					<td>
						<input type="hidden" class="groupid" name="groupid">
					</td>
					<td>
						<input type="hidden" class="number" name="number">
					</td>
					<td colspan="2" style="text-align: right;">
						<button type="button" class="close">&times;</button>
					</td>
				</tr>
				<tr>
					<th>시터이름</th>
					<td id="vs_name"></td>
					<th>연락처</th>
					<td id="vs_contact"></td>
				</tr>
				<tr>
					<th>선택사항</th>
					<td colspan="3" id="vs_attention"></td>
				</tr>
				<tr>
					<th>체크인</th>
					<td id="vs_chkin"></td>
					<th>체크아웃</th>
					<td id="vs_chkout"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="5" cols="50" id="vs_message"></textarea>
				</tr>
				<tr>
					<td colspan="2" style="padding-left: 35px">
						<span id="starRev" class="starRev"> 
							<span class="starR1" id="vs_star1" title="0.5">별1_왼쪽</span> 
							<span class="starR2" id="vs_star2" title="1">별1_오른쪽</span> 
							<span class="starR1" id="vs_star3" title="1.5">별2_왼쪽</span> 
							<span class="starR2" id="vs_star4" title="2">별2_오른쪽</span> 
							<span class="starR1" id="vs_star5" title="2.5">별3_왼쪽</span> 
							<span class="starR2" id="vs_star6" title="3">별3_오른쪽</span> 
							<span class="starR1" id="vs_star7" title="3.5">별4_왼쪽</span> 
							<span class="starR2" id="vs_star8" title="4">별4_오른쪽</span> 
							<span class="starR1" id="vs_star9" title="4.5">별5_왼쪽</span> 
							<span class="starR2" id="vs_star10" title="5">별5_오른쪽</span>
						</span>
					</td>
					<th>총가격</th>
					<td id="vs_total"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						<a href="#" onclick="payMent()" class="btn my-btn payment" id="payment">결제</a>
						<a href="#" onclick="cancel()" class="btn my-btn cancel" id="cancel">취소</a>
						<a href="#" onclick="review()" class="btn my-btn review" id="review" style="position:relative;right:190px">후기</a>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="phrInfo" class="phrInfo noshow">
			<table class="table table-hover">
				<tr>
					<td>
						<input type="hidden" class="groupid" name="groupid">
					</td>
					<td>
						<input type="hidden" class="number" name="number">
					</td>
					<td colspan="2" style="text-align: right;">
						<button type="button" class="close">&times;</button>
					</td>
				</tr>
				<tr>
					<th>호텔이름</th>
					<td id="ph_name"></td>
					<th>연락처</th>
					<td id="ph_contact"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3" id="ph_address"></td>
				</tr>
				<tr>
					<th>체크인</th>
					<td id="ph_chkin"></td>
					<th>체크아웃</th>
					<td id="ph_chkout"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="5" cols="50" id="ph_message"></textarea>
				</tr>
				<tr>
					<td colspan="2" class="starTr" id="starTr" style="padding-left: 35px">
						<span id="starRev" class="starRev"> 
							<span class="starR1" id="ph_star1" title="0.5">별1_왼쪽</span> 
							<span class="starR2" id="ph_star2" title="1">별1_오른쪽</span> 
							<span class="starR1" id="ph_star3" title="1.5">별2_왼쪽</span> 
							<span class="starR2" id="ph_star4" title="2">별2_오른쪽</span> 
							<span class="starR1" id="ph_star5" title="2.5">별3_왼쪽</span> 
							<span class="starR2" id="ph_star6" title="3">별3_오른쪽</span> 
							<span class="starR1" id="ph_star7" title="3.5">별4_왼쪽</span> 
							<span class="starR2" id="ph_star8" title="4">별4_오른쪽</span> 
							<span class="starR1" id="ph_star9" title="4.5">별5_왼쪽</span> 
							<span class="starR2" id="ph_star10" title="5">별5_오른쪽</span>
						</span>
					</td>
					<th>총가격</th>
					<td id="ph_total"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						<a href="#" onclick="cancel()" class="btn my-btn cancel" id="cancel">취소</a>
						<a href="#" onclick="review()" class="btn my-btn review" id="review"style="position:relative;right:190px">후기</a>
					</td>
				</tr>
			</table>
		</div>

	</div>

</body>
</html>