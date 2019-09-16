<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{
	font-weight:600;
}
</style>
<script type="text/javascript">

// 	function goBack() {
// 		window.history.back();
// 	}
</script>
<meta charset="UTF-8">
<title>요금 세부 정보</title>
</head>
<body>
<form action="reservation10" method="get">
	<table>
		<tr>
			<td><input type="text" name="c_num" value="${c_num}"></td>
			<td><c:forEach items="${p_num}" var="p">
					<input type="text" name="p_num" value="${p}">
				</c:forEach> <c:forEach items="${p_name}" var="n">
					<input type="text" name="p_name" value="${n}">
				</c:forEach> <c:forEach items="${pd_week}" var="w">
					<input type="text" name="pd_week" value="${w}">
				</c:forEach> <c:forEach items="${pd_hour}" var="h">
					<input type="text" name="pd_hour" value="${h}">
				</c:forEach> <c:forEach items="${pd_hAdd}" var="a">
					<input type="text" name="pd_hAdd" value="${a}">
				</c:forEach></td>
		</tr>
		<tr>
			<th>회당 기본 금액</th>
			<td>33000원</td>
		</tr>
		<tr>	
			<th>기본 1마리</th>
			<td>28000원</td>
		</tr>
		<tr>	
			<th>1마리 추가</th>
			<td>5000원</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>상세 예약 내역</th>
		</tr>
		
			<c:forEach items="${pd_week}" var="week">
				<tr>
					<td>${week}</td>
					<td></td>
				</tr>
			</c:forEach>
			<th>추가 시간 내역</th>
			<c:forEach items="${pd_hAdd}" var="hAdd">
				<td>${hAdd}</td>
				
			</c:forEach>
				
		

	</table>
	<div>
		<input type="submit" value="확인">
	</div>
</form>	
	
	
</body>
</html>