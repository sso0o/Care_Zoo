<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/lightGallery.css" />                  
<script src="js/lightGallery.js"></script>
<meta charset="UTF-8">
<title>homeSitterView</title>
<!-- 가정집 펫시터 상세내용 -->
<script type="text/javascript">
$(document).ready(function() {
	$('#imageGallery').lightSlider({
		gallery : true,
		item : 1,
		loop : true,
		thumbItem : 9,
		slideMargin : 0,
		enableDrag : false,
		currentPagerPosition : 'left',
		onSliderLoad : function(el) {
			el.lightGallery({
				selector : '#imageGallery .lslide'
			});
		}
	});
});
</script>
</head>
<body>
<div>
	<ul id="imageGallery">
		<li data-thumb="img/thumb/cS-1.jpg" data-src="img/largeImage.jpg">
			<img src="img/cS-1.jpg" />
		</li>
		<li data-thumb="img/thumb/cS-2.jpg" data-src="img/largeImage1.jpg">
			<img src="img/cS-2.jpg" />
		</li>
	</ul>
</div>
</body>
</html>