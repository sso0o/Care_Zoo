<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberView</title>
</head>
<body>
	<div>
		<div>
			<table>
				<tr>
					<td>고객이름</td>
					<td>${c.c_name }</td>
<%-- 					<td>${c.c_num }</td> --%>
				</tr>
				<tr>
					<td>고객아이디</td>
					<td>${c.c_email }</td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<select name="p_num">
				<c:forEach items="${pL }" var="p">
					<option value="${p.p_num }">${p.p_name }</option>
				</c:forEach>
			</select>

		</div>
		
		<div>
			
			<button onclick="location.href='${contextPath}/admin/addPetForm?c_num=${c.c_num }'">펫 등록</button>
			<button onclick="location.href='${contextPath}/admin/memberList'">멤버목록</button>
		</div>
	</div>

</body>
</html>