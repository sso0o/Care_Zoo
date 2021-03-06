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
		console.log("numtype : "+user_numtype)
		console.log("name : "+user_name)
		console.log("num : "+user_num)
		
		if("${msg}" != ""){
			alert("${msg}");
		}
		
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
	})//문서가 로딩되면 실행할 함수
	

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

		// 캘린더에 내 예약 추가(홈시터)
		$.ajax({
			url : "${contextPath}/sitter/myReservationHS",
			data : {
				hs_num : num
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data)
				for(var i = 0; i<data.hsrList.length; i++){
					var e = {
						groupId : 'c_num',
						id : data.hsrList[i].C_NUM,
						start : data.hsrList[i].HSR_CHKIN+ "T"+data.hsrList[i].HSR_PICKUP_TIME,
						end : data.hsrList[i].HSR_CHKOUT+ "T"+data.hsrList[i].HSR_DROPOFF_TIME,
						title : data.hsrList[i].C_NAME+' 보호자',
						description : data.hsrList[i].HSR_STATUS,
						color : 'rgba(0, 0, 120, 0.6)',
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
		
		calendar.render();

	});
	
	//홈시터는 고객의 정보 가져오게
	function modalOpen(num) {
		console.log($("#groupid").val()+"=="+$("#number").val())
		var urll = "getModalC";
		console.log(urll)
		$.ajax({
			url: "${contextPath}/comment/"+urll ,
			data:{
				num: num
			},
			dataTpe:"JSON",
			success: function(data) {
				console.log(data)				
				$("#modal-name").val(data.name);
				$("#modal-contact").val(data.contact);


			},error: function() {
	
			}
		})
		
		$("#reply-modal").show();

		//모달창 닫기 전에 데이터 초기화
		$("#modal-close").on("click", function() {
			$("#reply-modal").hide();

			$("#modal-name").val("");
			$("#modal-contact").val("");

		});
	}
	
	//예약리스트 가져오기
	function myResList(checkDate) {
		console.log("function : "+checkDate);
		console.log("function : "+user_numtype);
		var showDiv = $("#showDiv");
		$("#legend").text(checkDate);

		showDiv.children("p").remove();
		$.ajax({
			url : "",
			data: {
				num:user_num,
			},
			dataType: "JSON",
			success: function(data) {
			console.log(data);				
				
			},
			error: function() {
				
			}
		})
		
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
						<li><a href="${contextPath}/home/write">게시글 관리</a></li>
						<li><a href="${contextPath}/sitter/getHsrStatus0">예약현황 보기</a></li>
						<li><a href="${contextPath}/sitter/goodByeCheckUser">회원탈퇴</a></li>
					</ul>
				</div>
			</div>

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
                        <li class='last'><a href='${contextPath}/home/main'>가정펫시터</a></li>
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

	<div class="container">
		<h2>내 정보</h2>
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
	<div class="modal-modify" id="reply-modal">
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
					<img id="modal-img" class="modal-img" src="${contextPath}/resources/img/aa.jpg" style="width: 150px; height: 180px; vertical-align: middle; margin-left: 15px;">
				</td>
				<td colspan="2">
					<a id="atag"><input type="text" class="modal-content name" name="modal-name" id="modal-name" value="" readonly="readonly"></a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" class="modal-content contact" name="modal-contact" id="modal-contact" value="" readonly="readonly">
				</td>
			</tr>
			<tr class="addressTr" id="addressTr">
				<td colspan="3">
					<p class="modal-content address" id="modal-address"></p>
				</td>
			</tr>
		</table>

	</div>
	<div class="bottom-left alert" id="plusfriend-chat-button"></div>
</body>
</html>