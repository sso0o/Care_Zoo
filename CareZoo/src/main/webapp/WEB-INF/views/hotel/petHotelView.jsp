<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet" href="${contextPath}/resources/css/lightslider.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/datepicker.css' />
<link rel='stylesheet' type='text/css' href='${contextPath}/resources/css/homeSitter.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/slick/slick-theme.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/core/main.css' />
<link rel='stylesheet' href='${contextPath}/resources/fullcalendarScheduler/daygrid/main.css' />
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/core/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/interaction/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/daygrid/main.js'></script>
<script type="text/javascript" src='${contextPath}/resources/fullcalendarScheduler/lang/ko.js'></script>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/moment.js" type="text/javascript"></script>
<script type="text/javascript" src="${contextPath}/resources/js/index.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/lightslider.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="${contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js" type="text/javascript"></script>
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<script type="text/javascript">
	var imgCommonPreview = new Image();
	$(document).on(
			'ready',
			function() {

				$("#datepicker").datepicker({
					minDate : 0
				});
				var datepickerStart = $('.col-dates .pull-left').datepicker(
						{
							dateFormat : 'yy-mm-dd',
							minDate : 0,
							onSelect : function(selected) {
								datepickerEnd.datepicker('option', 'minDate',
										selected);

								if (datepickerEnd.prop('disabled')) {
									datepickerEnd.datepicker('setDate',
											selected);
								} else if (!datepickerEnd.val()) {
									setTimeout($.proxy(
											datepickerEnd.datepicker,
											datepickerEnd, 'show'), 50);
								}
							}
						});

				if (moment('yyyy-mm-dd').toDate() == null) {
					var datepickerEnd = $('.col-dates .pull-right').datepicker(
							{
								dateFormat : 'yy-mm-dd',
								minDate : moment('yy-mm-dd').toDate()
							});
				} else {
					var datepickerEnd = $('.col-dates .pull-right').datepicker(
							{
								dateFormat : 'yy-mm-dd',
								minDate : 0
							});
				}

				$(".lazy").slick({
					dots : true,
					lazyLoad : 'ondemand', // ondemand progressive anticipated
					infinite : true,
					centerMode : false,
					//          autoplay : true, //자동플레이 유무( false시 자동플레이 안됨)
					autoplaySpeed : 4000
				// 자동플레이 스피드
				});
			});

	function initialize() {

		var geocoder = new google.maps.Geocoder();

		var addr = '${petHotel.ph_address}';

		var lat = "";
		var lng = "";

		geocoder.geocode({
			'address' : addr
		},

		function(results, status) {

			if (results != "") {

				var location = results[0].geometry.location;

				lat = location.lat();
				lng = location.lng();

				var latlng = new google.maps.LatLng(lat, lng);
				var myOptions = {
					zoom : 15,
					center : latlng,
					mapTypeControl : true,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document
						.getElementById("map_canvas"), myOptions);
				var marker = new google.maps.Marker({
					position : latlng,
					map : map
				});

				marker.setMap(map);
			} else
				$("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
		})
	}

	$(function() {
		initialize();

		$("#content-slider").lightSlider({
			loop : true,
			keyPress : true
		});
		$('#image-gallery').lightSlider({
			isthumb : true,
			gallery : true,
			item : 1,
			thumbItem : 9,
			slideMargin : 0,
			speed : 500,
			auto : true,
			loop : true,
			onSliderLoad : function() {
				$('#image-gallery').removeClass('cS-hidden');
			}
		});
	})

	function logoutCheck() {
		if (confirm("정말 로그아웃?") == true) {
			location.href = '${contextPath}/logout'
		} else {
			return false;
		}
	}

	document.addEventListener('DOMContentLoaded', function() {
		var d = new Date();
		var num =
<%=session.getAttribute("c_num")%>
	var calendarEl = document.getElementById('calendar');
		var calHeight = 450;
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid', 'interaction' ],
			//		 			timeZone : "Asian/Seoul",
			locale : 'ko',
			height : calHeight,
			// 				    contentHeight:calHeight,
			allDayDefault : false,
			editable : false,
			defaultView : 'dayGridMonth',
			defaultDate : d,
			editable : false,
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

		//// uncomment this line to hide the all-day slot
		//allDaySlot: false,

		// 					select : function(arg) {
		// 						console.log(arg.startStr, arg.endStr,
		// 								arg.resource ? arg.resource.id : '(no resource)');
		// 					}
		// 					,
		// 					eventClick : function(info) {
		// 						var infocheck = info.event.groupId+'='+info.event.id
		// 						var chkoutTime = info.event.end

		// 						$("#type").val(info.event.groupId)
		// 						$("#number").val(info.event.id)

		// 						$("#reply-modal").show();

		// 						$("#modal-close").on("click", function() {
		// 							$("#reply-modal").hide();
		// 						});

		// 						$("#modal-review").on("click", function() {
		// 							if(d>chkoutTime){
		// 								if(info.event.groupId=="phr_num"){
		// 									location.href='${contextPath}/comment/phCommentForm?phr_num='+info.event.id
		// 								} else if(info.event.groupId=="hsr_num"){
		// 									location.href='${contextPath}/comment/hsCommentForm?hsr_num='+info.event.id
		// 								}else if(info.event.groupId=="vsr_num"){
		// 									location.href='${contextPath}/comment/vsCommentForm?vsr_num='+info.event.id
		// 								}
		// 							} else{
		// 								alert("조건을 갖추지 못하였습니다 :/")
		// 							}
		// 						});
		// 					}

		});

		// 				$.ajax({
		// 					url : "${contextPath}/member/myReservation",
		// 					data : {
		// 						c_num : num
		// 					},
		// 					dataType : "JSON",
		// 					success : function(data) {
		// 						for (var i = 0; i < data.vsrList.length; i++) {
		// 							var e = {
		// 								groupId : 'vsr_num',
		// 								id : data.vsrList[i].vsr_num,
		// 								start : data.vsrList[i].vsr_chkin,
		// 								end : data.vsrList[i].vsr_chkout,
		// 								title : '방문시터예약',
		// 								description : '이거슨 방문시터',
		// 								color : 'rgba(0, 0, 120, 0.6)'
		// 							}
		// 							calendar.addEvent(e)
		// 							calendar.render();
		// 						}

		// 						for (var i = 0; i < data.hsrList.length; i++) {
		// 							var e = {
		// 								groupId : 'hsr_num',
		// 								id : data.hsrList[i].hsr_num,
		// 								start : data.hsrList[i].hsr_chkin,
		// 								end : data.hsrList[i].hsr_chkout,
		// 								title : '가정시터 예약',
		// 								description : data.hsInfo[i].hs_name,
		// 								color : 'rgba(0, 120, 0, 0.6)'
		// 							}
		// 							calendar.addEvent(e)
		// 							calendar.render();
		// 						}

		// 						for (var i = 0; i < data.phrList.length; i++) {
		// 							var e = {
		// 								groupId : 'phr_num',
		// 								id : data.phrList[i].phr_num,
		// 								start : data.phrList[i].phr_chkin+'T13:00',
		// 								end : data.phrList[i].phr_chkout+'T11:00',
		// 								title : data.phInfo[i].ph_name,
		// 								description : data.pet[i].p_name,
		// 								color : 'rgba(200, 0, 0, 0.6)'
		// 							}
		// 							calendar.addEvent(e)
		// 							calendar.render();
		// 						}

		// 					},
		// 					error : function() {
		// 						alert("데이터를 불러오는데 실패했습니다.")
		// 					}
		// 				})
		// 		var iiii = {
		// 			start : '2019-09-26',
		// 			end: '2019-09-27',
		// 			description : 'test',
		// 			title: 'test'

		// 		}
		// 		calendar.addEvent(iiii);
		calendar.render();

	});
