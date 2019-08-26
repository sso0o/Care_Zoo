<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homeSitterList</title>
<!-- 가정용 펫시터 리스트 -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

</script>
</head>
<body>
<div >

	<form action="search" method="post">
		<div>
			<label for ="service">서비스</label>
			<select  name = "hss_service_type" id="service" >
				<option value="allday">24시간 돌봄</option>
				<option value="daycare">데이케어</option>
			</select>
			
			<label>예약일</label>
			<input type="date" id="start" >
			<input type="date" id="end" >
			
			<label for="pet_age">반려견 나이</label>
			<select  name = "hss_pet_age" id="pet_age" >
				<option value="puppy">강아지 (1살 이하)</option>
				<option value="dog">성견 (2~6살)</option>
				<option value="aged_dog">노령견 (7살)</option>
			</select>
			
			<label for="pet_size">반려견 크기</label>
			<select  name = "hss_pet_size" id="pet_size" >
				<option value="S">소형견 (0~4.9kg)</option>
				<option value="M">중형견 (5~14.9kg)</option>
				<option value="L">대형견 (15kg)</option>
			</select>
			
			<button type="submit">검색</button> 
		</div>
		<div>
			<input type="reset" value = "검색 설정 초기화">
		</div>
	</form>
</div>
</body>
</html>
