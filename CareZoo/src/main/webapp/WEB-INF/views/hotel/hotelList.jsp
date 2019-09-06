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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet"
	href="${contextPath}/resources/css/lightslider.css" />
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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/lightslider.js"></script>
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
	src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAgHEcAR6wGi2lnF3cqqiPJuwv_MVvutIA&callback=initMap">
	
</script>

<script type="text/javascript">
	var imgCommonPreview = new Image();
	    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
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
</style>



<title>petHotelView</title>

</head>
<body>

	<div class="demo">
		<div class="item">
			<div class="clearfix" style="max-width: 474px;">
				<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
					<li data-thumb="${contextPath}/resources/img/logo.jpg"><img
						src="${contextPath}/resources/img/logo.jpg" /></li>
					<li data-thumb="${contextPath}/resources/img/logo.jpg"><img
						src="${contextPath}/resources/img/logo.jpg" /></li>
					<li data-thumb="${contextPath}/resources/img/logo.jpg"><img
						src="${contextPath}/resources/img/logo.jpg" /></li>

				</ul>
			</div>
		</div>


		<div class="item">
			<ul id="content-slider" class="content-slider">

			</ul>
		</div>

	</div>
</body>
</html>