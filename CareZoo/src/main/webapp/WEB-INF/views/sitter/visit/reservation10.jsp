<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

</script>
<title>방문 펫시터 예약(일반)</title>
</head>
<body>
<h3>예약 확인 및 결제정보를 등록해주세요.</h3>
<form action="payment" method="post">
	<table>
		<tr>
			<td><input type="text" name="c_num" value="${c_num}"></td>
			<td><c:forEach items="${p_num}" var="p">
					<input type="text" name="p_num" value="${p}">
				</c:forEach> <c:forEach items="${p_name}" var="n">
					<input type="text" name="p_name" value="${n}">
				</c:forEach> <c:forEach items="${pd_week}" var="w">
					<input type="text" name="pd_week" value="${w}">
				</c:forEach> <c:forEach items="${pd_hour}" var="h">
					<input type="text" name="pd_hour" value="${h}">
				</c:forEach> <c:forEach items="${pd_hAdd}" var="a">
					<input type="text" name="pd_hAdd" value="${a}">
				</c:forEach></td>
		</tr>
		<tr>
			<th>반려 동물</th>
			<td><c:forEach items="${p_name}" var="n">
				${n}
			</c:forEach></td>
		</tr>
		<tr>
			<th>방문 주소</th>
			<td>${address.c_address} ${address.c_d_address}</td>
		</tr>
		<tr>
			<th>결제 예정 금액</th>
			<td></td>
		</tr>
		<tr>
			<td><input type="submit" value="요금 세부 정보 보기"></td>
		</tr>


	</table>
</form>	
</body>
</html>