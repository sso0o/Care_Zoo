<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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

<style>

/*
  i wish this required CSS was better documented :(
  https://github.com/FezVrasta/popper.js/issues/674
  derived from this CSS on this page: https://popper.js.org/tooltip-examples.html
  */
.popper, .tooltip {
	position: absolute;
	z-index: 9999;
	background: #e1e1e1;
	color: black;
	width: 150px;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
	padding: 10px;
	text-align: center;
}

.style5 .tooltip {
	background: #1E252B;
	color: #FFFFFF;
	max-width: 200px;
	width: auto;
	font-size: .8rem;
	padding: .5em 1em;
}

.popper .popper__arrow, .tooltip .tooltip-arrow {
	width: 0;
	height: 0;
	border-style: solid;
	position: absolute;
	margin: 5px;
}

.tooltip .tooltip-arrow, .popper .popper__arrow {
	border-color: #e1e1e1;
}

.style5 .tooltip .tooltip-arrow {
	border-color: #050f0c;
}

.popper[x-placement^="top"], .tooltip[x-placement^="top"] {
	margin-bottom: 5px;
}

.popper[x-placement^="top"] .popper__arrow, .tooltip[x-placement^="top"] .tooltip-arrow {
	border-width: 5px 5px 0 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	bottom: -5px;
	left: calc(50% - 5px);
	margin-top: 0;
	margin-bottom: 0;
}

.popper[x-placement^="bottom"], .tooltip[x-placement^="bottom"] {
	margin-top: 5px;
}

.tooltip[x-placement^="bottom"] .tooltip-arrow, .popper[x-placement^="bottom"] .popper__arrow {
	border-width: 0 5px 5px 5px;
	border-left-color: transparent;
	border-right-color: transparent;
	border-top-color: transparent;
	top: -5px;
	left: calc(50% - 5px);
	margin-top: 0;
	margin-bottom: 0;
}

.tooltip[x-placement^="right"], .popper[x-placement^="right"] {
	margin-left: 5px;
}

.popper[x-placement^="right"] .popper__arrow, .tooltip[x-placement^="right"] .tooltip-arrow {
	border-width: 5px 5px 5px 0;
	border-left-color: transparent;
	border-top-color: transparent;
	border-bottom-color: transparent;
	left: -5px;
	top: calc(50% - 5px);
	margin-left: 0;
	margin-right: 0;
}

.popper[x-placement^="left"], .tooltip[x-placement^="left"] {
	margin-right: 5px;
}

.popper[x-placement^="left"] .popper__arrow, .tooltip[x-placement^="left"] .tooltip-arrow {
	border-width: 5px 0 5px 5px;
	border-top-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	right: -5px;
	top: calc(50% - 5px);
	margin-left: 0;
	margin-right: 0;
}

