<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>" ></c:set>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function check(){
		var flag= false;
		//checkBox 접근 후 체크된 개수 파악
		var values = document.getElementsByName("week");
		for(var i=0;values.length;i++){
			if(values[i].checked){
				alert(values[i].value);
			}
		}
		return flag;
		var values = document.getElementsByName("hour");
		for(var i=0;values.length;i++){
			if(values[i].checked){
				alert(values[i].value);
			}
		}
		return flag;
		var values = document.getElementsByName("hAdd");
		for(var i=0;values.length;i++){
			if(values[i].checked){
				alert(values[i].value);
			}
		}
		return flag;
	}
</script>
<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
</head>
<body>
<form action="complete1" method="post">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
<table>
	<tr>
		<th>요일선택(중복선택 가능)</th>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="week" id="Mon" value="Mon">월
			<input type="checkbox" name="week" id="Tus" value="Tus">화
			<input type="checkbox" name="week" id="Wed" value="Wed">수
			<input type="checkbox" name="week" id="Thu" value="Thu">목
			<input type="checkbox" name="week" id="Fri" value="Fri">금
			<input type="checkbox" name="week" id="Sat" value="Sat">토
			<input type="checkbox" name="week" id="Sun" value="Sun">일
		</td>
	</tr>
	<tr>
		<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="hour" id="9" value="9h-12h">9시~12시
			<input type="checkbox" name="hour" id="12" value="12h-15h">12시~15시
			<input type="checkbox" name="hour" id="15" value="15h-18h">15시~18시
			<input type="checkbox" name="hour" id="18" value="18h-21h">18시~21시
		</td>
	</tr>
	<tr>
		<th>시간 추가(기본 1시간 돌봄)</th>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="hAdd" id="0" value="없음">없음
			<input type="checkbox" name="hAdd" id="1" value="1시간">+1시간
			<input type="checkbox" name="hAdd" id="2" value="2시간">+2시간
			<input type="checkbox" name="hAdd" id="3" value="3시간">+3시간
			<input type="checkbox" name="hAdd" id="4" value="4시간">+4시간
		</td>
	</tr>
</table>
<div>
	<input type="submit" vlaue="다음" onclick="">
</div>
</form>
</body>
</html>