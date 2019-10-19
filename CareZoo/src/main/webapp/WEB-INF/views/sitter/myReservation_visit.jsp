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
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<link rel='stylesheet' href='${contextPath}/resources/css/popper_tooltip.css' />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- kakao상담 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script>
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"
	var d = new Date();
	
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}
	
	$(function() {
// 		console.log(d)
// 		console.log("numtype : "+user_numtype)
// 		console.log("name : "+user_name)
// 		console.log("num : "+user_num)
		
		if("${msg}" != ""){
			alert("${msg}");
		}
		
// 		$("#legend").text(value)
								//----카카오 1:1상담
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('d5215a661c44ab13805d6f04adeddadb');
		// 플러스친구 1:1채팅 버튼을 생성합니다.
		Kakao.PlusFriend.createChatButton({
		  container: '#plusfriend-chat-button',
		  plusFriendId: '_QuCiT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
		});
		//]]>
		//----카카오 1:1상담	
	})

	document.addEventListener('DOMContentLoaded', function() {
		var num = <%=session.getAttribute("user_num")%>
		var calendarEl = document.getElementById('calendar');
		
		var eee = null;
		var rstnum = null;
		
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
				console.log(arg.startStr, arg.endStr, arg.resource ? arg.resource.id : '(no resource)');
// 				document.getElementById("p1").innerHTML=arg.startStr ;
				myResList(arg.startStr);

			},
			eventClick : function(info) {
				var infocheck = info.event.groupId+'='+info.event.id
				var chkoutTime = info.event.end
				eee = info.event.end;
				$("#groupid").val(info.event.groupId)
				$("#number").val(info.event.id)
				
				modalOpen(info.event.id);
			}

		});
		
		calendar.render();

