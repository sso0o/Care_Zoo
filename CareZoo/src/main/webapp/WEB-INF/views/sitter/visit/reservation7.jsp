<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
//삭제버튼 클릭했을 때 작동되는 함수
function petDeleteOpen(p_num){	
	console.log(p_num);
			var p_num = p_num;
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete",
				data:{"p_num":p_num},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						alert("삭제완료");
						location.href="${contextPath}/visit/complete1?p_num="+p_num
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
<title>예약내용 확인 폼</title>
</head>
<body>
<h1>예약 변경을 원할 경우 추가/변경을 눌러주세요</h1>

	<form action="complete2" method="post">
		<div>
		<table>
		<tr>
				<c:forEach items="${pd_List}" var="p">
					<tr>
						<td>${p.pd_date}&emsp; 매주 ${p.pd_week}요일 예약이 되었습니다.</td>
						<td><input type="hidden" name="p_num" value="${p.p_num}"></td>
					</tr>
					<tr>
						<td>&nbsp;${p.pd_hour}&nbsp;${p.pd_hAdd}</td>
					</tr>
				</c:forEach>
				
			</tr>	
		</table>
		</div>
		<div>
			<input type="submit" value="다음">
			<button
								onclick="location.href='${contextPath}/visit/complete?p_num=${p_num}'">추가/변경</button>
			<button onclick="petDeleteOpen(p_num)">일정 삭제</button>
		</div>
	</form>
</body>
</html>