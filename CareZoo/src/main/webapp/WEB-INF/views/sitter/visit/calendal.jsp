<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script >
$(function(){
	$("#cal").datepicker({
		dateFormat:'yy-mm-dd',
		minDate:0
	});
});
	


</script>
<meta charset="UTF-8">
<title>정기적인 요일 시작일 고르기</title>
</head>
<body>

<%-- 		<input type="text" name="c_num" value="${c_num}"> --%>
<%-- 		<c:forEach items="${p_num}" var="p"> --%>
<%-- 			<input type="text" name="p_num" value="${p}"> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:forEach items="${p_name}" var="n"> --%>
<%-- 			<input type="text" name="p_name" value="${n.p_name}"> --%>
<%-- 		</c:forEach> --%>
	<!-- 달력 -->	
	<div id="cal"></div>
</body>
</html>