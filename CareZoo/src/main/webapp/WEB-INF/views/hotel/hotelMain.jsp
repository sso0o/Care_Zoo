<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hotelMain</title>
<!-- 보호자 동반, 비동반 고르는곳 -->
</head>
<body>
	<div>
		<span> 여기는 호텔 메인 </span>
		<br>
		<button onclick="location.href='${contextPath}/dongbanHotel/hotelList'">반려견 동반 호텔</button>
		<button onclick="location.href='${contextPath}/petHotel/petHotelResForm'">보호자 비동반 애견호텔</button>
		<br>
		<span>contextPath => ${contextPath}</span>
	</div>
</body>
</html>