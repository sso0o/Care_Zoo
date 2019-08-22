<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Reservation1</title>
</head>
<body>
<h2>방문펫시터 예약을 위해 고객님 로그인을 부탁 드립니다.</h2>
<hr>
<button onclick="location.href='${contextPath}/member/join'">회원가입</button>
<button onclick="location.href='${contextPath}/member/login'">로그인</button>
</body>
</html>