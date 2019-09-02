<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petHotelList</title>
<!-- 애견호텔 목록 -->
</head>
<body>
	<div>
		<div>
			<fieldset>
				<legend>호텔 옵션 선택</legend>
				<input type="checkbox" name="asdf" value="aaa">bbb
			</fieldset>
		</div>
		<div>
			<table>
				<c:forEach var="phList" items="${phList}">
				<tr>
					<td><a href="${contextPath}/petHotel/petHotelView?ph_num=${phList.ph_num}">${phList.ph_name}</a></td>
				</tr>

					<!-- 				<p> -->
					<%-- 					<c:out value="${boardMap.title}" /> --%>
					<!-- 				</p> -->
<!-- 					사진:<br> -->
<!-- 					<img width="200px" height="200px" -->
<%-- 						src="${contextPath}/image?fileName=NAVER.jpg" /> --%>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>