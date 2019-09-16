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
function petDeleteOpen(pd_week,p_num){	
	console.log(pd_week);
	console.log(p_num);
			var pd_week = pd_week;
			var p_num = p_num;
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete1",
				data:{"pd_week":pd_week,"p_num":p_num},
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
//추가/변경 클릭 함수...
function add(c_num,p_num,p_name){	
	console.log(c_num);
	console.log(p_num);
	console.log(p_name);
			var c_num = c_num;
			var p_num = p_num;
			var p_name= p_name;
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete1",
				data:{"c_num":c_num,"p_num":p_num,"p_name":p_name},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						alert("삭제완료");
						location.href="${contextPath}/visit/addForm";
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
					<td><input type="text" name="c_num" value="${c_num}"></td>
					<td>
					<c:forEach items="${p_num}" var="p">
						<input type="text" name="p_num" value="${p}">
					</c:forEach>
					<c:forEach items="${p_name}" var="n">
					<input type="text" name="p_name" value="${n}">
						</c:forEach>
					<c:forEach items="${pd_week}" var="w">
						<input type="text" name="pd_week" value="${w}">
					</c:forEach>
					<c:forEach items="${pd_hour}" var="h">
						<input type="text" name="pd_hour" value="${h}">
					</c:forEach>
					<c:forEach items="${pd_hAdd}" var="a">
						<input type="text" name="pd_hAdd" value="${a}">
					</c:forEach>
					</td>
				</tr>
				<tr>
					<c:forEach items="${pd_week}" var="w">
						매주${w}요일 &emsp;
						<button onclick="add(${c},${p},${n})">추가/변경</button>	
						<br>
						<c:forEach items="${pd_hour}" var="h">
						${h}
						<c:forEach items="${pd_hAdd}" var="a">
						${a} &emsp;
						
							</c:forEach>
						</c:forEach>
						<button onclick="petDeleteOpen(${w})">x</button><br>
					</c:forEach>
				</tr>
			</table>
		</div>
		<div>
			<input type="submit" value="다음">
			
			
		</div>
	</form>
</body>
</html>