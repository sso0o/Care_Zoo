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
			//alert(values[i].value);
			flag= true;
		}
	}
	return flag;
}
//삭제버튼 클릭했을 때 작동되는 함수
function petDeleteOpen(p_num,c_num){	
	console.log(p_num);
	console.log(c_num);
			var p_num = p_num;
 			var c_num = c_num;
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete",
				data:{"p_num":p_num,"c_num":c_num},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						if(confirm("정말 삭제하시겠습니까?")){
							alert("삭제완료");
							location.href="${contextPath}/visit/petList?c_num="+c_num
						}
					}else{
						alert("삭제실패");
					}
				},error:function(r,s,e){
					console.log("r:"+r+"s:"+s+"e:"+e);
				}
			});

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
	<form action="petList1" method="post">	
		<c:forEach items="${petList}" var="pet">
		<ul>
			
			<li><input type="hidden" name="c_num" value="${c_num}">
			<input type="checkbox" name="p_num" value="${pet.p_num}">
			${pet.p_name}(${pet.p_weight},${pet.p_birth})
			
			<input type="button" name="p_num" onclick="petDeleteOpen(${pet.p_num},${c_num})" value="x"></li>
		</ul>
		</c:forEach>
		<div>
			<input type="submit" value="다음" onclick="return test_checkbox()">
			<!-- return: 클릭했을 때 함수호출
			true: action 수행, false: action수행 안함 -->
			
		</div>
	</form>
	<button onclick="location.href='${contextPath}/visit/nomalapply?c_num=${c_num}'">새로운 반려견 등록</button>
</body>
</html>