/* 	===========================================모달 */
.modal-modify {
	overflow: hidden;
	z-index: 999;
	display: none;
	left: 0;
	top: 0;
	position: fixed;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-table {
	background-color: #fefefe;
	padding-top: 5px;
	padding-left: 40px;
	padding-right: 20px;
	padding-bottom: 10px; 
	border : 1px solid #888;
	width: 550px; /* Could be more or less, depending on screen size */
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -150px;
	margin-left: -275px;
	border: 1px solid #888;
}

.modal-table th {
	background-color: #7858a7;
}

.modal-content {
 	border: none; 
	font-size: 20px;
	line-height:2.5em;
	width: 95%;	
	margin-left: 10px;
	text-align: center;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	text-align: right;
}

.review{
	color: #aaa;
	float: right;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.close:hover, .close:focus,
.review:hover, .review:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>

<script>
	
	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	document.addEventListener('DOMContentLoaded', function() {
		var d = new Date();
		var num = <%=session.getAttribute("c_num")%>
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
				console.log(arg.startStr, arg.endStr,
						arg.resource ? arg.resource.id : '(no resource)');
			}
			,
			eventClick : function(info) {
				var infocheck = info.event.groupId+'='+info.event.id
				var chkoutTime = info.event.end
				eee = info.event.end;
				$("#groupid").val(info.event.groupId)
				$("#number").val(info.event.id)
				
				modalOpen();

			}

		});
		
		// 캘린더에 내 예약 추가
		$.ajax({
			url : "${contextPath}/member/myReservation",
			data : {
				c_num : num
			},
			dataType : "JSON",
			success : function(data) {
				for (var i = 0; i < data.vsrList.length; i++) {
					var e = {
						groupId : 'vsr_num',
						id : data.vsrList[i].vsr_num,
						start : data.vsrList[i].vsr_chkin,
						end : data.vsrList[i].vsr_chkout,
						title : '방문시터예약',
						description : '이거슨 방문시터',
						color : 'rgba(0, 0, 120, 0.6)'
					}
					calendar.addEvent(e)
					calendar.render();
				}

				for (var i = 0; i < data.hsrList.length; i++) {
					var e = {
						groupId : 'hsr_num',
						id : data.hsrList[i].hsr_num,
						start : data.hsrList[i].hsr_chkin,
						end : data.hsrList[i].hsr_chkout,
						title : '가정시터 예약',
						description : data.hsInfo[i].hs_name,
						color : 'rgba(0, 120, 0, 0.6)'
					}
					calendar.addEvent(e)
					calendar.render();
				}

				for (var i = 0; i < data.phrList.length; i++) {
					var e = {
						groupId : 'phr_num',
						id : data.phrList[i].phr_num,
						start : data.phrList[i].phr_chkin+'T13:00',
						end : data.phrList[i].phr_chkout+'T11:00',
						title : data.phInfo[i].ph_name,
						description : data.pet[i].p_name,
						color : 'rgba(200, 0, 0, 0.6)'
					}
					calendar.addEvent(e)
					calendar.render();
				}

			},
			error : function() {
				alert("데이터를 불러오는데 실패했습니다.")
			}
		})
		
		
		// 후기등록 버튼 눌렀을때 실행할 함수
		$("#modal-review").on("click", function() {
			if(d>eee){
				$.ajax({
					url:"${contextPath}/comment/commentchk" ,
					data:{
						groupId : $("#groupid").val(),
						id : $("#number").val()
					},
					dataType : "JSON",
					success: function(data) {
						if(data){
							if($("#groupid").val()=="phr_num"){
								location.href='${contextPath}/comment/phCommentForm?phr_num='+info.event.id
							} else if($("#groupid").val()=="hsr_num"){
								location.href='${contextPath}/comment/hsCommentForm?hsr_num='+info.event.id
							}else if($("#groupid").val()=="vsr_num"){
								location.href='${contextPath}/comment/vsCommentForm?vsr_num='+info.event.id
							}		
						} else{
							alert("이미 후기를 작성하셨습니다 :)")
						}
					
					},
					error: function() {
					
					}
				})
			
			} else{
				alert("조건을 갖추지 못하였습니다 :/")
			}
		});
		
		var iiii = {
			start : '2019-09-17',
			end: '2019-09-17',
			description : 'test',
			title: 'test'
			
		}
		calendar.addEvent(iiii);

		calendar.render();
		
		

	});
	
	function modalOpen() {
		
		console.log($("#groupid").val()+"=="+$("#number").val())
		var urll = "";
		if($("#groupid").val()=="phr_num"){
			urll = "getModalPH";
		} else if($("#groupid").val()=="hsr_num"){
			urll = "getModalHS";
		}else if($("#groupid").val()=="vsr_num"){
			urll = "getModalVS";
		}
		console.log(urll)
		
		$.ajax({
			url: "${contextPath}/comment/"+urll ,
			data:{
				num: $("#number").val()
			},
			dataTpe:"JSON",
			success: function(data) {
				console.log(data)				
				$("#modal-name").val(data.name);
				$("#modal-contact").val(data.contact);
				$("#modal-star").val(data.star);
				rstnum = data.number;
				if(data.fileName != null){
					$("#modal-img").attr("src","c:\temp"+data.fileName)
				} else{
					$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg")
				}
				
				$("#atag").on('click', function() {
					if($("#groupid").val()=="phr_num"){
						$("#atag").attr('href',"${contextPath}/petHotel/petHotelView?ph_num="+rstnum)
					} else if($("#groupid").val()=="hsr_num"){
						////여기 채우기ㅣㅣㅣ**********************************************
					}else if($("#groupid").val()=="vsr_num"){
						////여기 채우기ㅣㅣㅣ**********************************************
					}
				})
				
			},
			error: function() {
				
			}
			
		})
		
		$("#reply-modal").show();

		$("#modal-close").on("click", function() {
			$("#reply-modal").hide();
		});
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
	margin: 50px auto;
	max-height: 700px;
}
</style>
<title>mypage</title>
<!-- 마이페이지 시작 -->
</head>
<body>
	<div class="container">
		<header>
			<a href="${contextPath}"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
				<li class='active sub'><a href='#'>REVIEW</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>시터</a></li>
						<li class='last'><a href='#'>호텔</a></li>
					</ul></li>
				<li class='last'><a href='#' style="font-size: 17px">MY PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<div id='calendar'></div>
		<div>dydydydydy</div>
	</div>

	<!-- ///////////////////////////////////////////////////////////////모달 -->
	<div class="modal-modify" id="reply-modal">
		<!-- css 적용 하기 위한 경우 class -->



		<!-- 스크립트 요소를 직접 조작해야 하는경우 id -->
		<table class="modal-table" id="modal-table">
			<tr height="10px">
				<td>
					<input type="hidden" name="groupid" id="groupid">
				</td>
				<td>
					<input type="hidden" name="number" id="number">
				</td>
				<td class="close" id="modal-close">&times;</td>

			</tr>
			<tr>
				<td rowspan="3" style="width: 150px">
					<img id="modal-img" class="modal-img" src="${contextPath}/resources/img/aa.jpg" style="width: 150px; height: 150px; vertical-align: middle;">
				</td>
				<td>
					<a id="atag"><input type="text" class="modal-content" name="modal-name" id="modal-name" value=""></a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="modal-content" name="modal-contact" id="modal-contact" value="">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="modal-content" name="modal-contact" id="modal-star" value="">
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center"><span class="review" id="modal-review">후기등록</span>
			</tr>
		</table>

	</div>



</body>
</html>