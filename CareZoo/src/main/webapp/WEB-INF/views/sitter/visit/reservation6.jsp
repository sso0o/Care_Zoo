
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>" ></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").on("click",function(){
			var check = $("#checkContainer").children().is(":checked");
			var check2 = $("#checkContainer2").children().is(":checked");
			var check3 = $("#checkContainer3").children().is(":checked");
			console.log(check);
			
			if(!(check&&check2&&check3)){
				alert("체크해주세요");
				return false;
			}
			alert("완료")
			return true;
		});
	});
</script>
<meta charset="UTF-8">
<title>방문 펫시터 예약</title>
</head>
<body>
<form action="complete1" method="post" name="checkForm" id="checkForm">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${p_name}" var="n">
		<input type="hidden" name="p_name" value="${n}">
	</c:forEach>
<table>
	<tr>
		<th>요일선택(중복선택 가능)</th>
	</tr>
	<tr>
		<td id="checkContainer">
			<input type="checkbox" name="pd_week" id="mon" value="월">월
			<input type="checkbox" name="pd_week" id="tus" value="화">화
			<input type="checkbox" name="pd_week" id="wen" value="수">수
			<input type="checkbox" name="pd_week" id="thu" value="목">목
			<input type="checkbox" name="pd_week" id="fri" value="금">금
			<input type="checkbox" name="pd_week" id="sat" value="토">토
			<input type="checkbox" name="pd_week" id="sun" value="일">일
		</td>
	</tr>
	<tr>
		<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
	</tr>
	<tr>
		<td id="checkContainer2">
			<input type="checkbox" name="pd_hour" id="one" value="9시~12시">9시~12시
			<input type="checkbox" name="pd_hour" id="two" value="12시~15시">12시~15시
			<input type="checkbox" name="pd_hour" id="three" value="15시~18시">15시~18시
			<input type="checkbox" name="pd_hour" id="four" value="18시~21시">18시~21시
		</td>
	</tr>
	<tr>
		<th>시간 추가(기본 1시간 돌봄)</th>
	</tr>
	<tr>
		<td id="checkContainer3">
			<input type="checkbox" name="pd_hAdd" id="0" value="없음">없음
			<input type="checkbox" name="pd_hAdd" id="1" value="+1시간">+1시간
			<input type="checkbox" name="pd_hAdd" id="2" value="+2시간">+2시간
			<input type="checkbox" name="pd_hAdd" id="3" value="+3시간">+3시간
			<input type="checkbox" name="pd_hAdd" id="4" value="+4시간">+4시간
		</td>
	</tr>
</table>
<div>
	<input type="submit" id="btn"value="다음" >
</div>
</form>
</body>
</html>