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
				if(data.vsrList != null){
					for (var i = 0; i < data.vsrList.length; i++) {
						var e = {
							groupId : 'vsr_num',
							id : data.vsrList[i].vsr_num,
							start : data.vsrList[i].vsr_chkin,
							end : data.vsrList[i].vsr_chkout,
							title : '방문시터예약',
							description : '이거슨 방문시터',
							color : 'rgba(0, 0, 120, 0.6)',
							textColor: "white"
						}
						calendar.addEvent(e)
						calendar.render();
					}
				
				}
				if(data.hsrList != null){
					for (var i = 0; i < data.hsrList.length; i++) {
						var e = {
							groupId : 'hsr_num',
							id : data.hsrList[i].hsr_num,
							start : data.hsrList[i].hsr_chkin,
							end : data.hsrList[i].hsr_chkout,
							title : '가정시터 예약',
							description : data.hsInfo[i].hs_name,
							color : 'rgba(0, 120, 0, 0.6)',
							textColor: "white"
						}
						calendar.addEvent(e)
						calendar.render();
					}
				}
				
				if(data.phrList != null){
					for (var i = 0; i < data.phrList.length; i++) {
						var e = {
							groupId : 'phr_num',
							id : data.phrList[i].phr_num,
							start : data.phrList[i].phr_chkin+'T13:00',
							end : data.phrList[i].phr_chkout+'T11:00',
							title : data.phInfo[i].ph_name,
							description : data.pet[i].p_name,
							color : 'rgba(200, 0, 0, 0.6)',
							textColor: "white"
						}
						calendar.addEvent(e)
						calendar.render();
					}
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
	
		var iiii = {
				start : '2019-09-17',
				end: '2019-09-17',
				description : 'test',
				title: 'test',
				textColor: "white"
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
		} else if($("#groupid").val()=="c_num"){
			urll = "getModalC";
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
	
	function myResList(checkDate) {
		console.log("function : "+checkDate);
		console.log("function : "+user_numtype);
		var showDiv = $("#showDiv");
		$("#legend").text(checkDate);

		showDiv.children("p").remove();
		$.ajax({
			url : "${contextPath}/member/myReservationCustomer",
			data: {
				c_num:user_num,
			},
			dataType: "JSON",
			success: function(data) {
			console.log(data);
				if(data.vsrList != null){
					for (var i = 0; i < data.vsrList.length; i++) {
						if(data.vsrList[i].vsr_chkin<=checkDate && checkDate <=data.vsrList[i].vsr_chkout){
							var pTag = "<p>"+data.vsInfo[i].vs_name+"  "+data.vsInfo.vs_contact+" "+data.vsrList.vsr_status+"</p>";
							showDiv.append(pTag);	
						}	
					}
				}
				
				if(data.hsrList != null){
					for (var i = 0; i < data.hsrList.length; i++) {
						if(data.hsrList[i].hsr_chkin<=checkDate && checkDate <=data.hsrList[i].hsr_chkout){
							var pTag = "<p>"+data.hsInfo[i].hs_name+"  "+data.hsInfo.hs_contact+" "+data.hsrList.hsr_status+"</p>";
							showDiv.append(pTag);
						}
					}
				}
				
				if(data.phrList != null){
					for (var i = 0; i < data.phrList.length; i++) {
						if(data.phrList[i].phr_chkin <= checkDate && checkDate <= data.phrList[i].phr_chkout){
							var pTag1 = "<p class='col'>"+data.phInfo[i].ph_name+"</p>";
							var pTag2 = "<p class='col'>"+data.phInfo[i].ph_contact+"</p>";
							showDiv.append(pTag1);
							showDiv.append(pTag2);
							var pTag3;
							switch (data.phrList[i].phr_status){
							case '0': pTag3 = "<p class='col'>예약 신청</p>";
									break;
							case '1': pTag3 = "<p class='col'>예약 거절</p>";
									break;
							case '2': pTag3 = "<p class='col'>결제 대기</p>";
									 var pTag4 = "<p class='col'><a id='payMent' class='btn my-btn'>결제 하기</a></p>";
									 showDiv.append(pTag3);
									 showDiv.append(pTag4);
									break;
							case '3': pTag3 = "<p class='col'>결제 완료</p>";
									break;
							case '4': pTag3 = "<p class='col'>사용 완료</p>";
									break;
									
							default: pTag3 = "<p class='col'></p>";
									break;
							}
							
							
						}
					}
				}

			},
			error: function() {
				
			}
		})
		
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
				<legend style="text-align: center;" id="legend">여기에 선택한 날짜의 예약이 나옴</legend>
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
			<tr class="starTr" id="starTr">
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