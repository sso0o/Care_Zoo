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
		minDate:0,
		regional:"ko",
		beforeShowDay:function(date){
			//선택한 요일 값 가져오기..
			var week = new Array('월','화','수','목','금','토','일');
			
			var day = date.getDay();
			console.log(day);	
			return[(day !=0 && day!=5 &&day!=3 &&day!=4 &&day!=6)];
		}
	});
});



</script>
<meta charset="UTF-8">
<title>정기적인 요일 시작일 고르기</title>
</head>
<body>

	<input type="text" name="c_num" value="${c_num}">
	<c:forEach items="${p_num}" var="p">
		<input type="text" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${p_name}" var="n">
		<input type="text" name="p_name" value="${n}">
	</c:forEach>
	<c:forEach items="${pd_week}" var="w">
		<input type="text" name="pd_week" value="${w}">
	</c:forEach>
	<c:forEach items="${pd_hour}" var="h">
		<input type="text" name="pd_hour" value="${h}">
	</c:forEach>
	<c:forEach items="${pd_hAdd}" var="a">
		<input type="text" name="pd_hAdd" value="${a}">
	</c:forEach>
	<!-- 달력 -->	
	<div id="cal"></div>
</body>
</html>