<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation2</title>
</head>
<body>
<h1>원하시는 방문 유형을 선택해 주세요</h1><br>
<button onclick="location.href='${contextPath}/visit/apply?c_num=${c_num}'">정기 방문 돌봄 신청</button><br>
<button onclick="location.href='${contextPath}/visit/nomalapply?c_num=${c_num}'">일반 방문 돌봄 신청</button><br>
<br>
<h3><img src="${contextPath}/resources/img/schedule.jpg">
<a href="${contextPath}/visit/apply?c_num=${c_num}">정기 방문 돌봄 신청</a></h3><br>
<p>매월 몇 회씩 방문 돌봄을 신청하는 서비스로 
정기 결제 시 최대 22% 할인된 가격으로 이용하실 수 있습니다.</p><br>
<h3><img src="${contextPath}/resources/img/check.jpg">
<a href="${contextPath}/visit/nomalapply?c_num=${c_num}">일반 방문 돌봄 신청</a></h3><br>
<p>여행 및 출장 등의 이유로 단기 방문 돌봄을 신청하는 서비스로
5회 이상 예약 시 회당 10% 할인된 가격으로 이용하실 수 있습니다.</p><br>
<input type="hidden" name="c_num" value="${c_num}">
</body>
</html>