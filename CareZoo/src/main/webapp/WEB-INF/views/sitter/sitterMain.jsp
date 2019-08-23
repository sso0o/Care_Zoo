<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterMain</title>
<!-- 방문펫시터, 가정집펫시터 고르는부분  -->
</head>
<body>
	<h1>시터메인입니다.</h1>
	<div>
		<table>
			<tr>
				<th><a href="visit/vMain">방문시터</a></th>
				<td></td>				
			</tr>
			<tr>
				<th><a href="home/main">가정시터</a></th>
				<td></td>				
			</tr>
		</table>
	</div>
</body>
</html>