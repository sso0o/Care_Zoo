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


			},
			eventClick : function(info) {
				var infocheck = info.event.groupId+'='+info.event.id
				var chkoutTime = info.event.end
				eee = info.event.end;
				$("#groupid").val(info.event.groupId)
				$("#number").val(info.event.id)
				
				modalOpen();
			}

		});

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
						description : '이거슨 방문시터',
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
						description : data.phrList[i].P_NAME,
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
								location.href='${contextPath}/comment/phCommentForm?phr_num='+$("#number").val();
							} else if($("#groupid").val()=="hsr_num"){
								location.href='${contextPath}/comment/hsCommentForm?hsr_num='+$("#number").val();
							}else if($("#groupid").val()=="vsr_num"){
								location.href='${contextPath}/comment/vsCommentForm?vsr_num='+$("#number").val();
							}		
						} else{
							alert("이미 후기를 작성하셨습니다 :)")
						}
					},error: function() {
						alert("오류");
					}
				})
			
			} else{
				alert("조건을 갖추지 못하였습니다 :/")
			}
		});

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
		} else if($("#groupid").val()=="c_num"){
			urll = "getModalC";
		}
		console.log(urll)
		
		$.ajax({
			url: "${contextPath}/member/"+urll ,
			data:{
				num: $("#number").val()
			},
			dataTpe:"JSON",
			success: function(data) {
				console.log(data)				
				$("#modal-name").val(data.name);
				$("#modal-contact").val(data.contact);
				if(data.star != null){
					$("#starTr").show();
					$("#modal-star").val(data.star+"점");
				} else{
					$("#starTr").hide();
					$("#reviewTr").hide();
				}
				rstnum = data.number;
				if(data.fileName != null){
					$("#modal-img").attr("src","${contextPath}/comment/image?fileName="+data.filename)
				} else{
					$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg")
				}
				var rststar = parseInt(data.star /0.5) 
				console.log(rststar)
				$("#star"+rststar).addClass('on').prevAll('span').addClass('on');
				
				if(data.address != null){
					$("#addressTr").show();
					document.getElementById("modal-address").innerHTML=(data.address);
				} else{
					$("#addressTr").hide();
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
				
			},error: function() {
	
			}
		})
		
		$("#reply-modal").show();

		$("#modal-close").on("click", function() {
			$("#reply-modal").hide();
			$("#starRev").children('span').removeClass('on');
			$("#modal-name").val("");
			$("#modal-contact").val("");
			$("#modal-star").val("");
			$("#modal-img").attr("src","${contextPath}/resources/img/aa.jpg");
			document.getElementById("modal-address").innerHTML=("");
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
					</ul>
				</div>
			</div>

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
	<div class="container-fluid modal-modify" id="modal-showMain">
		<div id="hsrInfo" class="hsrInfo noshow">
			<table class="table table-hover">
				<tr>
					<td>
						<input type="hidden" id="groupid" name="groupid">
					</td>
					<td>
						<input type="hidden" id="number" name="number">
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
					<td colspan="2" class="starTr" id="starTr">
						<span id="starRev" class="starRev"> 
							<span class="starR1" id="star1" title="0.5">별1_왼쪽</span> 
							<span class="starR2" id="star2" title="1">별1_오른쪽</span> 
							<span class="starR1" id="star3" title="1.5">별2_왼쪽</span> 
							<span class="starR2" id="star4" title="2">별2_오른쪽</span> 
							<span class="starR1" id="star5" title="2.5">별3_왼쪽</span> 
							<span class="starR2" id="star6" title="3">별3_오른쪽</span> 
							<span class="starR1" id="star7" title="3.5">별4_왼쪽</span> 
							<span class="starR2" id="star8" title="4">별4_오른쪽</span> 
							<span class="starR1" id="star9" title="4.5">별5_왼쪽</span> 
							<span class="starR2" id="star10" title="5">별5_오른쪽</span>
						</span>
					</td>
					<th>총가격</th>
					<td id="hs_total"></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="#" onclick="payMent()" class="btn acc-btn" id="cancel">결제</a>
					</td>
					<td colspan="2">
						<a href="#" onclick="review()" class="btn acc-btn" id="accept">후기</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="vsrInfo" class="vsrInfo">
			<table class="table table-hover"></table>
		</div>
		<div id="phrInfo" class="phrInfo">
			<table class="table table-hover"></table>
		</div>
		
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
			<tr >
				<td style="padding-left: 15px; width: 170px;">
					<span id="starRev" class="starRev"> <span class="starR1" id="star1" title="0.5">별1_왼쪽</span> <span class="starR2" id="star2" title="1">별1_오른쪽</span> <span class="starR1" id="star3" title="1.5">별2_왼쪽</span> <span class="starR2" id="star4" title="2">별2_오른쪽</span> <span class="starR1" id="star5" title="2.5">별3_왼쪽</span> <span class="starR2" id="star6" title="3">별3_오른쪽</span> <span class="starR1" id="star7" title="3.5">별4_왼쪽</span> <span class="starR2" id="star8" title="4">별4_오른쪽</span> <span class="starR1" id="star9" title="4.5">별5_왼쪽</span> <span class="starR2" id="star10" title="5">별5_오른쪽</span>
					</span>
				</td>
				<td>
					<input type="text" class="modal-content star" name="modal-contact" id="modal-star" value="" style="display: inline-block; text-align: left;">

				</td>
			</tr>
			<tr class="addressTr" id="addressTr">
				<td colspan="3">
					<p class="modal-content address" id="modal-address"></p>
				</td>
			</tr>
			<tr id="reviewTr">
				<td colspan="3" style="text-align: center">
					<span class="review" id="modal-review">후기등록</span>
			</tr>
		</table>

	</div>

</body>
</html>