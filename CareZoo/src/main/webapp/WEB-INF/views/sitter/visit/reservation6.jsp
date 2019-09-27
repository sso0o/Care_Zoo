
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>" ></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<script type="text/javascript">
function oneCheckbox(a){
	var chk2 = document.getElementsByName("pd_hour");
	for(var i =0;i<chk2.length;i++){
		if(chk2[i] != a){
			chk2[i].checked = false;
		}
	}
}
function oneCheckbox1(a){
	var chk3 = document.getElementsByName("pd_hAdd");
	for(var i =0;i<chk3.length;i++){
		if(chk3[i] != a){
			chk3[i].checked = false;
		}
	}
}

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
	<input type="hidden" name="c_num" value ="${c_num}">
	<c:forEach items="${p_num}" var="p">
		<input type="hidden" name="p_num" value="${p}">
	</c:forEach>
	<c:forEach items="${p_name}" var="n">
		<input type="hidden" name="p_name" value="${n.p_name}">
	</c:forEach>
<table>
	<tr>
		<th>요일선택(중복선택 가능)</th>
	</tr>
	<tr>
		<td id="checkContainer">
			<input type="checkbox" name="vsr_day" id="mon" value="1">월
			<input type="checkbox" name="vsr_day" id="tus" value="2">화
			<input type="checkbox" name="vsr_day" id="wen" value="3">수
			<input type="checkbox" name="vsr_day" id="thu" value="4">목
			<input type="checkbox" name="vsr_day" id="fri" value="5">금
			<input type="checkbox" name="vsr_day" id="sat" value="6">토
			<input type="checkbox" name="vsr_day" id="sun" value="0">일
		</td>
	</tr>
	<tr>
		<th>시간대 선택(선택한 시간대에 펫시터가 방문합니다)</th>
	</tr>
	<tr>
		<td id="checkContainer2">
			<input type="checkbox" name="vsr_hour" id="one" value="9" onclick="oneCheckbox(this)">9시~12시
			<input type="checkbox" name="vsr_hour" id="two" value="12" onclick="oneCheckbox(this)">12시~15시
			<input type="checkbox" name="vsr_hour" id="three" value="15" onclick="oneCheckbox(this)">15시~18시
			<input type="checkbox" name="vsr_hour" id="four" value="18" onclick="oneCheckbox(this)">18시~21시
		</td>
	</tr>
	<tr>
		<th>시간 추가(기본 1시간 돌봄)</th>
	</tr>
	<tr>
		<td id="checkContainer3">
			<input type="checkbox" name="vsr_hAdd" id="0" value="0" onclick="oneCheckbox1(this)">없음
			<input type="checkbox" name="vsr_hAdd" id="1" value="1" onclick="oneCheckbox1(this)">+1시간
			<input type="checkbox" name="vsr_hAdd" id="2" value="2" onclick="oneCheckbox1(this)">+2시간
			<input type="checkbox" name="vsr_hAdd" id="3" value="3" onclick="oneCheckbox1(this)">+3시간
			<input type="checkbox" name="vsr_hAdd" id="4" value="4" onclick="oneCheckbox1(this)">+4시간
		</td>
	</tr>
</table>
<div>
	<input type="submit" id="btn"value="다음" >
</div>
</form>
</body>
</html>