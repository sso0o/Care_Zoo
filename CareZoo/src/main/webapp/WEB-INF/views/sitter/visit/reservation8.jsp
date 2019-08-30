<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사전만남 신청폼</title>
</head>
<body>
<form action="">
		<input type="text" value="${p_name}" name="p_name"> 
		<input type="text" name="p_num" value="${p_num}">
	    <input type="text" name="pd_week" value="${pd_week}"> 
	    <input type="text" name="pd_date" value="${pd_date}">
	    <input type="text" name="pd_hour" value="${pd_hour}">
	    <input type="text" name="pd_hAdd" value="${pd_hAdd}">
		<div>
			<button onclick="location.href=''">사전 만남 신청하기</button>
			<br>
			<button onclick="location.href=''">사전 만남 없이 진행하기</button>
		</div>
		<div>
		<h2>사전만남이란?</h2>
			<ul>
				<li>강아지 체크리스트 작성 및 친화과정을 갖는 시간입니다.</li>
				<li>사전만남은 신청 시 2~3일내로 진행하시는 걸 권장합니다.</li>
			</ul>
	</div>
</form>		
</body>
</html>