<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
	if(${msg} != null){
		alert("${msg}")
	}
	
	
</script>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
	<div>
		<button onclick="location.href='${contextPath}/carezoo/admin/addHotelForm'">호텔추가</button>
		<button onclick="location.href='${contextPath}/carezoo/admin/'">호텔수정</button>
		<button onclick="location.href='${contextPath}/carezoo/admin/addPetHotelForm'">펫호텔추가</button>
		<button onclick="location.href='${contextPath}/carezoo/admin/modifyPetHotelList'">펫호텔수정</button>
		
		
	</div>

</body>
</html>