</script>
<style>
#map_canvas {
	width: 300px;
	height: 300px;
}

.pignose-calendar-unit-disabled a {
	color: red !important
}

footer {
	
}

.slider {
	width: 200px;
	margin: 50px auto;
}

.slick-slide {
	margin: 10px;
}

.slick-slide img {
	width: 80%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	margin-left: 0;
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}

.lazy slider slick-initialized slick-slider slick-dotted {
	margin-left: 0;
}

body {
	margin: 0;
}

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

.popper[x-placement^="top"] .popper__arrow, .tooltip[x-placement^="top"] .tooltip-arrow
	{
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

.tooltip[x-placement^="bottom"] .tooltip-arrow, .popper[x-placement^="bottom"] .popper__arrow
	{
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

.popper[x-placement^="right"] .popper__arrow, .tooltip[x-placement^="right"] .tooltip-arrow
	{
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

.popper[x-placement^="left"] .popper__arrow, .tooltip[x-placement^="left"] .tooltip-arrow
	{
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
	border: 1px solid #888;
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

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	text-align: right;
}

.review {
	color: #aaa;
	float: right;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.close:hover, .close:focus, .review:hover, .review:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

a.fc-more {
	font-size: 1px;
}

.fc-toolbar h2 {
	font-size: 20px;
	margin: 0;
}

td.fc-day.fc-past { /*지난 날 블러*/
	background-color: #EEEEEE;
}
</style>



<title>petHotelView</title>

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
				<li class='active sub'><a href='#'>SITTER</a>
					<ul>
						<li class='last'><a href='#'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>HOTEL</a>
					<ul>
						<li class='last'><a href='#'>애견동반호텔</a></li>
						<li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
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
	<div class="container">
		<div style="width: 700px; display: inline-block; float: left;">
			<div>

				<table>
					<tr>
						<td>${petHotel.ph_name}</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
				</table>
				<!--             <div style="width: 700px;"> -->
				<!--                <div class="lazy slider" -->
				<!--                   style="width: 700px; height: 600px; margin-left: 0;"> -->
				<%--                   <c:forEach items="${filesName}" var="fn"> --%>
				<!--                      <div> -->
				<%--                         <img src="${contextPath}/petHotel/image?fileName=${fn}" --%>
				<!--                            data-sizes="100vw" data-srcset="" -->
				<!--                            style="width: 680px; height: 580px;"> -->
				<!--                      </div> -->
				<%--                   </c:forEach> --%>
				<!--                </div> -->
				<!--             </div> -->
				<div style="width: 700px;">

					<div class="item">
						<div class="clearfix" style="max-width: 680px;">
							<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
								<c:forEach items="${filesName}" var="fn">
									<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 680px; height: 580px;" /></li>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>

				<table>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>가능한 펫 마리수:${petHotel.ph_p_count }
					</tr>
					<tr>
						<td><input type="hidden" id="sample4_postcode" placeholder="우편번호"> 주소:${petHotel.ph_address} <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> ${petHotel.ph_d_address }
					</tr>
					<tr>
						<td>
							<div>
								<div id="map_canvas"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td>
							<hr width=670px>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<c:forEach var="phComment" items="${phComment}">
						<tr>
							<td>${phComment.c_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${phComment.phc_star}</td>
						</tr>
						<tr>
							<td>${phComment.phc_comment}</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>${phComment.phc_write_date}</td>
						</tr>
						<!--             <p> -->
						<tr>
							<td>
								<hr width=670px>
							</td>
						</tr>
					</c:forEach>

				</table>
				<div class="demo"></div>
			</div>
			<div class="reservation">
				<div class="reserRequest"></div>
				<div class="calendar"></div>
			</div>
			<div class="show_map">
				<div id="map_canvas"></div>
			</div>
		</div>
		<br> <br> <br> <br>
		<div style="float: left;">
			<form action="${contextPath }/petHotel/petHotelResForm" method="post">
				<div class="col-dates" style="padding: 10px; font-size: 15px; width: 300px; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px; text-align: center;">

					<label>방:&nbsp; </label> <select name="roomSelect" class="rSelect">
						<option value="">필수선택</option>
						<c:forEach items="${petHotelRoomList}" var="phrl">
<%-- 							<li data-thumb="${contextPath}/petHotel/image?fileName=${fn}"><img src="${contextPath}/petHotel/image?fileName=${fn}" style="width: 680px; height: 580px;" /></li> --%>
								<option value="${phrl.phrm_name}">${phrl.phrm_name}</option>
						</c:forEach>
					</select> <br> <input type="hidden" name="ph_num" value="${petHotel.ph_num }"> <span style="font-size: 17px; text-align: center">예약기간을 정해주세요.</span> <br> <br> <input type="text" class="pull-left" placeholder="시작 날짜" readonly="readonly" name="phr_chkin" style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" /> <span>&gt;</span> <input type="text" class="pull-right" placeholder="마침 날짜" readonly="readonly" name="phr_chkout" style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" /> <br style="padding: 20px"> <br>
					<div style="">
						<label style="text-align: left">(1박 가격)</label><span>(kg선택)</span>
					</div>
					<hr>
					<span>(시작날짜 마침날짜 계산일)박</span><span>(가격)</span>
					<hr>
					<span>반려견 추가</span><span>(가격)</span>
					<hr>
					<span>총 합계:</span> <span>(총가격)</span> <br> <br> <input type="submit" value="예약하기">
				</div>
			</form>
			<br>
			<div style="padding: 10px; font-size: 15px; height: 1000px; width: 300px; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px; text-align: center;">
				<span style="font-size: 17px;">/캘린더 미리보기/</span> <br> <br>

				<div id='calendar'></div>
			</div>
		</div>
	</div>
	<div class="container">ㄴㅁㅇ</div>
</body>
</html>