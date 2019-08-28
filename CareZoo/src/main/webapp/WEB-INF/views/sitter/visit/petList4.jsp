<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
function test_checkbox(){
	var flag = false;
	//checkbox 접근 후 체크된 개수 파악
	var values = document.getElementsByName("p_num");
	//배열길이
	//alert(values.length); 
	for(var i=0;i<values.length;i++){
		if(values[i].checked){
			alert(values[i].value);
			flag= true;
		}
	}
	return flag;
}
</script>
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
			<input type="checkbox" name="p_num" value="${pet.p_num}"></li>
		</ul>
		</c:forEach>
		<div>
			<input type="submit" value="다음" onclick="return test_checkbox()">
			<!-- return: 클릭했을 때 함수호출
			true: action 수행, false: action수행 안함 -->
		</div>
	</form>
		<div>
			<button onclick="location.href='${contextPath}/visit/apply?c_num=${c_num}'">반려견 등록</button>
		</div>
</body>
</html>