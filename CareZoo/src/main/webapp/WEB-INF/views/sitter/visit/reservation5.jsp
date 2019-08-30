<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
	function checkAll() {
		var chk1 = document.checkForm.needs1.checked;
		var chk2 = document.checkForm.needs2.checked;
		var chk3 = document.checkForm.needs3.checked;
		var chk4 = document.checkForm.needs4.checked;
		
		if(!chk1){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk2){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk3){
			alert("확인란을 체크해 주세요");
			return false;
		}
		if(!chk4){
			alert("확인란을 체크해 주세요");
			return false;
		}
		return true;
	}
</script>
<meta charset="UTF-8">
<title>notify</title>
</head>
<body>
	<h1>예약 전 안내사항</h1>
	<form action="complete" method="post" id="checkForm" name="checkForm">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${p_name}" var="n">
		<input type="hidden" name="p_name" value="${n}">
	</c:forEach>
	<table border='1'>
		<tr>
			<th><input type="checkbox" name="needs" id="needs1">
				원하는 시간대 안에서 예약이 진행됩니다
			</th>
		</tr>
		<tr>	
			<td>
				맡겨주는 원활한 돌봄을 위해 시간대로 운영되고 있습니다.<br>
				오전(9~12) 오후(12~15/15~18)타임 중 요청한 시간대 내에서 스케쥴 에따라 시간대가 결정됩니다.
			</td>
		</tr>
		<tr>
			<th><input type="checkbox" name="needs" id="needs2">
			돌봄은 1시간 단위로 제공됩니다
			</th>
		</tr>
		<tr>	
			<td>
				펫시터는 요청한 시간대에 방문해 기본 1시간 돌봄을(산책,배식,배변처리)진행합니다.<br>
				또한 1시간 내 최대 2마리까지 산책이 가능하여 3마리 이상 산책을 원할 경우 2시간 돌봄으로 예약 신청 바랍니다.
			</td>
			<tr>
			<th><input type="checkbox" name="needs" id="needs3">
				2명의 펫시터가 교차 배정될 수 있습니다
			</th>
		</tr>
		<tr>	
			<td>
				원하는 날짜, 시간대 방문을 위해 최소 2명의 펫시터가 배정될 수 있으며 펫시터 지정은 불가합니다.
			</td>
			<tr>
			<th><input type="checkbox" name="needs" id="needs4">
				하네스가 없으면 산책이 불가합니다
			</th>
		</tr>
		<tr>	
			<td>
				도그메이트는 산책 시 발생될 수 있는 놓침 사고를 예방하기 위해 이중산책줄을 사용합니다.<br>
				도그메이트에서 준비한 목줄과 하네스를 결합하여 사고를 방치하고 있습니다.<br>
				하네스가 없을 경우 산책은 불가하여 실내놀이로 대체됩니다.
			</td>
	</table>
	<div>
		<input type="submit" value="확인했습니다!" onclick="return checkAll()">
	</div>
	</form>
</body>
</html>