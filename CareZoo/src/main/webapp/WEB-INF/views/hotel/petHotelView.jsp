<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/datepicker.css' />
<link rel='stylesheet' type='text/css'
	href='${contextPath}/resources/css/homeSitter.css' />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/slick/slick-theme.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/moment.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/datepicker-ko.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="${contextPath}/resources/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap"></script>

<script type="text/javascript">
	var imgCommonPreview = new Image();
	$(document).on('ready',function() {
			
		$("#datepicker").datepicker({
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			weekHeader : "주",
			dateFormat : 'yy-mm-dd',
			minDate : moment('yy-mm-dd').toDate()
		});

		$(".lazy").slick({
			dots : true,
			lazyLoad : 'ondemand', // ondemand progressive anticipated
			infinite : true,
			centerMode : false,
			// 			autoplay : true, //자동플레이 유무( false시 자동플레이 안됨)
			autoplaySpeed : 4000
			// 자동플레이 스피드
		});
	var datepickerStart = $('.col-dates .pull-left').datepicker({
		closeText : "닫기",
		prevText : "이전달",
		nextText : "다음달",
		currentText : "오늘",
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		dayNames : [ "일요일", "월요일", "화요일",
													"수요일", "목요일", "금요일", "토요일" ],
											dayNamesShort : [ "일", "월", "화",
													"수", "목", "금", "토" ],
											dayNamesMin : [ "일", "월", "화", "수",
													"목", "금", "토" ],
											weekHeader : "주",
											dateFormat : 'yy-mm-dd',
											minDate : moment('yy-mm-dd')
													.toDate(),
											onSelect : function(selected) {
												datepickerEnd.datepicker(
														'option', 'minDate',
														selected);

												if (datepickerEnd
														.prop('disabled')) {
													datepickerEnd
															.datepicker(
																	'setDate',
																	selected);
												} else if (!datepickerEnd.val()) {
													setTimeout(
															$
																	.proxy(
																			datepickerEnd.datepicker,
																			datepickerEnd,
																			'show'),
															50);
												}
											}
										});
						var datepickerEnd = $('.col-dates .pull-right')
								.datepicker(
										{
											closeText : "닫기",
											prevText : "이전달",
											nextText : "다음달",
											currentText : "오늘",
											monthNames : [ "1월", "2월", "3월",
													"4월", "5월", "6월", "7월",
													"8월", "9월", "10월", "11월",
													"12월" ],
											monthNamesShort : [ "1월", "2월",
													"3월", "4월", "5월", "6월",
													"7월", "8월", "9월", "10월",
													"11월", "12월" ],
											dayNames : [ "일요일", "월요일", "화요일",
													"수요일", "목요일", "금요일", "토요일" ],
											dayNamesShort : [ "일", "월", "화",
													"수", "목", "금", "토" ],
											dayNamesMin : [ "일", "월", "화", "수",
													"목", "금", "토" ],
											weekHeader : "주",
											dateFormat : 'yy-mm-dd',
											minDate : moment('yy-mm-dd')
													.toDate()
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
	})
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

.review {
	float: left;
	width: 50%;
	margin: auto 0;
}

.review .fieldview .subReview {
	display: inline-block;
	width: 45%;
	margin: auto 0;
	min-height: 400px;
	border: none;
}

.review .fieldview {
	border: 5px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	min-height: 200px;
}

.review .fieldview legend {
	background: #40bf9f;
	color: #fff;
	padding: 5px 10px;
	font-size: 20px;
	border-radius: 5px;
	box-shadow: 0 0 0 5px #ddd;
	margin-left: 20px;
}

.review.review .fieldview p {
	text-align: right;
	padding-right: 10px;
}

body {
	margin: 0;
}
</style>



<title>petHotelView</title>

</head>
<body>
	<div class="container">
		<header>
			<a href="#"><img src="${contextPath}/resources/img/logo.jpg"
				class="anchor_logo"></a> <br>
			<div class="header_Btn">
				<a class="btn_Login" href="${contextPath}/member/login">로그인</a> <a
					class="btn_Join" href="${contextPath}/member/join">회원가입</a>
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
				<li class='last'><a href='#' style="font-size: 17px">MY
						PAGE</a></li>
				<li class='last'><a href='#' style="font-size: 17px">Q&A</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div
			style="width: 700px; display: inline-block display:inline; float: left;">
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
				<div style="width: 700px;">
					<div class="lazy slider"
						style="width: 700px; height: 600px; margin-left: 0;">
						<c:forEach items="${filesName}" var="fn">
							<div>
								<img src="${contextPath}/petHotel/image?fileName=${fn}"
									data-sizes="100vw" data-srcset=""
									style="width: 680px; height: 580px;">
							</div>
						</c:forEach>
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
						<td><input type="hidden" id="sample4_postcode"
							placeholder="우편번호"> 주소:${petHotel.ph_address} <input
							type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							${petHotel.ph_d_address }
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
							<td>${phComment.c_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${phComment.phc_star}</td>
						</tr>
						<tr>
							<td>${phComment.phc_comment}</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td>${phComment.phc_write_date}</td>
						</tr>
						<!-- 				<p> -->
						<tr>
							<td>
								<hr width=670px>
							</td>
						</tr>
					</c:forEach>
				</table>
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
				<div class="col-dates"
					style="padding: 10px; font-size: 15px; width: 300px; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px; text-align: center;">
					<span style="font-size: 17px; text-align: center">예약기간을
						정해주세요.</span> <br> <br> <input type="text" class="pull-left"
						placeholder="시작 날짜" readonly="readonly" name="hsl_chkin"
						style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" />
					<span>&gt;</span> <input type="text" class="pull-right"
						placeholder="마침 날짜" readonly="readonly" name="hsl_chkout"
						style="width: 115px; color: #666666; text-align: center; border-radius: 4px; font-size: 15px;" />

					<br style="padding: 20px"> <br>
					<div style="">
						<label style="text-align: left">(1박 가격)</label><span>(kg선택)</span>
					</div>
					<hr>
					<span>(시작날짜 마침날짜 계산일)박</span><span>(가격)</span>
					<hr>
					<span>반려견 추가</span><span>(가격)</span>
					<hr>
					<span>총 합계:</span> <span>(총가격)</span>
					<br>
					<br>
					<input type="submit" value="예약하기">
				</div>
			</form>
			<br>
			<div
				style="padding: 10px; font-size: 15px; width: 300px; border: 1px solid darkgray; margin-left: 30px; border-radius: 4px; text-align: center;">
				<span style="font-size: 17px;">/캘린더 미리보기/</span> <br>
				<br>
				<div id="datepicker" class="calendar2"
					style="border-collapse: none; width: 50px; color: red"></div>

			</div>
		</div>
	</div>

</body>
</html>