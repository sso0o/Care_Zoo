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
function petDeleteOpen(c_num,vsr_num){	
			var c_num = c_num;
			var vsr_num = vsr_num;
			
			console.log(c_num);
			console.log(vsr_num);
			
			//삭제로직 실행
			$.ajax({
				url:"${contextPath}/visit/delete1",
				data:{"vsr_num":vsr_num},
				type:"post",
				success:function(result){
					console.log(result);
					if(result){
						alert("삭제완료");
						//삭제되고 남은 pd_hAdd를 보여줘야하잔하....
						location.href="${contextPath}/visit/complete11?c_num="+c_num+"&vsr_num="+vsr_num;
					}else{
						alert("삭제실패");
					}
				},error:function(r,s,e){
					console.log("r:"+r+"s:"+s+"e:"+e);
				}
			});

}

$( document ).ready( function() {
	var originHour = document.getElementById("vsr_hour").value;
	console.log(originHour);
	var sum = Number(originHour)+3;
	console.log(sum);
	//id로 가져오면 값 하나만 출력하기 때문에 class로 줘서 사용해야한다.
		$('.hour').append(originHour+"시~"+sum.toString()+"시");
    
  } );
</script>
<meta charset="UTF-8">
<title>예약내용 확인 폼</title>
</head>
<body>
<h1>예약 변경을 원할 경우 추가/변경을 눌러주세요</h1>
<!-- <h3>강아지 한마리를 선택하면 전체 강아지의 시간이 '변경' 또는 '삭제' 됩니다^^</h3> -->

	<form action="complete22" method="post">
		<div>
			<table>
				<tr>
					<td><input type="hidden" name="c_num" value="${c_num}"> 
					<c:forEach items="${p_num}" var="pn">
						<input type="hidden" name="p_num" value="${pn}">
					</c:forEach></td>
				</tr>
				<tr>
				<c:forEach items="${list}" var="li">
				<input type="hidden" id="vsr_hour" name ="vsr_hour" value="${li.vsr_hour}">
					<tr><th>매주${li.vsr_chkin}
					<input type="button" onclick="petDeleteOpen(${c_num},${li.vsr_num})" value="x">
					
					</th></tr>
					<tr><td class="hour"></td><td>+${li.vsr_hAdd}시간
					<input type="button" onclick="location.href='${contextPath}/visit/addForm?vsr_chkin=${li.vsr_chkin}&vsr_hour=${li.vsr_hour}&vsr_hAdd=${li.vsr_hAdd}&c_num=${c_num}&vsr_num=${li.vsr_num}'" value="변경">
					</td></tr>	
				</c:forEach>				

			</table>
		</div>
		<div>
			<input type="submit" value="다음">
		</div>
	</form>
</body>
</html>