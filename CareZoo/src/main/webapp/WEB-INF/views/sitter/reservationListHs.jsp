<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel='stylesheet' href='${contextPath}/resources/css/resListVs_modal.css' />

<link rel='stylesheet' href='${contextPath}/resources/css/sideMenu.css' />

<!-- 선택요소 -->
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>

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
		if("${msg}" != ""){
			alert("${msg}");
		}
	
		console.log("aa : ${rst1}")		
	})
	
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
				console.log(arg.startStr, arg.endStr, arg.resource ? arg.resource.id : '(no resource)');
// 				document.getElementById("p1").innerHTML=arg.startStr ;
				myResList(arg.startStr);

			},
			eventClick : function(info) {
				var infocheck = info.event.groupId+'='+info.event.id
				var chkoutTime = info.event.end
				eee = info.event.end;
// 				$("#groupid").val(info.event.groupId)
// 				$("#number").val(info.event.id)
				
				modalOpen(info.event.id);
			}

		});
		
		

	});
	
	
	function modalOpen(obj) {	
		var num = $(obj).attr('title');
		
		console.log("hsr_num : "+num)
		
		$.ajax({
			url:"${contextPath}/sitter/getHSRInfo",
			data:{
				hsr_num:num
			},
			dataType:"JSON",
			success: function(data) {
				console.log(data)
				$("#chkin").text(data.HSR_CHKIN+ " "+data.HSR_DROPOFF_TIME );
				$("#chkout").text(data.HSR_CHKOUT+" "+data.HSR_DROPOFF_TIME);
				$("#attention").text(data.HSR_MESSAGE);									
				$("#name").text(data.C_NAME);
				$("#contact").text(data.C_CONTACT);
				$("#total").text(data.HSR_TOTALPRICE+"원");
				
				
			},
			error: function() {
				alert("error")
			}
		})

		$("#modal-showHsr").show();

		
		$(".close").on("click", function() {
			$("#modal-showHsr").hide();
			$("#chkin").text("");
			$("#chkout").text("");
			$("#attention").text("");								
			$("#name").text("");
			$("#contact").text("");
			$("#total").text("");

		});
		
	}//modalOpen()
	
	function booking() {
		var num = $("#hsr_num").val()
		console.log("booking -> "+num)
		if(confirm("신청된 예약을 수락하시겠습니까?") ==  true){
			location.href = '${contextPath}/sitter/acceptHsr?hsr_num='+num;
			
		} else{
			return false;
		}
	}
	

	// $(document).ready(function() { //문서가 로딩되면 실행할 함수 $(function(){ })  이랑 같음 둘중에 하나만!
	
	// })
	
	// 기본적으로 세션에 저장된 정보
	var user_numtype = "<%=session.getAttribute("user_numtype")%>"
	var user_num = "<%=session.getAttribute("user_num")%>"
	var user_name = "<%=session.getAttribute("user_name")%>"
	



</script>
<style type="text/css">
.content {
	width: 900px;
	margin: 20px auto;
}

.noshow {
	display: none;
}

.item {
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: .2em;
	height: 30px;
}

.cl {
	line-height: 1.5em;
}

.tt {
	font-size: 11px;
}

.col, .col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8,
	.col-9, .col-10, .col-11, .col-12 {
	text-align: center;
}

.hsrInfo {
	background-color: #fff;
	width: 500px;
	height: 360px;
	position: absolute;
	margin-top: -180px;
	margin-left: -250px;
	top: 50%;
	left: 50%;
}

textarea {
	width: 100%;
	border: none;
	resize: none;
}

.acc-btn{
	border: 1px solid #40bf9f;
	color: #40bf9f;
	border-radius: .125em;
}

.acc-btn:hover,.acc-btn:focus  {
	background-color: #40bf9f;
	color: #fff;
	cursor: pointer;
}

#calendar {
	max-width: 900px;
	margin: 30px auto;
	max-height: 100%;
}


</style>


<title>나에게 신청된 예약</title>
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
						<li><a href="${contextPath}/sitter/getHsrStatus0">나에게 신청된 예약</a></li>
						<li><a href="${contextPath}/sitter/myReservationHs_Page">예약상황 보기</a></li>
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

<br><br><br>
<div class="container">
<!-- 		여기다 내용을 작성하시면 됩니다 -->
<div class="content">
	<h2>수락 대기중인 예약 목록</h2>
	<hr>
	<div id='calendar'></div>
	<!--
	<table class="table table-hover">
	<thead>
		<tr>
	        <th>시작일</th>
	        <th>종료일</th>
	        <th>체크인</th>
	        <th>체크아웃</th>
	        <th>마리수</th>
	        <th>총가격</th>
	        <th>정보</th>
        </tr>
	</thead>
	<tbody>
		<c:forEach items="${rst1 }" var="hsr">
			<tr>
				<td>${hsr.HSR_CHKIN }</td>
				<td>${hsr.HSR_CHKOUT }</td>
				<td>${hsr.HSR_PICKUP_TIME }</td>
				<td>${hsr.HSR_DROPOFF_TIME }</td>
				<td>${hsr.HSR_NUMOF_PET }</td>
				<td>${hsr.HSR_TOTALPRICE }</td>
				<td onclick="modalOpen(this)" title="${hsr.HSR_NUM }">보기</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	  -->
	
</div>
		
</div>
	<!-- ///////////////////////////////////////////////////////////////모달 -->
<div class="container-fluid modal-modify" id="modal-showHsr">
	<div id="hsrInfo" class="hsrInfo">
		<table class="table table-hover">
			<tr>
				<td colspan="2"><input type="hidden" id="hsr_num" name="hsr_num"></td>
				<td colspan="2" style="text-align: right;"><button type="button" class="close">&times;</button></td>
			</tr>
			<tr>
				<th>이름</th>
				<td id="name"></td>
				<th>연락처</th>
				<td id="contact"></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td id="chkin"></td>
				<th>종료일</th>
				<td id="chkout"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea rows="5" cols="50" id="message"></textarea>
			</tr>
			<tr>
				<th>총가격</th>
				<td id="total"></td>
				<td colspan="2" style="text-align: right;"><a href="#" onclick="booking()" class="btn acc-btn" id="accept">수락</a></td>
			</tr>
		</table>



	</div>
</div>
</body>
</html>