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

<script type="text/javascript" src='${contextPath}/resources/js/moment.js'></script>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.min.js'></script>

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
	
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'interaction' ],
      defaultView: 'dayGridMonth',
      defaultDate: d,
      editable: true,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek'
      },
//       views: {
//         resourceTimeGridTwoDay: {
//           type: 'dayGridMonth',
//           duration: { days: 2 },
//           buttonText: '2 days',
//         }
//       },

      //// uncomment this line to hide the all-day slot
      //allDaySlot: false,

//       resources: [
//         { id: 'a', title: 'Room A' },
//         { id: 'b', title: 'Room B', eventColor: 'green' },
//         { id: 'c', title: 'Room C', eventColor: 'orange' },
//         { id: 'd', title: 'Room D', eventColor: 'red' }
//       ],
//       events: [
//         { id: '1', resourceId: 'a', start: '2019-08-06', end: '2019-08-08', title: 'event 1' },
//         { id: '2', resourceId: 'a', start: '2019-08-07', end: '2019-08-07', title: 'event 2' },
//         { id: '3', resourceId: 'b', start: '2019-08-07', end: '2019-08-08', title: 'event 3' },
//         { id: '4', resourceId: 'c', start: '2019-08-07', end: '2019-08-07', title: 'event 4' },
//         { id: '5', resourceId: 'd', start: '2019-08-07', end: '2019-08-07', title: 'event 5' }
//       ],

//       select: function(arg) {
//           console.log(
//             'select',
//             arg.startStr,
//             arg.endStr,
//             arg.resource ? arg.resource.id : '(no resource)'
//           );
//         },
//       dateClick: function(arg) {
//           console.log(
//             'dateClick',
//             arg.date,
//             arg.resource ? arg.resource.id : '(no resource)'
//           );
  
//         }
    
        
    });

    calendar.render();
  });

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
}
</style>
<title>mypage</title>
<!-- 마이페이지 시작 -->
</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg" class="anchor_logo"></a>

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
		<div>
			dydydydydy
		</div>
	</div>
	
</body>
</html>