// 		이벤트 추가
	$.ajax({
			url : "${contextPath}/sitter/myReservationVS",
			data : {
				vs_num : num
			},
			dataType : "JSON",
			success : function(data) {
// 				console.log(data.rst1)
// 				console.log(data.rst2)
				
				for(var i= 0; i<data.rst1.length; i++){
					var e = {
						groupId : 'vsr_num',
 						id : data.rst1[i].VSR_NUM,
 						start : data.rst1[i].VSR_CHKIN,
 						title : data.rst1[i].C_NAME,
 						description : "*" + data.rst1[i].VSR_STATUS,
 						color : 'rgba(0, 0, 120,0.6)',
 						textColor : "white"
					}
					calendar.addEvent(e)
 					calendar.render();
				}

				for(var i= 0; i<data.rst2.length; i++){
					var e = {
						groupId : 'vsr_num',
 						id : data.rst2[i].VSR_NUM,
 						start : data.rst2[i].VSR_CHKIN,
 						title : data.rst2[i].C_NAME,
 						description : "*" + data.rst2[i].VSR_STATUS,
 						color : 'rgba(120, 0, 0, 0.6)',
 						textColor : "white"
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

	//고객정보가 모달에 있어야함
	function modalOpen(num) {
		$.ajax({
			url : "${contextPath}/sitter/getModalC",
			data : {
				num : num
			},
			dataTpe : "JSON",
			success : function(data) {
// 				console.log(data)
				$("#c_name").text(data.C_NAME)
				$("#c_contact").text(data.C_CONTACT)
				$("#c_address").text(data.C_ADDRESS+" "+data.C_D_ADDRESS)
				$("#chkin").text(data.VSR_CHKIN+" "+data.VSR_HOUR+":00")
				$("#chkout").text(data.VSR_CHKIN+" "+data.VSR_EHOUR+":00")
				$("#count").text(data.COUNT)
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
				$("#attention").text(str)
				$("#message").text(data.VSR_CONTENTS)
			},
			error : function() {
			}
		})

		$("#modal-showMain").show();
		$("#phrInfo").show();

		$("#modal-close").on("click", function() {
			$("#modal-showMain").hide();
			
		});
	}
	
	function cancel() {
		var num = $("#number").val();
		if(confirm("선택한 예약을 취소하시겠습니까?") == true){
			location.href = '${contextPath}/sitter/cancelVsr?vsr_num='+num;
		} else{
			return false;
		}
	}

</script>
<style>

body{
   font-family: 'Noto Sans KR', sans-serif;
}
#calendar {
	max-width: 900px;
	margin: 30px auto;
	max-height: 100%;
}

.content{
	width: 900px;
	margin: 0 auto;
}

.vsrInfo{
	background-color: #fff;
	width: 500px;
	height: 500px;
	position: absolute;
	margin-top: -250px;
	margin-left: -250px;
	top: 50%;
	left: 50%;
}
textarea {
	width: 100%;
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: .3em;
	resize: none;
}
.table th, .table td{
	vertical-align: middle;
}

.purple{
	border: 1px solid rgba(0, 0, 120,0.6);
	background-color: rgba(0, 0, 120,0.6);
	border-radius: .125em;
	color: white;
	margin-right: 15px;
	padding-left: 5px;
	padding-right: 5px;
}

.red{
	border: 1px solid rgba(120, 0, 0,0.6);
	background-color:rgba(120, 0, 0,0.6);
	border-radius: .125em;
	color: white;
	margin-right: 15px;
	padding-left: 5px;
	padding-right: 5px;
}

/*
.fieldset{
	border: 1px solid #888;
	border-radius: .125em;
	margin: 20px auto;
	padding: 20px;
}

.fieldset legend{
	max-width: 400px;
	width: auto;
}*/

.col{
	text-align: center;
}


.my-btn{
	border: 1px solid #40bf9f;
	color: #40bf9f;
}




.my-btn:hover, .my-btn:focus{
	border: 1px solid #40bf9f;
	color: white;
	background-color: #40bf9f;
	cursor: pointer;
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
</style>
<title>mypage</title>
<!-- 마이페이지 시작 -->
</head>
<body class="container">
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
						<li><a href="${contextPath}/sitter/getVsrStatus0">신청 목록</a></li>
						<li><a href="${contextPath}/sitter/myReservationVs_Page">예약상황 보기</a></li>
						<li><a href="${contextPath}/member/goodByeCheckUser">회원탈퇴</a></li>
					</ul>
				</div>
			</div>

	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>
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
	<div class="container" style="margin-bottom: 80px">
		<h2>내 정보</h2>
		<hr>
		<p style="text-align: right;">
			<span class="red">정기예약</span>
			<span class="purple">일반예약</span>
		</p>
		<div id='calendar'></div>
		<div class="content"></div>
		<div></div>

	</div>


	

	<!-- ///////////////////////////////////////////////////////////////모달 -->
	<div class="container-fluid modal-modify" id="modal-showMain">
		<table class="vsrInfo table table-hover" id="vsrInfo">
			<tr style="height: 10px">
				<th>마리수</th>
				<td id="count"></td>
				<td >
					<input type="hidden" name="groupid" id="groupid" >
					<input type="hidden" name="number" id="number" >
				</td>
				<td><button class="close" id="modal-close" style="margin: 0">&times;</button></td>
			</tr>
			<tr>
				<th>고객이름</th>
				<td id="c_name"></td>
				<th >연락처</th>
				<td id="c_contact" ></td> 
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="3" id="c_address"></td>
			</tr>
			<tr>
				<th>체크인</th>
				<td id="chkin"></td>
				<th>체크아웃</th>
				<td id="chkout"></td>
			</tr>
			<tr>
				<th>선택사항</th>
				<td colspan="3" id="attention"></td>
			</tr>
			<tr>
				<td colspan="4">
				<textarea rows="5" cols="50" id="message">없음</textarea>
			</tr>
			<tr style="text-align: center;">
				<td colspan="4" style="text-align: center;">
					<a href="#" onclick="cancel()" class="btn my-btn cancel" id="cancel">취소</a>
				</td>
			</tr>

		</table>

	</div>
<!-- 	상담버튼 -->
	<div class="bottom-left alert" id="plusfriend-chat-button"></div>
</body>
</html>