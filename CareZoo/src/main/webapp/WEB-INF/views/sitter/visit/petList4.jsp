<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petList</title>
</head>
<body>
	<h1>반려동물 등록하기</h1>
	<h3>돌봄을 신청하는 반려동물을 선택해 주세요</h3>
	반려견이름(무게/생일)
	<br>
	<form action="petList" method="post">	
		<c:forEach items="${petList}" var="pet">
		<ul>
			
			<li><input type="hidden" name="c_num" value="${c_num}">
			${pet.p_name}(${pet.p_weight}kg,${pet.p_birth})
			<input type="checkbox" name="p_chk" value="${pet.p_num}"></li>
		</ul>
		</c:forEach>
		<div>
			<input type="submit" value="다음">
		</div>
	</form>

</body>
</html>