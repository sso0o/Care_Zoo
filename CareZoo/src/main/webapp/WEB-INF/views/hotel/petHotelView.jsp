<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
		initialize()
	})
</script>
<style>
#map_canvas {
	width: 300px;
	height: 300px;
}
</style>

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

<title>petHotelView</title>

</head>
<body>

	<table>
		<tr>
			<th>호텔이름</th>
			<td><input type="text" name="ph_name"
				value="${petHotel.ph_name }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="hidden" id="sample4_postcode"
				placeholder="우편번호"> <input type="button"
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <input
				type="text" id="sample4_roadAddress" name="ph_address"
				value="${petHotel.ph_address }"> <input type="hidden"
				id="sample4_jibunAddress" placeholder="지번주소"></td>
			<td><input type="text" id="c_d_address" name="ph_d_address"
				value="${petHotel.ph_d_address }"> <span id="guide"
				style="color: #999"></span></td>
		</tr>
		<tr>
			<th>가능한 펫 마리수</th>
			<td><input type="number" name="ph_p_count"
				value="${petHotel.ph_p_count }"></td>

		</tr>
		<tr>
			<th>이미지</th>
			<c:forEach items="${filesName}" var="fn">
				<td><img width="200px" height="200px"
					src="${contextPath}/petHotel/image?fileName=${fn}" /><br>
			</c:forEach>
		</tr>

		<tr>
			<td><input type="submit" value="수정"></td>
			<td><input type="button" value="삭제" onclick="removeCheck()"></td>
		</tr>
		<tr>
			<!-- <th>첨부파일</th> -->
			<%-- <td><a href="download?ph_num=${pethotel.ph_num}" id="attach_file"></a></td> --%>
		</tr>
	</table>
	<div>
		<div id="map_canvas"></div>
	</div>

	


</body>
</html>