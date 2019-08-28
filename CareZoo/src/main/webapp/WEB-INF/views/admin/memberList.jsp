<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body>	
	<div>
		<table>
			<tr>
				<th>고객넘</th>
				<th>고객이름</th>
				<th>고객아이디</th>
				<th>수정</th>
			</tr>
			<c:forEach items="${cList }" var="c">
				<tr>
					<td>${c.c_num }</td>
					<td>${c.c_name }</td>
					<td>${c.c_email }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>