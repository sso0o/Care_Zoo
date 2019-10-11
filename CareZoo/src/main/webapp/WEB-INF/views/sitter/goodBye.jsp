<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:set var = "contextPath" value ="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>회원탈퇴</title>
</head>
<body>
<h2 style="text-align:center;">회원탈퇴가 완료되었습니다</h2>
<input type="button" value="확인" onclick="location.href='${contextPath}/logout'">
</body>
</html>