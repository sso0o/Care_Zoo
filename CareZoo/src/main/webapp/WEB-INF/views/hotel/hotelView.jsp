<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hotelView</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=ture_or_false"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap">
	
</script>
<script type="text/javascript">
	//구글맵 v3
	function initialize() {

		var geocoder = new google.maps.Geocoder();
		
		var addr = "서울 마포구 굴레방로1길 25 (아현동, 애오개아이파크)";

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

</head>
<body>

	<div id="map_canvas"></div>


</body>
</html>