<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/slick/slick-theme.css">

<style>
#map_canvas {
	width: 300px;
	height: 300px;
}

nav {
	
}

footer {
	border-top: 1px solid;
	text-align: center;
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
</style>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap">
	
</script>

<script type="text/javascript">
	//구글맵 v3
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



<meta charset="UTF-8">
<title>petHotelView</title>
<!-- 애견호텔 상세보기 -->

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>
<script type="text/javascript">
	var imgCommonPreview = new Image();
	$(document).on('ready', function() {
		$(".lazy").slick({
			dots : true,
			lazyLoad : 'ondemand', // ondemand progressive anticipated
			infinite : true,
			centerMode : false,
			// 			autoplay : true, //자동플레이 유무( false시 자동플레이 안됨)
			autoplaySpeed : 4000
		// 자동플레이 스피드
		});
	});
</script>

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
				<li class='active sub'><a href='#'>시터</a>
					<ul>
						<li class='last'><a href='#'>가정펫시터</a> <!-- 
                     <ul>
                        <li><a href='#'>HTML Basic</a></li>
                        <li class='last'><a href='#'>HTML Advanced</a></li>
                     </ul>
                      --></li>
						<li class='last'><a href='${contextPath}/visit/main'>방문펫시터</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>호텔</a>
					<ul>
						<li class='last'><a href='#'>애견동반호텔</a></li>
						<li class='last'><a href='#'>애견호텔(보호자비동반)</a></li>
					</ul></li>
				<li class='active sub'><a href='#'>후기</a>
					<ul>
						<!--                   <li class='sub'><a href='#'>시터</a></li> 하위메뉴 생기게 하는방법-->
						<li class='last'><a href='#'>시터</a></li>
						<li class='last'><a href='#'>호텔</a></li>
					</ul></li>
				<li class='last'><a href='#' style="font-size: 17px">마이페이지</a></li>
				<li class='last'><a href='#' style="font-size: 17px">고객센터</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>








	<div class="container">
		<div style="width:770px">
			<div>
				<br>
				<br>
				<table>
					<tr>
						<td>${petHotel.ph_name}</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td><hr width=750px></td>
					</tr>
				</table>
				<!-- 					<td><img width="400px" height="400px" -->
				<%-- 						src="${contextPath}/petHotel/image?fileName=${fn}" --%>
				<!-- 						style="cursor: pointer" /> -->
				<!-- 						</td> -->
				<!-- 						<td> -->
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
						<td><hr width=750px></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>

						<td>가능한 펫 마리수:${petHotel.ph_p_count }
					</tr>

					<tr>

						<td><input type="hidden" id="sample4_postcode"
							placeholder="우편번호"> 주소:${petHotel.ph_address}" <input
							type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							${petHotel.ph_d_address }
					</tr>
					<tr>
						<td><div>
								<div id="map_canvas"></div>
							</div></td>
					</tr>


					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td><hr width=750px></td>
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
						<%-- 					<c:out value="${boardMap.title}" /> --%>
						<!-- 				</p> -->
						<!-- 					사진:<br> -->
						<!-- 					<img width="200px" height="200px" -->
						<%-- 						src="${contextPath}/image?fileName=NAVER.jpg" /> --%>
						<td><hr width=750px></td>
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
	</div>
</body>
</html>