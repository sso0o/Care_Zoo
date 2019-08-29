<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내용 확인 폼</title>
</head>
<body>
<h1>예약 변경을 원할 경우 추가/변경을 눌러주세요</h1>
리스트 만들어서 리스트에 버튼 달아주기...
<form action="">
	<table>
		<tr>

		</tr>
<%-- 	<c:forEach items="${pd_List}" var="pd"> --%>
<!-- 		<tr> -->
<%-- 			<th>${pd.pd_date}</th> --%>
<%-- 			<td>${pd.pd_hour}</td> --%>
<%-- 			<td>${pd.pd_hAdd}</td> --%>
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
	</table>
</form>
</body>
</html>