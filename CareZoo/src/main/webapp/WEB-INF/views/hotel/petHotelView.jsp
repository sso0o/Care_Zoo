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
	
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/index.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap">
</script>
<script src="${contextPath}/resources/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>

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

<style>
#map_canvas {
	width: 300px;
	height: 300px;
}
</style>

<meta charset="UTF-8">
<title>petHotelView</title>

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/board.css">
<script type="text/javascript"
	src="${contextPath}/resources/js/board.js"></script>
<!-- 애견호텔 상세보기 -->
<script type="text/javascript">

	
	$(function() { //문서가 로딩되면 실행할 함수
		var fileName = getOriginFileName('${board.fileName}');
		$("#attach_file").text(fileName);
	});

</script>

<script type="text/javascript">
	var imgCommonPreview = new Image();
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
		<br>
		<hr style="border: solid 0.5px">
		<br>
		<table>
			<tr>
				<td>${petHotel.ph_name}</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><hr width=200%></td>
			</tr>
			<tr>
				<c:forEach items="${filesName}" var="fn">
					<td><img width="400px" height="400px"
						src="${contextPath}/petHotel/image?fileName=${fn}"
						style="cursor: pointer" /><br>
				</c:forEach>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><hr width=200%></td>
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
				<td><hr width=200%></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<c:forEach var="phComment" items="${phComment}">
				<tr>
					<td>${phComment.c_name}</td>
					<td>${phComment.phc_star}</td>
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
				<td><hr width=200%></td>
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


</body>
</html>