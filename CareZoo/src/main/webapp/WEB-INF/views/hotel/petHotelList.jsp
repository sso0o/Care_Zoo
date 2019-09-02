<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petHotelList</title>
<!-- 애견호텔 목록 -->
</head>
<body>
<div>
	<div>
	
	</div>
	
	
	
	<div>
		<table>
			<tr>
				<th>num</th>
				
				<th>name</th>
			</tr>
			<c:forEach items="${phList}" var="ph">
				<tr>
					<td>${ph.ph_num }</td>
					<td>${ph.ph_name }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table>
			<tr>
			<td></td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>