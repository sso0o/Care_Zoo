<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
//새창띄우기(playPlan)
function openWin(){  
    window.open("${contextPath}/visit/playPlan", "새창", "width=800, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  

</script>
<title>요청사항 폼!!</title>
</head>
<body>
<form action="sub" method="post">
		<input type="hidden" name="c_num" value="${c_num}">
		<c:forEach items="${p_num}" var="p">
			<input type="hidden" name="p_num" value="${p}">
		</c:forEach>
		<c:forEach items="${vsr_num}" var="vsr_num">
			<input type="hidden" value="${vsr_num}" name="vsr_num">
		</c:forEach>
		<div>
		<h2>펫시터에게 전달 할 요청사항이 있으신가요?</h2>
			<table>
				<tr>
					<td>
						<input type="checkbox" id="play" name="vsr_attention" value="1" >산책없이 놀이 서비스로 대체해주세요.<br>
						<input type="checkbox" id="play" name="vsr_attention" value="2" >산책 위주로 진행해주세요.<br>
						<input type="checkbox" id="play" name="vsr_attention" value="3" >생식 급여가 필요합니다.<br>
						<input type="checkbox" id="play" name="vsr_attention"  value="4" >노령견 및 환자견 케어가 필요합니다.<br>
					</td> 
				</tr>
			</table>
			<div>
			<!-- 새창띄우기 -->
				<input type="button" onclick="openWin()" value="놀이 프로그램 자세히보기">
			</div>
			<div>
				<textarea rows="20" cols="60" name="vsr_contents" placeholder="기타 요청 사항을 작성해주세요. 
															*정해진 시간에 투약을 해약하거나, 야외 배변 필수 등 돌봄 중 펫시터가 유의해야하는 사항을 꼭 작성해주세요."></textarea>
			</div>
		<div>
			<input type="submit" id="btn" value="다음">
		</div>
	</div>
</form>		
</body>
</html>