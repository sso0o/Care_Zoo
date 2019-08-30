<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

</script>
<meta charset="UTF-8">
<title>예약내용 확인 폼</title>
</head>
<body>
<h1>예약 변경을 원할 경우 추가/변경을 눌러주세요</h1>

	<form action="complete2" method="post">
		<div>
		<table>
		<tr>
				<c:forEach items="${p_name}" var="name">
					<tr>
						
						<td>${name.p_name}님 예약내용입니다.&emsp;<button name="delete" id="delete" onclick="location.href='delete()'">x</button></td>
						<td><input type="hidden" name="p_num1" value="${name.p_num}"></td>
					</tr>
				</c:forEach>
				<c:forEach items="${pd_List}" var="p">
					<tr>
						<td>${p.pd_date}&emsp;${p.pd_week}&nbsp;${p.pd_hour}&nbsp;${p.pd_hAdd}&nbsp;</td>
						<td><input type="hidden" name="p_num" value="${p.p_num}"></td>
					</tr>
				</c:forEach>
				
			</tr>	
					<!-- 				<tr> -->
					<%-- 					<td><input type="text" value="${name}" name="p_name"></td> --%>
					<%-- 					<td><input type="text" name="p_num" value="${p_num}"></td> --%>
					<%-- 					<td><input type="text" name="pd_week" value="${week}"></td> --%>
					<%-- 					<td><input type="text" name="pd_hour" value="${hour}"></td> --%>
					<%-- 					<td><input type="text" name="pd_hAdd" value="${hAdd}"></td> --%>
					<!-- 				</tr> -->

		</table>
		</div>
		<div>
			<input type="submit" value="다음">
			<button
								onclick="location.href='${contextPath}/visit/complete?p_num=${p_num}'">추가/변경</button>
		</div>
	</form>
</body>
</html>