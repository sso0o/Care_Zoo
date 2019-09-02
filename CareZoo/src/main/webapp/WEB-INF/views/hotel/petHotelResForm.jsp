<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<title>petHotelResForm</title>
<link href="${contextPath }/resources/css/minical.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div>
		<h2>보호자 비동반 애견호텔 예약</h2>
		<fieldset>
			<legend>정보 입력</legend>
			<table>
				<tr>
					<td>체크인</td>
					<td></td>
					<td>체크아웃</td>
					<td></td>
				</tr>
			</table>
		</fieldset>
	</div>

</body>
</html>