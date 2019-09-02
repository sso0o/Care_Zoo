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
      
      var addr = "서울 강남구 강남대로 238 (도곡동)";

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
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
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

	<div class="info">
		<div class="photoAndsitter">
			사진:<br> <img width="200px" height="200px"
				src="${contextPath}/image?fileName=NAVER.jpg" />

			<c:forEach var="boardMap" items="${boardList}">

<!-- 				<p> -->
<%-- 					<c:out value="${boardMap.title}" /> --%>
<!-- 				</p> -->
					사진:<br>
				<img width="200px" height="200px"
					src="${contextPath}/image?fileName=NAVER.jpg" />
			</c:forEach>




			이름, 주소, 특징?(아파트, 노령견케어, 실외배변) 간단한 호텔 소개(우리호텔) 환경
		</div>
		<div class="review">호텔 후기 (별점)</div>
	</div>
	<div class="reservation">
		<div class="reserRequest"></div>
		<div class="calendar"></div>
	</div>
	
	<div>
		<div id="map_canvas"></div>
	</div>

</body>
</html>