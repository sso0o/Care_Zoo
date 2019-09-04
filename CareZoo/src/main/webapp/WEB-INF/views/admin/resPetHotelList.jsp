<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resPetHotelList</title>
</head>
<body>
	<div>
		<button onclick="location.href='${contextPath}/admin/resPetHotelForm'">예약하기</button>
	</div>
	<div>
		<table>	
			<tr>
				<th>번호</th>
				<th>고객</th>
				<th>호텔</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>상태</th>
			</tr>
			
			<c:forEach items="${phR }" var="r">
				<tr>
					<td>${r.phr_num }</td>
					<td>${r.c_num }</td>
					<td>${r.ph_num }</td>
					<td>${r.phr_chkin }</td>
					<td>${r.phr_chkout }</td>
					<td>${r.phr_status }</td>
				</tr>
				
			</c:forEach>
		</table>
	</div>

</body>
</html>