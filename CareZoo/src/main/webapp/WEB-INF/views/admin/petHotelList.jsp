<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petHotelList</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<th>ph_num</th>
				<th>ph_name</th>	
				<th>ph_address</th>
			</tr>
			<c:forEach items="${phL }" var="ph" >
				<tr>
					<td>${ph.ph_num}</td>
					<td><a href="viewPetHotel?ph_num=${ph.ph_num}">${ph.ph_name}</a></td>
					<td>${ph.ph_address}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>